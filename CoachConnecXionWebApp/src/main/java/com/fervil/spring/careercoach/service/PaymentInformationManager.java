package com.fervil.spring.careercoach.service;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;

import org.jetbrains.annotations.NotNull;
import org.springframework.transaction.annotation.Transactional;

import com.fervil.spring.careercoach.model.domain.PaymentInformation;
import com.fervil.spring.careercoach.model.domain.UserProfile;

@Transactional
public interface PaymentInformationManager  extends Serializable {
	
    @NotNull
	public List<UserProfile> getUserProfiles() throws Exception ;
    
    public void storeUserProfile(UserProfile userProfile) throws Exception ;
    public void deleteUserProfile(String id) throws Exception ;
    public UserProfile findById(String id) throws Exception ;	
    public String [] processPaymentInfo(PaymentInformation paymentInformation, String coachEmail) throws Exception ;
    public List<PaymentInformation> findPurchasedPackages(long coachUserProfileId) throws Exception;
    public void storePaymentInformation(PaymentInformation paymentInformation) throws Exception;
    public List<HashMap> getPaymentRecordBypackageForUser(long packageId, String email) throws Exception;
    
}
