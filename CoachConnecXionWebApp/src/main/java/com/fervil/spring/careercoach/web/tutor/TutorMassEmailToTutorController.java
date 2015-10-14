package com.fervil.spring.careercoach.web.tutor;

import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fervil.spring.careercoach.model.domain.Contacttutor;
import com.fervil.spring.careercoach.model.domain.UserProfile;
import com.fervil.spring.careercoach.service.ContactTutorManager;
import com.fervil.spring.careercoach.service.CreateUserProfileValidator;
import com.fervil.spring.careercoach.service.UserProfileManager;
import com.fervil.spring.careercoach.service.validator.TutorMassTutorEmailValidator;
import com.fervil.spring.careercoach.util.Constants;

@Controller		  
public class TutorMassEmailToTutorController {
    private static final Logger log = LoggerFactory.getLogger(TutorMassEmailToTutorController.class);
    
	@Resource(name = "massTutorContactValidator")
	private TutorMassTutorEmailValidator validator;
	
	@Resource(name = "contactTutorManager")
	private ContactTutorManager contactTutorManager;
	

@RequestMapping(value = "/tutor/contact/mass-email-to-tutors", method = RequestMethod.GET)
public String getEmailToTutor(HttpServletRequest request, HttpServletResponse response, ModelMap model) {

	//Map<String, Object> myModel = new HashMap<String, Object>();
	try{	

		
		String availability = " Monday: 3PM - 9PM \r Tuesday: 3PM - 9PM \r Wednesday: 3PM - 9PM \r Thursday: 3PM - 9PM \r Friday: 3PM - 9PM \r Saturday: Not Available \r Sunday: Not Available \r";
		
		Contacttutor contacttutor = new Contacttutor();
		
		/*
		if (userProfile.getAvailability() == null || userProfile.getAvailability().trim().equalsIgnoreCase("") ) {
			userProfile.setAvailability(availability);
		}
		*/
		contacttutor.setAvailability(availability);
		
		String now = (new java.util.Date()).toString();
		model.addAttribute("contacttutor", contacttutor);
		model.addAttribute("now", now);
		
		return "tutor/contacttutor/MassEmailToTutors"; 

/*		
		myModel.put("contacttutor", new Contacttutor());
        myModel.put("now", now);
		String navPage = "tutor/contacttutor/MassEmailToTutors";
        return new ModelAndView(navPage, "model", myModel);
*/
	} catch (Exception e) {
        String msg = "The request failed. Error " + e;
        log.error(msg, e);
		model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
        return "tutor/public/common/error/errorpage";
	}	
}	

@RequestMapping(value = "/tutor/contact/mass-email-to-tutors", method = RequestMethod.POST)
public String postEmailToTutor(HttpServletRequest request, HttpServletResponse response, Model model,
		@ModelAttribute("contacttutor") Contacttutor contactTutor, BindingResult result) {

		validator.validate(contactTutor, result);

		try {
		
	        if (result.hasErrors()) {
	    		model.addAttribute("contacttutor", contactTutor);
				return "tutor/contacttutor/MassEmailToTutors";
			} else {
				contactTutorManager.storeContactTutor(contactTutor);
				return "tutor/contacttutor/MassEmailToTutors";
			}
		
		} catch (Exception e) {
            String msg = "Failed to create user. Error " + e;
            log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "tutor/public/common/error/errorpage";
		}    
	        
	
}	

	
}
