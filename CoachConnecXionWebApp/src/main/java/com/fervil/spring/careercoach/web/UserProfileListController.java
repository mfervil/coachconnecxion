package com.fervil.spring.careercoach.web;

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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fervil.spring.careercoach.model.domain.CoachingRequest;
import com.fervil.spring.careercoach.model.domain.UserProfile;
import com.fervil.spring.careercoach.service.CreateUserProfileValidator;
import com.fervil.spring.careercoach.service.JobRatingService;
import com.fervil.spring.careercoach.service.UserProfileManager;

import com.fervil.spring.careercoach.service.SelectedCoachesValidator;
import com.fervil.spring.careercoach.util.Constants;

@Controller
@RequestMapping("/public/userprofileList")
public class UserProfileListController  {
    private static final Logger log = LoggerFactory.getLogger(UserProfileListController.class);
	
	private UserProfileManager userProfileManager;
	private SelectedCoachesValidator validator;
	
	@Autowired
	public UserProfileListController(UserProfileManager userProfileManager,
			SelectedCoachesValidator validator) {
		this.userProfileManager = userProfileManager;
		this.validator = validator;
	}

	public void setUserProfileManager(UserProfileManager userProfileManager) {
		this.userProfileManager = userProfileManager;
	}
	
	public UserProfileManager getUserProfileManager() {
		return userProfileManager;
	}

	@Resource(name = "jobRatingService")
	private JobRatingService jobRatingService;
	
	//@RequestMapping(method = RequestMethod.GET)
	//protected ModelAndView handleRequestInternal(HttpServletRequest request,
	//		HttpServletResponse response) throws Exception {
	@RequestMapping(method = RequestMethod.GET) 
	public ModelAndView listUserProfiles(ModelMap model, org.springframework.web.context.request.WebRequest webRequest) {

	    Map<String, Object> myModel = new HashMap<String, Object>();

		try{
				
			int coachingCategory = webRequest.getParameter("coachingCategory") == null?-1:Integer.valueOf(webRequest.getParameter("coachingCategory"));
			int coachingSubcategory = webRequest.getParameter("coachingSubcategory") == null?-1:Integer.valueOf(webRequest.getParameter("coachingSubcategory"));
			int industryExperience = webRequest.getParameter("industryExperience") == null?-1:Integer.valueOf(webRequest.getParameter("industryExperience"));
			String companyExperience = webRequest.getParameter("companyExperience") == null?"":webRequest.getParameter("companyExperience");
			String coachFirstName = webRequest.getParameter("coachFirstName") == null?"":webRequest.getParameter("coachFirstName");
			String coachLastName = webRequest.getParameter("coachLastName") == null?"":webRequest.getParameter("coachLastName");
			String city = webRequest.getParameter("city") == null?"":webRequest.getParameter("city");
			String state = webRequest.getParameter("state") == null?"":webRequest.getParameter("state");
	
			
			List<HashMap> userProfiles = userProfileManager.getUserProfiles(
					coachingCategory, coachingSubcategory, industryExperience,companyExperience, coachFirstName, coachLastName, city, state);
			
			ModelAndView mav = new ModelAndView ();
			mav.setViewName ("public/userprofile/userprofileList");
			mav.addObject("userProfiles", userProfiles);
			
			CoachingRequest coachingRequest = new CoachingRequest();
			mav.addObject("coachingRequest", coachingRequest);
			
			// float averageRate1 = jobRatingService.getProfileRating(123);
			// model.addAttribute("averageRate1", averageRate1);
			
			mav.addObject("coachingCategory", webRequest.getParameter("coachingCategory"));
	
			log.info("Number of coaches returned to UserProfileListController: " + userProfiles.size());
			
			return mav;
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
	        model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
	        return new ModelAndView("public/common/error/errorpage");
			
		}	
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView submitForm(
			@ModelAttribute("coachingRequest") CoachingRequest coachingRequest,
			BindingResult result, SessionStatus status, Model model) {

	    Map<String, Object> myModel = new HashMap<String, Object>();
		
		try{
			validator.validate(coachingRequest, result);
	
	        if (result.hasErrors()) {
	    		List<UserProfile> userProfiles = userProfileManager.getUserProfiles();
	    		ModelAndView mav = new ModelAndView ();
	    		mav.setViewName ("public/userprofile/userprofileList");
	    		mav.addObject("userProfiles", userProfiles);
	    		
	    		//CoachingRequest coachingRequest = new CoachingRequest();
	    		mav.addObject("coachingRequest", coachingRequest);
				return mav;
	        	
				//initial return "userprofileList";
			} else {
	    		//List<UserProfile> userProfiles = userProfileManager.getUserProfiles();
	    		ModelAndView mav = new ModelAndView ();
	    		mav.setViewName ("userprofile/createcoachingrequest");
	    		
	            String selectedCoachList = coachingRequest.getSelectedCoaches();
	
	    		mav.addObject("coachesToContact", " The selected list" + selectedCoachList);
	    		return mav;
			}
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
	        model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
	        return new ModelAndView("public/common/error/errorpage");
			
		}	
	}	
}
