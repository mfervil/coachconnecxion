package com.fervil.spring.careercoach.web;

import java.util.List;
import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils;

import com.fervil.spring.careercoach.util.Constants;
import com.fervil.spring.careercoach.vo.CustomerPackagesVO;
import com.fervil.spring.careercoach.service.PackageDetailsService;

@Controller
public class CustomerInfomationController {
    private static final Logger log = LoggerFactory.getLogger(CustomerInfomationController.class);
	
	
	@Resource(name = "packageDetailsService")
	private PackageDetailsService packageDetailsService;
    
	@RequestMapping(value = "/viewOrders", method = RequestMethod.GET)
	public ModelAndView viewOrdersForm( Model model) {

	ModelAndView mav = new ModelAndView ();
	try{	
		
			long userId = SecurityUtils.getCurrentUser().getId() ;
		
			List<CustomerPackagesVO> customerPackages = packageDetailsService.getUserPackages(userId);
			mav.addObject("currentUserId", userId);
			mav.addObject("customerPackages", customerPackages);
			mav.setViewName ("customer/customerPackages");
			return mav;
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
	        return new ModelAndView("public/common/error/errorpage");
		}	
	}
}
