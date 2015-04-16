package com.fervil.spring.careercoach.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fervil.spring.careercoach.model.dao.PaymentInformationDao;
import com.fervil.spring.careercoach.model.dao.UserProfileDao;
import com.fervil.spring.careercoach.model.domain.PaymentInformation;
import com.fervil.spring.careercoach.model.domain.UserProfile;
import com.fervil.spring.careercoach.vo.CustomerPackagesVO;

import paypal.payflow.BaseTender;

@Service
public class BasicPaymentInformationManager implements PaymentInformationManager {
	@Resource(name = "sessionFactory")
	private SessionFactory sessionFactory;

    private static final Logger logger = LoggerFactory.getLogger(BasicPaymentInformationManager.class);
	
	@Autowired
	Paypalfunctions pplfunctions;

    /**
	 * 
	 */
	private static final long serialVersionUID = 1559837252165311804L;
	/**
	 * 
	 */
	@Autowired
	private UserProfileDao userProfileDao;

	/**
	 * 
	 */
	@Autowired
	private PaymentInformationDao paymentInformationDao;
	
	
    @NotNull
    @Override
    public List<UserProfile> getUserProfiles()  throws Exception {
        return userProfileDao.findAll();

	}

    public void storeUserProfile(UserProfile userProfile)  throws Exception {
    	userProfileDao.store(userProfile);
    }

	public UserProfile findById(String id)  throws Exception {
		return userProfileDao.findById(id);
	}
	
	public void deleteUserProfile(String id)  throws Exception {
		userProfileDao.delete(id);
	}
	
    public void setUserProfileDao(UserProfileDao userProfileDao)  throws Exception {
        this.userProfileDao = userProfileDao;
    }

	public List<PaymentInformation> findPurchasedPackages(long coachUserProfileId) throws Exception {
		return this.paymentInformationDao.findPurchasedPackages(coachUserProfileId);
	}
    
    public List<PaymentInformation> getPaymentRecordBypackageForUser(long packageId, String email ) throws Exception {
		return this.paymentInformationDao.getPaymentRecordBypackageForUser(packageId, email);
    }
	
	
	//public void saveBasicPaymentInformation(PaymentInformation paymentInformation) throws Exception {
	//	this.paymentInformationDao.store(paymentInformation); 
	//}
    
	@Override
	public String[] processPaymentInfo(PaymentInformation paymentInformation, String coachEmail)  throws Exception {
		/*
		 ==================================================================
		 Payflow Credit Card - ORDER CONFIRM : START SNIPPET
		 ===================================================================
		*/
		String [] response = {"",""};
		
		if (paymentInformation.getCreditCardType().equalsIgnoreCase("Visa") || paymentInformation.getCreditCardType().equalsIgnoreCase("MasterCard") || paymentInformation.getCreditCardType().equalsIgnoreCase("Amex") || paymentInformation.getCreditCardType().equalsIgnoreCase("Discover"))
		{

			/*		
			'------------------------------------
			' The paymentAmount is the total value of 
			' the shopping cart, that was set 
			' earlier in a session variable 
			' by the shopping cart page
			'------------------------------------
			*/
			//String paymentAmount = (String)session.getAttribute("Payment_Amount");

			/*
			'------------------------------------
			' The paymentType that was selected earlier 
			'------------------------------------
			*/
			String paymentType = "Sale";
			
			/*
			' Set these values based on what was selected by the user on the Billing page Html form
			*/
			
			//String creditCardType 		= "<<Visa/MasterCard/Amex/Discover>>"; //' Set this to one of the acceptable values (Visa/MasterCard/Amex/Discover) match it to what was selected on your Billing page
			//String creditCardNumber 	= "<<CC number>>"; // ' Set this to the string entered as the credit card number on the Billing page
			//String expDate 				= "<<Expiry Date>>"; // ' Set this to the credit card expiry date entered on the Billing page
			//String cvv2 				= "<<cvv2>>"; // ' Set this to the CVV2 string entered on the Billing page 
			//String firstName 			= "<<firstName>>"; // ' Set this to the customer's first name that was entered on the Billing page 
			//String lastName 			= "<<lastName>>"; // ' Set this to the customer's last name that was entered on the Billing page 
			//String street 				= "<<street>>"; // ' Set this to the customer's street address that was entered on the Billing page 
			//String city 				= "<<city>>"; // ' Set this to the customer's city that was entered on the Billing page 
			//String state 				= "<<state>>"; // ' Set this to the customer's state that was entered on the Billing page 
			//String zip 					= "<<zip>>"; // ' Set this to the zip code of the customer's address that was entered on the Billing page 
			//String countryCode 			= "<<PayPal Country Code>>"; // ' Set this to the PayPal code for the Country of the customer's address that was entered on the Billing page 
			//String currencyCode 		= "<<PayPal Currency Code>>"; // ' Set this to the PayPal code for the Currency used by the customer
			//String orderDescription 	= "<<OrderDescription>>"; // ' Set this to the textual description of this order 
			
			/*	
			'------------------------------------------------
			' Calls the DoDirectPayment API call
			'
			' The DirectPayment function is defined in PayPalFunctions.java 
			' included at the top of this file.
			'-------------------------------------------------
			*/
			
			//Paypalfunctions pplfunctions = new Paypalfunctions();

			 response = pplfunctions.ExecutePayment(paymentType, paymentInformation, coachEmail);
			
		}		
		return response;
	}

	@Override
	public void storePaymentInformation(PaymentInformation paymentInformation)
			throws Exception {
		
		System.out.println("Inside storePaymentInformation");
		this.paymentInformationDao.store(paymentInformation); 
	}
	
	
}