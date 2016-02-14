package com.fervil.spring.careercoach.service.validator;
		
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.fervil.spring.careercoach.model.domain.UserProfile;

@Service("createBlogPostValidator")
@Component
public class CreateBlogPostValidator implements Validator {
    private static final Logger logger = LoggerFactory.getLogger(CreateBlogPostValidator.class);
	
    public boolean supports(Class clazz) {
        return UserProfile.class.isAssignableFrom(clazz);
    }
    
    public void validate(Object target, Errors errors) {
    	String fieldisRequired = " Required field";
    	
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "blogtitle",
                "required.blogtitle", "Blog Title is required");

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "blogposting",
                "required.blogposting", "Blog Post Details is required");
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "coachingcategory",
                "required.coachingcategory", "Blog Category is required");

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "metadescription",
                "required.coachingcategory", "Meta Description is required");
        
        
/*        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "creatorfirstname",
                "required.creatorfirstname", fieldisRequired);
    	
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "creatorlastname",
                "required.creatorlastname", fieldisRequired);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "creatorlastname",
                "required.creatorlastname", fieldisRequired);
*/
    }
    
    public void validateComment(Object target, Errors errors){
    	String fieldisRequired = " Required field";
    	
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email",
                "required.email", "Email is required");

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name",
                "required.name", "Name is required");
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "comment",
                "required.comment", "Comment is required");
    	
    }
}
