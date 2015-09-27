package com.fervil.spring.careercoach.web.tutor;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.fervil.spring.careercoach.model.domain.CoachingRequest;
import com.fervil.spring.careercoach.model.domain.UserProfile;
import com.fervil.spring.careercoach.model.domain.Zipcode;
import com.fervil.spring.careercoach.model.domain.ZipcodeContainer;
import com.fervil.spring.careercoach.service.JobRatingService;
import com.fervil.spring.careercoach.service.SelectedCoachesValidator;
import com.fervil.spring.careercoach.service.UserProfileManager;
import com.fervil.spring.careercoach.util.Constants;
import com.google.gson.Gson;

import org.springframework.web.client.RestTemplate;

//@RequestMapping("/public/userprofileList")
@Controller
public class TutorUserProfileListController  {
    private static final Logger log = LoggerFactory.getLogger(TutorUserProfileListController.class);
    
    private static final int pageSize = 25;
	
	private UserProfileManager userProfileManager;
	private SelectedCoachesValidator validator;
	
	@Autowired
	public TutorUserProfileListController(UserProfileManager userProfileManager,
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
	//@RequestMapping(method = RequestMethod.GET) 
	@RequestMapping(value = "/tutor/public/userprofileList", method = RequestMethod.GET)
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
			int pageNumber = webRequest.getParameter("pageNumber") == null?1:Integer.valueOf(webRequest.getParameter("pageNumber"));
			
			
			//int pageNumber = Integer.valueOf(webRequest.getParameter("pagenumber"));
			//int pageNumber = 2;
			//int pageSize = 10;			
			
            //criteria.setFirstResult((pageNumber - 1) * pageSize);
            //criteria.setMaxResults(pageSize);			
			
			
			List<HashMap> userProfiles = userProfileManager.getUserProfiles(
					coachingCategory, coachingSubcategory, industryExperience,companyExperience, coachFirstName, coachLastName, city, state, pageSize, pageNumber);

			int userprofilecount = userProfileManager.findFilteredUserProfilesCount(
					coachingCategory, coachingSubcategory, industryExperience,companyExperience, coachFirstName, coachLastName, city, state, pageSize, pageNumber);
			
			
			ModelAndView mav = new ModelAndView ();
			mav.setViewName ("tutor/public/userprofile/userprofileList");
			mav.addObject("userProfiles", userProfiles);
			
			CoachingRequest coachingRequest = new CoachingRequest();
			mav.addObject("coachingRequest", coachingRequest);
			
			// float averageRate1 = jobRatingService.getProfileRating(123);
			// model.addAttribute("averageRate1", averageRate1);
			
			long totalNumPagestoDisplay =  ((Double)Math.ceil(new Double(userprofilecount)/new Double(pageSize))).longValue() ;
			
			mav.addObject("coachingCategory", webRequest.getParameter("coachingCategory"));
			mav.addObject("coachingSubcategory", webRequest.getParameter("coachingSubcategory"));
			mav.addObject("industryExperience", webRequest.getParameter("industryExperience"));
			mav.addObject("companyExperience", webRequest.getParameter("companyExperience"));
			mav.addObject("coachFirstName", webRequest.getParameter("coachFirstName"));
			mav.addObject("coachLastName", webRequest.getParameter("coachLastName"));
			mav.addObject("city", webRequest.getParameter("city"));
			mav.addObject("state", webRequest.getParameter("state"));
			mav.addObject("pageNumber", pageNumber);
			mav.addObject("userprofilecount", userprofilecount);
			mav.addObject("pagesize", pageSize);
			mav.addObject("totalpages", totalNumPagestoDisplay);
			
			mav.addObject("coachingCategory", webRequest.getParameter("coachingCategory"));
	
			log.info("Number of coaches returned to UserProfileListController: " + userProfiles.size());
			
			return mav;
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
	        model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
	        return new ModelAndView("tutor/public/common/error/errorpage");
			
		}	
	}

	//List coaches for advanced searches where all criteria may be passed, and some may be left blank..... 
	@RequestMapping(value = "/tutor/public/coachprofileListAdvance/coachingCategory/{coachingCategory}/coachingSubcategory/{coachingSubcategory}/industryExperience/{industryExperience}/companyExperience/{companyExperience}/gradelevel/{gradelevel}/maxrate/{maxrate}/subject/{subject}/coachFirstName/{coachFirstName}/coachLastName/{coachLastName}/city/{city}/state/{state}/pageNumber/{pageNumber}/zipcode/{zipcode}/coachstyleinperson/{coachstyleinperson}/coachstyleonline/{coachstyleonline}", method = RequestMethod.GET)
	public ModelAndView listCoachProfiles(ModelMap model, org.springframework.web.context.request.WebRequest webRequest, 
				@PathVariable("coachingCategory") int coachingCategory, 
				@PathVariable("coachingSubcategory") int coachingSubcategory, 
				@PathVariable("industryExperience") int industryExperience, 
				@PathVariable("gradelevel") String gradelevel, 
				@PathVariable("maxrate") int maxrate, 
				@PathVariable("subject") String subject, 
				@PathVariable("companyExperience") String companyExperience, 
				@PathVariable("coachFirstName") String coachFirstName, 
				@PathVariable("coachLastName") String coachLastName, 
				@PathVariable("city") String city, 
				@PathVariable("state") String state, 
				@PathVariable("pageNumber") int pageNumber, 
				@PathVariable("zipcode") String zipcode, 
				@PathVariable("coachstyleinperson") String coachstyleinperson, 
				@PathVariable("coachstyleonline") String coachstyleonline 
			) {

	    	Map<String, Object> myModel = new HashMap<String, Object>();

		try{

			String tmpzip = (zipcode == null || zipcode.equalsIgnoreCase(Constants.DEFAULT_URL_STRING))?"":zipcode;
			
			String zipcodes = "";
			if (!tmpzip.equalsIgnoreCase("")) {
				zipcodes= getNearestZipCodes(tmpzip); };

			String tmpcompanyExperience = (companyExperience == null || companyExperience.equalsIgnoreCase(Constants.DEFAULT_URL_STRING))?"":companyExperience;
			String tmpcoachFirstName = (coachFirstName == null || coachFirstName.equalsIgnoreCase(Constants.DEFAULT_URL_STRING))?"":coachFirstName;
			String tmpcoachLastName = (coachLastName == null || coachLastName.equalsIgnoreCase(Constants.DEFAULT_URL_STRING))?"":coachLastName;
			String tmpcity = (city == null || city.equalsIgnoreCase(Constants.DEFAULT_URL_STRING))?"":city;
			String tmpstate = (state == null || state.equalsIgnoreCase(Constants.DEFAULT_URL_STRING))?"":state;
			String tmpcoachstyleinperson = (coachstyleinperson == null || coachstyleinperson.equalsIgnoreCase(Constants.DEFAULT_URL_STRING))?"":"1";
			String tmpcoachstyleonline = (coachstyleonline == null || coachstyleonline.equalsIgnoreCase(Constants.DEFAULT_URL_STRING))?"":"1";
			
			pageNumber = (pageNumber < 1 )?1:pageNumber;
			
			List<HashMap> userProfiles = userProfileManager.getUserProfilesForTutors(
					coachingCategory, coachingSubcategory, industryExperience,tmpcompanyExperience, 
					tmpcoachFirstName, tmpcoachLastName, tmpcity, tmpstate, pageSize, pageNumber, 
					gradelevel, maxrate, subject, zipcodes, tmpcoachstyleinperson, tmpcoachstyleonline);

			int userprofilecount = userProfileManager.findFilteredUserProfilesCount(
					coachingCategory, coachingSubcategory, industryExperience,tmpcompanyExperience, 
					tmpcoachFirstName, tmpcoachLastName, tmpcity, tmpstate, pageSize, pageNumber);
			
			ModelAndView mav = new ModelAndView ();
			mav.setViewName ("tutor/public/userprofile/userprofileList");
			mav.addObject("userProfiles", userProfiles);
			
			CoachingRequest coachingRequest = new CoachingRequest();
			mav.addObject("coachingRequest", coachingRequest);
			
			long totalNumPagestoDisplay =  ((Double)Math.ceil(new Double(userprofilecount)/new Double(pageSize))).longValue() ;
			
			mav.addObject("coachingCategory", coachingCategory);
			mav.addObject("coachingSubcategory", coachingSubcategory);
			mav.addObject("industryExperience", industryExperience);
			mav.addObject("companyExperience", companyExperience);
			mav.addObject("coachFirstName", coachFirstName);
			mav.addObject("coachLastName", coachLastName);
			mav.addObject("city", city);
			mav.addObject("state", state);
			mav.addObject("pageNumber", pageNumber);
			mav.addObject("userprofilecount", userprofilecount);
			mav.addObject("pagesize", pageSize);
			mav.addObject("totalpages", totalNumPagestoDisplay);
			mav.addObject("coachstyleinperson", coachstyleinperson);
			mav.addObject("coachstyleonline", coachstyleonline);
			
			log.info("Number of tutors returned to UserProfileListController: " + userProfiles.size());
			
			return mav;
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
	        model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
	        return new ModelAndView("tutor/public/common/error/errorpage");
		}	
	}
	
	public String getNearestZipCodes(String zipcode){
		String zipList="";
		
		/*
		RestTemplate restTemplate = new RestTemplate();
		String jsonUrl = "https://www.zipwise.com/webservices/radius.php?key=ut5elgroqwapjwq6&zip=" + zipcode + "&radius=5&format=json";

        ResponseEntity<Zipcode[]> entity = restTemplate.getForEntity(jsonUrl, Zipcode[].class);
        List<Zipcode> zipdataList = Arrays.asList(entity.getBody());

        int i=0;
        for(Zipcode zip : zipdataList) {
        	if (i>0) zipList = zipList + ","; 
        	zipList = "'" + zip.getZip();

        	System.out.println(i);
        }
        */
		
		//List<LinkedHashMap> emps = restTemplate.getForObject("https://www.zipwise.com/webservices/radius.php?key=ut5elgroqwapjwq6&zip=90210&radius=5&format=json", List.class);
        //System.out.println(emps.size());
        /*
        int i=0;
        for(LinkedHashMap map : emps){
        	if (i>0) zipList = zipList + ","; 
        	zipList = "'" + map.get("zip").toString() + "'";
            System.out.println("ID="+map.get("id")+",Name="+map.get("name")+",CreatedDate="+map.get("createdDate"));
            i++;
        }
        */
		
		zipList = "'60563','60555','60540','60567','60502','60532','60566','60189','60599'";
        System.out.println(" The zipcode list is: " + zipList);
        return zipList;
        
        /*
		String response ="";
		Gson g = new Gson();
		ZipcodeContainer vc = g.fromJson(response, ZipcodeContainer.class);	
								
		HashMap<String, String> hm = new HashMap<String,String>();
		for(Zipcode v: vc.zipcodes){
		  hm.put(v.getId(), v.getName());  
		}		
		*/
		
		
		//https://www.zipwise.com/webservices/radius.php?key=YOUR_API_KEY&zip=90210&radius=2&format=json
/*			
			URL url = new URL("https://www.zipwise.com/webservices/radius.php?key=YOUR_API_KEY&zip=90210&radius=2&format=json");
			BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream()));

			JSONParser parser=new JSONParser();
			Object object = parser.parse(in);

			JSONArray array = (JSONArray) object;        
			JSONObject object2 = (JSONObject)array.get(0);
			System.out.println(object2.get("hello")); 			
*/			
			
	}
	
	//@RequestMapping(value = "/public/userprofileList", method = RequestMethod.GET)
	//Searches for coaches where category type, city and state are always passed.
	@RequestMapping(value = "/tutor/public/find-a-coach-by-city-state/coachtypeid/{coachtypeid}/coachtype/{coachtype}/statecode/{statecode}/state/{state}/cityname/{cityname}/pagenumber/{pagenumber}", method = RequestMethod.GET)
	public ModelAndView listUserProfilesbyCategoryCityState(ModelMap model, org.springframework.web.context.request.WebRequest webRequest,
				@PathVariable("coachtypeid") int coachtypeid, 
				@PathVariable("coachtype") String coachtype, 
				@PathVariable("statecode") String statecode, 
				@PathVariable("state") String state, 
				@PathVariable("cityname") String cityname, 
				@PathVariable("pagenumber") int pagenumber 
			) {
	    Map<String, Object> myModel = new HashMap<String, Object>();

		try{
					
			//int pageNumber = webRequest.getParameter("pageNumber") == null?1:Integer.valueOf(webRequest.getParameter("pageNumber"));
			
			String tmpcityname = (cityname == null || cityname.trim().equals("") || cityname.equals(Constants.DEFAULT_URL_STRING)?"":cityname);
			List<HashMap> userProfiles = userProfileManager.getUserProfiles(coachtypeid, 0, 0,"", "","", tmpcityname, statecode, pageSize, pagenumber );
			int userprofilecount = userProfileManager.findFilteredUserProfilesCount(coachtypeid, 0, 0,"", "","", tmpcityname, statecode, pageSize, pagenumber);
			
			ModelAndView mav = new ModelAndView ();
			mav.setViewName ("tutor/public/userprofile/userprofileList");
			mav.addObject("userProfiles", userProfiles);
			
			CoachingRequest coachingRequest = new CoachingRequest();
			mav.addObject("coachingRequest", coachingRequest);
			
			long totalNumPagestoDisplay =  ((Double)Math.ceil(new Double(userprofilecount)/new Double(pageSize))).longValue() ;
			
			mav.addObject("coachingCategory", coachtypeid);
			mav.addObject("coachingSubcategory", -1);
			mav.addObject("industryExperience", -1);
			mav.addObject("companyExperience", Constants.DEFAULT_URL_STRING);
			mav.addObject("coachFirstName", Constants.DEFAULT_URL_STRING);
			mav.addObject("coachLastName", Constants.DEFAULT_URL_STRING);
			mav.addObject("city", cityname);
			mav.addObject("state", statecode);
			mav.addObject("statename", state);
			mav.addObject("pageNumber", pagenumber);
			mav.addObject("userprofilecount", userprofilecount);
			mav.addObject("pagesize", pageSize);
			mav.addObject("totalpages", totalNumPagestoDisplay);
			
			log.info("Number of coaches returned to UserProfileListController: " + userProfiles.size());
			
			return mav;
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
	        model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
	        return new ModelAndView("tutor/public/common/error/errorpage");
			
		}	
	}
	
	
	@RequestMapping(value = "/tutor/public/userprofileList", method = RequestMethod.POST)
	public ModelAndView submitForm(
			@ModelAttribute("coachingRequest") CoachingRequest coachingRequest,
			BindingResult result, SessionStatus status, Model model) {

	    Map<String, Object> myModel = new HashMap<String, Object>();
		
		try{
			validator.validate(coachingRequest, result);
	
	        if (result.hasErrors()) {
	    		List<UserProfile> userProfiles = userProfileManager.getUserProfiles();
	    		ModelAndView mav = new ModelAndView ();
	    		mav.setViewName ("tutor/public/userprofile/userprofileList");
	    		mav.addObject("userProfiles", userProfiles);
	    		
	    		//CoachingRequest coachingRequest = new CoachingRequest();
	    		mav.addObject("coachingRequest", coachingRequest);
				return mav;
	        	
				//initial return "userprofileList";
			} else {
	    		//List<UserProfile> userProfiles = userProfileManager.getUserProfiles();
	    		ModelAndView mav = new ModelAndView ();
	    		mav.setViewName ("tutor/userprofile/createcoachingrequest");
	    		
	            String selectedCoachList = coachingRequest.getSelectedCoaches();
	
	    		mav.addObject("coachesToContact", " The selected list" + selectedCoachList);
	    		return mav;
			}
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
	        model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
	        return new ModelAndView("tutor/public/common/error/errorpage");
			
		}	
	}	
}
