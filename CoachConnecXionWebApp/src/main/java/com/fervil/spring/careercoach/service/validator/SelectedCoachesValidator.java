package com.fervil.spring.careercoach.service.validator;
		
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.fervil.spring.careercoach.model.domain.CoachingRequest;
import com.fervil.spring.careercoach.model.domain.UserProfile;

@Component
public class SelectedCoachesValidator implements Validator {
    private static final Logger logger = LoggerFactory.getLogger(SelectedCoachesValidator.class);

    public boolean supports(Class clazz) {
        return UserProfile.class.isAssignableFrom(clazz);
    }

    
    public void validate(Object target, Errors errors)  {
    	final String fieldisRequired = "Coaches must be added to proceed.";
    	
        CoachingRequest coachingRequest = (CoachingRequest) target;
        String selectedCoachList = coachingRequest.getSelectedCoaches();
        if (selectedCoachList == null || selectedCoachList.length() < 1) {
			errors.rejectValue("selectedCoaches", "invalid.selectedCoaches", fieldisRequired);
        }
    }
}
