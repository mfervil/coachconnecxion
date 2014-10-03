package com.fervil.spring.careercoach.service;
		
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.fervil.spring.careercoach.model.domain.CoachSelection;
import com.fervil.spring.careercoach.model.domain.UserProfile;

@Component
public class CoachSelectionValidator implements Validator {
    private static final Logger logger = LoggerFactory.getLogger(CoachSelectionValidator.class);

    public boolean supports(Class clazz) {
        return UserProfile.class.isAssignableFrom(clazz);
    }

    public void validate(Object target, Errors errors) {
    	String fieldisRequired = " : This field is required.";

        CoachSelection coachSelection = (CoachSelection) target;
        if (coachSelection.getCoachingCategory() <= 0) {
			errors.rejectValue("coachingCategory", "invalid.coachingCategory", " : Must be selected.");
        }
    }
}

