package com.fervil.spring.careercoach.service.validator;
		
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.fervil.spring.careercoach.model.domain.ContactCoach;
import com.fervil.spring.careercoach.model.domain.UserProfile;

@Service("masscoachContactValidator")
@Component
public class MassCoachEmailValidator implements Validator {
    private static final Logger logger = LoggerFactory.getLogger(MassCoachEmailValidator.class);
	
    public boolean supports(Class clazz) {
        return ContactCoach.class.isAssignableFrom(clazz);
    }

    public void validate(Object target, Errors errors) {
    	String fieldisRequired = " Required field";
    	
        ContactCoach contactCoach = (ContactCoach) target;
    	
        if (contactCoach.getCategory() <= 0  ) {
			errors.rejectValue("category", "invalid.category", " You must select the category");
        }

        //if (contacttutor.getGradelevel().equals("-1")  ) {
		//	errors.rejectValue("gradelevel", "invalid.gradelevel", " You must select the grade level");
        //}
        
        //ValidationUtils.rejectIfEmptyOrWhitespace(errors, "course", "required.course", "The course name is required");
        
        if (contactCoach.getStartmonth() <= 0  ) {
			errors.rejectValue("startmonth", "invalid.startmonth", " You must select your desired start month");
        }
        
        if (contactCoach.getStartday() <= 0  ) {
			errors.rejectValue("startmonth", "invalid.startmonth", " You must select your desired start day");
        }

        if (contactCoach.getStartyear() <= 0  ) {
			errors.rejectValue("startmonth", "invalid.startmonth", " You must select your desired start year");
        }

        if (contactCoach.getDaysavailable() <= 0  ) {
			errors.rejectValue("daysavailable", "invalid.daysavailable", " You must select the days you're available");
        }

        if (contactCoach.getWeeksavailable() <= 0  ) {
			errors.rejectValue("weeksavailable", "invalid.weeksavailable", " You must select the weeks you're available");
        }
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "coachstylepreference", "invalid.coachstylepreference", "You must select your coaching preference");

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "availability", "invalid.availability", "You must add your availability");

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "overview", "invalid.overview", "You must describe why you need coaching");

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "studentemail", "invalid.studentemail", "You must enter your email");

        if (contactCoach.getCoachstylepreference() != null){
	        if ((contactCoach.getCoachstylepreference().equals("1") || contactCoach.getCoachstylepreference().equals("3"))   &&
	        		(contactCoach.getZipcode().trim().equals("") || contactCoach.getCity().trim().equals("")  || contactCoach.getState().trim().equals("")  )  )	
	        {
				errors.rejectValue("zipcode", "zipcode.category", " If you want in-person coaching, you must enter zipcode, city and state.");
	        }
        }    
    }    
}
