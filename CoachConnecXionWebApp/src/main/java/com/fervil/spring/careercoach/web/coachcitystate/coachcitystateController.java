package com.fervil.spring.careercoach.web.coachcitystate;

import java.text.DateFormat;
import java.text.DateFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import com.fervil.spring.careercoach.model.domain.BlogComment;
import com.fervil.spring.careercoach.model.domain.BlogPost;
import com.fervil.spring.careercoach.model.domain.CoachingCategory;
import com.fervil.spring.careercoach.model.domain.UserProfile;
import com.fervil.spring.careercoach.service.BlogCommentManager;
import com.fervil.spring.careercoach.service.BlogManager;
import com.fervil.spring.careercoach.service.CityManager;
import com.fervil.spring.careercoach.service.CoachingCategoryManager;
import com.fervil.spring.careercoach.service.CreateBlogPostValidator;
import com.fervil.spring.careercoach.service.UserProfileManager;
import com.fervil.spring.careercoach.util.Constants;
import com.fervil.spring.careercoach.util.SystemUtil;

@Controller       
public class coachcitystateController {
	
    private static final Logger log = LoggerFactory.getLogger(coachcitystateController.class);
	
	@Autowired
	private SessionFactory sessionFactory;

	@Resource(name = "cityManager")
	private CityManager cityManager;   

	//Creating a brand new blog GET
	
	@RequestMapping(value = "/public/coachcitystate/coachtypeid/{coachtypeid}/coachtype/{coachtype}/statecode/{statecode}/state/{state}", method = RequestMethod.GET)
	public String getCitiesForState(
			@PathVariable("coachtypeid") int coachtypeid, 
			@PathVariable("coachtype") String coachtype, 
			@PathVariable("statecode") String statecode, 
			@PathVariable("state") String state, 
			ModelMap model, org.springframework.web.context.request.WebRequest webRequest,
			HttpSession session, HttpServletRequest request) {

		try{
			
			List<HashMap> cities = cityManager.findCitiesWithCoaches(statecode, coachtypeid);

			log.info("Number of cities returned: " + cities.size());
			
			double itemsPerRow = Math.ceil(((double)cities.size())/ 4);

			log.info("Items Per Row Number of cities returned: " + itemsPerRow);
			
			model.addAttribute("coachtypeid", coachtypeid);
			model.addAttribute("coachtype", coachtype);
			model.addAttribute("statecode", statecode);
			model.addAttribute("state", state);
			model.addAttribute("cities", cities);
			model.addAttribute("itemsperrow", itemsPerRow);

			return "public/landingpages/coachcitiesbycategorystate"; 
			
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
		}	
	} 

	
	@RequestMapping(value = "/public/coachcitystate/coachtypeid/{coachtypeid}/coachtype/{coachtype}", method = RequestMethod.GET)
	public String getStateByCoachType(@PathVariable("coachtypeid") int coachtypeid, 
			@PathVariable("coachtype") String coachtype, 
			ModelMap model, org.springframework.web.context.request.WebRequest webRequest,
			HttpSession session, HttpServletRequest request) {

		try{
			
			model.addAttribute("coachtypeid", coachtypeid);
			model.addAttribute("coachtype", coachtype);

			return "public/landingpages/coachcategorybystate"; 
			
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
		}	
	} 
	
	
	
}
