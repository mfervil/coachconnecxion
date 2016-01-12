package com.fervil.spring.careercoach.web.tutor;

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

import com.fervil.spring.careercoach.model.domain.Contacttutor;
import com.fervil.spring.careercoach.model.domain.UserProfile;
import com.fervil.spring.careercoach.model.domain.Zipcode;
import com.fervil.spring.careercoach.model.domain.ZipcodeContainer;
import com.fervil.spring.careercoach.service.ContactTutorManager;
import com.fervil.spring.careercoach.service.UserProfileManager;
import com.fervil.spring.careercoach.service.validator.TutorMassTutorEmailValidator;
import com.fervil.spring.careercoach.util.Constants;
import com.fervil.spring.careercoach.util.SystemUtil;

@Controller		  
public class TutorMassEmailToTutorController {
    private static final Logger log = LoggerFactory.getLogger(TutorMassEmailToTutorController.class);
    
	@Resource(name = "massTutorContactValidator")
	private TutorMassTutorEmailValidator validator;
	
	@Resource(name = "contactTutorManager")
	private ContactTutorManager contactTutorManager;
	
	@Resource(name = "userProfileManager")
	private UserProfileManager userProfileManager;
	
    @Autowired
    private SmtpMailService mailService;
    
    //private static final String CONTACT_STUDENT_DEV_ENV = "href='http://localhost:8080/CoachConnecXionWebApp-3/tutor/contact/contactstudent?ctt1=";
    //private static final String CONTACT_STUDENT_PROD_ENV = "href='http://www.coachconnecxion.com/tutor/contact/contactstudent?ctt1=";
	

@RequestMapping(value = "/tutor/contact/mass-email-to-tutors", method = RequestMethod.GET)
public String getMassEmailToTutors(HttpServletRequest request, HttpServletResponse response, ModelMap model) {

	//Map<String, Object> myModel = new HashMap<String, Object>();
	try{	

		
		String availability = " Monday: 3PM - 9PM \r Tuesday: 3PM - 9PM \r Wednesday: 3PM - 9PM \r Thursday: 3PM - 9PM \r Friday: 3PM - 9PM \r Saturday: Not Available \r Sunday: Not Available \r";
		
		Contacttutor contacttutor = new Contacttutor();
		
		/*
		if (userProfile.getAvailability() == null || userProfile.getAvailability().trim().equalsIgnoreCase("") ) {
			userProfile.setAvailability(availability);
		}
		*/
		
		Long profileId = SystemUtil.getUserProfileId(request, userProfileManager);
		UserProfile userprfl = userProfileManager.findById(profileId.toString());	
		
		contacttutor.setStudentemail(userprfl.getEmail());
		contacttutor.setStudentfirstname(userprfl.getFirstname());
		contacttutor.setAvailability(availability);
		contacttutor.setOverview(" ");
		String now = (new java.util.Date()).toString();
		model.addAttribute("contacttutor", contacttutor);
		model.addAttribute("now", now);
		
		return "tutor/contacttutor/MassEmailToTutors"; 

/*		
		myModel.put("contacttutor", new Contacttutor());
        myModel.put("now", now);
		String navPage = "tutor/contacttutor/MassEmailToTutors";
        return new ModelAndView(navPage, "model", myModel);
*/
	} catch (Exception e) {
        String msg = "The request failed. Error " + e;
        log.error(msg, e);
		model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
        return "tutor/public/common/error/errorpage";
	}	
}	

@RequestMapping(value = "/tutor/contact/mass-email-to-tutors", method = RequestMethod.POST)
public String postEmailToTutor(HttpServletRequest request, HttpServletResponse response, Model model,
		@ModelAttribute("contacttutor") Contacttutor contactTutor, BindingResult result) {

		validator.validate(contactTutor, result);

		try {
		
	        if (result.hasErrors()) {
	    		model.addAttribute("contacttutor", contactTutor);
				return "tutor/contacttutor/MassEmailToTutors";
			} else {

				//long profileId = SystemUtil.getUserProfileId(request, userProfileManager);
				//contactTutor.setUserprofileid(profileId);
				//contactTutorManager.storeContactTutor(contactTutor);
				
				return "tutor/contacttutor/MassEmailToTutorsConfirmation";
			}
		
		} catch (Exception e) {
            String msg = "Failed to create user. Error " + e;
            log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "tutor/public/common/error/errorpage";
		}    
}	


@RequestMapping(value = "/tutor/contact/mass-email-to-tutors-confirm", method = RequestMethod.GET)
public String getEmailToTutorconfirm(HttpServletRequest request, HttpServletResponse response, ModelMap model, 
		@ModelAttribute("contacttutor") Contacttutor contactTutor) {

	//Map<String, Object> myModel = new HashMap<String, Object>();
	try{	

		model.addAttribute("contacttutor", contactTutor);
		
		return "tutor/contacttutor/MassEmailToTutorsConfirmation"; 

	} catch (Exception e) {
        String msg = "The request failed. Error " + e;
        log.error(msg, e);
		model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
        return "tutor/public/common/error/errorpage";
	}	
}	

	@RequestMapping(value = "/tutor/contact/mass-email-to-tutors-confirm", method = RequestMethod.POST)
	public String postEmailToTutorConfirm(HttpServletRequest request, HttpServletResponse response, Model model,
		@ModelAttribute("contacttutor") Contacttutor contactTutor, BindingResult result) {

		try {
				contactTutor.setCategory( new Integer(request.getParameter("hcategory")).intValue() );
				contactTutor.setCoachstylepreference(request.getParameter("hcoachstylepreference"));
				contactTutor.setGradelevel(request.getParameter("hgradelevel"));
				contactTutor.setStartmonth(new Integer(request.getParameter("hstartmonth")).intValue());
				contactTutor.setStartday(new Integer(request.getParameter("hstartday")).intValue());
				contactTutor.setStartyear(new Integer(request.getParameter("hstartyear")).intValue());
				contactTutor.setDaysavailable(new Integer(request.getParameter("hdaysavailable")).intValue());
				contactTutor.setWeeksavailable(new Integer(request.getParameter("hweeksavailable")).intValue()); 
				contactTutor.setCity(request.getParameter("city").toString() ); 
				contactTutor.setState(request.getParameter("hstate").toString() ); 
				contactTutor.setStudentemail(request.getParameter("hstudentemail").toString() ); 
				contactTutor.setStudentfirstname(request.getParameter("hstudentfirstname").toString() ); 
			
				long profileId = SystemUtil.getUserProfileId(request, userProfileManager);
				contactTutor.setUserprofileid(profileId);
				contactTutorManager.storeContactTutor(contactTutor);
		
				///////////   SEND EMAILS TO TUTORS /////////////////////////////////////////////////////////////
				
				//Remove all numeric suffix after the course name.......
				contactTutor.setCourse(contactTutor.getCourse().replaceAll("1", "").trim() );
				contactTutor.setCourse(contactTutor.getCourse().replaceAll("2", "").trim() );
				contactTutor.setCourse(contactTutor.getCourse().replaceAll("3", "").trim() );
				contactTutor.setCourse(contactTutor.getCourse().replaceAll("4", "").trim() );
				contactTutor.setCourse(contactTutor.getCourse().replaceAll("5", "").trim() );
				contactTutor.setCourse(contactTutor.getCourse().replaceAll("6", "").trim() );
				contactTutor.setCourse(contactTutor.getCourse().replaceAll("7", "").trim() );
				contactTutor.setCourse(contactTutor.getCourse().replaceAll("8", "").trim() );
				contactTutor.setCourse(contactTutor.getCourse().replaceAll("9", "").trim() );
				
				List <HashMap> emailList = getEmailsOfTutors(contactTutor, contactTutor.getZipcode() == null?"":contactTutor.getZipcode());
				
				sendEmailToTutors(emailList, contactTutor);
				/////////////////////////////////////////////////////////////////////////////////////////////////
				
				model.addAttribute("successMessage", "Your request has been sent to our tutors.");
				return "tutor/contacttutor/MassEmailToTutorsConfirmation";
		
		} catch (Exception e) {
            String msg = "Failed to create user. Error " + e;
            log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "tutor/public/common/error/errorpage";
		}    
	}	
	
	private void sendEmailToTutors(List <HashMap> userprofilesDataList, Contacttutor contactTutor){
		
    	//////////////////////////////////////////////////////////////////////////////////////////////////////////////
    	///                          TODO TODO TODO TODO TODO                                           //////////////
    	//@TODO  NOTE THAT WE ARE ONLY SENDING EMAILS TO THE FIRST 25 TUTORS FOUND IN THE DATABASE      //////////////
    	//WILL NEED TO CHANGE THIS CODE IN THE FUTURE SO WE DON'T SEND TO THE SAME 25 EVERY TIME        //////////////
    	//MAY HAVE TO IMPLEMENT SOME TYPE OF RANDOMIZER TO SELECT WHICH 25 USERS TO SEND MESSAGES TO    //////////////
    	//////////////////////////////////////////////////////////////////////////////////////////////////////////////
    	
		String emailbody = "";
		
	        for(HashMap userProfiles : userprofilesDataList) {
				emailbody = " Hi " + userProfiles.get("firstname")	+ ", <br><br>" +  
        		"Great news! We've identified a student looking looking for a tutor to help with " + contactTutor.getCourse() + ". <br><br>" +
        		" You were selected because you expressed interest in tutoring " + contactTutor.getCourse() +   " on CoachConnecXion.com <br><br>" +
				"<a style='font-size: 16px' " + Constants.CONTACT_STUDENT_PROD_ENV + userProfiles.get("user_profile_id") +
				"&jbbid=" +  contactTutor.getContacttutorid() + "'> " +
				"CLICK HERE FOR THE JOB POSTING </a> <br><br>" +
				" If the link above does not work, copy the following value to your browser: <br><br>" + 
				Constants.CONTACT_STUDENT_PROD_ENV.replace("href='", "") + userProfiles.get("user_profile_id") +
				"&jbbid=" +  contactTutor.getContacttutorid();

				//System.out.println(emailbody);
				mailService.sendMessage(userProfiles.get("email").toString(), "New Tutoring Request", emailbody);
	        }
	}
	
	private List <HashMap> getEmailsOfTutors(Contacttutor contactTutor, String zipcode) throws Exception {
		int coachstyleonline = -1;
		int coachstyleinperson = -1;
		
		if (contactTutor.getCoachstylepreference().trim().equals("1" )) {
			coachstyleinperson = 1;
		} else if (contactTutor.getCoachstylepreference().trim().equals("2")) {
			coachstyleonline = 1;
		} 
		
		String zipcodes="";
		
		if(coachstyleinperson == 1){  //Only find zipcodes if its in person only
			if (!zipcode.trim().equals("")) zipcodes = getNearestZipCodes(zipcode);
		}
		
		if (zipcodes.trim().equals("")){
			//If we cannot find any tutors in your area, then goahead and display online tutors
			coachstyleinperson = -1;   //Negative 1 is the default value when nothing is selected................
		}
		
		List <HashMap> userprofilesDataList = userProfileManager.getUserProfilesOfTutors(contactTutor.getCategory(), contactTutor.getCourse(), 
				coachstyleinperson, coachstyleonline,  zipcodes );

		/*
		ArrayList<String> userProfilesList= new ArrayList<String>();
		
        int i=0;
        for(HashMap userProfiles : userprofilesDataList) {
        	userProfilesList.add(userProfiles.get("email").toString() );
        	//if (i>0) userProfilesList = userProfilesList + ","; 
        	//userProfilesList = userProfilesList + "'" + userProfiles.get("email")  + "'";
        	//i++;
        }
        */
		
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
