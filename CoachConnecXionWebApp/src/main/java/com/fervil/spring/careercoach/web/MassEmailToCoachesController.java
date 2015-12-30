package com.fervil.spring.careercoach.web;

import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

import ua.com.bitlab.springsecuritydemo.services.SmtpMailService;

import com.fervil.spring.careercoach.model.domain.ContactCoach;
import com.fervil.spring.careercoach.model.domain.UserProfile;
import com.fervil.spring.careercoach.model.domain.Zipcode;
import com.fervil.spring.careercoach.model.domain.ZipcodeContainer;
import com.fervil.spring.careercoach.service.ContactCoachManager;
import com.fervil.spring.careercoach.service.UserProfileManager;
import com.fervil.spring.careercoach.service.validator.MassCoachEmailValidator;
import com.fervil.spring.careercoach.util.Constants;
import com.fervil.spring.careercoach.util.SystemUtil;

@Controller		  
public class MassEmailToCoachesController {
    private static final Logger log = LoggerFactory.getLogger(MassEmailToCoachesController.class);
    
	@Resource(name = "masscoachContactValidator")
	private MassCoachEmailValidator validator;
	
	@Resource(name = "contactCoachManager")
	private ContactCoachManager contactcoachManager;
	
	@Resource(name = "userProfileManager")
	private UserProfileManager userProfileManager;
	
    @Autowired
    private SmtpMailService mailService;
    
    //private static final String CONTACT_STUDENT_DEV_ENV = "href='http://localhost:8080/CoachConnecXionWebApp-3/coach/contact/contactstudent?ctt1=";
    //private static final String CONTACT_STUDENT_PROD_ENV = "href='http://www.coachconnecxion.com/coach/contact/contactstudent?ctt1=";
	

@RequestMapping(value = "/coach/contact/mass-email-to-coachs", method = RequestMethod.GET)
public String getMassEmailTocoachs(HttpServletRequest request, HttpServletResponse response, ModelMap model) {

	//Map<String, Object> myModel = new HashMap<String, Object>();
	try{	

		
		String availability = " Monday: 3PM - 9PM \r Tuesday: 3PM - 9PM \r Wednesday: 3PM - 9PM \r Thursday: 3PM - 9PM \r Friday: 3PM - 9PM \r Saturday: Not Available \r Sunday: Not Available \r";
		
		ContactCoach contactcoach = new ContactCoach();
		
		/*
		if (userProfile.getAvailability() == null || userProfile.getAvailability().trim().equalsIgnoreCase("") ) {
			userProfile.setAvailability(availability);
		}
		*/
		
		Long profileId = SystemUtil.getUserProfileId(request, userProfileManager);
		UserProfile userprfl = userProfileManager.findById(profileId.toString());	
		
		contactcoach.setStudentemail(userprfl.getEmail());
		contactcoach.setStudentfirstname(userprfl.getFirstname());
		contactcoach.setAvailability(availability);
		contactcoach.setOverview(" ");
		String now = (new java.util.Date()).toString();
		model.addAttribute("contactcoach", contactcoach);
		model.addAttribute("now", now);
		
		return "coach/contactcoach/MassEmailTocoachs"; 

/*		
		myModel.put("contactcoach", new Contactcoach());
        myModel.put("now", now);
		String navPage = "coach/contactcoach/MassEmailTocoachs";
        return new ModelAndView(navPage, "model", myModel);
*/
	} catch (Exception e) {
        String msg = "The request failed. Error " + e;
        log.error(msg, e);
		model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
        return "coach/public/common/error/errorpage";
	}	
}	

@RequestMapping(value = "/coach/contact/mass-email-to-coachs", method = RequestMethod.POST)
public String postEmailTocoach(HttpServletRequest request, HttpServletResponse response, Model model,
		@ModelAttribute("contactcoach") ContactCoach contactcoach, BindingResult result) {

		validator.validate(contactcoach, result);

		try {
		
	        if (result.hasErrors()) {
	    		model.addAttribute("contactcoach", contactcoach);
				return "coach/contactcoach/MassEmailTocoachs";
			} else {

				//long profileId = SystemUtil.getUserProfileId(request, userProfileManager);
				//contactcoach.setUserprofileid(profileId);
				//contactcoachManager.storeContactcoach(contactcoach);
				
				return "coach/contactcoach/MassEmailTocoachsConfirmation";
			}
		
		} catch (Exception e) {
            String msg = "Failed to create user. Error " + e;
            log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "coach/public/common/error/errorpage";
		}    
}	


@RequestMapping(value = "/coach/contact/mass-email-to-coachs-confirm", method = RequestMethod.GET)
public String getEmailTocoachconfirm(HttpServletRequest request, HttpServletResponse response, ModelMap model, 
		@ModelAttribute("contactcoach") ContactCoach contactcoach) {

	//Map<String, Object> myModel = new HashMap<String, Object>();
	try{	

		model.addAttribute("contactcoach", contactcoach);
		
		return "coach/contactcoach/MassEmailTocoachsConfirmation"; 

	} catch (Exception e) {
        String msg = "The request failed. Error " + e;
        log.error(msg, e);
		model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
        return "coach/public/common/error/errorpage";
	}	
}	

	@RequestMapping(value = "/coach/contact/mass-email-to-coachs-confirm", method = RequestMethod.POST)
	public String postEmailTocoachConfirm(HttpServletRequest request, HttpServletResponse response, Model model,
		@ModelAttribute("contactcoach") ContactCoach contactcoach, BindingResult result) {

		try {
				contactcoach.setCategory( new Integer(request.getParameter("hcategory")).intValue() );
				contactcoach.setCoachstylepreference(request.getParameter("hcoachstylepreference"));
				//contactcoach.setGradelevel(request.getParameter("hgradelevel"));
				contactcoach.setStartmonth(new Integer(request.getParameter("hstartmonth")).intValue());
				contactcoach.setStartday(new Integer(request.getParameter("hstartday")).intValue());
				contactcoach.setStartyear(new Integer(request.getParameter("hstartyear")).intValue());
				contactcoach.setDaysavailable(new Integer(request.getParameter("hdaysavailable")).intValue());
				contactcoach.setWeeksavailable(new Integer(request.getParameter("hweeksavailable")).intValue()); 
				contactcoach.setCity(request.getParameter("city").toString() ); 
				contactcoach.setState(request.getParameter("hstate").toString() ); 
				contactcoach.setStudentemail(request.getParameter("hstudentemail").toString() ); 
				contactcoach.setStudentfirstname(request.getParameter("hstudentfirstname").toString() ); 
			
				long profileId = SystemUtil.getUserProfileId(request, userProfileManager);
				contactcoach.setUserprofileid(profileId);
				contactcoachManager.storeContactCoach(contactcoach);
		
				///////////   SEND EMAILS TO coachS /////////////////////////////////////////////////////////////
				
				//Remove all numeric suffix after the course name.......
				/*
				contactcoach.setCourse(contactcoach.getCourse().replaceAll("1", "").trim() );
				contactcoach.setCourse(contactcoach.getCourse().replaceAll("2", "").trim() );
				contactcoach.setCourse(contactcoach.getCourse().replaceAll("3", "").trim() );
				contactcoach.setCourse(contactcoach.getCourse().replaceAll("4", "").trim() );
				contactcoach.setCourse(contactcoach.getCourse().replaceAll("5", "").trim() );
				contactcoach.setCourse(contactcoach.getCourse().replaceAll("6", "").trim() );
				contactcoach.setCourse(contactcoach.getCourse().replaceAll("7", "").trim() );
				contactcoach.setCourse(contactcoach.getCourse().replaceAll("8", "").trim() );
				contactcoach.setCourse(contactcoach.getCourse().replaceAll("9", "").trim() );
				*/
				
				List <HashMap> emailList = getEmailsOfcoachs(contactcoach, contactcoach.getZipcode() == null?"":contactcoach.getZipcode());
				
				sendEmailTocoachs(emailList, contactcoach);
				/////////////////////////////////////////////////////////////////////////////////////////////////
				
				model.addAttribute("successMessage", "Your request has been sent to our coachs.");
				return "coach/contactcoach/MassEmailTocoachsConfirmation";
		
		} catch (Exception e) {
            String msg = "Failed to create user. Error " + e;
            log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "coach/public/common/error/errorpage";
		}    
	}	
	
	private void sendEmailTocoachs(List <HashMap> userprofilesDataList, ContactCoach contactcoach){
		
    	//////////////////////////////////////////////////////////////////////////////////////////////////////////////
    	///                          TODO TODO TODO TODO TODO                                           //////////////
    	//@TODO  NOTE THAT WE ARE ONLY SENDING EMAILS TO THE FIRST 25 coachS FOUND IN THE DATABASE      //////////////
    	//WILL NEED TO CHANGE THIS CODE IN THE FUTURE SO WE DON'T SEND TO THE SAME 25 EVERY TIME        //////////////
    	//MAY HAVE TO IMPLEMENT SOME TYPE OF RANDOMIZER TO SELECT WHICH 25 USERS TO SEND MESSAGES TO    //////////////
    	//////////////////////////////////////////////////////////////////////////////////////////////////////////////
    	
		String emailbody = "";
		
	        for(HashMap userProfiles : userprofilesDataList) {
				emailbody = " Hi " + userProfiles.get("firstname")	+ ", <br><br>" +  
        		"Great news! We've identified a student looking for a coach to help with " + contactcoach.getCategory() + ". <br><br>" +
        		" You were selected because you expressed interest in coaching " + contactcoach.getCategory() +   " on CoachConnecXion.com <br><br>" +
				"<a style='font-size: 16px' " + Constants.CONTACT_STUDENT_PROD_ENV + userProfiles.get("user_profile_id") +
				"&jbbid=" +  contactcoach.getContactcoachid() + "'> " +
				"CLICK HERE FOR THE JOB POSTING </a> <br><br>" +
				" If the link above does not work, copy the following value to your browser: <br><br>" + 
				Constants.CONTACT_STUDENT_PROD_ENV.replace("href='", "") + userProfiles.get("user_profile_id") +
				"&jbbid=" +  contactcoach.getContactcoachid();

				//System.out.println(emailbody);
				mailService.sendMessage(userProfiles.get("email").toString(), "New coaching Request", emailbody);
	        }
	}
	
	private List <HashMap> getEmailsOfcoachs(ContactCoach contactcoach, String zipcode) throws Exception {
		int coachstyleonline = -1;
		int coachstyleinperson = -1;
		
		if (contactcoach.getCoachstylepreference().trim().equals("1" )) {
			coachstyleinperson = 1;
		} else if (contactcoach.getCoachstylepreference().trim().equals("2")) {
			coachstyleonline = 1;
		} 
		
		String zipcodes="";
		
		if(coachstyleinperson == 1){  //Only find zipcodes if its in person only
			if (!zipcode.trim().equals("")) zipcodes = getNearestZipCodes(zipcode);
		}
		
		if (zipcodes.trim().equals("")){
			//If we cannot find any coachs in your area, then goahead and display online coachs
			coachstyleinperson = -1;   //Negative 1 is the default value when nothing is selected................
		}
		
		List <HashMap> userprofilesDataList = userProfileManager.getUserProfilesOfCoachesToContact(contactcoach.getCategory(), coachstyleinperson, coachstyleonline,  zipcodes );

        return userprofilesDataList;
	}
	
	
	public String getNearestZipCodes(String zipcode){
		String zipList="";

        javax.net.ssl.HttpsURLConnection.setDefaultHostnameVerifier(
        	    new javax.net.ssl.HostnameVerifier(){
	        		Random rand = new Random();
	        		String webserviceHostName = "";
	        		
        	        public boolean verify(String hostname,
        	                javax.net.ssl.SSLSession sslSession) {
        	        	System.out.println("The Host Name is: " + hostname);
        	        	
        	        	webserviceHostName = "www.zipwise.com";
        	        	
        	            if (hostname.equals(webserviceHostName)) {
        	                return true;
        	            }
        	            return false;
        	        }
        });
		
		RestTemplate restTemplate = new RestTemplate();
		
		//String jsonUrl = "https://www.zipwise.com/webservices/radius.php?key=7wntjyde93vph7m3&zip=zzzipcodeee&radius=50&format=json";

		String jsonUrl = Constants.JSON_URL.replace("zzzipcodeee", zipcode);
		
		System.setProperty("jsse.enableSNIExtension", "false");
		
		List<Zipcode> zipdataList =  null;
		
		try{
	        zipdataList = restTemplate.getForObject(jsonUrl, ZipcodeContainer.class).getResults();
	        
	        int i=0;
	        for(Zipcode zip : zipdataList) {
	        	if (i>0) zipList = zipList + ","; 
	        	zipList = zipList + "'" + zip.getZip() + "'";

	        	i++;
	        }
	        
		} catch (HttpMessageNotReadableException e){
			//If nothing is returned from the webservice call, return an empty zipcode list.
			zipList = "";
		}

        
		//ZIPCODES BELOW FOR TESTING ONLY SINCE WE CANNOT GET TO THE ZIPCODE LIST LOCALLY
        //if (zipList.trim().equals("")){
        //	zipList = "'60563', '60519', '60555', '60567','60502', '60189', '60505','60565'";
        //}
		
        System.out.println(zipList);
        
        return zipList;
			
	}
	
	

}
