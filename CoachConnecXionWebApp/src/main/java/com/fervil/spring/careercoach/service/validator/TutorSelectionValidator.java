package com.fervil.spring.careercoach.service.validator;
		
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.fervil.spring.careercoach.model.domain.CoachSelection;
import com.fervil.spring.careercoach.model.domain.UserProfile;
import com.fervil.spring.careercoach.util.Constants;

@Component
public class TutorSelectionValidator implements Validator {
    private static final Logger logger = LoggerFactory.getLogger(TutorSelectionValidator.class);

    public boolean supports(Class clazz) {
        return UserProfile.class.isAssignableFrom(clazz);
    }

    public void validate(Object target, Errors errors) {
    	String fieldisRequired = " This field is required.";

        CoachSelection coachSelection = (CoachSelection) target;
        if (coachSelection.getCoachstyle().equals(Constants.COACH_STYLE_IN_PERSON) && (coachSelection.getZipcode() == null || coachSelection.getZipcode().trim().equals("") )){
			errors.rejectValue("zipcode", "invalid.zipcode", " Zipcode is required for In-Person Tutoring.");
        }
        /*
        if (coachSelection.getCoachingCategory() < 1){
			errors.rejectValue("coachingCategory", "invalid.coachingCategory", fieldisRequired);
        }
		*/
    }
}

