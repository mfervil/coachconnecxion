package com.fervil.spring.careercoach.web;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.fervil.spring.careercoach.util.Constants;

@Controller
@RequestMapping("/createuserprofilesuccess/userProfileId/{userProfileId}")
public class CreateUserProfileSuccessController {
    private static final Logger log = LoggerFactory.getLogger(CreateUserProfileSuccessController.class);
	
    @RequestMapping(method=RequestMethod.GET)
    public ModelAndView createBillPaySuccess(@PathVariable("userProfileId") String userProfileId, Model model) {
    	Map<String, Object> myModel = new HashMap<String, Object>();
	    try{	
	    	//myModel.put("userProfileId", userProfileId);
	    	myModel.put("message", "Your profile has been successfully created.");
	    	
	    	return new ModelAndView("userprofile/createUserProfileSuccess", "model", myModel);
	    	
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
	        model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
	        return new ModelAndView("public/common/error/errorpage");
		}	
    }
}
