package com.fervil.spring.careercoach.web;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils;

import com.fervil.spring.careercoach.util.Constants;
import com.fervil.spring.careercoach.util.SystemUtil;
import com.fervil.spring.careercoach.vo.CustomerPackagesVO;
import com.fervil.spring.careercoach.model.domain.PaymentInformation;
import com.fervil.spring.careercoach.service.PackageDetailsService;
import com.fervil.spring.careercoach.service.PaymentInformationManager;
import com.fervil.spring.careercoach.service.PaymentInformationValidator;
import com.fervil.spring.careercoach.service.UserProfileManager;

@Controller
public class CoachOrderInfomationController {
    private static final Logger log = LoggerFactory.getLogger(CoachOrderInfomationController.class);


	@Resource(name = "userProfileManager")
	private UserProfileManager userProfileManager;
    
	//@Resource(name = "paymentInformationManager")
	private PaymentInformationManager paymentInformationManager;

    
	@Autowired
	public CoachOrderInfomationController(PaymentInformationManager paymentInformationManager,
			PaymentInformationValidator validator) {
		this.paymentInformationManager = paymentInformationManager;
		//this.validator = validator;
	}		
	
	
	@RequestMapping(value = "/viewRequests", method = RequestMethod.GET)
	public ModelAndView viewOrdersForm( Model model, HttpServletRequest request) {
		
	ModelAndView mav = new ModelAndView ();
	try{	
		
			//long userId = SecurityUtils.getCurrentUser().getId() ;

			long profileId = SystemUtil.getUserProfileId(request, userProfileManager);

			List<PaymentInformation> coachOrders = paymentInformationManager.findPurchasedPackages(profileId);
			
			mav.addObject("coachOrders", coachOrders);
			mav.setViewName ("coaches/coachOrders");
			return mav;
		} catch (Exception e) {
	        String msg = "CoachOrderInfomationController:ModelAndView -- The request failed. Error: " + e;
	        //log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
	        return new ModelAndView("public/common/error/errorpage");
		}	
	}
}
