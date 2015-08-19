package com.fervil.spring.careercoach.web.tutor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils;

import com.connection.service.MessageService;
import com.fervil.spring.careercoach.model.domain.PaymentInformation;
import com.fervil.spring.careercoach.model.domain.UserProfile;
import com.fervil.spring.careercoach.util.Constants;

@Controller
public class TutorMessageInfoController {
	@Autowired
	private MessageService messageService;
	@Autowired
    private JavaMailSender mailSender;
	
	@RequestMapping(value = "/tutor/getMessageCount", method = RequestMethod.GET)
	public ModelAndView viewOrdersForm( Model model) {

	ModelAndView mav = new ModelAndView ();
	try{	
		
			long userId = SecurityUtils.getCurrentUser().getId() ;
		
			//List<CustomerPackagesVO> customerPackages = packageDetailsService.getUserPackages(userId);
		
			//List<UserProfile> usrList = userProfileManager.findByUserId(userId);
			
			List<UserProfile> usrList = null;
			
			int profileType = 0;
			long userProfileId = 0;
			for(int j=0; j<usrList.size();j++ ){			
				profileType= usrList.get(j).getUserProfileType();
				userProfileId = (profileType==1 || profileType==2)?usrList.get(j).getUserProfileId():0;
				break;
			}
			
			//List<PaymentInformation> customerPackages = packageDetailsService.getUserPackagesByProfileId(userProfileId);
			List<PaymentInformation> customerPackages = null;

			mav.addObject("currentUserId", userId);
			mav.addObject("customerPackages", customerPackages);
			mav.setViewName ("tutor/customer/customerPackages");
			return mav;
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        //log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
	        return new ModelAndView("tutor/public/common/error/errorpage");
		}	
	}
}
