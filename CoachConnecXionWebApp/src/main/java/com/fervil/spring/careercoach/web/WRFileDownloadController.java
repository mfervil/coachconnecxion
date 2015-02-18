package com.fervil.spring.careercoach.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.amazonaws.auth.profile.ProfileCredentialsProvider;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.GetObjectRequest;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.model.S3ObjectInputStream;
import com.fervil.spring.careercoach.model.domain.ResumesCertificates;
import com.fervil.spring.careercoach.service.AddresumeService;
import com.fervil.spring.careercoach.util.Constants;


@Controller
public class WRFileDownloadController {
	@Resource(name = "addresumeService")
	private AddresumeService addresumeService;
	
	/**
	 * Size of a byte buffer to read/write file
	 */
	private static final int BUFFER_SIZE = 4096;

	private static final int BUFFER_SIZE_DOWNLOAD = 5409600;

	/**
	 * Path of the file to be downloaded, relative to application's directory
	 */
	private String filePath = "/tmpFiles/";
	
    private static String bucketName     = "ccxviworkroom";
    private static String keyName        = "Object-"+UUID.randomUUID();	
    private static String uploadFileNamePrefix = "ccxv1atch";
	
	/**
	 * Method for handling file download request from client
	 */
	@RequestMapping(value = "/downloadinitial", method = RequestMethod.GET)
	public @ResponseBody 
	void doDownload(HttpServletRequest request,
			HttpServletResponse response,@RequestParam("attachId") String attachId, @RequestParam("filename") String filename)throws IOException {

	
		
		// get absolute path of the application
		String extension=filename.substring(filename.indexOf("."),(filename.length()));
		
		
		//ServletContext context = request.getServletContext();
		ServletContext context = null;
		String rootPath = System.getProperty("catalina.home");
		String appPath = context.getRealPath("");
	

		// construct the complete absolute path of the file
		String fullPath = rootPath + filePath+attachId+extension;		
		File downloadFile = new File(fullPath);
		FileInputStream inputStream = new FileInputStream(downloadFile);
		
		// get MIME type of the file
		String mimeType = context.getMimeType(fullPath);
		if (mimeType == null) {
			// set to binary type if MIME mapping not found
			mimeType = "application/octet-stream";
		}
		

		// set content attributes for the response
		response.setContentType(mimeType);
		response.setContentLength((int) downloadFile.length());

		// set headers for the response
		String headerKey = "Content-Disposition";
		String headerValue = String.format("attachment; filename=\"%s\"",
				filename);
		response.setHeader(headerKey, headerValue);

		// get output stream of the response
		OutputStream outStream = response.getOutputStream();

		byte[] buffer = new byte[BUFFER_SIZE];
		int bytesRead = -1;

		// write bytes read from the input stream into the output stream
		while ((bytesRead = inputStream.read(buffer)) != -1) {
			outStream.write(buffer, 0, bytesRead);
		}

		inputStream.close();
		outStream.close();

	}
	
	
	@RequestMapping(value = "/workroom/downloadFromAWSSE", method = RequestMethod.GET)
	public String download(HttpServletRequest request,
			HttpServletResponse response,@RequestParam("attachId") String attachId, @RequestParam("filename") String filename) {
//		log.info("Received request to download resume");
		try {

			long orderid = Long.valueOf(request.getParameter("orderid"));
			long messageid = Long.valueOf(request.getParameter("messageid"));
			
			String AWSfileName = uploadFileNamePrefix + orderid + messageid + filename ;		
			
			AmazonS3 s3Client = new AmazonS3Client(new ProfileCredentialsProvider());        

			S3Object object = s3Client.getObject(
			                  new GetObjectRequest(bucketName, AWSfileName));
			
			InputStream objectData = object.getObjectContent();
			
			// Process the objectData stream.
			String mimeType = "application/octet-stream";
			
			// set content attributes for the response
			response.setContentType(mimeType);
			
			//response.setContentLength((int)  IOUtils.toByteArray(objectData).length);
			response.setContentLength(BUFFER_SIZE_DOWNLOAD);
			
			response.setHeader("Content-Disposition", "inline;filename=\""
					+ filename + "\"");
			
			// get output stream of the response
			OutputStream outStream = response.getOutputStream();

			byte[] buffer = new byte[BUFFER_SIZE_DOWNLOAD];
			//int bytesRead = -1;
			
			IOUtils.copy(objectData, outStream);

			//while ((bytesRead = objectData.read(buffer)) != -1) {
			//	System.out.println("The bytes read are: " + objectData.read(buffer));
			//	outStream.write(buffer, 0, bytesRead);
			//}

			outStream.flush();
			outStream.close();
			objectData.close();
			
			return null;

		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
//	        log.error(msg, e);
//			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
		}	
	}
	
	
	/**
	 * Method for handling file download request from client
	 */
	@RequestMapping(value = "/workroom/downloadFromAWSSEOld", method = RequestMethod.GET)
	public String doDownloadFromAWSSE(HttpServletRequest request,
			HttpServletResponse response,@RequestParam("attachId") String attachId, @RequestParam("filename") String filename)throws IOException {

		long orderid = Long.valueOf(request.getParameter("orderid"));
		long messageid = Long.valueOf(request.getParameter("messageid"));
		
		
        //AmazonS3 s3client = new AmazonS3Client(new ProfileCredentialsProvider());
		
		
		// get absolute path of the application
		//String extension=filename.substring(filename.indexOf("."),(filename.length()));
		
		/*
		//ServletContext context = request.getServletContext();
		ServletContext context = null;
		String rootPath = System.getProperty("catalina.home");
		String appPath = context.getRealPath("");
	

		// construct the complete absolute path of the file
		String fullPath = rootPath + filePath+attachId+extension;		
		File downloadFile = new File(fullPath);
		//FileInputStream inputStream = new FileInputStream(downloadFile);
		*/

		/*
		<img id="photo2" src="https://s3.amazonaws.com/ccxvi/ccxv1${profileInfo.userProfileId}.${profileInfo.profile_picture_type}" width="125px;" /> 
		*/
		System.out.println("1 The file name is: " + new Date());
		
		String AWSfileName = uploadFileNamePrefix + orderid + messageid + filename ;		
		
		System.out.println("2 The file name is: " + AWSfileName + new Date());
		
		AmazonS3 s3Client = new AmazonS3Client(new ProfileCredentialsProvider());        
		System.out.println("3 The file name is: " + AWSfileName + new Date());

		S3Object object = s3Client.getObject(
		                  new GetObjectRequest(bucketName, AWSfileName));
		System.out.println("4 The file name is: " + AWSfileName + new Date());
		
		InputStream objectData = object.getObjectContent();
		System.out.println("5 The file name is: " + AWSfileName + new Date());
		
		// Process the objectData stream.
		//objectData.close();
		
		/**************************************             *****************************************/
		
		// get MIME type of the file
		/*
		String mimeType = context.getMimeType(fullPath);
		if (mimeType == null) {
			// set to binary type if MIME mapping not found
			mimeType = "application/octet-stream";
		}
		*/
		String mimeType = "application/octet-stream";
		System.out.println("6 The file name is: " + AWSfileName + new Date());
		
		// set content attributes for the response
		response.setContentType(mimeType);
		System.out.println("7 The file name is: " + AWSfileName + new Date());
		
		response.setContentLength((int)  IOUtils.toByteArray(objectData).length);
		System.out.println("8 The file name is: " + AWSfileName + new Date());

		// set headers for the response
		//String headerKey = "Content-Disposition";
		//String headerValue = String.format("attachment; filename=\"%s\"",
		//		filename);
		//response.setHeader(headerKey, headerValue);

		response.setHeader("Content-Disposition", "inline;filename=\""
				+ filename + "\"");
		System.out.println("9 The file name is: " + AWSfileName + new Date());
		
		
		// get output stream of the response
		OutputStream outStream = response.getOutputStream();
		System.out.println("10 The file name is: " + AWSfileName + new Date());

		//byte[] buffer = new byte[BUFFER_SIZE];
		//int bytesRead = -1;

		//IOUtils.copy(objectData, outStream);
		// write bytes read from the input stream into the output stream
		//while ((bytesRead = inputStream.read(buffer)) != -1) {
/*
		while ((bytesRead = objectData.read(buffer)) != -1) {
			outStream.write(buffer, 0, bytesRead);
		}
*/
		System.out.println("11 The file name is: " + AWSfileName + new Date());
		outStream.flush();
		System.out.println("12 The file name is: " + AWSfileName + new Date());
		outStream.close();
		System.out.println("13 The file name is: " + AWSfileName + new Date());
		//objectData.close();

		return null;
		
	}	
	
}