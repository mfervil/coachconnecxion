package com.fervil.spring.careercoach.web;

import java.io.File;
import java.lang.reflect.InvocationTargetException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.connection.bean.CustomerBean;
import com.connection.model.Attachment;
import com.connection.model.Customer;
import com.connection.model.Message;
import com.connection.model.Usermessage;
import com.connection.service.CustomerService;
import com.connection.service.MessageService;
import com.fervil.spring.careercoach.util.Constants;

@Controller
@Scope("session")
public class WRCustomerController {
    private static final Logger log = LoggerFactory.getLogger(legalController.class);
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
	private CustomerService customerService;
	@Autowired
    private JavaMailSender mailSender;
	@Autowired
	private MessageService messageService;  
	private String filePath = "/tmpFiles/";
	private static final int BUFFER_SIZE = 4096;
	
	
/*	
	@RequestMapping(value = "/workroom/wrsaveCustomer", method = RequestMethod.POST)
	public ModelAndView saveCustomer(@ModelAttribute("command") CustomerBean customerbean, 
			BindingResult result) {
		
		Map<String, Object> model = new HashMap<String, Object>();
		try{
			String email=customerbean.getEmailid();
			boolean flag=customerService.cheking(email);
			if(!flag){
				
			
				
			String password=customerbean.getPassword();
		    if(password.equals(customerbean.getConfirmpassword())){
			Customer employee = prepareModel(customerbean);
			
			customerService.addCustomer(employee);
			regiMail(employee);
			model.put("msg", "Customer Inserted Successfully");
			}
			else{
				
				model.put("msg", "password and confirm password not match");
			}
			}
			else{
				model.put("msg", "Email Id present in data base");
			}
			model.put("customers",  prepareListofBean(customerService.listCustomer()));
			
        }catch(Exception exception){
        	model.put("msg", exception.getMessage());
		}
		return new ModelAndView("workroom/wraddCustomer", model);
	}
*/	

/*	
	@RequestMapping(value = "/workroom/wraddCustomer", method = RequestMethod.GET)
	public ModelAndView addCustomer(@ModelAttribute("command")  CustomerBean customerbean,
			BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		//model.put("employees",  prepareListofBean(employeeService.listEmployeess()));
		model.put("customers",  prepareListofBean(customerService.listCustomer()));
		return new ModelAndView("workroom/wraddCustomer", model);
	}
	@RequestMapping(value="/workroom/wrviewCustomer", method = RequestMethod.GET)
	public ModelAndView listEmployees() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("customers",  prepareListofBean(customerService.listCustomer()));
		return new ModelAndView("wrcustomersList", model);
	}
	
	@RequestMapping(value = "/workroom/wrdeleteCustomer", method = RequestMethod.GET)
	public ModelAndView editEmployee(@ModelAttribute("command")  CustomerBean customerbean,
			BindingResult result) {
		customerService.deleteCustomer(prepareModel(customerbean));
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("customers", null);
		model.put("customers",  prepareListofBean(customerService.listCustomer()));
		return new ModelAndView("workroom/wraddCustomer", model);
	}
	@RequestMapping(value = "/workroom/wrindex", method = RequestMethod.GET)
	public ModelAndView welcome() {
		return new ModelAndView("workroom/wrindex");
	}
*/
	
/*	
	@RequestMapping(value = "/workroom/wrlogin", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("command")  CustomerBean customerbean,
			BindingResult result,HttpServletRequest request) {
		Map<String, Object> model = new HashMap<String, Object>();
		String emailID=customerbean.getEmailid();
		String pass=customerbean.getPassword();
		
		emailID = "sanando.career@gmail.com";
		pass = "123";		
		
		List<Customer> list=customerService.login(emailID, pass);
		if(list.size()>0){
			HttpSession session=request.getSession();
			for(Customer customer:list){
				session.setAttribute("Customer", customer);
			}
			Customer customer=(Customer)session.getAttribute("Customer");
			
			//session.setAttribute("Customer", arg1)
		//List<Object[]>  listname=customerService.unReadMsg(customer.getEmailid());
			
			
			List<Object[]> listname=customerService.unReadMsg(customer);
			List<String[]> listarray=new ArrayList<String[]>();
			
			String checker="";
			for(Object[] arr : listname){
	            String[] liststring=new String[4];
	            int index=0;
	            for(Object value:arr){
	            	 //String value=value.toString()
	            	
	            	liststring[index]=value.toString();
	            	//checker=liststring[0];
	            	index++;
	            }
	            listarray.add(liststring);
	        }
			//Collections.sort(listarray.subList(1, listarray.size()));
			model.put("listarray", listarray);
		List<Object[]>  listObject=customerService.fileDownload(customer);
            List<String[]> listdownload=new ArrayList<String[]>();
			
			//String checker="";
			for(Object[] arr : listObject){
	            String[] liststring=new String[4];
	            int index=0;
	            for(Object value:arr){
	            	 //String value=value.toString()
	            	
	            	liststring[index]=value.toString();
	            	//checker=liststring[0];
	            	index++;
	            }
	            listdownload.add(liststring);
			}
			model.put("listdownload",listdownload);
			
			// * Was already commented out
			List<Attachment> attachments=new Arrray 
			CustomerBean bean=new CustomerBean();
			bean.setId(customer.getCustomerid()); 
			Customer model1=new Customer();
			model1=customerService.loadCustomer(bean);
			Iterator<Message> iterator=model1.getFromMessage().iterator();
			while (iterator.hasNext()) {
				
				Message message=iterator.next();
				Iterator<Attachment> iterator2=message.getAttachment().iterator(); 
				while(iterator2.hasNext()){
					
				}
			//return new ModelAndView("Welcome", model);
			
			}
			model.put("message", iterator);
			* //  Was already commented out
	
	
			return new ModelAndView("workroom/wrWelcome", model);
			
			
		}else{
			model.put("msg",  "Login Credential Wrong");
			return new ModelAndView("workroom/wrloginPage", model);
		}
	}
*/

/*	
	@RequestMapping(value = "/workroom/wrhome", method = RequestMethod.GET)
	public ModelAndView homePage(@ModelAttribute("command")  CustomerBean customerbean,
			BindingResult result,HttpServletRequest request) throws MessagingException {
		
		HttpSession session=request.getSession();
		Map<String, Object> model = new HashMap<String, Object>();
		Customer customer=(Customer)session.getAttribute("Customer");
		
		
		
		List<Object[]> listname=customerService.unReadMsg(customer);
		List<String[]> listarray=new ArrayList<String[]>();
		
		String checker="";
		for(Object[] arr : listname){
            String[] liststring=new String[4];
            int index=0;
            for(Object value:arr){
            	 //String value=value.toString()
            	
            	liststring[index]=value.toString();
            	//checker=liststring[0];
            	index++;
            }
            listarray.add(liststring);
        }
		//Collections.sort(listarray.subList(1, listarray.size()));
		model.put("listarray", listarray);
	List<Object[]>  listObject=customerService.fileDownload(customer);
        List<String[]> listdownload=new ArrayList<String[]>();
		
		//String checker="";
		for(Object[] arr : listObject){
            String[] liststring=new String[4];
            int index=0;
            for(Object value:arr){

            	liststring[index]=value.toString();
            	
            	index++;
            }
            listdownload.add(liststring);
		}
		model.put("listdownload",listdownload);
		return new ModelAndView("workroom/wrWelcome", model);
		
		
		//return new ModelAndView("Welcome", model);
		
	}
*/	
	
	
	@RequestMapping(value = "/workroom/wrsendMail", method = RequestMethod.GET)
	public ModelAndView sendMail(@ModelAttribute("command")  CustomerBean customerbean,
			BindingResult result,HttpServletRequest request) {
		Map<String, Object> model = new HashMap<String, Object>();

		try{
			boolean flag=sendMail();
			return new ModelAndView("workroom/wrindex");
		} catch (Exception e) {
	        String msg = "Error encountered while downloading your file.  The file is either corrupted or does not exist " + e;
	        log.error(msg, e);
	        model.put(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			//model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return new ModelAndView("public/common/error/errorpage", model);

			//return "public/common/error/errorpage";

		}	
		
	}

	
	private boolean sendMail() throws Exception{
		
		String recipientAddress = "tmmca10@gmail.com";
		String subject = "test";
		String message = "test";

       
       MimeMessage msg = mailSender.createMimeMessage();  
       
       MimeMessageHelper helper = new MimeMessageHelper(msg, true);  
       helper.setFrom("sanando.beas@gmail.com");  
       helper.setTo("tmmca10@gmail.com");  
       helper.setSubject(subject);  
       //helper.setText(message);  
 
       // attach the file  
       FileSystemResource file = new FileSystemResource(new File("d:/rr.txt"));  
       helper.addAttachment("mybrothermage.txt", file);//image will be sent by this name  
 
       mailSender.send(msg);  
       
       return true;
	}
	
	
	
/*	
	@RequestMapping(value = "/workroom/wrforgotPasswordPage", method = RequestMethod.GET)
	public ModelAndView forgotPasswordPage(@ModelAttribute("command")  CustomerBean customerbean,
			BindingResult result,HttpServletRequest request) throws MessagingException {
		//boolean flag=sendMail();
		return new ModelAndView("workroom/wrforgotPassword");
		
	}
	//forgotPassword.html
	
	@RequestMapping(value = "/workroom/wrforgotPassword", method = RequestMethod.GET)
	public ModelAndView forgotPassword(@ModelAttribute("command")  CustomerBean customerbean,
			BindingResult result,HttpServletRequest request) throws MessagingException {
		String emailID=customerbean.getEmailid();
		Map<String, Object> model = new HashMap<String, Object>();
		List<Customer> list=customerService.forgotPassword(emailID);
		
		if(list.size()>0){
			for(Customer customer:list){
			forgotPasswordMail(customer);
			}
			model.put("msg",  "We will send you the password in your mail id");
			return new ModelAndView("workroom/wrforgotPassword",model);
		}
		else{
			model.put("msg",  "Email Id Not Present in database");
			return new ModelAndView("workroom/wrforgotPassword",model);
		}
		
		
	}
	
*/	
	
	@RequestMapping(value = "/workroom/wrsearch", method = RequestMethod.POST)
	public ModelAndView search(@ModelAttribute("command")  CustomerBean customerbean,
			BindingResult result,HttpServletRequest request) {
		Map<String, Object> model = new HashMap<String, Object>();
		
		try{
			
			String searchValue=customerbean.getSearchValue();
			if(searchValue!=null && !searchValue.equalsIgnoreCase("")){
				
			
			List<Customer> list=customerService.listSearchCustomer(searchValue);
			
			//List<Customer> list=customerService.login(emailID, pass);
			model.put("customers",  list);
			
			//Collections.sort(listarray.subList(1, listarray.size()));
			//model.put("listarray", listarray);
			}
			
			else{
				model.put("msg","Please Enter data in text field");
			}
			HttpSession session=request.getSession();
			Customer customer=(Customer)session.getAttribute("Customer");
			
			List<Object[]> listname=customerService.unReadMsg(customer);
			List<String[]> listarray=new ArrayList<String[]>();
			
			String checker="";
			for(Object[] arr : listname){
	            String[] liststring=new String[4];
	            int index=0;
	            for(Object value:arr){
	            	 //String value=value.toString()
	            	
	            	liststring[index]=value.toString();
	            	//checker=liststring[0];
	            	index++;
	            }
	            listarray.add(liststring);
	        }
			//Collections.sort(listarray.subList(1, listarray.size()));
			model.put("listarray", listarray);
			
			List<Object[]>  listObject=customerService.fileDownload(customer);
	        List<String[]> listdownload=new ArrayList<String[]>();
			
			//String checker="";
			for(Object[] arr : listObject){
	            String[] liststring=new String[4];
	            int index=0;
	            for(Object value:arr){
	            	 //String value=value.toString()
	            	
	            	liststring[index]=value.toString();
	            	//checker=liststring[0];
	            	index++;
	            }
	            listdownload.add(liststring);
			}
			model.put("listdownload",listdownload);
			return new ModelAndView("workroom/wrWelcome", model);
			
		} catch (Exception e) {
	        String msg = "Error encountered while downloading your file.  The file is either corrupted or does not exist " + e;
	        log.error(msg, e);
	        model.put(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			//model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return new ModelAndView("public/common/error/errorpage", model);
		}	
	}
	
/*	
	@RequestMapping(value = "/workroom/wrloginPage", method = RequestMethod.GET)
	public ModelAndView loginPage(@ModelAttribute("command")  CustomerBean customerbean,
			BindingResult result,HttpServletRequest request) {
			//return new ModelAndView("workroom/wrloginPage");
		
		Map<String, Object> model = new HashMap<String, Object>();
		String emailID=customerbean.getEmailid();
		String pass=customerbean.getPassword();
		
		emailID = "sanando.career@gmail.com";
		pass = "123";		
		
		List<Customer> list=customerService.login(emailID, pass);
		if(list.size()>0){
			HttpSession session=request.getSession();
			for(Customer customer:list){
				session.setAttribute("Customer", customer);
			}
			Customer customer=(Customer)session.getAttribute("Customer");
			
			//session.setAttribute("Customer", arg1)
		//List<Object[]>  listname=customerService.unReadMsg(customer.getEmailid());
			
			
			List<Object[]> listname=customerService.unReadMsg(customer);
			List<String[]> listarray=new ArrayList<String[]>();
			
			String checker="";
			for(Object[] arr : listname){
	            String[] liststring=new String[4];
	            int index=0;
	            for(Object value:arr){
	            	 //String value=value.toString()
	            	
	            	liststring[index]=value.toString();
	            	//checker=liststring[0];
	            	index++;
	            }
	            listarray.add(liststring);
	        }
			//Collections.sort(listarray.subList(1, listarray.size()));
			model.put("listarray", listarray);
		List<Object[]>  listObject=customerService.fileDownload(customer);
            List<String[]> listdownload=new ArrayList<String[]>();
			
			//String checker="";
			for(Object[] arr : listObject){
	            String[] liststring=new String[4];
	            int index=0;
	            for(Object value:arr){
	            	 //String value=value.toString()
	            	
	            	liststring[index]=value.toString();
	            	//checker=liststring[0];
	            	index++;
	            }
	            listdownload.add(liststring);
			}
			model.put("listdownload",listdownload);
			
			// 2/23/2015 Was already commented out*
			List<Attachment> attachments=new Arrray 
			CustomerBean bean=new CustomerBean();
			bean.setId(customer.getCustomerid()); 
			Customer model1=new Customer();
			model1=customerService.loadCustomer(bean);
			Iterator<Message> iterator=model1.getFromMessage().iterator();
			while (iterator.hasNext()) {
				
				Message message=iterator.next();
				Iterator<Attachment> iterator2=message.getAttachment().iterator(); 
				while(iterator2.hasNext()){
					
					
					System.out.println("@@@@@@@@@@@@@@@ iterator2  "+iterator2.next().getAttachmentname()); 
				}
			//return new ModelAndView("Welcome", model);
			
			}
			model.put("message", iterator);
			*  2/23/2015 Was already commented out /
			return new ModelAndView("workroom/wrWelcome", model);
			
			
		}else{
			model.put("msg",  "Login Credential Wrong");
			return new ModelAndView("workroom/wrloginPage", model);
		}
	}

*/	
	
/*		
		@RequestMapping(value = "/workroom/wrloginPage", method = RequestMethod.GET)
		public ModelAndView loginPage(@ModelAttribute("command")  CustomerBean customerbean,
				BindingResult result,HttpServletRequest request) {
				return new ModelAndView("workroom/wrloginPage");
		
		
		//customerService.deleteCustomer(prepareModel(customerbean));
		
	}
*/		
		
	//Send Message Tanumoy da.....
		
		@RequestMapping(value = "/workroom/wrsendMessage", method = RequestMethod.GET)
		public ModelAndView  sendMessage(org.springframework.web.context.request.WebRequest webRequest, HttpServletRequest request) {

			//Map<String, Object> model = new HashMap<String, Object>();
			ModelMap model = new ModelMap();
			
			try{
				System.out.println("######################################### sendMessage ###############################################"); 
	
				
				long orderid = Long.valueOf(webRequest.getParameter("orderid"));
	
				long currentLoggedInUserProfileId = Long.valueOf(webRequest.getParameter("fromprofileid"));
				long userCommunicatingTotoProfileId = Long.valueOf(webRequest.getParameter("toprofileid"));
				String fromEmail = webRequest.getParameter("fromemail").toString();
				String toEmail = webRequest.getParameter("toemail").toString() ;
	
				String fromdisplayname = webRequest.getParameter("fromdisplayname").toString();
				String todisplayname = webRequest.getParameter("todisplayname").toString() ;
				
				
				System.out.println("The passed info is: " + currentLoggedInUserProfileId + ":" + userCommunicatingTotoProfileId + ":" + fromEmail + ":" + toEmail);
				
				//System.out.println("############  EMAIL "+customerService.loadCustomer(customerbean).getEmailid()); 
				/*
				Customer customer=new Customer();
				try {
					customer=customerService.loadCustomer(customerbean);
					BeanUtils.copyProperties(customerbean, customer); 
					
				} catch (IllegalAccessException e) {				
					e.printStackTrace();
				} catch (InvocationTargetException e) {				
					e.printStackTrace();
				}
				*/
				
				
				
				//HttpSession session=request.getSession();
				//Customer fromCustomer=(Customer)session.getAttribute("Customer");
				List<Usermessage> messages=new ArrayList<Usermessage>();
				
				messages=messageService.getUserMessagesByProfileId(orderid);  
	
				System.out.println("WRCustomerController::wrsendMessage 1:: The messages are: " + messages.size()  );
	
				for(int i=0;i<messages.size();i++){
					
					Usermessage message=new Usermessage();
					message=messages.get(i); 
	
					System.out.println("WRCustomerController::wrsendMessage 2:: The messages are: " + message.getMessageid());
				}
	
				//Change the status of all the messages to read.
				try {
					messageService.updateReadStatus(orderid, userCommunicatingTotoProfileId, currentLoggedInUserProfileId, 0);
					
				 //After the user sees all the emails, we want to clear the messages.
					int numMessages =messageService.getNumberOfUnreadMsgByProfileId(currentLoggedInUserProfileId);  
					
					HttpSession session=request.getSession();
					session.setAttribute("nummessages", new Integer(numMessages));
					
					System.out.println("fromprofileid::" + currentLoggedInUserProfileId + "::numMessages:" + numMessages);
				//After user sees all the emails	
					
					
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}  
				
				model.addAttribute("emailid", toEmail);  
				model.addAttribute("name", "Marc Test Name");   
				//model.addAttribute("id", toProfileId);
	
				model.addAttribute("fromprofileid", currentLoggedInUserProfileId);
				model.addAttribute("toprofileid", userCommunicatingTotoProfileId);
				model.addAttribute("orderid", orderid);
	
				model.addAttribute("fromdisplayname", fromdisplayname);
				model.addAttribute("todisplayname", todisplayname);
				
				model.addAttribute("fromemail", fromEmail);
				model.addAttribute("toemail", toEmail);
				
				//session.setAttribute("TO_CUSTOMER",customer );
				model.addAttribute("skypeName","mfervil");
				
				model.put("messages", messages);
				return new ModelAndView("workroom/wrEmailForm", model); 
			
			} catch (Exception e) {
		        String msg = "Error encountered while downloading your file.  The file is either corrupted or does not exist " + e;
		        log.error(msg, e);
		        model.put(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				//model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				return new ModelAndView("public/common/error/errorpage", model);
			}	
			
			
		}
		
		@RequestMapping(value = "/workroom/wrloadMessageDetails", method = RequestMethod.GET)
		public @ResponseBody String loadSentMessage(HttpServletRequest request,HttpServletResponse response,@RequestParam("id") Integer id, Model model){
			System.out.println("######################################### loadMessageDetails ###############################################");

			try{
					List<Message> messages=new ArrayList<Message>();
			
					Customer customer=new Customer();
					HttpSession session=request.getSession();
					
					customer=(Customer)session.getAttribute("Customer"); 
					Customer customer2=new Customer();
					if(session.getAttribute("TO_CUSTOMER")!=null){
						customer2=(Customer)session.getAttribute("TO_CUSTOMER"); 
					}else{
						CustomerBean customerbean=new CustomerBean();
						customerbean.setId(id);
						try {
							customer2=customerService.loadCustomer(customerbean);
							BeanUtils.copyProperties(customerbean, customer2); 
							
						} catch (IllegalAccessException e) {				
							e.printStackTrace();
						} catch (InvocationTargetException e) {				
							e.printStackTrace();
						}
					}
					
					//Customer customer2=new Customer();
					
					System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^customer.getCustomername()  "+customer.getCustomername());
					System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^customer2.getCustomername()  "+customer2.getCustomername());
					 
					messages=messageService.getUserMessages(customer,customer2);    
				 
					String result="";
					for(int i=0;i<messages.size();i++){
						Message message1=new Message();
						message1=messages.get(i); 
						
						result=result+"<div class=\"detail-msg clearfix\"><strong>"+message1.getFromuser().getCustomername()+"</strong>";
						result=result+"<strong>"+message1.getTouser().getCustomername()+"</strong>";
						result=result+"<div class=\"para\"><p>"+message1.getDescription()+"</p>";
						try{
							Iterator<Attachment> iterator=message1.getAttachment().iterator();
							while(iterator.hasNext()){
								Attachment attachment=iterator.next();
								result=result+"<a href=\"download.html?attachId="+attachment.getAttachid()+"&filename="+attachment.getAttachmentname()+"\"><p>"+attachment.getAttachmentname()+"</p></a>";
							}
						}catch(Exception e){
							
						}
						result=result+"</div>";
						result=result+" <small>"+message1.getDate()+"</small></div>";
						
					}
				
				 /*Random rand = new Random();
				 float r = rand.nextFloat() * 100;
				String result = "<br>Next Random # is <b>" + r + "</b>. Generated on <b>" + new Date().toString() + "</b>";
		        System.out.println("Debug Message from CrunchifySpringAjaxJQuery Controller.." + new Date().toString());*/
					if(messages.size()==0){
						result=""; 
					}
		      
				return result; 
				//return messages;
			
			} catch (Exception e) {
		        String msg = "Error encountered while downloading your file.  The file is either corrupted or does not exist " + e;
		        log.error(msg, e);
		        model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				//model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				return "public/common/error/errorpage";
				
			}	
		}
		
/*		
		@RequestMapping(value = "/workroom/wrloadTotalMsg", method = RequestMethod.GET)
		public @ResponseBody String loadTotalMsg(HttpServletRequest request,HttpServletResponse response){
			HttpSession session=request.getSession();
			Customer customer=(Customer)session.getAttribute("Customer");
			
			//session.setAttribute("Customer", arg1)
		//List<Object[]>  listname=customerService.unReadMsg(customer.getEmailid());
			
			
			List<Object[]> listname=customerService.unReadMsg(customer);
			List<String[]> listarray=new ArrayList<String[]>();
			
			String checker="";
			for(Object[] arr : listname){
	            String[] liststring=new String[4];
	            int index=0;
	            for(Object value:arr){
	            	 //String value=value.toString()
	            	
	            	liststring[index]=value.toString();
	            	//checker=liststring[0];
	            	index++;
	            }
	            listarray.add(liststring);
	        }
			String maindiv="<div class='row-top clearfix'><span>USERS</span><strong>MESSAGES</strong><em>Date</em></div>";
		for(String[] listOfString:listarray){
			maindiv=maindiv+"<div class='detail-msg clearfix'><strong><a href='sendMessage.html?id="+listOfString[3]+"'>"+listOfString[0]+"</a></strong><div class='para'><p>"+listOfString[2]+" Messages</p></div><small>"+listOfString[1]+"</small> </div>";
		}
		//System.out.println("main Div=-----"+maindiv);
  return maindiv;
			
		}
*/		
	
/*		
		@RequestMapping(value = "/workroom/wrloadFileDetails", method = RequestMethod.GET)
		public @ResponseBody String loadFileDetails(HttpServletRequest request,HttpServletResponse response){
			HttpSession session=request.getSession();
			Customer customer=(Customer)session.getAttribute("Customer");
			
			//session.setAttribute("Customer", arg1)
		//List<Object[]>  listname=customerService.unReadMsg(customer.getEmailid());
			
			
			List<Object[]>  listObject=customerService.fileDownload(customer);
            List<String[]> listdownload=new ArrayList<String[]>();
			
			//String checker="";
			for(Object[] arr : listObject){
	            String[] liststring=new String[4];
	            int index=0;
	            for(Object value:arr){
	            	 //String value=value.toString()
	            	
	            	liststring[index]=value.toString();
	            	//checker=liststring[0];
	            	index++;
	            }
	            listdownload.add(liststring);
			}
			
		
			
			String maindiv="<div class='row-top clearfix'><span>USERS</span><strong>Attachments</strong><em>Date</em></div>";
		
			for(String[] listOfString:listdownload){
			maindiv=maindiv+"<div class='detail-msg clearfix'><strong>"+listOfString[0]+"</strong><div class='para'><p><a href='download.html?attachId="+listOfString[3]+"&filename="+listOfString[2]+"'>"+listOfString[2]+"</a></p></div><small>"+listOfString[1]+"</small></div>";
		}
		
           return maindiv;
		}
*/		
		
/*	
	private Customer prepareModel(CustomerBean customerBean){
		Customer customer=new Customer();
		//DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		//System.out.println(dateFormat.format(date));
		
		
		
		customer.setCreateddate(date);
		customer.setAddress(customerBean.getAddress());
		customer.setPhno(customerBean.getPhno());
		customer.setCustomername(customerBean.getName());
		customer.setEmailid(customerBean.getEmailid());
		customer.setPassword(customerBean.getPassword());
		customer.setSkypeName(customerBean.getSkypeName());
		return customer;
	}
	
	
	private List<CustomerBean> prepareListofBean(List<Customer> customers){
		List<CustomerBean> beans = null;
		if(customers != null && !customers.isEmpty()){
			beans = new ArrayList<CustomerBean>();
			CustomerBean bean = null;
			for(Customer customer : customers){
				bean = new CustomerBean();
				bean.setName(customer.getCustomername());
				bean.setId(customer.getCustomerid());
				bean.setAddress(customer.getAddress());
				bean.setPhno(customer.getPhno());
				//bean.setAge(customer.getEmpAge());
				bean.setCreateddate(customer.getCreateddate());
				beans.add(bean);
			}
		}
		return beans;
	}

	
	private  boolean regiMail(Customer customer) throws MessagingException{
		String recipientAddress = customer.getEmailid();
		String subject = "Thanks For Registration"+" "+customer.getCustomername();
		String message = "Registration Successful";

      
       MimeMessage msg = mailSender.createMimeMessage();  
       
       MimeMessageHelper helper = new MimeMessageHelper(msg, true);  
       helper.setFrom("support@CoachConnecXion.com");  
       helper.setTo(recipientAddress);  
       helper.setSubject(subject);  
       helper.setText(message);  
 
       mailSender.send(msg); 
		
		return true;
	}
	
	private  boolean forgotPasswordMail(Customer customer) throws MessagingException{
		String recipientAddress = customer.getEmailid();
		//String passord=customer.getPassword();
		String message = "Username:"+" "+customer.getEmailid()+" "+"Password:"+" "+customer.getPassword();
		String subject = "Forgot Passord"+" "+customer.getCustomername();

      
       MimeMessage msg = mailSender.createMimeMessage();  
       
       MimeMessageHelper helper = new MimeMessageHelper(msg, true);  
       helper.setFrom("support@CoachConnecXion.com");  
       helper.setTo(recipientAddress);  
       helper.setSubject(subject);  
       helper.setText(message);  
 
       mailSender.send(msg); 
		
		return true;
	}
	@RequestMapping(value = "/workroom/wrlogout", method = RequestMethod.GET) 
	public String logout(@ModelAttribute("command")  CustomerBean customerbean,
			BindingResult result,HttpServletRequest request) { 
		
		HttpSession session=request.getSession();
		session.invalidate();
				return "wrloginPage";   
		
	} 
*/	
}
	
