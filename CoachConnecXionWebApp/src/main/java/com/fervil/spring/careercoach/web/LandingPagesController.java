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

					ModelAndView mav = getMAV(webRequest, "public/landingpages/business-coaches", coachSelection, result, session);
					return mav;

			} catch (Exception e) {
		        String msg = "The request failed. Error " + e;
		        log.error(msg, e);
				model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				return new ModelAndView("public/common/error/errorpage");
			}	
		}
		

@RequestMapping(value = "/public/landing-add-adhd-coaches", method = RequestMethod.GET)
public ModelAndView addAdhdCoachesreturn(Model model, org.springframework.web.context.request.WebRequest webRequest, HttpSession session) {

	log.debug("Received request to show add/adhd coaches");
	
	ModelAndView mav = new ModelAndView ();
	
	CoachSelection coachSelection = new CoachSelection();

	mav.addObject("coachingcategoryname", Constants.ADD_ADHD_COACHES_CATEGORY_NAME);
	mav.addObject("coachingCategory", Constants.ADD_ADHD_COACHES_CATEGORY_ID);

	mav.addObject("coachSelection", coachSelection);
	mav.setViewName ("public/landingpages/add-adhd-coaches");
	return mav;
}

@RequestMapping(value = "/public/landing-add-adhd-coaches", method = RequestMethod.POST)
public ModelAndView addAdhdsubmitForm( 
		@ModelAttribute("coachSelection") CoachSelection coachSelection,
		BindingResult result, SessionStatus status, org.springframework.web.context.request.WebRequest webRequest, 
		Model model, HttpSession session) {

	try{

			ModelAndView mav = getMAV(webRequest, "public/landingpages/add-adhd-coaches", coachSelection, result, session);
			return mav;

	} catch (Exception e) {
        String msg = "The request failed. Error " + e;
        log.error(msg, e);
		model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
		return new ModelAndView("public/common/error/errorpage");
	}	
}


@RequestMapping(value = "/public/landing-college-preperation-testing-coaches", method = RequestMethod.GET)
public ModelAndView collegePrepCoachesreturn(Model model, org.springframework.web.context.request.WebRequest webRequest, HttpSession session) {

	log.debug("Received request to show college prep coaches");
	
	ModelAndView mav = new ModelAndView ();
	
	CoachSelection coachSelection = new CoachSelection();

	mav.addObject("coachingcategoryname", Constants.COLLEGE_PREP_CATEGORY_NAME);
	mav.addObject("coachingCategory", Constants.COLLEGE_PREP_CATEGORY_ID);

	mav.addObject("coachSelection", coachSelection);
	mav.setViewName ("public/landingpages/college-prep-testing-coaches");
	return mav;
}

@RequestMapping(value = "/public/landing-college-preperation-testing-coaches", method = RequestMethod.POST)
public ModelAndView collegePrepsubmitForm( 
		@ModelAttribute("coachSelection") CoachSelection coachSelection,
		BindingResult result, SessionStatus status, org.springframework.web.context.request.WebRequest webRequest, 
		Model model, HttpSession session) {

	try{

			ModelAndView mav = getMAV(webRequest, "public/landingpages/college-prep-testing-coaches", coachSelection, result, session);
			return mav;

	} catch (Exception e) {
        String msg = "The request failed. Error " + e;
        log.error(msg, e);
		model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
		return new ModelAndView("public/common/error/errorpage");
	}	
}


@RequestMapping(value = "/public/landing-entrepreneurship-coaches", method = RequestMethod.GET)
public ModelAndView entrepreneurshipCoachesreturn(Model model, org.springframework.web.context.request.WebRequest webRequest, HttpSession session) {

	log.debug("Received request to show college prep coaches");
	
	ModelAndView mav = new ModelAndView ();
	
	CoachSelection coachSelection = new CoachSelection();

	mav.addObject("coachingcategoryname", Constants.ENTREPRENEURSHIP_CATEGORY_NAME);
	mav.addObject("coachingCategory", Constants.ENTREPRENEURSHIP_CATEGORY_ID);

	mav.addObject("coachSelection", coachSelection);
	mav.setViewName ("public/landingpages/entrepreneurship-coaches");
	return mav;
}

@RequestMapping(value = "/public/landing-entrepreneurship-coaches", method = RequestMethod.POST)
public ModelAndView entrepreneurshipsubmitForm( 
		@ModelAttribute("coachSelection") CoachSelection coachSelection,
		BindingResult result, SessionStatus status, org.springframework.web.context.request.WebRequest webRequest, 
		Model model, HttpSession session) {

	try{
			ModelAndView mav = getMAV(webRequest, "public/landingpages/entrepreneurship-coaches", coachSelection, result, session);
			return mav;

	} catch (Exception e) {
        String msg = "The request failed. Error " + e;
        log.error(msg, e);
		model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
		return new ModelAndView("public/common/error/errorpage");
	}	
}
		

@RequestMapping(value = "/public/landing-leadership-coaches", method = RequestMethod.GET)
public ModelAndView leadershipCoachesreturn(Model model, org.springframework.web.context.request.WebRequest webRequest, HttpSession session) {

	log.debug("Received request to show leadership coaches");
	
	ModelAndView mav = new ModelAndView ();
	
	CoachSelection coachSelection = new CoachSelection();

	mav.addObject("coachingcategoryname", Constants.LEADERSHIP_CATEGORY_NAME);
	mav.addObject("coachingCategory", Constants.LEADERSHIP_CATEGORY_ID);

	mav.addObject("coachSelection", coachSelection);
	mav.setViewName ("public/landingpages/leadership-coaches");
	return mav;
}

@RequestMapping(value = "/public/landing-leadership-coaches", method = RequestMethod.POST)
public ModelAndView leadershipsubmitForm( 
		@ModelAttribute("coachSelection") CoachSelection coachSelection,
		BindingResult result, SessionStatus status, org.springframework.web.context.request.WebRequest webRequest, 
		Model model, HttpSession session) {

	try{
			ModelAndView mav = getMAV(webRequest, "public/landingpages/leadership-coaches", coachSelection, result, session);
			return mav;

	} catch (Exception e) {
        String msg = "The request failed. Error " + e;
        log.error(msg, e);
		model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
		return new ModelAndView("public/common/error/errorpage");
	}	
}
		


@RequestMapping(value = "/public/landing-motivational-performance-coaches", method = RequestMethod.GET)
public ModelAndView motivationalPerformancereturn(Model model, org.springframework.web.context.request.WebRequest webRequest, HttpSession session) {

	log.debug("Received request to show motivational/performance coaches");
	
	ModelAndView mav = new ModelAndView ();
	
	CoachSelection coachSelection = new CoachSelection();

	mav.addObject("coachingcategoryname", Constants.MOTIVATAIONAL_PERFORMANCE_CATEGORY_NAME);
	mav.addObject("coachingCategory", Constants.MOTIVATAIONAL_PERFORMANCE_CATEGORY_ID);

	mav.addObject("coachSelection", coachSelection);
	mav.setViewName ("public/landingpages/motivational-performance-coaches");
	return mav;
}

@RequestMapping(value = "/public/landing-motivational-performance-coaches", method = RequestMethod.POST)
public ModelAndView motivationalPerformancesubmitForm( 
		@ModelAttribute("coachSelection") CoachSelection coachSelection,
		BindingResult result, SessionStatus status, org.springframework.web.context.request.WebRequest webRequest, 
		Model model, HttpSession session) {

	try{
			ModelAndView mav = getMAV(webRequest, "public/landingpages/motivational-performance-coaches", coachSelection, result, session);
			return mav;

	} catch (Exception e) {
        String msg = "The request failed. Error " + e;
        log.error(msg, e);
		model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
		return new ModelAndView("public/common/error/errorpage");
	}	
}


@RequestMapping(value = "/public/landing-sales-coaches", method = RequestMethod.GET)
public ModelAndView salesreturn(Model model, org.springframework.web.context.request.WebRequest webRequest, HttpSession session) {

	log.debug("Received request to show sales coaches");
	
	ModelAndView mav = new ModelAndView ();
	
	CoachSelection coachSelection = new CoachSelection();

	mav.addObject("coachingcategoryname", Constants.SALES_CATEGORY_NAME);
	mav.addObject("coachingCategory", Constants.SALES_CATEGORY_ID);

	mav.addObject("coachSelection", coachSelection);
	mav.setViewName ("public/landingpages/sales-coaches");
	return mav;
}

@RequestMapping(value = "/public/landing-sales-coaches", method = RequestMethod.POST)
public ModelAndView salessubmitForm( 
		@ModelAttribute("coachSelection") CoachSelection coachSelection,
		BindingResult result, SessionStatus status, org.springframework.web.context.request.WebRequest webRequest, 
		Model model, HttpSession session) {

	try{
			ModelAndView mav = getMAV(webRequest, "public/landingpages/sales-coaches", coachSelection, result, session);
			return mav;

	} catch (Exception e) {
        String msg = "The request failed. Error " + e;
        log.error(msg, e);
		model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
		return new ModelAndView("public/common/error/errorpage");
	}	
}


@RequestMapping(value = "/public/landing-team-and-group-coaches", method = RequestMethod.GET)
public ModelAndView teamGroupreturn(Model model, org.springframework.web.context.request.WebRequest webRequest, HttpSession session) {

	log.debug("Received request to show team and group coaches");
	
	ModelAndView mav = new ModelAndView ();
	
	CoachSelection coachSelection = new CoachSelection();

	mav.addObject("coachingcategoryname", Constants.TEAM_GROUP_CATEGORY_NAME);
	mav.addObject("coachingCategory", Constants.TEAM_GROUP_CATEGORY_ID);

	mav.addObject("coachSelection", coachSelection);
	mav.setViewName ("public/landingpages/team-group-coaches");
	return mav;
}

@RequestMapping(value = "/public/landing-team-and-group-coaches", method = RequestMethod.POST)
public ModelAndView teamGroupsubmitForm( 
		@ModelAttribute("coachSelection") CoachSelection coachSelection,
		BindingResult result, SessionStatus status, org.springframework.web.context.request.WebRequest webRequest, 
		Model model, HttpSession session) {

	try{
			ModelAndView mav = getMAV(webRequest, "public/landingpages/team-group-coaches", coachSelection, result, session);
			return mav;
	} catch (Exception e) {
        String msg = "The request failed. Error " + e;
        log.error(msg, e);
		model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
		return new ModelAndView("public/common/error/errorpage");
	}	
}

		@RequestMapping(value = "/public/landing-health-fitness-exercise-coaches", method = RequestMethod.GET)
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
		
		@RequestMapping(value = "/public/landing-health-fitness-exercise-coaches", method = RequestMethod.POST)
		public ModelAndView submitFitnessForm( 
				@ModelAttribute("coachSelection") CoachSelection coachSelection,
				BindingResult result, SessionStatus status, org.springframework.web.context.request.WebRequest webRequest, 
				Model model, HttpSession session) {
			
			try{

					//ModelAndView mav = new ModelAndView ();
					//setMavSession(mav, session, webRequest);
				
					ModelAndView mav = getMAV(webRequest, "public/landingpages/fitness-coaches", coachSelection, result, session);
					
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
					
					ModelAndView mav = getMAV(webRequest, "public/landingpages/career-coaches", coachSelection, result, session);
					
					return mav;
			} catch (Exception e) {
		        String msg = "The request failed. Error " + e;
		        log.error(msg, e);
				model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				return new ModelAndView("public/common/error/errorpage");
			}	
		}

		
		@RequestMapping(value = "/public/landing-diet-nutrition-weigh-loss-coaches", method = RequestMethod.GET)
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
		
		@RequestMapping(value = "/public/landing-diet-nutrition-weigh-loss-coaches", method = RequestMethod.POST)
		public ModelAndView submitNutritionForm( 
				@ModelAttribute("coachSelection") CoachSelection coachSelection,
				BindingResult result, SessionStatus status, org.springframework.web.context.request.WebRequest webRequest, 
				Model model, HttpSession session) {
			
			try{

					//ModelAndView mav = new ModelAndView ();
					//setMavSession(mav, session, webRequest);

					ModelAndView mav = getMAV(webRequest, "public/landingpages/nutrition-coaches", coachSelection, result, session);
					
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
					ModelAndView mav = getMAV(webRequest, "public/landingpages/family-coaches", coachSelection, result, session);
					
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
					ModelAndView mav = getMAV(webRequest, "public/landingpages/finance-money-coaches", coachSelection, result, session);
					
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
					ModelAndView mav = getMAV(webRequest, "public/landingpages/life-coaches", coachSelection, result, session);
					
					return mav;
			} catch (Exception e) {
		        String msg = "The request failed. Error " + e;
		        log.error(msg, e);
				model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				return new ModelAndView("public/common/error/errorpage");
			}	
		}

		
		@RequestMapping(value = "/public/landing-relationship-couples-coaches", method = RequestMethod.GET)
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
		
		@RequestMapping(value = "/public/landing-relationship-couples-coaches", method = RequestMethod.POST)
		public ModelAndView submitRelationshipForm( 
				@ModelAttribute("coachSelection") CoachSelection coachSelection,
				BindingResult result, SessionStatus status, org.springframework.web.context.request.WebRequest webRequest, 
				Model model, HttpSession session) {
			
			try{
					ModelAndView mav = getMAV(webRequest, "public/landingpages/relationship-coaches", coachSelection, result, session);
					return mav;

			} catch (Exception e) {
		        String msg = "The request failed. Error " + e;
		        log.error(msg, e);
				model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				return new ModelAndView("public/common/error/errorpage");
			}	
		}
		
		
		@RequestMapping(value = "/public/landing-executive-corporate-management-coaches", method = RequestMethod.GET)
		public ModelAndView corporateCoachesreturn(Model model, org.springframework.web.context.request.WebRequest webRequest, HttpSession session) {

			log.debug("Received request to show corporate coaches");
			
			ModelAndView mav = new ModelAndView ();
			CoachSelection coachSelection = new CoachSelection();

			mav.addObject("coachingcategoryname", Constants.EXECUTIVE_MANAGEMENT_COACHES_CATEGORY_NAME);
			mav.addObject("coachingCategory", Constants.EXECUTIVE_MANAGEMENT_COACHES_CATEGORY_ID);

			mav.addObject("coachSelection", coachSelection);
			mav.setViewName ("public/landingpages/corporate-coaches");
			return mav;
		}
		
		@RequestMapping(value = "/public/landing-executive-corporate-management-coaches", method = RequestMethod.POST)
		public ModelAndView submitCorporateForm( 
				@ModelAttribute("coachSelection") CoachSelection coachSelection,
				BindingResult result, SessionStatus status, org.springframework.web.context.request.WebRequest webRequest, 
				Model model, HttpSession session) {
			
			try{
					ModelAndView mav = getMAV(webRequest, "public/landingpages/corporate-coaches", coachSelection, result, session);
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

			try{

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

			} catch (Exception e) {
		        String msg = "The request failed in setMavSession. Error " + e;
		        log.error(msg, e);
				throw e;
			}	
			
		}
		

		ModelAndView getMAV(org.springframework.web.context.request.WebRequest webRequest, String viewName, CoachSelection coachSelection, BindingResult result, HttpSession session) throws Exception
		{
			
			try{
			
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
				
			} catch (Exception e) {
		        String msg = "The request failed in getMAV. Error " + e;
		        log.error(msg, e);
				throw e;
			}	
				
		}
		
}
