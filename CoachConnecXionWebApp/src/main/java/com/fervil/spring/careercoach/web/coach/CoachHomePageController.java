package com.fervil.spring.careercoach.web.coach;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fervil.spring.careercoach.model.domain.CoachSelection;
import com.fervil.spring.careercoach.model.domain.CoachingCategory;
import com.fervil.spring.careercoach.model.domain.RequestDetails;
import com.fervil.spring.careercoach.service.RequestDetailService;
import com.fervil.spring.careercoach.util.Constants;

import org.slf4j.Logger;

/**
 * Handles and retrieves person request
 */
@Controller
public class CoachHomePageController {
    private static final Logger log = LoggerFactory.getLogger(CoachHomePageController.class);
	
    //Method used to diplay the tutor home page 	
	@RequestMapping(value = "/coach/public", method = RequestMethod.GET)
	public ModelAndView fitnessCoachesreturn(Model model, org.springframework.web.context.request.WebRequest webRequest, HttpSession session) {

		log.debug("Received request to show tutor home page");
		
		
		ModelAndView mav = new ModelAndView ();
		
		mav.setViewName ("coach/users/coachhome");
		return mav;
	}
}
