package ua.com.bitlab.springsecuritydemo.services.security;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.SavedRequest;

import com.connection.service.MessageService;
import com.connection.service.MessageServiceImpl;
import com.fervil.spring.careercoach.model.domain.UserProfile;
import com.fervil.spring.careercoach.service.UserProfileManager;

public class CCAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

		//Re-examine these 2 calls to see if too much resources are consumed in login
	   	@Resource(name = "userProfileManager")
	   	private UserProfileManager userProfileManager;

	   	@Resource(name = "messageService")
	   	private MessageService messageService;
	   	
		//@Autowired
		//private static MessageService messageService;  
		////////////////////////////////////////////////////////////////////////////////
		
	@Override
    public void onAuthenticationSuccess(HttpServletRequest request,
					HttpServletResponse response,
					Authentication auth)
		throws IOException, ServletException {
	// initialization logic after login

    	
    	
	SavedRequest savedRequest = (SavedRequest)request.getSession().getAttribute("SPRING_SECURITY_SAVED_REQUEST");
	
	//2/16/2015::Get number of user messages and put it in session
	
	//long userId = SecurityUtils.getCurrentUser().getId() ;
	
	System.out.println("I am in CCAuthen....");
	List<UserProfile> usrList=null;
	try {
		usrList = userProfileManager.findByUserId(SecurityUtils.getCurrentUser().getId());
		
		int profileType = 0;
		long userProfileId = 0;
		for(int j=0; j<usrList.size();j++ ){			
			profileType= usrList.get(j).getUserProfileType();
			userProfileId = (profileType==1 || profileType==2)?usrList.get(j).getUserProfileId():0;
			System.out.println("I am in CCAuthen...." + profileType + "::" + userProfileId);
			break;
		}
		
		int numMessages =messageService.getNumberOfUnreadMsgByProfileId(userProfileId);  
		System.out.println("NUM MESSAGES I am in CCAuthen...." + numMessages);
		
		HttpSession session=request.getSession();
		session.setAttribute("nummessages", new Integer(numMessages));
		session.setAttribute("usertype", profileType);
		
		//Customer customer=new Customer();
		//customer=(Customer)session.getAttribute("Customer");
		
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

	//2/16/2015
	
System.out.println("Inside the saved request");
	if (savedRequest == null) {
		
	    response.sendRedirect(request.getContextPath() + "/");
	}
	else {
		System.out.println("The saved request is: " + savedRequest.getRedirectUrl());
		
		if (savedRequest.getRedirectUrl().contains("ping_session") ){
		    response.sendRedirect(request.getContextPath() + "/");
		} else {
			response.sendRedirect(savedRequest.getRedirectUrl());
		}	
	}
    }
}
