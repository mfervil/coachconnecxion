package com.fervil.spring.careercoach.web;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamSource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.amazonaws.AmazonClientException;
import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.profile.ProfileCredentialsProvider;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.connection.bean.CustomerBean;
import com.connection.model.Attachment;
import com.connection.model.Customer;
import com.connection.model.Message;
import com.connection.model.UserAttachment;
import com.connection.model.Usermessage;
import com.connection.service.CustomerService;
import com.connection.service.MessageService;
import com.fervil.spring.careercoach.util.Constants;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.PutObjectRequest;

@Controller
@RequestMapping("/workroom/wrsendEmail")
public class WRSendEmailAttachController { 
	
    private static final Logger log = LoggerFactory.getLogger(WorkController.class);
	
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private MessageService messageService;  
	@Autowired
	private CustomerService customerService;

    private static String bucketName     = "ccxviworkroom";
    //private static String keyName        = "Object-"+UUID.randomUUID();	
    private static String uploadFileNamePrefix = "ccxv1atch";

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView sendEmail(HttpServletRequest request,
			final @RequestParam CommonsMultipartFile attachFile,ModelMap model) { 

		try{	
			
			// reads form input
			final String emailTo = request.getParameter("emailid");
			final String name = request.getParameter("name"); 
			final String subject = request.getParameter("subject");
			final String message = request.getParameter("message");
	
			//final long fromprofileid =  Long.valueOf(request.getParameter("fromprofileid").toString() );
			//final long toprofileid = Long.valueOf(request.getParameter("toprofileid").toString() ) ;
			
			long fromprofileid = Long.valueOf(request.getParameter("fromprofileid"));
			long toprofileid = Long.valueOf(request.getParameter("toprofileid"));

			//May do something here.  If Order Id is null, create a dummy order for users just trying to send messages.			
			long orderid = Long.valueOf(request.getParameter("orderid"));

			String fromEmail = request.getParameter("fromemail").toString();
			String toEmail = request.getParameter("toemail").toString();
			
			UserAttachment attachment=new UserAttachment();
			attachment.setAttachmentname(attachFile.getOriginalFilename());
			Usermessage message2=new Usermessage();
			message2.setDescription(message);
			message2.setReadstatus("1");
			message2.setType(subject);
			
			message2.setFromprofileid(fromprofileid);
			message2.setToprofileid(toprofileid);
			message2.setOrderid(orderid);
			
			//message2.setFromuser(customer);  
			//message2.setTouser(customer2);  
			Set<UserAttachment> attachments=new HashSet<UserAttachment>();
			attachments.add(attachment);
			message2.setUserattachment(attachments); 
			Date date = new Date();
			message2.setDate(date);
			message2=messageService.saveUserMessage(message2);   
			
			attachments=message2.getUserattachment();
			Iterator<UserAttachment> iterator=attachments.iterator();
			String extension="";
			while (iterator.hasNext()) {
				extension=String.valueOf(iterator.next().getAttachid());
				
			}
			
		
			/************Added By Sanando 16.01.15 at 8:15 pm********************/
			
			List<Usermessage> messages=new ArrayList<Usermessage>();
			
			messages=messageService.getUserMessagesByProfileId(orderid);  
			
			for(int i=0;i<messages.size();i++){
				Usermessage message1=new Usermessage();
				message1=messages.get(i); 
			}
			
			model.addAttribute("emailid", emailTo);  
			
			model.put("messages", messages);
			
			
			/************Added By Sanando 16.01.15 at 8:15 pm********************/
			
			//START FILE UPLOAD CODE
			 if (!attachFile.isEmpty()) {
		            //try {
		                byte[] bytes = attachFile.getBytes();
	
	//AWS AWS AWS AWS Setup to save the file in Amazon AWS
		                try {  //We want the try and catch here because we want to continue even if saving to AWS fails.
		        	        AmazonS3 s3client = new AmazonS3Client(new ProfileCredentialsProvider());

		                	File convFile = new File(attachFile.getOriginalFilename());
			                attachFile.transferTo(convFile);
			                //return convFile;            
			        
			                String[] split = convFile.getName().split("\\.");
			                String ext = split[split.length - 1];
	
			                String filename = split[split.length - 2];
			                
			                PutObjectRequest por = new PutObjectRequest(bucketName, uploadFileNamePrefix + message2.getOrderid() + message2.getMessageid() + filename + "." + ext, convFile);
			                por.setCannedAcl(CannedAccessControlList.PublicRead);
			                s3client.putObject(por);
			                
			                convFile.delete();
			                
			                //s3client.putObject(new PutObjectRequest(
			                //		bucketName, uploadFileNamePrefix + userProfile.getUserProfileId() + "." + ext, convFile ) );
			                
			             } catch (AmazonServiceException ase) {
			            	/* 
			                System.out.println("Caught an AmazonServiceException, which " +
			                		"means your request made it " +
			                        "to Amazon S3, but was rejected with an error response" +
			                        " for some reason.");
			                System.out.println("Error Message:    " + ase.getMessage());
			                System.out.println("HTTP Status Code: " + ase.getStatusCode());
			                System.out.println("AWS Error Code:   " + ase.getErrorCode());
			                System.out.println("Error Type:       " + ase.getErrorType());
			                System.out.println("Request ID:       " + ase.getRequestId());
							*/
			            	 String msg = "Caught an AmazonServiceException, which " +
				                		"means your request made it " +
				                        "to Amazon S3, but was rejected with an error response" +
				                        " for some reason. ";
			            	 msg += "::Error Message:    " + ase.getMessage();
			            	 msg += "::HTTP Status Code: " + ase.getStatusCode();
			            	 msg += "::AWS Error Code:   " + ase.getErrorCode();
			            	 msg += "::Error Type:       " + ase.getErrorType();
			            	 msg += "::Request ID:       " + ase.getRequestId();
	
			            	 log.error(msg, ase);
			    	        
			    			//model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			    			//return "public/common/error/errorpage";
			                
			             
			             } catch (AmazonClientException ace) {
			                String msg = "Caught an AmazonClientException, which " +
			                		"means the client encountered " +
			                        "an internal error while trying to " +
			                        "communicate with S3, " +
			                        "such as not being able to access the network.";
			                
			            	 log.error(msg, ace);
			            }  catch (Exception e) {
			                String msg = "Caught a General Amazon Exception, which ";			                
			            	log.error(msg, e);
			            }     	
			                
		//AWS AWS AWS End of save to AWS
		                
		                mailSender.send(new MimeMessagePreparator() {
	
		        			@Override
		        			public void prepare(MimeMessage mimeMessage) throws Exception {
		        				MimeMessageHelper messageHelper = new MimeMessageHelper(
		        						mimeMessage, true, "UTF-8");
		        				messageHelper.setTo(emailTo);
		        				messageHelper.setSubject(subject);
		        				messageHelper.setText(message);
		        				
		        				// determines if there is an upload file, attach it to the e-mail
		        				
		        				
		        				String attachName = attachFile.getOriginalFilename();
		        				if (!attachFile.equals("")) {
	
		        					messageHelper.addAttachment(attachName, new InputStreamSource() {
		        						
		        						@Override
		        						public InputStream getInputStream() throws IOException {
		        							return attachFile.getInputStream();
		        						}
		        					});
		        				}
		        				
		        			}
	
		        		}); 
/*		               
		            } catch (Exception e) {
		                String msg = "Error while trying to send the Email::";
		                
		            	 log.error(msg, e);
		            	
		            }
*/		            
		        } else {
		        	mailSender.send(new MimeMessagePreparator() {
	
	        			@Override
	        			public void prepare(MimeMessage mimeMessage) throws Exception {
	        				MimeMessageHelper messageHelper = new MimeMessageHelper(
	        						mimeMessage, true, "UTF-8");
	        				messageHelper.setTo(emailTo);
	        				messageHelper.setSubject(subject);
	        				messageHelper.setText(message);
	        			}
	
	        		}); 
		        }
	//END FILE UPLOAD CODE
			 
			 
				model.addAttribute("fromprofileid", fromprofileid);
				model.addAttribute("toprofileid", toprofileid);
				model.addAttribute("orderid", orderid);
				
				model.addAttribute("fromemail", fromEmail);
				model.addAttribute("toemail", toEmail);
			
			 
			   model.addAttribute("emailid",emailTo);  
			   model.addAttribute("name",name); 
	
			   model.addAttribute("fromdisplayname", request.getParameter("fromdisplayname").toString());
			   model.addAttribute("todisplayname", request.getParameter("todisplayname").toString());
	
			   return new ModelAndView("workroom/wrEmailForm", model); 
			   
        } catch (Exception e) {
            //String msg = "Error while trying to send the Email::";
        	//log.error(msg, e);
        	 
 	        String msg = "The request failed. Error " + e;
 	        log.error(msg, e);
 			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
		    return new ModelAndView("public/common/error/errorpage", model); 
        	 
        	
        }
			  
	}
}