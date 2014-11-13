package ua.com.bitlab.springsecuritydemo.services.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.SavedRequest;

public class CCAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request,
					HttpServletResponse response,
					Authentication auth)
		throws IOException, ServletException {
	// initialization logic after login

	SavedRequest savedRequest = (SavedRequest)request.getSession().getAttribute("SPRING_SECURITY_SAVED_REQUEST");

System.out.println("Inside the saved request");
	if (savedRequest == null) {
	    response.sendRedirect(request.getContextPath() + "/");
	}
	else {
		System.out.println("The saved request is: " + savedRequest.getRedirectUrl());
		
	    response.sendRedirect(savedRequest.getRedirectUrl());
	}
    }
}
