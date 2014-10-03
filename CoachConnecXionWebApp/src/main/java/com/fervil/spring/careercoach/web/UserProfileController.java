package com.fervil.spring.careercoach.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.fervil.spring.careercoach.service.BasicUserProfileManager;
import com.fervil.spring.careercoach.service.UserProfileManager;
import com.fervil.spring.careercoach.util.Constants;

public class UserProfileController {
    private static final Logger log = LoggerFactory.getLogger(UserProfileController.class);

    private UserProfileManager userProfileManager;

    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response, Model model) {
        Map<String, Object> myModel = new HashMap<String, Object>();

    	try	{
	        String now = (new java.util.Date()).toString();
	
	        myModel.put("now", now);
	        userProfileManager = new BasicUserProfileManager();
	        myModel.put("userProfiles", userProfileManager.getUserProfiles());
	           	
	        return new ModelAndView("userProfileList", "model", myModel);
	        
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
	        model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
	        return new ModelAndView("public/common/error/errorpage");
		}	
    }

    public void setUserProfileManager(UserProfileManager userProfileManager) {
        this.userProfileManager = userProfileManager;
    }
}
