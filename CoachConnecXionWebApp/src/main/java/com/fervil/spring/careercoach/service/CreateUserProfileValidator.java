package com.fervil.spring.careercoach.service;
		
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.fervil.spring.careercoach.model.domain.UserProfile;

@Service("userProfileValidator")
@Component
public class CreateUserProfileValidator implements Validator {
    private static final Logger logger = LoggerFactory.getLogger(CreateUserProfileValidator.class);
	
    public boolean supports(Class clazz) {
        return UserProfile.class.isAssignableFrom(clazz);
    }

    public void validate(Object target, Errors errors) {
    	String fieldisRequired = " Required field";
    	
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstname",
                "required.firstname", fieldisRequired);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastname",
                "required.lastname", fieldisRequired);
    	
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "displayName",
                "required.displayName", fieldisRequired);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email",
                "required.email", fieldisRequired);
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phone",
                "required.phone", fieldisRequired);
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "overview",
                "required.overview", fieldisRequired);
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "serviceDescription",
                "required.serviceDescription", fieldisRequired);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "skillsExpertise",
                "required.skillsExpertise", fieldisRequired);

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "address",
                "required.address", fieldisRequired);

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "city",
                "required.city", fieldisRequired);

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "state",
                "required.state", fieldisRequired);

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "zipcode",
                "required.zipcode", fieldisRequired);

        UserProfile userProfile = (UserProfile) target;

        if (userProfile.getCoachingcategory1() <= 0  && userProfile.getCoachingcategory2() <= 0 && userProfile.getCoachingcategory3() <= 0) {
			errors.rejectValue("coachingcategory1", "invalid.coachingcategory1", " You must select at least 1 subject");
        }
    }    
    
    public void validateTutor(Object target, Errors errors) {
        	String fieldisRequired = " Required field";
        	
            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstname",
                    "required.firstname", fieldisRequired);
            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastname",
                    "required.lastname", fieldisRequired);
        	
            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "displayName",
                    "required.displayName", fieldisRequired);
            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email",
                    "required.email", fieldisRequired);
            
            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phone",
                    "required.phone", fieldisRequired);
            
            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "overview",
                    "required.overview", fieldisRequired);

            //ValidationUtils.rejectIfEmptyOrWhitespace(errors, "availability",
            //        "required.availability", fieldisRequired);
            
            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "serviceDescription",
                    "required.serviceDescription", fieldisRequired);
            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "skillsExpertise",
                    "required.skillsExpertise", fieldisRequired);

            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "address",
                    "required.address", fieldisRequired);

            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "city",
                    "required.city", fieldisRequired);

            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "state",
                    "required.state", fieldisRequired);

            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "zipcode",
                    "required.zipcode", fieldisRequired);
            
            UserProfile userProfile = (UserProfile) target;

            if (userProfile.getCoachingcategory1() <= 0  && userProfile.getCoachingcategory2() <= 0 && userProfile.getCoachingcategory3() <= 0) {
    			errors.rejectValue("coachingcategory1", "invalid.coachingcategory1", " You must select at least 1 category");
            }
            
            if (userProfile.getDobday() <= 0  || userProfile.getDobmonth() <= 0 || userProfile.getDobyear() <= 0) {
    			errors.rejectValue("dobmonth", "invalid.dobmonth", " You must select the month, day and year");
            }

            if (userProfile.getGender().equals("-1") ) {
    			errors.rejectValue("gender", "invalid.gender", " You must select the gender");
            }
            
            if (userProfile.getExperience() <= 0 ) {
    			errors.rejectValue("experience", "invalid.experience", " You must select your experience level");
            }

            if (userProfile.getCoachstyleinperson() == null && userProfile.getCoachstyleonline()==null  ) {
    			errors.rejectValue("coachstyleinperson", "invalid.coachstyleinperson", " You must select your coaching preference(s)");
            }

            if (userProfile.getHourlyrate() <= 0 ) {
    			errors.rejectValue("hourlyrate", "invalid.hourlyrate", " You must select your hourly rate");
            }

            if (userProfile.getLvlcollege()==null && userProfile.getLvlelementary()==null && userProfile.getLvlhighschool()==null
            	&& userProfile.getLvljuniorhigh()==null	&& userProfile.getLvlleisure()==null && userProfile.getLvlprofessional()==null ) {
    			errors.rejectValue("lvlelementary", "invalid.lvlelementary", " You must select the grade levels you want to teach");
            }
            
            if (userProfile.getSkillsExpertise().replace("&nbsp;", "").trim().equals("") ) {
    			errors.rejectValue("skillsExpertise", "invalid.skillsExpertise", " You must add the name of each subject you wish to teach");
            }

            
    }
}
