package com.fervil.spring.careercoach.web;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils;

import com.connection.model.Usermessage;
import com.connection.service.MessageService;
import com.fervil.spring.careercoach.util.Constants;
import com.fervil.spring.careercoach.util.SystemUtil;
import com.fervil.spring.careercoach.vo.CustomerPackagesVO;
import com.fervil.spring.careercoach.model.domain.PaymentInformation;
import com.fervil.spring.careercoach.model.domain.UserProfile;
import com.fervil.spring.careercoach.service.PackageDetailsService;
import com.fervil.spring.careercoach.service.PaymentInformationManager;
import com.fervil.spring.careercoach.service.PaymentInformationValidator;
import com.fervil.spring.careercoach.service.UserProfileManager;

@Controller
public class CoachClientNonOrderConversationController {
    private static final Logger log = LoggerFactory.getLogger(CoachClientNonOrderConversationController.class);


	@Resource(name = "userProfileManager")
	private UserProfileManager userProfileManager;
    
	//@Resource(name = "paymentInformationManager")
	private PaymentInformationManager paymentInformationManager;

    
	@Autowired
	public CoachClientNonOrderConversationController(PaymentInformationManager paymentInformationManager,
			PaymentInformationValidator validator) {
		this.paymentInformationManager = paymentInformationManager;
		//this.validator = validator;
	}		
	
	
	@Autowired
	private MessageService messageService;  

	@RequestMapping(value = "/workroom/wrsendMessageNoOrder", method = RequestMethod.GET)
	public ModelAndView  sendMessageNoOrder(org.springframework.web.context.request.WebRequest webRequest, HttpServletRequest request) {

		//Map<String, Object> model = new HashMap<String, Object>();
		ModelMap model = new ModelMap();
		
		try{

			//long orderid = Long.valueOf(webRequest.getParameter("orderid"));
			//long orderid = Long.valueOf(webRequest.getParameter("orderid") == null?"-1":webRequest.getParameter("orderid"));

			//Coach Information
			String toEmail = webRequest.getParameter("coachEmail").toString();
			String todisplayname = webRequest.getParameter("coachDisplayName").toString() ;
			long userCommunicatingTotoProfileId = Long.valueOf(webRequest.getParameter("coachProfileId"));

			UserProfile userprofile = SystemUtil.getUserProfile(request, userProfileManager); //Only works if you gets redirected automatically to the login page first
			
			
			long currentLoggedInUserProfileId =  userprofile.getUserProfileId();
			String fromEmail = userprofile.getEmail();
			String fromdisplayname = userprofile.getDisplayName();

			/////////////////////////////////////////////////////////////////////////////////////////////////////
			//  IF ORDERID DOES NOT EXISTS, ADD A DUMMY RECORD IN THE PAYMENT INFORMATION TABLE.
			PaymentInformation paymentInformation = new PaymentInformation();

			paymentInformation.setEmail(fromEmail);

			paymentInformation.setPackageName(webRequest.getParameter("packageName"));
			paymentInformation.setPackageId(Integer.valueOf(webRequest.getParameter("packageId")));
			paymentInformation.setPackagePrice(Float.valueOf(webRequest.getParameter("packagePrice")));
			paymentInformation.setEntrytype(1);
			
			paymentInformation.setPassword("000000");  // User password should not be set in this table
			paymentInformation.setConfirmedpassword("000000");

			List<HashMap> currentUserPaymentInformataion = paymentInformationManager.getPaymentRecordBypackageForUser(paymentInformation.getPackageId(), paymentInformation.getEmail());
			//If If I don't have a thread going on this package, create a payment information record, since that is needed to send messages
			//back and forth.

			long orderid = -1;
			
			if (currentUserPaymentInformataion.isEmpty()){
				paymentInformationManager.storePaymentInformation(paymentInformation);
				orderid = paymentInformation.getId();
			} else {
				
				orderid = ((BigInteger)currentUserPaymentInformataion.get(0).get("id")).longValue()   ;
			}
			
			
			
			////////////////////////////////////////////////////////////////////////////////////////////////////
			
			List<Usermessage> messages=new ArrayList<Usermessage>();
			
			messages=messageService.getUserMessagesByProfileId(orderid);  

			for(int i=0;i<messages.size();i++){
				
				Usermessage message=new Usermessage();
				message=messages.get(i); 

			}

			//Change the status of all the messages to read.
			try {
				messageService.updateReadStatus(orderid, userCommunicatingTotoProfileId, currentLoggedInUserProfileId, 0);
				
				//After the user sees all the emails, we want to clear the messages.
				int numMessages =messageService.getNumberOfUnreadMsgByProfileId(currentLoggedInUserProfileId);  
				
				HttpSession session=request.getSession();
				session.setAttribute("nummessages", new Integer(numMessages));
				
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
	        String msg = "Error encountered while running sendMessageNoOrder " + e;
	        log.error(msg, e);
	        model.put(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			//model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return new ModelAndView("public/common/error/errorpage", model);
		}	
	}
	
}
