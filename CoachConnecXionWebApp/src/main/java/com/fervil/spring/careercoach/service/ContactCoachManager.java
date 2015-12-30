package com.fervil.spring.careercoach.service;

import java.io.Serializable;
import java.util.List;

import org.jetbrains.annotations.NotNull;
import org.springframework.transaction.annotation.Transactional;

import com.fervil.spring.careercoach.model.domain.ContactCoach;

@Transactional
public interface ContactCoachManager  extends Serializable {
	
    @NotNull
	public List<ContactCoach> getContactCoachRequests() throws Exception;
    public void storeContactCoach(ContactCoach contactcoach) throws Exception;
    public ContactCoach findById(long id) throws Exception;	
}
