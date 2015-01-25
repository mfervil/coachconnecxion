package com.fervil.spring.careercoach.service;
		
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.fervil.spring.careercoach.model.domain.UserProfile;

@Service("customerUserProfileValidator")
@Component
public class CreateCustomerUserProfileValidator implements Validator {
    private static final Logger logger = LoggerFactory.getLogger(CreateCustomerUserProfileValidator.class);
	
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
        
        //ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phone",
        //        "required.phone", fieldisRequired);
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "overview",
                "required.overview", fieldisRequired);

/*        
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

*/
        
        UserProfile userProfile = (UserProfile) target;

        if (userProfile.getCoachingcategory1() <= 0  && userProfile.getCoachingcategory2() <= 0 && userProfile.getCoachingcategory3() <= 0) {
			errors.rejectValue("coachingcategory1", "invalid.coachingcategory1", " You must select at least 1 category");
        }
        
    }
}
