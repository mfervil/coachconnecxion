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
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.PutObjectRequest;

@Controller
@RequestMapping("/workroom/wrsendEmail")
public class WRSendEmailAttachController { 
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

        AmazonS3 s3client = new AmazonS3Client(new ProfileCredentialsProvider());
		
		// reads form input
		final String emailTo = request.getParameter("emailid");
		final String name = request.getParameter("name"); 
		final String subject = request.getParameter("subject");
		final String message = request.getParameter("message");

		//final long fromprofileid =  Long.valueOf(request.getParameter("fromprofileid").toString() );
		//final long toprofileid = Long.valueOf(request.getParameter("toprofileid").toString() ) ;
		
		long fromprofileid = Long.valueOf(request.getParameter("fromprofileid"));
		long toprofileid = Long.valueOf(request.getParameter("toprofileid"));
		long orderid = Long.valueOf(request.getParameter("orderid"));

		String fromEmail = request.getParameter("fromemail").toString();
		String toEmail = request.getParameter("toemail").toString() ;
		
		
		
		//HttpSession session=request.getSession();
		//Customer customer=new Customer();
		//customer=(Customer)session.getAttribute("Customer"); 
		 
		// for logging
		
		UserAttachment attachment=new UserAttachment();
		attachment.setAttachmentname(attachFile.getOriginalFilename());
		Usermessage message2=new Usermessage();
		message2.setDescription(message);
		message2.setReadstatus("1");
		message2.setType(subject);
		
/*		
		Customer customer2=new Customer();
		if(session.getAttribute("TO_CUSTOMER")!=null){
			customer2=(Customer)session.getAttribute("TO_CUSTOMER"); 
		}else{
			CustomerBean customerbean=new CustomerBean();
			customerbean.setId(Integer.parseInt(request.getParameter("id")));  
			try {
				customer2=customerService.loadCustomer(customerbean);
				BeanUtils.copyProperties(customerbean, customer2); 
				
			} catch (IllegalAccessException e) {				
				e.printStackTrace();
			} catch (InvocationTargetException e) {				
				e.printStackTrace();
			}
		}
*/			
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
		
		System.out.println("++++++++++++++++++++++++++++++hello++++++++++++++++++++++++");
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
		
		//System.out.println("NOW TOTAL FILE NAME:_   "+filename); 
		
		//START FILE UPLOAD CODE
		 if (!attachFile.isEmpty()) {
	            try {
	                byte[] bytes = attachFile.getBytes();

/*	                
	                // Creating the directory to store file
	                String rootPath = System.getProperty("catalina.home");
	                File dir = new File(rootPath + File.separator + "tmpFiles");
	                if (!dir.exists())
	                    dir.mkdirs();
	 
	                // Create the file on server
	              String filename=attachFile.getOriginalFilename();
	              filename=filename.substring(filename.indexOf(".")); 
	              filename=extension+filename;
	                File serverFile = new File(dir.getAbsolutePath()
	                        + File.separator +filename);
	                BufferedOutputStream stream = new BufferedOutputStream(
	                        new FileOutputStream(serverFile));
	                stream.write(bytes);
	                stream.close();
	                
*/

//AWS AWS AWS AWS Setup to save the file in Amazon AWS
	                try {
		                File convFile = new File(attachFile.getOriginalFilename());
		                attachFile.transferTo(convFile);
		                //return convFile;            
		        
		                String[] split = convFile.getName().split("\\.");
		                String ext = split[split.length - 1];

		                String filename = split[split.length - 2];
		                
		                PutObjectRequest por = new PutObjectRequest(bucketName, uploadFileNamePrefix + message2.getOrderid() + message2.getMessageid() + filename + "." + ext, convFile);
		                por.setCannedAcl(CannedAccessControlList.PublicRead);
		                s3client.putObject(por);
		                
		                //s3client.putObject(new PutObjectRequest(
		                //		bucketName, uploadFileNamePrefix + userProfile.getUserProfileId() + "." + ext, convFile ) );
		                
		             } catch (AmazonServiceException ase) {
		                System.out.println("Caught an AmazonServiceException, which " +
		                		"means your request made it " +
		                        "to Amazon S3, but was rejected with an error response" +
		                        " for some reason.");
		                System.out.println("Error Message:    " + ase.getMessage());
		                System.out.println("HTTP Status Code: " + ase.getStatusCode());
		                System.out.println("AWS Error Code:   " + ase.getErrorCode());
		                System.out.println("Error Type:       " + ase.getErrorType());
		                System.out.println("Request ID:       " + ase.getRequestId());
		            } catch (AmazonClientException ace) {
		                System.out.println("Caught an AmazonClientException, which " +
		                		"means the client encountered " +
		                        "an internal error while trying to " +
		                        "communicate with S3, " +
		                        "such as not being able to access the network.");
		                System.out.println("Error Message: " + ace.getMessage());
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
	               
	            } catch (Exception e) {
	               e.printStackTrace();
	            }
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

		    //model.addAttribute("id",toprofileid); 
		   
		   return new ModelAndView("workroom/wrEmailForm", model); 
		   
		  
	}
}