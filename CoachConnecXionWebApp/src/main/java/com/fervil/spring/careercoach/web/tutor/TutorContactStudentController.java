package com.fervil.spring.careercoach.web.tutor;

import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import ua.com.bitlab.springsecuritydemo.services.SmtpMailService;

import com.fervil.spring.careercoach.model.domain.Contacttutor;
import com.fervil.spring.careercoach.model.domain.UserProfile;
import com.fervil.spring.careercoach.model.domain.Zipcode;
import com.fervil.spring.careercoach.model.domain.ZipcodeContainer;
import com.fervil.spring.careercoach.service.ContactTutorManager;
import com.fervil.spring.careercoach.service.CreateUserProfileValidator;
import com.fervil.spring.careercoach.service.UserProfileManager;
import com.fervil.spring.careercoach.service.validator.ContactStudentEmailValidator;
import com.fervil.spring.careercoach.service.validator.TutorMassTutorEmailValidator;
import com.fervil.spring.careercoach.util.Constants;
import com.fervil.spring.careercoach.util.SystemUtil;

@Controller		  
public class TutorContactStudentController {
    private static final Logger log = LoggerFactory.getLogger(TutorContactStudentController.class);
    
	//@Resource(name = "massTutorContactValidator")
	//private TutorMassTutorEmailValidator validator;

	@Resource(name = "contactStudentByEmailValidator")
	private ContactStudentEmailValidator validator;

	@Resource(name = "contactTutorManager")
	private ContactTutorManager contactTutorManager;
	
	@Resource(name = "userProfileManager")
	private UserProfileManager userProfileManager;
	
    @Autowired
    private SmtpMailService mailService;
	

@RequestMapping(value = "/tutor/contact/contactstudent", method = RequestMethod.GET)
public String getContactStudent(HttpServletRequest request, HttpServletResponse response, ModelMap model) {

	//Map<String, Object> myModel = new HashMap<String, Object>();
	try{	

		Contacttutor ctTutor  = contactTutorManager.findById(Long.valueOf(request.getParameter("jbbid").toString()));
		
		model.addAttribute("contacttutor", ctTutor);
		return "tutor/contacttutor/contactstudent"; 

	} catch (Exception e) {
        String msg = "The request failed. Error " + e;
        log.error(msg, e);
		model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
        return "tutor/public/common/error/errorpage";
	}	
}	

@RequestMapping(value = "/tutor/contact/contactstudent", method = RequestMethod.POST)
public String postContactStudent(HttpServletRequest request, HttpServletResponse response, Model model,
		@ModelAttribute("contacttutor") Contacttutor contactTutor, BindingResult result) {

		validator.validate(contactTutor, result);

		try {
		
	        if (result.hasErrors()) {
	    		model.addAttribute("contacttutor", contactTutor);
				return "tutor/contacttutor/contactstudent";
			} else {

				//Email proposal to student.....................
				
				
				//long profileId = SystemUtil.getUserProfileId(request, userProfileManager);
				//contactTutor.setUserprofileid(profileId);
				//contactTutorManager.storeContactTutor(contactTutor);
				
				return "tutor/contacttutor/MassEmailToTutorsConfirmation";
			}
		
		} catch (Exception e) {
            String msg = "Failed to create user. Error " + e;
            log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "tutor/public/common/error/errorpage";
		}    
}	

}
