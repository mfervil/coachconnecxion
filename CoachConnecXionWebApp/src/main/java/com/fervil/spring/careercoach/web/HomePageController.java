package com.fervil.spring.careercoach.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fervil.spring.careercoach.model.domain.CoachingCategory;
import com.fervil.spring.careercoach.model.domain.RequestDetails;
import com.fervil.spring.careercoach.service.RequestDetailService;
import com.fervil.spring.careercoach.util.Constants;

import org.slf4j.Logger;

/**
 * Handles and retrieves person request
 */
@Controller
public class HomePageController {
    private static final Logger log = LoggerFactory.getLogger(HomePageController.class);
	
Integer requestId=1;
	@Resource(name = "requestDetailService")
	private RequestDetailService requestDetailService;

    //Method used to diplay the home page 	
	@RequestMapping(value = {"", "/"}, method = RequestMethod.GET)
	public String getHomePage(Model model) {
		log.debug("Received request to display the home page");
		try{	
			return "users/home";
			
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
		}	
		
		
	}
}
