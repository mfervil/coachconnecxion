package com.fervil.spring.careercoach.model.dao;

import java.util.List;

import com.fervil.spring.careercoach.model.domain.CoachingRequest;
import com.fervil.spring.careercoach.model.domain.PaymentInformation;

public interface PaymentInformationDao {

    public void store(PaymentInformation paymentInformation) throws Exception ;

    public void delete(long id) throws Exception ;

    public PaymentInformation findById(long id) throws Exception ;

    public List<PaymentInformation> findAll() throws Exception ;  
    
	public List<PaymentInformation> findByCoachUserId(long id)  throws Exception ;
	
	public List<PaymentInformation> findPurchasedPackages(long id)  throws Exception;
}
