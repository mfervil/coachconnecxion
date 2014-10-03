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

import com.fervil.spring.careercoach.service.BasicCoachingRequestManager;
import com.fervil.spring.careercoach.service.CoachingRequestManager;
import com.fervil.spring.careercoach.util.Constants;

public class CoachingRequestController {
    private static final Logger log = LoggerFactory.getLogger(CoachingRequestController.class);
	

    private CoachingRequestManager coachingRequestManager;

    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response, Model model) {
            //throws ServletException, IOException {
        Map<String, Object> myModel = new HashMap<String, Object>();

    	try{	
	        String now = (new java.util.Date()).toString();
	    
	        myModel.put("now", now);
	        coachingRequestManager = new BasicCoachingRequestManager();
	        myModel.put("coachingRequests", coachingRequestManager.getCoachingRequests());
	           	
	        return new ModelAndView("coachingRequestList", "model", myModel);
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
	        //TODO Add handler for map to error page....
	        //myModel.put(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
	        return new ModelAndView("public/common/error/errorpage", "model", myModel);
		}	
    }

    public void setCoachingRequestManager(CoachingRequestManager coachingRequestManager) {
        this.coachingRequestManager = coachingRequestManager;
    }
}
