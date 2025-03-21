package com.fervil.spring.careercoach.web.tutor.coachcitystate;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fervil.spring.careercoach.service.CityManager;
import com.fervil.spring.careercoach.util.Constants;

@Controller       
public class TutorcoachcitystateController {
	
    private static final Logger log = LoggerFactory.getLogger(TutorcoachcitystateController.class);
	
	@Autowired
	private SessionFactory sessionFactory;

	@Resource(name = "cityManager")
	private CityManager cityManager;   

	//Creating a brand new blog GET
	
	@RequestMapping(value = "/tutor/public/coachcitystate/coachtypeid/{coachtypeid}/coachtype/{coachtype}/statecode/{statecode}/state/{state}", method = RequestMethod.GET)
	public String getCitiesForState(
			@PathVariable("coachtypeid") int coachtypeid, 
			@PathVariable("coachtype") String coachtype, 
			@PathVariable("statecode") String statecode, 
			@PathVariable("state") String state, 
			ModelMap model, org.springframework.web.context.request.WebRequest webRequest,
			HttpSession session, HttpServletRequest request) {

		try{
			
			//Adding default entries for the cities page
			HashMap cityState1 = new HashMap();
			//cityState1.put("state", "All tutors");
			cityState1.put("city", "New search for tutors");

			HashMap cityState2 = new HashMap();
			//cityState2.put("state", state);
			cityState2.put("city", "All " + state + " tutors");
			
			List<HashMap> cities = cityManager.findCitiesWithCoachesForTutor(statecode, coachtypeid);
			cities.add(0, cityState1);
			cities.add(1, cityState2);
			
			log.info("Number of cities returned: " + cities.size());
			
			double itemsPerRow = Math.ceil(((double)cities.size() )/ 4);

			log.info("Items Per Row Number of cities returned: " + itemsPerRow);
			
			model.addAttribute("coachtypeid", coachtypeid);
			model.addAttribute("coachtype", coachtype);
			model.addAttribute("statecode", statecode);
			model.addAttribute("state", state);
			model.addAttribute("cities", cities);
			model.addAttribute("itemsperrow", itemsPerRow);

			return "tutor/public/landingpages/coachcitiesbycategorystate"; 
			
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "tutor/public/common/error/errorpage";
		}	
	} 

	
	@RequestMapping(value = "/tutor/public/coachcitystate/coachtypeid/{coachtypeid}/coachtype/{coachtype}", method = RequestMethod.GET)
	public String getStateByCoachType(@PathVariable("coachtypeid") int coachtypeid, 
			@PathVariable("coachtype") String coachtype, 
			ModelMap model, org.springframework.web.context.request.WebRequest webRequest,
			HttpSession session, HttpServletRequest request) {

		try{
			
			model.addAttribute("coachtypeid", coachtypeid);
			model.addAttribute("coachtype", coachtype);

			return "tutor/public/landingpages/coachcategorybystate"; 
			
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "tutor/public/common/error/errorpage";
		}	
	} 
	
	
	
}
