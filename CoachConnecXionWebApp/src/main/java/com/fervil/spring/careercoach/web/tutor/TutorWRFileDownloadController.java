package com.fervil.spring.careercoach.web.tutor;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.amazonaws.auth.profile.ProfileCredentialsProvider;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.GetObjectRequest;
import com.amazonaws.services.s3.model.S3Object;
import com.fervil.spring.careercoach.service.AddresumeService;
import com.fervil.spring.careercoach.util.Constants;


@Controller
public class TutorWRFileDownloadController {
	@Resource(name = "addresumeService")
	private AddresumeService addresumeService;
	
    private static final Logger log = LoggerFactory.getLogger(TutorWRFileDownloadController.class);
	
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
    
/* NOT NEEDED
	@RequestMapping(value = "/tutor/downloadinitialOld", method = RequestMethod.GET)
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
*/	
	
	@RequestMapping(value = "/tutor/workroom/downloadFromAWSSE", method = RequestMethod.GET)
	public String download(Model model, HttpServletRequest request,
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

			outStream.flush();
			outStream.close();
			objectData.close();
			
			return null;

		} catch (Exception e) {
	        String msg = "Error encountered while downloading your file.  The file is either corrupted or does not exist " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "tutor/public/common/error/errorpage";
		}	
	}
	
}