package com.fervil.spring.careercoach.web;

import java.text.NumberFormat;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomNumberEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import ua.com.bitlab.springsecuritydemo.services.UsersService;
import ua.com.bitlab.springsecuritydemo.web.beans.WebUser;

import com.fervil.spring.careercoach.model.domain.PaymentInformation;
import com.fervil.spring.careercoach.model.domain.UserProfile;
import com.fervil.spring.careercoach.service.PaymentInformationManager;
import com.fervil.spring.careercoach.service.UserProfileManager;
import com.fervil.spring.careercoach.service.validator.PaymentInformationValidator;
import com.fervil.spring.careercoach.util.Constants;

@Controller
@RequestMapping("/public/paymentinformation")
public class PaymentInformationFormController  {
	
    private static final Logger log = LoggerFactory.getLogger(PaymentInformationFormController.class);
	
	private PaymentInformationManager paymentInformationManager;
	private PaymentInformationValidator validator;
	
   	@Resource(name = "userProfileManager")
	private UserProfileManager userProfileManager;

    @Autowired
    private UsersService usersService;
	
	@Autowired
	public PaymentInformationFormController(PaymentInformationManager paymentInformationManager,
			PaymentInformationValidator validator) {
		this.paymentInformationManager = paymentInformationManager;
		this.validator = validator;
	}

	public void paymentInformationManager(PaymentInformationManager paymentInformationManager) {
		this.paymentInformationManager = paymentInformationManager;
	}
	
	public PaymentInformationManager getPaymentInformationManager() {
		return paymentInformationManager;
	}

	//@RequestMapping(method = RequestMethod.GET)
	//protected ModelAndView handleRequestInternal(HttpServletRequest request,
	//		HttpServletResponse response) throws Exception {
	@RequestMapping(method = RequestMethod.GET) 
	public ModelAndView showPaymentInformationForm(ModelMap model, org.springframework.web.context.request.WebRequest webRequest) {
        Map<String, Object> myModel = new HashMap<String, Object>();

		try{	
			PaymentInformation paymentInformation = new PaymentInformation();
			
			ModelAndView mav = new ModelAndView ();
	
			paymentInformation.setPackageName(webRequest.getParameter("packageName"));
			paymentInformation.setPackageId(Integer.valueOf(webRequest.getParameter("packageId")));
			paymentInformation.setPackagePrice(Float.valueOf(webRequest.getParameter("packagePrice")));
	
			mav.addObject("coachEmail", webRequest.getParameter("coachEmail"));
			mav.addObject("paymentInformation", paymentInformation);
			mav.setViewName ("public/paymentprocessing/paymentInformation");
	
			return mav;
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
	        myModel.put(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
	        return new ModelAndView("public/common/error/errorpage", "model", myModel);
		}	
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView submitForm( 
			@ModelAttribute("paymentInformation") PaymentInformation paymentInformation,
			BindingResult result, SessionStatus status, org.springframework.web.context.request.WebRequest webRequest,
			HttpServletRequest request, Model model) {

		try{

			paymentInformation.setPackageName(webRequest.getParameter("packageName"));
			paymentInformation.setPackageId(Integer.valueOf(webRequest.getParameter("packageId")));
			paymentInformation.setPackagePrice(Float.valueOf(webRequest.getParameter("packagePrice")));
			
			validator.validate(paymentInformation, result);
			
	        if (result.hasErrors()) {
	    		//mav.addObject("paymentInformation", paymentInformation);
	    		//mav.setViewName ("public/paymentprocessing/paymentInformation");
	    		
	    		ModelAndView mav = new ModelAndView ();
	    		mav.addObject("paymentInformation", paymentInformation);
	    		mav.setViewName ("public/paymentprocessing/paymentInformation");
				return mav;
			} else {
	    		ModelAndView mav = new ModelAndView ();
				
				if (((String)request.getParameter("processPayment")).equalsIgnoreCase("processPaymentYes") ){
					String pwd = paymentInformation.getPassword();
					paymentInformation.setPassword("000000");  // User password should not be set in this table
					paymentInformation.setConfirmedpassword("000000");
					String [] paymentResponse = paymentInformationManager.processPaymentInfo(paymentInformation, (String)request.getParameter("coachEmail"));
					
					if (paymentResponse[0].equals("0") ){
						
						//If the payment was processed successfully, then Save the registration information
						//
						WebUser user = new WebUser();

						try{

							user.setUsername(webRequest.getParameter("email"));
							user.setEmail(webRequest.getParameter("email"));
							user.setPassword(webRequest.getParameter("password"));
							user = usersService.saveUser(user);
					        user = usersService.activateUser( user.getId() , user.getActivationCode());
						} catch (Exception e){
							//If the user already exists, then the info will not be saved, and an exception will be thrown
							String msg = "PaymentInformationFormController: Error while creating the user. Error " + e;
					        log.error(msg, e);
					    }

						try{
					        //Create a profile record for the user....................................
					        UserProfile up = new UserProfile();
					        
					        up.setFirstname(paymentInformation.getFirstName());
					        up.setLastname(paymentInformation.getLastName());
					        up.setEmail(webRequest.getParameter("email"));
					        
					        up.setAccountType(2);
					        up.setHourlyrate(0); 
					        up.setUserProfileType(2);
					        up.setUser_userId(user.getId());
					        up.setCoachingcategory1(17);
					        userProfileManager.storeUserProfile(up);
					        //End Create a profile record for the user
					        
						} catch (Exception e){
							//If the user already exists, then the info will not be saved, and an exception will be thrown
							String msg = "PaymentInformationFormController: Error while creating the User Profile record. Error " + e;
					        log.error(msg, e);
					    }
						
						
						mav.addObject("packageName", webRequest.getParameter("packageName"));
						mav.addObject("packagePrice", webRequest.getParameter("packagePrice"));
						mav.setViewName ("public/paymentprocessing/ConfirmationMessage");
						
					} else {
						mav.addObject("paymentResponse", paymentResponse[1]);
						mav.addObject("packageName", webRequest.getParameter("packageName"));
						mav.addObject("packagePrice", webRequest.getParameter("packagePrice"));
						mav.addObject("coachEmail", webRequest.getParameter("coachEmail"));
						mav.setViewName ("public/paymentprocessing/paymentInformation");
					}
				} else {
					mav.addObject("paymentInformation", paymentInformation);
					mav.addObject("packageId", webRequest.getParameter("packageId"));
					mav.addObject("packageName", webRequest.getParameter("packageName"));
					mav.addObject("packagePrice", webRequest.getParameter("packagePrice"));
					
		    		mav.setViewName ("public/paymentprocessing/paymentInformationConfirmation");
				}
				return mav;

			}
 			
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
	        model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
	        return new ModelAndView("public/common/error/errorpage");
		}	

	}	
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
	    NumberFormat numberFormat = NumberFormat.getInstance();
	    numberFormat.setGroupingUsed(false);
	    binder.registerCustomEditor(Integer.class, new CustomNumberEditor(Integer.class, numberFormat, true));
	}
	
	
	
}
