package com.fervil.spring.careercoach.web.tutor;

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
public class TutorLandingPagesController {
    private static final Logger log = LoggerFactory.getLogger(TutorLandingPagesController.class);
	
		@RequestMapping(value = "/tutor/public/landing-art-tutor", method = RequestMethod.GET)
		public ModelAndView businessCoachesreturn(Model model, org.springframework.web.context.request.WebRequest webRequest, HttpSession session) {

			log.debug("Received request to show business coaches");
			
			ModelAndView mav = new ModelAndView ();
			
			CoachSelection coachSelection = new CoachSelection();

			mav.addObject("coachingcategoryname", Constants.ART_TUTOR_CATEGORY_NAME);
			mav.addObject("coachingCategory", Constants.ART_TUTOR_CATEGORY_ID);

			mav.addObject("coachSelection", coachSelection);
			
			mav.setViewName ("tutor/public/landingpages/art-tutor");
			return mav;
		}
		
		@RequestMapping(value = "/tutor/public/landing-art-tutor", method = RequestMethod.POST)
		public ModelAndView submitForm( 
				@ModelAttribute("coachSelection") CoachSelection coachSelection,
				BindingResult result, SessionStatus status, org.springframework.web.context.request.WebRequest webRequest, 
				Model model, HttpSession session) {

		    //Map<String, Object> myModel = new HashMap<String, Object>();
			
			try{

					ModelAndView mav = new ModelAndView ();
					setMavSession(mav, session, webRequest);

					return mav;
					
			} catch (Exception e) {
		        String msg = "The request failed. Error " + e;
		        log.error(msg, e);
				model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				return new ModelAndView("tutor/public/common/error/errorpage");
			}	
		}
		
		@RequestMapping(value = "/tutor/public/landing-business-tutor", method = RequestMethod.GET)
		public ModelAndView fitnessCoachesreturn(Model model, org.springframework.web.context.request.WebRequest webRequest, HttpSession session) {

			log.debug("Received request to show fitness coaches");
			
			ModelAndView mav = new ModelAndView ();
			
			CoachSelection coachSelection = new CoachSelection();

			mav.addObject("coachingcategoryname", Constants.BUSINESS_TUTOR_CATEGORY_NAME);
			mav.addObject("coachingCategory", Constants.BUSINESS_TUTOR_CATEGORY_ID);

			mav.addObject("coachSelection", coachSelection);
			mav.setViewName ("tutor/public/landingpages/business-tutor");
			return mav;
		}
		
		@RequestMapping(value = "/tutor/public/landing-business-tutor", method = RequestMethod.POST)
		public ModelAndView submitFitnessForm( 
				@ModelAttribute("coachSelection") CoachSelection coachSelection,
				BindingResult result, SessionStatus status, org.springframework.web.context.request.WebRequest webRequest, 
				Model model, HttpSession session) {
			
			try{

					ModelAndView mav = new ModelAndView ();
					setMavSession(mav, session, webRequest);
					
					return mav;
			} catch (Exception e) {
		        String msg = "The request failed. Error " + e;
		        log.error(msg, e);
				model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				return new ModelAndView("tutor/public/common/error/errorpage");
			}	
		}
		
		
		
		@RequestMapping(value = "/tutor/public/landing-computer-business-tutor", method = RequestMethod.GET)
		public ModelAndView careerCoachesreturn(Model model, org.springframework.web.context.request.WebRequest webRequest, HttpSession session) {

			log.debug("Received request to show career coaches");
			
			ModelAndView mav = new ModelAndView ();
			
			CoachSelection coachSelection = new CoachSelection();

			mav.addObject("coachingcategoryname", Constants.COMPUTER_BUSINESS_TUTOR_CATEGORY_NAME);
			mav.addObject("coachingCategory", Constants.COMPUTER_PROGRAMMING_TUTOR_CATEGORY_ID);

			mav.addObject("coachSelection", coachSelection);
			mav.setViewName ("tutor/public/landingpages/computer-business-tutor");
			return mav;
		}
		
		@RequestMapping(value = "/tutor/public/landing-computer-business-tutor", method = RequestMethod.POST)
		public ModelAndView submitCareerForm( 
				@ModelAttribute("coachSelection") CoachSelection coachSelection,
				BindingResult result, SessionStatus status, org.springframework.web.context.request.WebRequest webRequest, 
				Model model, HttpSession session) {
			
			try{

					ModelAndView mav = new ModelAndView ();
					setMavSession(mav, session, webRequest);
					
					return mav;
			} catch (Exception e) {
		        String msg = "The request failed. Error " + e;
		        log.error(msg, e);
				model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				return new ModelAndView("tutor/public/common/error/errorpage");
			}	
		}

		
		@RequestMapping(value = "/tutor/public/landing-computer-programming-tutor", method = RequestMethod.GET)
		public ModelAndView nutritionCoachesreturn(Model model, org.springframework.web.context.request.WebRequest webRequest, HttpSession session) {

			log.debug("Received request to show nutrition coaches");
			
			ModelAndView mav = new ModelAndView ();
			
			CoachSelection coachSelection = new CoachSelection();

			mav.addObject("coachingcategoryname", Constants.COMPUTER_PROGRAMMING_TUTOR_CATEGORY_NAME);
			mav.addObject("coachingCategory", Constants.COMPUTER_PROGRAMMING_TUTOR_CATEGORY_ID);

			mav.addObject("coachSelection", coachSelection);
			mav.setViewName ("tutor/public/landingpages/computer-programming-tutor");
			return mav;
		}
		
		@RequestMapping(value = "/tutor/public/landing-computer-programming-tutor", method = RequestMethod.POST)
		public ModelAndView submitNutritionForm( 
				@ModelAttribute("coachSelection") CoachSelection coachSelection,
				BindingResult result, SessionStatus status, org.springframework.web.context.request.WebRequest webRequest, 
				Model model, HttpSession session) {
			
			try{

					ModelAndView mav = new ModelAndView ();
					setMavSession(mav, session, webRequest);
					
					return mav;
			} catch (Exception e) {
		        String msg = "The request failed. Error " + e;
		        log.error(msg, e);
				model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				return new ModelAndView("tutor/public/common/error/errorpage");
			}	
		}
		
		
		@RequestMapping(value = "/tutor/public/landing-communication-presentation-tutor", method = RequestMethod.GET)
		public ModelAndView familyCoachesreturn(Model model, org.springframework.web.context.request.WebRequest webRequest, HttpSession session) {

			log.debug("Received request to show family coaches");
			
			ModelAndView mav = new ModelAndView ();
			
			CoachSelection coachSelection = new CoachSelection();

			mav.addObject("coachingcategoryname", Constants.COMMUNICATION_TUTOR_CATEGORY_NAME);
			mav.addObject("coachingCategory", Constants.COMMUNICATION_TUTOR_CATEGORY_ID);

			mav.addObject("coachSelection", coachSelection);
			mav.setViewName ("tutor/public/landingpages/communication-presentation-tutor");
			return mav;
		}
		
		@RequestMapping(value = "/tutor/public/landing-communication-presentation-tutor", method = RequestMethod.POST)
		public ModelAndView submitFamilyForm( 
				@ModelAttribute("coachSelection") CoachSelection coachSelection,
				BindingResult result, SessionStatus status, org.springframework.web.context.request.WebRequest webRequest, 
				Model model, HttpSession session) {
			
			try{

					ModelAndView mav = new ModelAndView ();
					setMavSession(mav, session, webRequest);
					
					return mav;
			} catch (Exception e) {
		        String msg = "The request failed. Error " + e;
		        log.error(msg, e);
				model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				return new ModelAndView("tutor/public/common/error/errorpage");
			}	
		}
		
		
		@RequestMapping(value = "/tutor/public/landing-english-tutor", method = RequestMethod.GET)
		public ModelAndView financeCoachesreturn(Model model, org.springframework.web.context.request.WebRequest webRequest, HttpSession session) {

			log.debug("Received request to show finance coaches");
			
			ModelAndView mav = new ModelAndView ();
			
			CoachSelection coachSelection = new CoachSelection();

			mav.addObject("coachingcategoryname", Constants.ENGLISH_TUTOR_CATEGORY_NAME);
			mav.addObject("coachingCategory", Constants.ENGLISH_TUTOR_CATEGORY_ID);

			mav.addObject("coachSelection", coachSelection);
			mav.setViewName ("tutor/public/landingpages/english-tutor");
			return mav;
		}
		
		@RequestMapping(value = "/tutor/public/landing-english-tutor", method = RequestMethod.POST)
		public ModelAndView submitFinanceForm( 
				@ModelAttribute("coachSelection") CoachSelection coachSelection,
				BindingResult result, SessionStatus status, org.springframework.web.context.request.WebRequest webRequest, 
				Model model, HttpSession session) {
			
			try{
					ModelAndView mav = new ModelAndView ();
					setMavSession(mav, session, webRequest);
					
					return mav;
			} catch (Exception e) {
		        String msg = "The request failed. Error " + e;
		        log.error(msg, e);
				model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				return new ModelAndView("tutor/public/common/error/errorpage");
			}	
		}
		
		
		@RequestMapping(value = "/tutor/public/landing-history-tutor", method = RequestMethod.GET)
		public ModelAndView lifeCoachesreturn(Model model, org.springframework.web.context.request.WebRequest webRequest, HttpSession session) {

			log.debug("Received request to show life coaches");
			
			ModelAndView mav = new ModelAndView ();
			
			CoachSelection coachSelection = new CoachSelection();

			mav.addObject("coachingcategoryname", Constants.HISTORY_TUTOR_CATEGORY_NAME);
			mav.addObject("coachingCategory", Constants.HISTORY_TUTOR_CATEGORY_ID);

			mav.addObject("coachSelection", coachSelection);
			mav.setViewName ("tutor/public/landingpages/history-tutor");
			return mav;
		}
		
		@RequestMapping(value = "/tutor/public/landing-history-tutor", method = RequestMethod.POST)
		public ModelAndView submitLifeForm( 
				@ModelAttribute("coachSelection") CoachSelection coachSelection,
				BindingResult result, SessionStatus status, org.springframework.web.context.request.WebRequest webRequest, 
				Model model, HttpSession session) {
			
			try{
					ModelAndView mav = new ModelAndView ();
					setMavSession(mav, session, webRequest);
					
					return mav;
			} catch (Exception e) {
		        String msg = "The request failed. Error " + e;
		        log.error(msg, e);
				model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				return new ModelAndView("tutor/public/common/error/errorpage");
			}	
		}

		
		@RequestMapping(value = "/tutor/public/landing-homeschool-tutor", method = RequestMethod.GET)
		public ModelAndView relationshipCoachesreturn(Model model, org.springframework.web.context.request.WebRequest webRequest, HttpSession session) {

			log.debug("Received request to show relationship coaches");
			
			ModelAndView mav = new ModelAndView ();
			CoachSelection coachSelection = new CoachSelection();

			mav.addObject("coachingcategoryname", Constants.HOMESCHOOL_TUTOR_CATEGORY_NAME);
			mav.addObject("coachingCategory", Constants.HOMESCHOOL_TUTOR_CATEGORY_ID);

			mav.addObject("coachSelection", coachSelection);
			mav.setViewName ("tutor/public/landingpages/homeschool-tutor");
			return mav;
		}
		
		@RequestMapping(value = "/tutor/public/landing-homeschool-tutor", method = RequestMethod.POST)
		public ModelAndView submitRelationshipForm( 
				@ModelAttribute("coachSelection") CoachSelection coachSelection,
				BindingResult result, SessionStatus status, org.springframework.web.context.request.WebRequest webRequest, 
				Model model, HttpSession session) {
			
			try{
					ModelAndView mav = new ModelAndView ();
					setMavSession(mav, session, webRequest);
					
					return mav;
			} catch (Exception e) {
		        String msg = "The request failed. Error " + e;
		        log.error(msg, e);
				model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				return new ModelAndView("tutor/public/common/error/errorpage");
			}	
		}
		
		
		@RequestMapping(value = "/tutor/public/landing-language-tutor", method = RequestMethod.GET)
		public ModelAndView corporateCoachesreturn(Model model, org.springframework.web.context.request.WebRequest webRequest, HttpSession session) {

			log.debug("Received request to show corporate coaches");
			
			ModelAndView mav = new ModelAndView ();
			CoachSelection coachSelection = new CoachSelection();

			mav.addObject("coachingcategoryname", Constants.LANGUAGE_TUTOR_CATEGORY_NAME);
			mav.addObject("coachingCategory", Constants.LANGUAGE_TUTOR_CATEGORY_ID);

			mav.addObject("coachSelection", coachSelection);
			mav.setViewName ("tutor/public/landingpages/language-tutor");
			return mav;
		}
		
		@RequestMapping(value = "/tutor/public/landing-language-tutor", method = RequestMethod.POST)
		public ModelAndView submitCorporateForm( 
				@ModelAttribute("coachSelection") CoachSelection coachSelection,
				BindingResult result, SessionStatus status, org.springframework.web.context.request.WebRequest webRequest, 
				Model model, HttpSession session) {
			
			try{
					ModelAndView mav = new ModelAndView ();
					setMavSession(mav, session, webRequest);
					
					return mav;
			} catch (Exception e) {
		        String msg = "The request failed. Error " + e;
		        log.error(msg, e);
				model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				return new ModelAndView("tutor/public/common/error/errorpage");
			}	
		}

		
		@RequestMapping(value = "/tutor/public/landing-math-tutor", method = RequestMethod.GET)
		public ModelAndView genralCoachesreturn(Model model, org.springframework.web.context.request.WebRequest webRequest, HttpSession session) {

			log.debug("Received request to show corporate coaches");
			
			ModelAndView mav = new ModelAndView ();
			CoachSelection coachSelection = new CoachSelection();

			mav.addObject("coachingcategoryname", Constants.LANGUAGE_TUTOR_CATEGORY_NAME);
			mav.addObject("coachingCategory", Constants.LANGUAGE_TUTOR_CATEGORY_ID);

			mav.addObject("coachSelection", coachSelection);
			//mav.setViewName ("public/landingpages/general-personal-coaches-cs");
			mav.setViewName ("tutor/public/landingpages/math-tutor");
			return mav;
		}
		
		@RequestMapping(value = "/tutor/public/landing-math-tutor", method = RequestMethod.POST)
		public ModelAndView submitGeneralForm( 
				@ModelAttribute("coachSelection") CoachSelection coachSelection,
				BindingResult result, SessionStatus status, org.springframework.web.context.request.WebRequest webRequest, 
				Model model, HttpSession session) {
			
			try{
					ModelAndView mav = new ModelAndView ();
					setMavSession(mav, session, webRequest);
					
					return mav;
			} catch (Exception e) {
		        String msg = "The request failed. Error " + e;
		        log.error(msg, e);
				model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				return new ModelAndView("tutor/public/common/error/errorpage");
			}	
		}
		
		@RequestMapping(value = "/tutor/public/landing-science-tutor", method = RequestMethod.GET)
		public ModelAndView scienceTutorreturn(Model model, org.springframework.web.context.request.WebRequest webRequest, HttpSession session) {

			log.debug("Received request to show corporate coaches");
			
			ModelAndView mav = new ModelAndView ();
			CoachSelection coachSelection = new CoachSelection();

			mav.addObject("coachingcategoryname", Constants.SCIENCE_TUTOR_CATEGORY_NAME);
			mav.addObject("coachingCategory", Constants.SCIENCE_TUTOR_CATEGORY_ID);

			mav.addObject("coachSelection", coachSelection);
			//mav.setViewName ("public/landingpages/general-personal-coaches-cs");
			mav.setViewName ("tutor/public/landingpages/science-tutor");
			return mav;
		}
		
		@RequestMapping(value = "/tutor/public/landing-science-tutor", method = RequestMethod.POST)
		public ModelAndView submitScienceTutorForm( 
				@ModelAttribute("coachSelection") CoachSelection coachSelection,
				BindingResult result, SessionStatus status, org.springframework.web.context.request.WebRequest webRequest, 
				Model model, HttpSession session) {
			
			try{
					ModelAndView mav = new ModelAndView ();
					setMavSession(mav, session, webRequest);
					
					return mav;
			} catch (Exception e) {
		        String msg = "The request failed. Error " + e;
		        log.error(msg, e);
				model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				return new ModelAndView("tutor/public/common/error/errorpage");
			}	
		}
		
		
		@RequestMapping(value = "/tutor/public/landing-add-adhd-tutor", method = RequestMethod.GET)
		public ModelAndView addAdhdTutorReturn(Model model, org.springframework.web.context.request.WebRequest webRequest, HttpSession session) {

			log.debug("Received request to show corporate coaches");
			
			ModelAndView mav = new ModelAndView ();
			CoachSelection coachSelection = new CoachSelection();

			mav.addObject("coachingcategoryname", Constants.SPECIAL_NEEDS_TUTOR_CATEGORY_NAME);
			mav.addObject("coachingCategory", Constants.SPECIAL_NEEDS_TUTOR_CATEGORY_ID);

			mav.addObject("coachSelection", coachSelection);
			//mav.setViewName ("public/landingpages/general-personal-coaches-cs");
			mav.setViewName ("tutor/public/landingpages/add-adhd-tutor");
			return mav;
		}
		
		@RequestMapping(value = "/tutor/public/landing-add-adhd-tutor", method = RequestMethod.POST)
		public ModelAndView submitaddAdhdTutorTutorForm( 
				@ModelAttribute("coachSelection") CoachSelection coachSelection,
				BindingResult result, SessionStatus status, org.springframework.web.context.request.WebRequest webRequest, 
				Model model, HttpSession session) {
			
			try{
					ModelAndView mav = new ModelAndView ();
					setMavSession(mav, session, webRequest);
					
					return mav;
			} catch (Exception e) {
		        String msg = "The request failed. Error " + e;
		        log.error(msg, e);
				model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				return new ModelAndView("tutor/public/common/error/errorpage");
			}	
		}
		
		@RequestMapping(value = "/tutor/public/landing-sat-act-gmat-lsat-tutor", method = RequestMethod.GET)
		public ModelAndView gmatLsatReturn(Model model, org.springframework.web.context.request.WebRequest webRequest, HttpSession session) {

			log.debug("Received request to show corporate coaches");
			
			ModelAndView mav = new ModelAndView ();
			CoachSelection coachSelection = new CoachSelection();

			mav.addObject("coachingcategoryname", Constants.TEST_PREP_TUTOR_CATEGORY_NAME);
			mav.addObject("coachingCategory", Constants.TEST_PREP_TUTOR_CATEGORY_ID);

			mav.addObject("coachSelection", coachSelection);
			//mav.setViewName ("public/landingpages/general-personal-coaches-cs");
			mav.setViewName ("tutor/public/landingpages/test-prep-tutor");
			return mav;
		}
		
		@RequestMapping(value = "/tutor/public/landing-sat-act-gmat-lsat-tutor", method = RequestMethod.POST)
		public ModelAndView submitgmatLsatTutorForm( 
				@ModelAttribute("coachSelection") CoachSelection coachSelection,
				BindingResult result, SessionStatus status, org.springframework.web.context.request.WebRequest webRequest, 
				Model model, HttpSession session) {
			
			try{
					ModelAndView mav = new ModelAndView ();
					setMavSession(mav, session, webRequest);
					
					return mav;
			} catch (Exception e) {
		        String msg = "The request failed. Error " + e;
		        log.error(msg, e);
				model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				return new ModelAndView("tutor/public/common/error/errorpage");
			}	
		}
		
		@RequestMapping(value = "/tutor/public/landing-music-tutor", method = RequestMethod.GET)
		public ModelAndView gmatmusicTutorReturn(Model model, org.springframework.web.context.request.WebRequest webRequest, HttpSession session) {

			log.debug("Received request to show corporate coaches");
			
			ModelAndView mav = new ModelAndView ();
			CoachSelection coachSelection = new CoachSelection();

			mav.addObject("coachingcategoryname", Constants.MUSIC_TUTOR_CATEGORY_NAME);
			mav.addObject("coachingCategory", Constants.MUSIC_TUTOR_CATEGORY_ID);

			mav.addObject("coachSelection", coachSelection);
			mav.setViewName ("tutor/public/landingpages/music-tutor");
			return mav;
		}
		
		@RequestMapping(value = "/tutor/public/landing-music-tutor", method = RequestMethod.POST)
		public ModelAndView submitmusicTutorForm( 
				@ModelAttribute("coachSelection") CoachSelection coachSelection,
				BindingResult result, SessionStatus status, org.springframework.web.context.request.WebRequest webRequest, 
				Model model, HttpSession session) {
			
			try{
					ModelAndView mav = new ModelAndView ();
					setMavSession(mav, session, webRequest);
					
					return mav;
			} catch (Exception e) {
		        String msg = "The request failed. Error " + e;
		        log.error(msg, e);
				model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				return new ModelAndView("tutor/public/common/error/errorpage");
			}	
		}
		
		
		private void setMavSession(ModelAndView mav, HttpSession session, org.springframework.web.context.request.WebRequest webRequest) throws Exception{
			
			mav.setViewName ("redirect:coachprofileListAdvance/coachingCategory/" + webRequest.getParameter("coachingCategory") + 
					"/coachingSubcategory/" + webRequest.getParameter("coachingSubcategory") + 
					"/industryExperience/" + webRequest.getParameter("industryExperience") +
					"/gradelevel/" + webRequest.getParameter("gradelevel") + 
					"/maxrate/" + webRequest.getParameter("maxrate") +
					"/subject/"  + (webRequest.getParameter("subject")  == null || webRequest.getParameter("subject").trim().equals("")?Constants.DEFAULT_URL_STRING:webRequest.getParameter("subject") ) +
					"/companyExperience/"  + (webRequest.getParameter("companyExperience") == null || webRequest.getParameter("companyExperience").trim().equals("") ?Constants.DEFAULT_URL_STRING:webRequest.getParameter("companyExperience") )+ 
					"/coachFirstName/"  + (webRequest.getParameter("coachFirstName")  == null || webRequest.getParameter("coachFirstName").trim().equals("")?Constants.DEFAULT_URL_STRING:webRequest.getParameter("coachFirstName") ) + 
					"/coachLastName/"  + (webRequest.getParameter("coachLastName")  == null || webRequest.getParameter("coachLastName").trim().equals("")?Constants.DEFAULT_URL_STRING:webRequest.getParameter("coachLastName") ) + 
					"/city/"  + (webRequest.getParameter("city")  == null || webRequest.getParameter("city").trim().equals("")?Constants.DEFAULT_URL_STRING:webRequest.getParameter("city") ) + 
					"/state/"  + (webRequest.getParameter("state")  == null || webRequest.getParameter("state").trim().equals("")?Constants.DEFAULT_URL_STRING:webRequest.getParameter("state") ) + 
					"/pageNumber/1" 
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
			session.setAttribute("gradelevel", webRequest.getParameter("gradelevel"));
			session.setAttribute("maxrate", webRequest.getParameter("maxrate"));
			session.setAttribute("subject", webRequest.getParameter("subject"));
		}		
}
