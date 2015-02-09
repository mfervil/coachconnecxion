package com.connection.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller

public class FileDownloadController {
	
	/**
	 * Size of a byte buffer to read/write file
	 */
	private static final int BUFFER_SIZE = 4096;
			
	/**
	 * Path of the file to be downloaded, relative to application's directory
	 */
	private String filePath = "/tmpFiles/";
	
	/**
	 * Method for handling file download request from client
	 */
	@RequestMapping(value = "/download", method = RequestMethod.GET)
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
	
	/**
	 * Method for handling file download request from client
	 */
	@RequestMapping(value = "/downloadFromAWSSE", method = RequestMethod.GET)
	public @ResponseBody 
	void doDownloadFromAWSSE(HttpServletRequest request,
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

		/*
		<img id="photo2" src="https://s3.amazonaws.com/ccxvi/ccxv1${profileInfo.userProfileId}.${profileInfo.profile_picture_type}" width="125px;" /> 
		*/
		
		
		
		/********************************************************************************************************************/
		
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
	
	
}