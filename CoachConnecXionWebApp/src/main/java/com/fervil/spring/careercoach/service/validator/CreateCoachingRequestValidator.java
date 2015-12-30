package com.fervil.spring.careercoach.service.validator;
		
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.fervil.spring.careercoach.model.domain.CoachingRequest;

@Component
public class CreateCoachingRequestValidator implements Validator {
    private static final Logger logger = LoggerFactory.getLogger(CreateCoachingRequestValidator.class);

    public boolean supports(Class clazz) {
        return CoachingRequest.class.isAssignableFrom(clazz);
    }

    public void validate(Object target, Errors errors) {
    	final String fieldisRequired = " : This field is required.";
    	final String ItemMustBeSelected = " : An item must be selected from the list.";
    	
    	
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "currentPosition",
                "required.currentPosition", fieldisRequired);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "goals",
                "required.goals", fieldisRequired);

        CoachingRequest coachingRequest = (CoachingRequest) target;

        //ValidationUtils.rejectIfEmptyOrWhitespace(errors, "careerCategory",
        //        "required.careerCategory", fieldisRequired);

        if (coachingRequest.getCareerCategory() <= 0) {
			errors.rejectValue("careerCategory", "invalid.careerCategory", ItemMustBeSelected);
        }
        
        
        if (coachingRequest.getCoachingType() <= 0) {
			errors.rejectValue("coachingType", "invalid.coachingType", ItemMustBeSelected);
        }
        
        if (coachingRequest.getroadblocks() <= 0) {
			errors.rejectValue("roadBlocks", "invalid.roadBlocks", ItemMustBeSelected);
        }

        if (coachingRequest.getCoachingStyle() <= 0) {
			errors.rejectValue("coachingStyle", "invalid.coachingStyle", ItemMustBeSelected);
        }
    }
}
