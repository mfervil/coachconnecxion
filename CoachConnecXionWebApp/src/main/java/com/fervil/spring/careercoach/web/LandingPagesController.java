package com.fervil.spring.careercoach.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;


import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.fervil.spring.careercoach.model.domain.CoachSelection;
import com.fervil.spring.careercoach.util.Constants;

@Controller
public class LandingPagesController {
    private static final Logger log = LoggerFactory.getLogger(LandingPagesController.class);
	
		@RequestMapping(value = "/public/landing-business-coaches", method = RequestMethod.GET)
		public ModelAndView businessCoachesreturn(Model model, org.springframework.web.context.request.WebRequest webRequest, HttpSession session) {

			log.debug("Received request to show all packages");
			
			ModelAndView mav = new ModelAndView ();
			
			CoachSelection coachSelection = new CoachSelection();

			mav.addObject("coachingcategoryname", "Business Coaches");
			mav.addObject("coachingCategory", "2");
			mav.addObject("coachSelection", coachSelection);
			mav.setViewName ("public/landingpages/business-coaches");
			return mav;
		}
		
		@RequestMapping(value = "/public/landing-business-coaches", method = RequestMethod.POST)
		public ModelAndView submitForm( 
				@ModelAttribute("coachSelection") CoachSelection coachSelection,
				BindingResult result, SessionStatus status, org.springframework.web.context.request.WebRequest webRequest, 
				Model model, HttpSession session) {

		    //Map<String, Object> myModel = new HashMap<String, Object>();
			
			try{

				/*
				//validator.validate(coachSelection, result);
		        if (result.hasErrors()) {
		    		ModelAndView mav = new ModelAndView ();
		    		mav.setViewName ("public/coachingCategory/coachSelection");
		    		mav.addObject("coachSelection", coachSelection);
					return mav;
				} else {
				    //return "redirect:/AboutYourProperty.htm";
				*/
				
					ModelAndView mav = new ModelAndView ();
					mav.setViewName ("redirect:userprofileList?coachingcategory=" + webRequest.getParameter("coachingCategory") );
					//mav.addObject("userProfiles", userProfiles);
					mav.addObject("coachingCategory", webRequest.getParameter("coachingCategory"));
					mav.addObject("coachingSubcategory", webRequest.getParameter("coachingSubcategory"));
					mav.addObject("industryExperience", webRequest.getParameter("industryExperience"));
					mav.addObject("companyExperience", webRequest.getParameter("companyExperience"));
					mav.addObject("coachFirstName", webRequest.getParameter("coachFirstName"));
					mav.addObject("coachLastName", webRequest.getParameter("coachLastName"));
					mav.addObject("state", webRequest.getParameter("state"));
					mav.addObject("city", webRequest.getParameter("city"));
					mav.addObject("coachingcategoryname", webRequest.getParameter("coachingcategoryname"));

					session.setAttribute("coachingCategory", webRequest.getParameter("coachingCategory"));
					session.setAttribute("coachingSubcategory", webRequest.getParameter("coachingSubcategory"));
					session.setAttribute("industryExperience", webRequest.getParameter("industryExperience"));
					session.setAttribute("companyExperience", webRequest.getParameter("companyExperience"));
					session.setAttribute("coachFirstName", webRequest.getParameter("coachFirstName"));
					session.setAttribute("coachLastName", webRequest.getParameter("coachLastName"));
					session.setAttribute("state", webRequest.getParameter("state"));
					session.setAttribute("city", webRequest.getParameter("city"));
					session.setAttribute("coachingcategoryname", webRequest.getParameter("coachingcategoryname"));
					
					return mav;
				//}
			} catch (Exception e) {
		        String msg = "The request failed. Error " + e;
		        log.error(msg, e);
		        //myModel.put(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				return new ModelAndView("public/common/error/errorpage");
				
		        //return new ModelAndView("coachSelection", "model", myModel);
				
			}	
		}
		
		
		
		
}
