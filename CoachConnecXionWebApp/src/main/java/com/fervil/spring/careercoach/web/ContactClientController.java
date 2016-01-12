package com.fervil.spring.careercoach.web;

import java.util.HashMap;

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

import com.fervil.spring.careercoach.model.domain.ContactCoach;
import com.fervil.spring.careercoach.service.ContactCoachManager;
import com.fervil.spring.careercoach.service.UserProfileManager;
import com.fervil.spring.careercoach.service.validator.ContactClientEmailValidator;
import com.fervil.spring.careercoach.util.Constants;
import com.fervil.spring.careercoach.util.SystemUtil;

@Controller		  
public class ContactClientController {
    private static final Logger log = LoggerFactory.getLogger(ContactClientController.class);
    
	//@Resource(name = "massTutorContactValidator")
	//private TutorMassTutorEmailValidator validator;
    				  
	@Resource(name = "contactClientByEmailValidator")
	private ContactClientEmailValidator validator;

	@Resource(name = "contactCoachManager")
	private ContactCoachManager contactCoachManager;
	
	@Resource(name = "userProfileManager")
	private UserProfileManager userProfileManager;
	  
    @Autowired
    private SmtpMailService mailService;
	

@RequestMapping(value = "/coach/contact/contactclient", method = RequestMethod.GET)
						
public String getContactStudent(HttpServletRequest request, HttpServletResponse response, ModelMap model) {

	//Map<String, Object> myModel = new HashMap<String, Object>();
	try{	

		ContactCoach ctCoach  = contactCoachManager.findById(Long.valueOf(request.getParameter("jbbid").toString()));
		ctCoach.setcoachcase(".");
		
		model.addAttribute("categoryName", getCategoryName(ctCoach.getCategory()));
		model.addAttribute("contactcoach", ctCoach);
		return "coach/contactcoach/contactclient"; 

	} catch (Exception e) {
        String msg = "The request failed. Error " + e;
        log.error(msg, e);
		model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
        return "public/common/error/errorpage";
	}	
}	

@RequestMapping(value = "/coach/contact/contactclient", method = RequestMethod.POST)
public String postContactStudent(HttpServletRequest request, HttpServletResponse response, Model model,
		@ModelAttribute("contactcoach") ContactCoach contactCoach, BindingResult result) {

		validator.validate(contactCoach, result);

		try {
		
	        if (result.hasErrors()) {
	    		model.addAttribute("contactcoach", contactCoach);
				return "coach/contactcoach/contactclient";
			} else {

				long profileId = SystemUtil.getUserProfileId(request, userProfileManager);

				String emailbody = "";
				
					//emailbody = " Hi " + userProfiles.get("firstname")	+ ", <br><br>" +  
					emailbody = " Hi " 	+ contactCoach.getStudentfirstname() + ", <br><br>" +  
	        		"Great news! You've receivved a proposal from one of our " + getCategoryName(contactCoach.getCategory()) + ". <br><br>" +
					"<p style='text-decoration: underline;'>MESSAGE FROM COACH: </p>"	+	
					contactCoach.getcoachcase() +
					"<br><br><a style='font-size: 16px' " + Constants.CONTACT_COACH_CLIENT_USER_PROFILE_URL_PROD + profileId + "&cttrno=" + contactCoach.getContactcoachid() + "'> " +
					"CLICK HERE TO SEE THE COACH DETAILS, CONTACT AND MAYBE HIRE THIS COACH </a> <br><br>" +
					"If the link above doesn't work, copy the address below to your browser <br>" +
					Constants.CONTACT_COACH_CLIENT_USER_PROFILE_URL_PROD.replace("href='", "") + profileId + "&cttrno=" + contactCoach.getContactcoachid();

					System.out.println("Sending Proposals to students::::::" + emailbody);
					
					mailService.sendMessage(contactCoach.getStudentemail(), "New message from coach", emailbody);
				
				model.addAttribute("successMessage", "Message has been sent to the client");
				return "coach/contactcoach/contactclient";
			}
		
		} catch (Exception e) {
            String msg = "Failed to create user. Error " + e;
            log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
		}    
}	

	private String getCategoryName(int categoryId){
		HashMap<Integer, String> coachCategoryMap = new HashMap<Integer, String>();
	
		coachCategoryMap.put(Constants.ADD_ADHD_COACHES_CATEGORY_ID, Constants.ADD_ADHD_COACHES_CATEGORY_NAME);
		coachCategoryMap.put(Constants.BUSINESS_COACHES_CATEGORY_ID, Constants.BUSINESS_COACHES_CATEGORY_NAME);
		coachCategoryMap.put(Constants.CAREER_COACHES_CATEGORY_ID, Constants.CAREER_COACHES_CATEGORY_NAME);
		coachCategoryMap.put(Constants.NUTRITION_COACHES_CATEGORY_ID, Constants.NUTRITION_COACHES_CATEGORY_NAME);
		coachCategoryMap.put(Constants.FAMILY_COACHES_CATEGORY_ID, Constants.FAMILY_COACHES_CATEGORY_NAME);
		coachCategoryMap.put(Constants.FINANCE_COACHES_CATEGORY_ID, Constants.FINANCE_COACHES_CATEGORY_NAME);
		coachCategoryMap.put(Constants.LEADERSHIP_CATEGORY_ID, Constants.LEADERSHIP_CATEGORY_NAME);
		coachCategoryMap.put(Constants.LIFE_COACHES_CATEGORY_ID, Constants.LIFE_COACHES_CATEGORY_NAME);
		coachCategoryMap.put(Constants.EXECUTIVE_MANAGEMENT_COACHES_CATEGORY_ID, Constants.EXECUTIVE_MANAGEMENT_COACHES_CATEGORY_NAME);
		coachCategoryMap.put(Constants.MOTIVATAIONAL_PERFORMANCE_CATEGORY_ID, Constants.MOTIVATAIONAL_PERFORMANCE_CATEGORY_NAME);
		coachCategoryMap.put(Constants.RELATIONSHIP_COACHES_CATEGORY_ID, Constants.RELATIONSHIP_COACHES_CATEGORY_NAME);
		coachCategoryMap.put(Constants.SALES_CATEGORY_ID, Constants.SALES_CATEGORY_NAME);
		coachCategoryMap.put(Constants.FITNESS_COACHES_CATEGORY_ID, Constants.FITNESS_COACHES_CATEGORY_NAME);
		coachCategoryMap.put(Constants.TEAM_GROUP_CATEGORY_ID, Constants.TEAM_GROUP_CATEGORY_NAME);
		coachCategoryMap.put(Constants.COLLEGE_PREP_CATEGORY_ID, Constants.COLLEGE_PREP_CATEGORY_NAME);
		coachCategoryMap.put(Constants.ENTREPRENEURSHIP_CATEGORY_ID, Constants.ENTREPRENEURSHIP_CATEGORY_NAME);

		return coachCategoryMap.get(categoryId);
		
	}

}
