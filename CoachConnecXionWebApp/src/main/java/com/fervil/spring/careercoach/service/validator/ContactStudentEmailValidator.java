package com.fervil.spring.careercoach.service.validator;
		
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.fervil.spring.careercoach.model.domain.Contacttutor;
import com.fervil.spring.careercoach.model.domain.UserProfile;

@Service("contactStudentByEmailValidator")
@Component
public class ContactStudentEmailValidator implements Validator {
    private static final Logger logger = LoggerFactory.getLogger(ContactStudentEmailValidator.class);
	
    public boolean supports(Class clazz) {
        return Contacttutor.class.isAssignableFrom(clazz);
    }

    public void validate(Object target, Errors errors) {
    	
        Contacttutor contacttutor = (Contacttutor) target;
    	
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "tutorcase", "required.tutorcase", "You must make your case why you should be chosen as the tutor");

    }    
}
