package com.fervil.spring.careercoach.service.validator;
		
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.fervil.spring.careercoach.model.domain.PaymentInformation;
import com.fervil.spring.careercoach.model.domain.UserProfile;

@Component
public class PaymentInformationValidator implements Validator {
    private static final Logger logger = LoggerFactory.getLogger(PaymentInformationValidator.class);

	 private Pattern pattern;  
	 private Matcher matcher;  
	  
	 private static final String EMAIL_PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"  
	   + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";  
	 String ID_PATTERN = "[0-9]+";  
	 String STRING_PATTERN = "[a-zA-Z]+";  
	 String MOBILE_PATTERN = "[0-9]{10}";	
	
    public boolean supports(Class clazz) {
        return PaymentInformationValidator.class.isAssignableFrom(clazz);
    }

    public void validate(Object target, Errors errors) {
    	String fieldisRequired = " : This field is required.";

    	
    	PaymentInformation paymentInformation = (PaymentInformation) target;
        if (paymentInformation.getCreditCardNumber1().trim().equals("") 
        	|| paymentInformation.getCreditCardNumber2().trim().equals("")
        	|| paymentInformation.getCreditCardNumber3().trim().equals("")
        	|| paymentInformation.getCreditCardNumber4().trim().equals("")  )
        {
			errors.rejectValue("creditCardNumber1", "invalid.creditCardNumber1", " : All credit card fields are required.");
        }
        
        if (paymentInformation.getCreditCardType().trim().equalsIgnoreCase("none")) { 
			errors.rejectValue("creditCardType", "invalid.creditCardType", fieldisRequired);
        }	
         
        if (paymentInformation.getEmail().trim().equalsIgnoreCase("")) { 
			errors.rejectValue("email", "invalid.email", fieldisRequired);
        }	

        if (paymentInformation.getPassword().trim().equalsIgnoreCase("")) { 
			errors.rejectValue("password", "invalid.email", fieldisRequired);
        }	
        if (paymentInformation.getConfirmedpassword().trim().equalsIgnoreCase("")) { 
			errors.rejectValue("confirmedpassword", "invalid.email", fieldisRequired);
        }	
        
        if (paymentInformation.getPhoneNumber1().trim().equalsIgnoreCase("")
        	|| paymentInformation.getPhoneNumber2().trim().equalsIgnoreCase("")	
        	|| paymentInformation.getPhoneNumber3().trim().equalsIgnoreCase("")	)
        { 
			errors.rejectValue("phoneNumber3", "invalid.phoneNumber3", fieldisRequired);
        }
        
        if (paymentInformation.getExpirationMonth() < 1 || paymentInformation.getExpirationYear() < 1) { 
			errors.rejectValue("expirationYear", "invalid.expirationYear", fieldisRequired);
        }	
        
        String phoneNumber = paymentInformation.getPhoneNumber1() + paymentInformation.getPhoneNumber2() + paymentInformation.getPhoneNumber3();
        if ( phoneNumber.length() < 10  ) { 
			errors.rejectValue("phoneNumber3", "invalid.phoneNumber3", "Phone number fields are not long enough");
        }	
        
        pattern = Pattern.compile(ID_PATTERN);  
        matcher = pattern.matcher(phoneNumber);  
        if (!matcher.matches()) {  
         errors.rejectValue("phoneNumber3", "invalid.phoneNumber3",  
           "Phone number entries must be numeric");  
        }

        if (paymentInformation.getFirstName().equals("") ) { 
			errors.rejectValue("firstName", "invalid.firstName", fieldisRequired);
        }	
        
        if (paymentInformation.getLastName().equals("") ) { 
			errors.rejectValue("lastName", "invalid.lastName", fieldisRequired);
        }	
        
        if (paymentInformation.getStreet1().trim().equals("")) { 
			errors.rejectValue("street1", "invalid.street1", fieldisRequired);
        }	
        
        if (paymentInformation.getStreet1().trim().equals("")) { 
			errors.rejectValue("city", "invalid.city", fieldisRequired);
        }	
        if (paymentInformation.getStreet1().trim().equals("")) { 
			errors.rejectValue("state", "invalid.state", fieldisRequired);
        }	
        if (paymentInformation.getStreet1().trim().equals("")) { 
			errors.rejectValue("zip", "invalid.zip", fieldisRequired);
        }	
    }
}