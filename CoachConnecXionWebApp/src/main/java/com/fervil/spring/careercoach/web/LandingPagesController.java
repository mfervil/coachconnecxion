package com.fervil.spring.careercoach.web;

import javax.annotation.Resource;
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
import com.fervil.spring.careercoach.service.validator.CoachSelectionValidator;
import com.fervil.spring.careercoach.util.Constants;

@Controller
public class LandingPagesController {
    private static final Logger log = LoggerFactory.getLogger(LandingPagesController.class);
	
		@Resource(name = "coachSelectionValidator")
		private CoachSelectionValidator validator;
    
    
		@RequestMapping(value = "/public/landing-business-coaches", method = RequestMethod.GET)
		public ModelAndView businessCoachesreturn(Model model, org.springframework.web.context.request.WebRequest webRequest, HttpSession session) {

			log.debug("Received request to show business coaches");
			
			ModelAndView mav = new ModelAndView ();
			
			CoachSelection coachSelection = new CoachSelection();

			mav.addObject("coachingcategoryname", Constants.BUSINESS_COACHES_CATEGORY_NAME);
			mav.addObject("coachingCategory", Constants.BUSINESS_COACHES_CATEGORY_ID);

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

					//ModelAndView mav = new ModelAndView ();
					//setMavSession(mav, session, webRequest);
					ModelAndView mav = getMAV(webRequest, "/public/landing-business-coaches", coachSelection, result, session);

					/*
					mav.setViewName ("redirect:userprofileList?coachingcategory=" + webRequest.getParameter("coachingCategory") );
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
					*/
					
					return mav;
			} catch (Exception e) {
		        String msg = "The request failed. Error " + e;
		        log.error(msg, e);
				model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				return new ModelAndView("public/common/error/errorpage");
			}	
		}
		
		@RequestMapping(value = "/public/landing-fitness-coaches", method = RequestMethod.GET)
		public ModelAndView fitnessCoachesreturn(Model model, org.springframework.web.context.request.WebRequest webRequest, HttpSession session) {

			log.debug("Received request to show fitness coaches");
			
			ModelAndView mav = new ModelAndView ();
			
			CoachSelection coachSelection = new CoachSelection();

			mav.addObject("coachingcategoryname", Constants.FITNESS_COACHES_CATEGORY_NAME);
			mav.addObject("coachingCategory", Constants.FITNESS_COACHES_CATEGORY_ID);

			mav.addObject("coachSelection", coachSelection);
			mav.setViewName ("public/landingpages/fitness-coaches");
			return mav;
		}
		
		@RequestMapping(value = "/public/landing-fitness-coaches", method = RequestMethod.POST)
		public ModelAndView submitFitnessForm( 
				@ModelAttribute("coachSelection") CoachSelection coachSelection,
				BindingResult result, SessionStatus status, org.springframework.web.context.request.WebRequest webRequest, 
				Model model, HttpSession session) {
			
			try{

					//ModelAndView mav = new ModelAndView ();
					//setMavSession(mav, session, webRequest);
				
					ModelAndView mav = getMAV(webRequest, "/public/landing-fitness-coaches", coachSelection, result, session);
					
					return mav;
			} catch (Exception e) {
		        String msg = "The request failed. Error " + e;
		        log.error(msg, e);
				model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				return new ModelAndView("public/common/error/errorpage");
			}	
		}
		
		
		
		@RequestMapping(value = "/public/landing-career-coaches", method = RequestMethod.GET)
		public ModelAndView careerCoachesreturn(Model model, org.springframework.web.context.request.WebRequest webRequest, HttpSession session) {

			log.debug("Received request to show career coaches");
			
			ModelAndView mav = new ModelAndView ();
			
			CoachSelection coachSelection = new CoachSelection();

			mav.addObject("coachingcategoryname", Constants.CAREER_COACHES_CATEGORY_NAME);
			mav.addObject("coachingCategory", Constants.CAREER_COACHES_CATEGORY_ID);

			mav.addObject("coachSelection", coachSelection);
			mav.setViewName ("public/landingpages/career-coaches");
			return mav;
		}
		
		@RequestMapping(value = "/public/landing-career-coaches", method = RequestMethod.POST)
		public ModelAndView submitCareerForm( 
				@ModelAttribute("coachSelection") CoachSelection coachSelection,
				BindingResult result, SessionStatus status, org.springframework.web.context.request.WebRequest webRequest, 
				Model model, HttpSession session) {
			
			try{

					//ModelAndView mav = new ModelAndView ();
					//setMavSession(mav, session, webRequest);
					
					ModelAndView mav = getMAV(webRequest, "/public/landing-career-coaches", coachSelection, result, session);
					
					return mav;
			} catch (Exception e) {
		        String msg = "The request failed. Error " + e;
		        log.error(msg, e);
				model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				return new ModelAndView("public/common/error/errorpage");
			}	
		}

		
		@RequestMapping(value = "/public/landing-nutrition-coaches", method = RequestMethod.GET)
		public ModelAndView nutritionCoachesreturn(Model model, org.springframework.web.context.request.WebRequest webRequest, HttpSession session) {

			log.debug("Received request to show nutrition coaches");
			
			ModelAndView mav = new ModelAndView ();
			
			CoachSelection coachSelection = new CoachSelection();

			mav.addObject("coachingcategoryname", Constants.NUTRITION_COACHES_CATEGORY_NAME);
			mav.addObject("coachingCategory", Constants.NUTRITION_COACHES_CATEGORY_ID);

			mav.addObject("coachSelection", coachSelection);
			mav.setViewName ("public/landingpages/nutrition-coaches");
			return mav;
		}
		
		@RequestMapping(value = "/public/landing-nutrition-coaches", method = RequestMethod.POST)
		public ModelAndView submitNutritionForm( 
				@ModelAttribute("coachSelection") CoachSelection coachSelection,
				BindingResult result, SessionStatus status, org.springframework.web.context.request.WebRequest webRequest, 
				Model model, HttpSession session) {
			
			try{

					//ModelAndView mav = new ModelAndView ();
					//setMavSession(mav, session, webRequest);

					ModelAndView mav = getMAV(webRequest, "/public/landing-nutrition-coaches", coachSelection, result, session);
					
					return mav;
			} catch (Exception e) {
		        String msg = "The request failed. Error " + e;
		        log.error(msg, e);
				model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				return new ModelAndView("public/common/error/errorpage");
			}	
		}
		
		
		@RequestMapping(value = "/public/landing-family-coaches", method = RequestMethod.GET)
		public ModelAndView familyCoachesreturn(Model model, org.springframework.web.context.request.WebRequest webRequest, HttpSession session) {

			log.debug("Received request to show family coaches");
			
			ModelAndView mav = new ModelAndView ();
			
			CoachSelection coachSelection = new CoachSelection();

			mav.addObject("coachingcategoryname", Constants.FAMILY_COACHES_CATEGORY_NAME);
			mav.addObject("coachingCategory", Constants.FAMILY_COACHES_CATEGORY_ID);

			mav.addObject("coachSelection", coachSelection);
			mav.setViewName ("public/landingpages/family-coaches");
			return mav;
		}
		
		@RequestMapping(value = "/public/landing-family-coaches", method = RequestMethod.POST)
		public ModelAndView submitFamilyForm( 
				@ModelAttribute("coachSelection") CoachSelection coachSelection,
				BindingResult result, SessionStatus status, org.springframework.web.context.request.WebRequest webRequest, 
				Model model, HttpSession session) {
			
			try{

					//ModelAndView mav = new ModelAndView ();
					//setMavSession(mav, session, webRequest);
					ModelAndView mav = getMAV(webRequest, "/public/landing-family-coaches", coachSelection, result, session);
					
					return mav;
			} catch (Exception e) {
		        String msg = "The request failed. Error " + e;
		        log.error(msg, e);
				model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				return new ModelAndView("public/common/error/errorpage");
			}	
		}
		
		
		@RequestMapping(value = "/public/landing-finance-money-coaches", method = RequestMethod.GET)
		public ModelAndView financeCoachesreturn(Model model, org.springframework.web.context.request.WebRequest webRequest, HttpSession session) {

			log.debug("Received request to show finance coaches");
			
			ModelAndView mav = new ModelAndView ();
			
			CoachSelection coachSelection = new CoachSelection();

			mav.addObject("coachingcategoryname", Constants.FINANCE_COACHES_CATEGORY_NAME);
			mav.addObject("coachingCategory", Constants.FINANCE_COACHES_CATEGORY_ID);

			mav.addObject("coachSelection", coachSelection);
			mav.setViewName ("public/landingpages/finance-money-coaches");
			return mav;
		}
		
		@RequestMapping(value = "/public/landing-finance-money-coaches", method = RequestMethod.POST)
		public ModelAndView submitFinanceForm( 
				@ModelAttribute("coachSelection") CoachSelection coachSelection,
				BindingResult result, SessionStatus status, org.springframework.web.context.request.WebRequest webRequest, 
				Model model, HttpSession session) {
			
			try{
					//ModelAndView mav = new ModelAndView ();
					//setMavSession(mav, session, webRequest);
					ModelAndView mav = getMAV(webRequest, "/public/landing-finance-money-coaches", coachSelection, result, session);
					
					return mav;
			} catch (Exception e) {
		        String msg = "The request failed. Error " + e;
		        log.error(msg, e);
				model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				return new ModelAndView("public/common/error/errorpage");
			}	
		}
		
		
		@RequestMapping(value = "/public/landing-life-coaches", method = RequestMethod.GET)
		public ModelAndView lifeCoachesreturn(Model model, org.springframework.web.context.request.WebRequest webRequest, HttpSession session) {

			log.debug("Received request to show life coaches");
			
			ModelAndView mav = new ModelAndView ();
			
			CoachSelection coachSelection = new CoachSelection();

			mav.addObject("coachingcategoryname", Constants.LIFE_COACHES_CATEGORY_NAME);
			mav.addObject("coachingCategory", Constants.LIFE_COACHES_CATEGORY_ID);

			mav.addObject("coachSelection", coachSelection);
			mav.setViewName ("public/landingpages/life-coaches");
			return mav;
		}
		
		@RequestMapping(value = "/public/landing-life-coaches", method = RequestMethod.POST)
		public ModelAndView submitLifeForm( 
				@ModelAttribute("coachSelection") CoachSelection coachSelection,
				BindingResult result, SessionStatus status, org.springframework.web.context.request.WebRequest webRequest, 
				Model model, HttpSession session) {
			
			try{
					//ModelAndView mav = new ModelAndView ();
					//setMavSession(mav, session, webRequest);
					ModelAndView mav = getMAV(webRequest, "/public/landing-life-coaches", coachSelection, result, session);
					
					return mav;
			} catch (Exception e) {
		        String msg = "The request failed. Error " + e;
		        log.error(msg, e);
				model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				return new ModelAndView("public/common/error/errorpage");
			}	
		}

		
		@RequestMapping(value = "/public/landing-relationship-coaches", method = RequestMethod.GET)
		public ModelAndView relationshipCoachesreturn(Model model, org.springframework.web.context.request.WebRequest webRequest, HttpSession session) {

			log.debug("Received request to show relationship coaches");
			
			ModelAndView mav = new ModelAndView ();
			CoachSelection coachSelection = new CoachSelection();

			mav.addObject("coachingcategoryname", Constants.RELATIONSHIP_COACHES_CATEGORY_NAME);
			mav.addObject("coachingCategory", Constants.RELATIONSHIP_COACHES_CATEGORY_ID);

			mav.addObject("coachSelection", coachSelection);
			mav.setViewName ("public/landingpages/relationship-coaches");
			return mav;
		}
		
		@RequestMapping(value = "/public/landing-relationship-coaches", method = RequestMethod.POST)
		public ModelAndView submitRelationshipForm( 
				@ModelAttribute("coachSelection") CoachSelection coachSelection,
				BindingResult result, SessionStatus status, org.springframework.web.context.request.WebRequest webRequest, 
				Model model, HttpSession session) {
			
			try{
					//ModelAndView mav = new ModelAndView ();
					//setMavSession(mav, session, webRequest);
					ModelAndView mav = getMAV(webRequest, "/public/landing-relationship-coaches", coachSelection, result, session);
					
					return mav;
			} catch (Exception e) {
		        String msg = "The request failed. Error " + e;
		        log.error(msg, e);
				model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				return new ModelAndView("public/common/error/errorpage");
			}	
		}
		
		
		@RequestMapping(value = "/public/landing-corporate-coaches", method = RequestMethod.GET)
		public ModelAndView corporateCoachesreturn(Model model, org.springframework.web.context.request.WebRequest webRequest, HttpSession session) {

			log.debug("Received request to show corporate coaches");
			
			ModelAndView mav = new ModelAndView ();
			CoachSelection coachSelection = new CoachSelection();

			mav.addObject("coachingcategoryname", Constants.CORPORATE_COACHES_CATEGORY_NAME);
			mav.addObject("coachingCategory", Constants.CORPORATE_COACHES_CATEGORY_ID);

			mav.addObject("coachSelection", coachSelection);
			mav.setViewName ("public/landingpages/corporate-coaches");
			return mav;
		}
		
		@RequestMapping(value = "/public/landing-corporate-coaches", method = RequestMethod.POST)
		public ModelAndView submitCorporateForm( 
				@ModelAttribute("coachSelection") CoachSelection coachSelection,
				BindingResult result, SessionStatus status, org.springframework.web.context.request.WebRequest webRequest, 
				Model model, HttpSession session) {
			
			try{
					//ModelAndView mav = new ModelAndView ();
					//setMavSession(mav, session, webRequest);

					ModelAndView mav = getMAV(webRequest, "/public/landing-corporate-coaches", coachSelection, result, session);

					
					return mav;
			} catch (Exception e) {
		        String msg = "The request failed. Error " + e;
		        log.error(msg, e);
				model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				return new ModelAndView("public/common/error/errorpage");
			}	
		}

		
		@RequestMapping(value = "/public/landing-general-personal-coaches", method = RequestMethod.GET)
		public ModelAndView genralCoachesProcess(Model model, org.springframework.web.context.request.WebRequest webRequest, HttpSession session) {

			log.debug("Received request to show corporate coaches");
			
			ModelAndView mav = new ModelAndView ();
			CoachSelection coachSelection = new CoachSelection();

			mav.addObject("coachingcategoryname", "");
			mav.addObject("coachingCategory", "");

			mav.addObject("coachSelection", coachSelection);
			//mav.setViewName ("public/landingpages/general-personal-coaches-cs");
			mav.setViewName ("public/landingpages/general-personal-coaches");
			return mav;
		}
		
		
		
		@RequestMapping(value = "/public/landing-general-personal-coaches", method = RequestMethod.POST)
		public ModelAndView genralCoachesProcess( 
				@ModelAttribute("coachSelection") CoachSelection coachSelection,
				BindingResult result, SessionStatus status, org.springframework.web.context.request.WebRequest webRequest, 
				Model model, HttpSession session) {
			
			try{
					
					ModelAndView mav = getMAV(webRequest, "public/landingpages/general-personal-coaches", coachSelection, result, session);
					
					
					return mav;
			} catch (Exception e) {
		        String msg = "The request failed. Error " + e;
		        log.error(msg, e);
				model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				return new ModelAndView("public/common/error/errorpage");
			}	
		}
		
		private void setMavSession(ModelAndView mav, HttpSession session, org.springframework.web.context.request.WebRequest webRequest) throws Exception{

			mav.setViewName ("redirect:coachprofileListAdvance/coachingCategory/" + webRequest.getParameter("coachingCategory") + 
					"/coachingSubcategory/" + webRequest.getParameter("coachingSubcategory") + 
					"/industryExperience/" + webRequest.getParameter("industryExperience") +
					"/companyExperience/"  + (webRequest.getParameter("companyExperience") == null || webRequest.getParameter("companyExperience").trim().equals("") ?Constants.DEFAULT_URL_STRING:webRequest.getParameter("companyExperience") )+ 
					"/coachFirstName/"  + (webRequest.getParameter("coachFirstName")  == null || webRequest.getParameter("coachFirstName").trim().equals("")?Constants.DEFAULT_URL_STRING:webRequest.getParameter("coachFirstName") ) + 
					"/coachLastName/"  + (webRequest.getParameter("coachLastName")  == null || webRequest.getParameter("coachLastName").trim().equals("")?Constants.DEFAULT_URL_STRING:webRequest.getParameter("coachLastName") ) + 
					"/city/"  + (webRequest.getParameter("city")  == null || webRequest.getParameter("city").trim().equals("")?Constants.DEFAULT_URL_STRING:webRequest.getParameter("city") ) + 
					"/state/"  + (webRequest.getParameter("state")  == null || webRequest.getParameter("state").trim().equals("")?Constants.DEFAULT_URL_STRING:webRequest.getParameter("state") ) + 
					"/pageNumber/1"  +  //12/17/2015 -- Add zipcode area search and sort functionalities
					"/zipcode/"  + (webRequest.getParameter("zipcode")  == null || webRequest.getParameter("zipcode").trim().equals("")?Constants.DEFAULT_URL_STRING:webRequest.getParameter("zipcode") ) +  
					"/coachstyleinperson/"  + (webRequest.getParameter("coachstyle").equalsIgnoreCase("coachstyleinperson")?"1":Constants.DEFAULT_URL_STRING ) + 
					"/coachstyleonline/"  + (webRequest.getParameter("coachstyle").equalsIgnoreCase("coachstyleonline")?"1":Constants.DEFAULT_URL_STRING ) + 
					"/sortcoachlist/-1" 
			);

			session.setAttribute("coachingCategory", webRequest.getParameter("coachingCategory"));
			session.setAttribute("coachingSubcategory", webRequest.getParameter("coachingSubcategory"));
			session.setAttribute("industryExperience", webRequest.getParameter("industryExperience"));
			session.setAttribute("companyExperience", webRequest.getParameter("companyExperience"));
			session.setAttribute("coachFirstName", webRequest.getParameter("coachFirstName"));
			session.setAttribute("coachLastName", webRequest.getParameter("coachLastName"));
			session.setAttribute("state", webRequest.getParameter("state"));
			session.setAttribute("city", webRequest.getParameter("city"));
			session.setAttribute("coachingcategoryname", webRequest.getParameter("coachingcategoryname"));
			session.setAttribute("zipcode", webRequest.getParameter("zipcode")); //12/17/2015  zipcode area search and sorting capabilities
			session.setAttribute("coachstyleinperson", webRequest.getParameter("coachstyleinperson"));
			session.setAttribute("coachstyleonline", webRequest.getParameter("coachstyleonline"));
			session.setAttribute("sortcoachlist", "-1");
			
		}
		

		ModelAndView getMAV(org.springframework.web.context.request.WebRequest webRequest, String viewName, CoachSelection coachSelection, BindingResult result, HttpSession session) throws Exception
		{
			String coachingCategory = webRequest.getParameter("coachingCategory");
			String coachingcategoryname = webRequest.getParameter("coachingcategoryname");
			
			ModelAndView mav = new ModelAndView ();
			
    		mav.addObject("coachSelection", coachSelection);

    		//Validation logic goes here
			validator.validate(coachSelection, result);
    		if (result.hasErrors()){
	    		mav.setViewName (viewName);

	    		if (coachingCategory != null){
		    		mav.addObject("coachingCategory", coachingCategory);
		    		mav.addObject("coachingcategoryname", coachingcategoryname);
	    		}
	    		
				return mav;
			}
			setMavSession(mav, session, webRequest);
			
			return mav;
		}

		
		
}
