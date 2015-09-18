package com.fervil.spring.careercoach.web.tutor;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fervil.spring.careercoach.util.Constants;

@Controller
@RequestMapping("/tutor/createuserprofilesuccess/userProfileId/{userProfileId}")
public class TutorCreateUserProfileSuccessController {
    private static final Logger log = LoggerFactory.getLogger(TutorCreateUserProfileSuccessController.class);
	
    @RequestMapping(method=RequestMethod.GET)
    public ModelAndView createBillPaySuccess(@PathVariable("userProfileId") String userProfileId, Model model) {
	    try{	
	    	
	    	ModelAndView mav = new ModelAndView ();
			mav.addObject("profileId", userProfileId);
			mav.addObject("message", "Congratulations! Your profile has been successfully created.");
	    	
			mav.setViewName ("tutor/userprofile/createUserProfileSuccess");
			return mav;
	    	
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
	        model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
	        return new ModelAndView("tutor/public/common/error/errorpage");
		}	
    }
}
