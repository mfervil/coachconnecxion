package com.fervil.spring.careercoach.web;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import com.fervil.spring.careercoach.model.domain.CoachingRequest;
import com.fervil.spring.careercoach.service.CreateCoachingRequestValidator;
import com.fervil.spring.careercoach.service.CoachingRequestManager;
import com.fervil.spring.careercoach.util.Constants;

@Controller        
@RequestMapping("/createcoachingRequest") 
public class CreateCoachingRequestFormController {
    private static final Logger log = LoggerFactory.getLogger(CreateCoachingRequestFormController.class);
	
	private CreateCoachingRequestValidator validator;
	private CoachingRequestManager coachingRequestManager;
	@Autowired
	public CreateCoachingRequestFormController(CoachingRequestManager coachingRequestManager,
			CreateCoachingRequestValidator validator) {
		this.coachingRequestManager = coachingRequestManager;
		this.validator = validator;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder webDataBinder) {
		//SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	
	@RequestMapping(method = RequestMethod.GET) 
	public String displayCoachingRequest(ModelMap model) {
		
		try{	
			CoachingRequest coachingRequest = new CoachingRequest();
	
			/////////////////////////////////////////////////////////////////////
			//This code for testing only
			/////////////////////////////////////////////////////////////////////
	/*
			coachingRequest.setDisplayName("Marco");
			coachingRequest.setCompanyOfHighestPosition("Information Resources Inc");
			coachingRequest.setEmail("mfervil@yahoo.com" + Math.random());
			coachingRequest.setHourlyRate(40);
			coachingRequest.setKeywords("All my test keywords");
			coachingRequest.setModifiedDate(new Date());
			coachingRequest.setOverview("This is my test overview");
			coachingRequest.setPaymentTerms(" $50 US. Dollars Per hour");
			coachingRequest.setServiceDescription("This is my test service description");
			coachingRequest.setSkillsExpertise("This is all the skills expertise");
			coachingRequest.setSummaryOfHighestPosition("This is the summary of Highest Description");
	
			coachingRequest.setUser_userId(1001);
			coachingRequest.setModifiedDate(new Date());
			coachingRequest.setAccountType(1);
			coachingRequest.setCoachingRequestType(1);
	*/		
			///////////////////////////////////////////////////////////////////////
			//End of this code for testing only
			///////////////////////////////////////////////////////////////////////
			
			model.addAttribute("coachingRequest", coachingRequest);
			return "createcoachingrequest"; 
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
		}	
		
	} 
	
	@RequestMapping(method = RequestMethod.POST)
	public String submitForm(
			@ModelAttribute("coachingRequest") CoachingRequest coachingRequest,
			BindingResult result, SessionStatus status, ModelMap model) {

		try{
			validator.validate(coachingRequest, result);
			
	        if (result.hasErrors()) {
				return "userprofile/createcoachingrequest";
			} else {
	
				///////////////////////////////////////////////////////////////////
				// This code for testing only
				///////////////////////////////////////////////////////////////////
	            
				//TODO replace the id with the logged-in user id...................
				coachingRequest.setUserId( Long.valueOf(1001));
				coachingRequest.setDate_posted(new Date());
				
				coachingRequestManager.storeCoachingRequest(coachingRequest);
				
				status.setComplete();
				return "redirect:userprofile/createcoachingRequestsuccess/coachingRequestId/" + coachingRequest.getCoachingRequestId();
			}
	        
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
		}	
        
        
	}
}
