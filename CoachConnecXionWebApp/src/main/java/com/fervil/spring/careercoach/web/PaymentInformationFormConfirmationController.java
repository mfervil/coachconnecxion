package com.fervil.spring.careercoach.web;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.fervil.spring.careercoach.model.domain.PaymentInformation;
import com.fervil.spring.careercoach.service.PaymentInformationManager;
import com.fervil.spring.careercoach.service.validator.PaymentInformationValidator;
import com.fervil.spring.careercoach.util.Constants;

@Controller
@RequestMapping("/public/paymentinformationConfirmation")
public class PaymentInformationFormConfirmationController  {
	
    private static final Logger log = LoggerFactory.getLogger(PaymentInformationFormConfirmationController.class);
	
	private PaymentInformationManager paymentInformationManager;
	private PaymentInformationValidator validator;
	//private UserProfileManager userProfileManager;
	
	@Autowired
	public PaymentInformationFormConfirmationController(PaymentInformationManager paymentInformationManager,
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
	public ModelAndView showPaymentInformationForm(org.springframework.web.context.request.WebRequest webRequest, Model model) {

	    //Map<String, Object> myModel = new HashMap<String, Object>();
		
		try{	
			PaymentInformation paymentInformation = new PaymentInformation();
			
			ModelAndView mav = new ModelAndView ();
	
			paymentInformation.setPackageName(webRequest.getParameter("packageName"));
 			
			paymentInformation.setPackageId(Integer.valueOf(webRequest.getParameter("packageId")));
			paymentInformation.setPackagePrice(Float.valueOf(webRequest.getParameter("packagePrice")));
			
			mav.addObject("paymentInformation", paymentInformation);
			mav.setViewName ("public/paymentprocessing/paymentInformation");
	
			return mav;
			
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
	        model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
	        return new ModelAndView("public/common/error/errorpage");
			
		}	
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView submitForm( 
			@ModelAttribute("paymentInformation") PaymentInformation paymentInformation,
			BindingResult result, SessionStatus status, org.springframework.web.context.request.WebRequest webRequest,
			HttpServletRequest request, Model model) {
		
		try{
			ModelAndView mav = new ModelAndView ();
			
	        if (result.hasErrors()) {
	    		mav.addObject("paymentInformation", paymentInformation);
	    		mav.setViewName ("public/paymentprocessing/paymentInformation");
			} else {
				
				if (((String)request.getParameter("processPayment")).equalsIgnoreCase("processPaymentYes") ){
					String [] paymentResponse = paymentInformationManager.processPaymentInfo(paymentInformation, webRequest.getParameter("coachEmail"));
 					if (paymentResponse[0].equals("0") ){
						
			    		mav.setViewName ("public/paymentprocessing/ConfirmationMessage");
					} else {
						mav.addObject("paymentResponse", paymentResponse[1]);
			    		mav.setViewName ("paymentInformation");
					}
				} else {
					mav.addObject("paymentInformation", paymentInformation);
					mav.addObject("packageId", webRequest.getParameter("packageId"));
					mav.addObject("packageName", webRequest.getParameter("packageName"));
					mav.addObject("packagePrice", webRequest.getParameter("packagePrice"));
					
		    		mav.setViewName ("public/paymentprocessing/paymentInformationConfirmation");
				}
			}
			return mav;
			
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
	        model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
	        return new ModelAndView("public/common/error/errorpage");
		}	
	}	
}
