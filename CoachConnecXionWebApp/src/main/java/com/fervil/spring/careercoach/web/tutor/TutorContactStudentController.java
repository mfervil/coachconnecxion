package com.fervil.spring.careercoach.web.tutor;

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

import ua.com.bitlab.springsecuritydemo.services.SmtpMailService;

import com.fervil.spring.careercoach.model.domain.Contacttutor;
import com.fervil.spring.careercoach.service.ContactTutorManager;
import com.fervil.spring.careercoach.service.UserProfileManager;
import com.fervil.spring.careercoach.service.validator.ContactStudentEmailValidator;
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
		ctTutor.setTutorcase(".");
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

		//System.out.println("The tutor case is: " + contactTutor.getTutorcase().trim() );
		
		
		try {
		
	        if (result.hasErrors()) {
	    		model.addAttribute("contacttutor", contactTutor);
				return "tutor/contacttutor/contactstudent";
			} else {

				long profileId = SystemUtil.getUserProfileId(request, userProfileManager);

				String emailbody = "";
				
					//emailbody = " Hi " + userProfiles.get("firstname")	+ ", <br><br>" +  
					emailbody = " Hi " 	+ contactTutor.getStudentfirstname() + ", <br><br>" +  
	        		"Great news! You've receivved a proposal from one of our tutors to help you with " + contactTutor.getCourse() + " <br><br>" +
					"<p style='text-decoration: underline;'>MESSAGE FROM TUTOR: </p>"	+	
					contactTutor.getTutorcase() +
					"<br><br><a style='font-size: 16px' " + Constants.CONTACT_STUDENT_USER_PROFILE_URL_PROD + profileId + "&cttrno=" + contactTutor.getContacttutorid() + "'> " +
					"CLICK HERE TO SEE THE TUTOR DETAILS, CONTACT AND MAYBE HIRE THIS TUTOR </a> <br><br>" +
					"If the link above doesn't work, copy the address below to your browser <br>" +
					Constants.CONTACT_STUDENT_USER_PROFILE_URL_PROD.replace("href='", "") + profileId + "&cttrno=" + contactTutor.getContacttutorid();

					//System.out.println(emailbody);
					mailService.sendMessage(contactTutor.getStudentemail(), "New message from tutor", emailbody);
				
				//Email proposal to student.....................
				//long profileId = SystemUtil.getUserProfileId(request, userProfileManager);
				//contactTutor.setUserprofileid(profileId);
				//contactTutorManager.storeContactTutor(contactTutor);
				model.addAttribute("successMessage", "Message has been sent to the student");
				return "tutor/contacttutor/contactstudent";
			}
		
		} catch (Exception e) {
            String msg = "Failed to create user. Error " + e;
            log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "tutor/public/common/error/errorpage";
		}    
}	

}
