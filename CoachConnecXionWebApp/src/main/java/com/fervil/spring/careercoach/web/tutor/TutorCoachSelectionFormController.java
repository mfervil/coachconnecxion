package com.fervil.spring.careercoach.web.tutor;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.fervil.spring.careercoach.model.domain.CoachSelection;
import com.fervil.spring.careercoach.service.CoachSelectionManager;
import com.fervil.spring.careercoach.service.CoachSelectionValidator;
import com.fervil.spring.careercoach.service.UserProfileManager;
import com.fervil.spring.careercoach.util.Constants;

@Controller
@RequestMapping("/tutor/public/coachSelection")
public class TutorCoachSelectionFormController  {
	private CoachSelectionManager coachSelectionManager;
	private CoachSelectionValidator validator;
	private UserProfileManager userProfileManager;

    private static final Logger log = LoggerFactory.getLogger(TutorCoachSelectionFormController.class);
	
	@Autowired
	public TutorCoachSelectionFormController(CoachSelectionManager coachSelectionManager,
			CoachSelectionValidator validator) {
		this.coachSelectionManager = coachSelectionManager;
		this.validator = validator;
	}

	public void setCoachSelectionManager(CoachSelectionManager coachSelectionManager) {
		this.coachSelectionManager = coachSelectionManager;
	}
	
	public CoachSelectionManager getCoachSelectionManager() {
		return coachSelectionManager;
	}

	//@RequestMapping(method = RequestMethod.GET)
	//protected ModelAndView handleRequestInternal(HttpServletRequest request,
	//		HttpServletResponse response) throws Exception {
	@RequestMapping(method = RequestMethod.GET) 
	//public ModelAndView showCoachSelectionForm(ModelMap model) {
	public ModelAndView showCoachSelectionForm(Model model, org.springframework.web.context.request.WebRequest webRequest, HttpSession session) {

	ModelAndView mav = new ModelAndView ();
    //Map<String, Object> myModel = new HashMap<String, Object>();
		
		try{	
			
			if (webRequest.getParameter("BREADCRUMB") != null && session.getAttribute("coachingCategory") != null){
				//MAF 5/11/2014 mav.setViewName ("redirect:userprofileList?coachingcategory=" + webRequest.getParameter("coachingCategory") );

				/*
				mav.setViewName ("redirect:coachprofileList/coachingcategory/" + webRequest.getParameter("coachingCategory") + 
						"/coachingSubcategory/" + Constants.DEFAULT_URL_NUMBER + 
						"/industryExperience/" + Constants.DEFAULT_URL_NUMBER +
						"/companyExperience/"  + Constants.DEFAULT_URL_STRING + 
						"/coachFirstName/"  + Constants.DEFAULT_URL_STRING + 
						"/coachLastName/"  + Constants.DEFAULT_URL_STRING + 
						"/city/"  + Constants.DEFAULT_URL_STRING + 
						"/state/"  + Constants.DEFAULT_URL_STRING + 
						"/pageNumber/1" 
				);
				*/
				mav.setViewName ("redirect:tutor/coachprofileList/coachingcategory/" + webRequest.getParameter("coachingCategory") + 
						"/coachingSubcategory/" + webRequest.getParameter("coachingSubcategory") + 
						"/industryExperience/" + webRequest.getParameter("industryExperience") +
						"/companyExperience/"  + webRequest.getParameter("companyExperience") + 
						"/coachFirstName/"  + webRequest.getParameter("coachFirstName") + 
						"/coachLastName/"  + webRequest.getParameter("coachLastName") + 
						"/city/"  + webRequest.getParameter("city") + 
						"/state/"  + webRequest.getParameter("state") + 
						"/pageNumber/1" 
				);

				mav.addObject("coachingCategory", session.getAttribute("coachingCategory"));
				mav.addObject("coachingSubcategory", session.getAttribute("coachingSubcategory"));
				mav.addObject("industryExperience", session.getAttribute("industryExperience"));
				mav.addObject("companyExperience", session.getAttribute("companyExperience"));
				mav.addObject("coachFirstName", session.getAttribute("coachFirstName"));
				mav.addObject("coachLastName", session.getAttribute("coachLastName"));
				mav.addObject("state", session.getAttribute("state"));
				mav.addObject("city", session.getAttribute("city"));

				return mav;
				
			} else {
				CoachSelection coachSelection = new CoachSelection();
				mav.addObject("coachSelection", coachSelection);
				mav.setViewName ("tutor/public/coachingCategory/coachSelection");
				return mav;
			}
			
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
	        //myModel.put(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
	        
	        return new ModelAndView("tutor/public/common/error/errorpage");
			
		}	
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView submitForm( 
			@ModelAttribute("coachSelection") CoachSelection coachSelection,
			BindingResult result, SessionStatus status, org.springframework.web.context.request.WebRequest webRequest, 
			Model model, HttpSession session) {

	    //Map<String, Object> myModel = new HashMap<String, Object>();
		
		try{
			//validator.validate(coachSelection, result);
	
	        if (result.hasErrors()) {
	    		ModelAndView mav = new ModelAndView ();
	    		mav.setViewName ("tutor/public/coachingCategory/coachSelection");
	    		mav.addObject("coachSelection", coachSelection);
				return mav;
			} else {
			    //return "redirect:/AboutYourProperty.htm";
				
				ModelAndView mav = new ModelAndView ();
				//MAF 5/11/2015 mav.setViewName ("redirect:userprofileList?coachingcategory=" + webRequest.getParameter("coachingCategory") );

				mav.setViewName ("redirect:tutor/coachprofileList/coachingcategory/" + webRequest.getParameter("coachingCategory") + 
						"/coachingSubcategory/" + webRequest.getParameter("coachingSubcategory") + 
						"/industryExperience/" + webRequest.getParameter("industryExperience") +
						"/companyExperience/"  + webRequest.getParameter("companyExperience") + 
						"/coachFirstName/"  + webRequest.getParameter("coachFirstName") + 
						"/coachLastName/"  + webRequest.getParameter("coachLastName") + 
						"/city/"  + webRequest.getParameter("city") + 
						"/state/"  + webRequest.getParameter("state") + 
						"/pageNumber/1" 
				);
				
				mav.addObject("coachingCategory", webRequest.getParameter("coachingCategory"));
				mav.addObject("coachingSubcategory", webRequest.getParameter("coachingSubcategory"));
				mav.addObject("industryExperience", webRequest.getParameter("industryExperience"));
				mav.addObject("companyExperience", webRequest.getParameter("companyExperience"));
				mav.addObject("coachFirstName", webRequest.getParameter("coachFirstName"));
				mav.addObject("coachLastName", webRequest.getParameter("coachLastName"));
				mav.addObject("state", webRequest.getParameter("state"));
				mav.addObject("city", webRequest.getParameter("city"));

				session.setAttribute("coachingCategory", webRequest.getParameter("coachingCategory"));
				session.setAttribute("coachingSubcategory", webRequest.getParameter("coachingSubcategory"));
				session.setAttribute("industryExperience", webRequest.getParameter("industryExperience"));
				session.setAttribute("companyExperience", webRequest.getParameter("companyExperience"));
				session.setAttribute("coachFirstName", webRequest.getParameter("coachFirstName"));
				session.setAttribute("coachLastName", webRequest.getParameter("coachLastName"));
				session.setAttribute("state", webRequest.getParameter("state"));
				session.setAttribute("city", webRequest.getParameter("city"));
				
				return mav;
			}
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
	        //myModel.put(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return new ModelAndView("tutor/public/common/error/errorpage");
			
	        //return new ModelAndView("coachSelection", "model", myModel);
			
		}	
	}
}
