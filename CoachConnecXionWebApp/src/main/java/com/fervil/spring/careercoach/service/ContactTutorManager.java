package com.fervil.spring.careercoach.service;

import java.io.Serializable;
import java.util.List;

import org.jetbrains.annotations.NotNull;
import org.springframework.transaction.annotation.Transactional;

import com.fervil.spring.careercoach.model.domain.Contacttutor;
import com.fervil.spring.careercoach.model.domain.UserProfile;

@Transactional
public interface ContactTutorManager  extends Serializable {
	
    @NotNull
	public List<Contacttutor> getContactTutorRequests() throws Exception;
    public void storeContactTutor(Contacttutor contacttutor) throws Exception;
    //public void deleteContactTutor(String id) throws Exception;
    public Contacttutor findById(long id) throws Exception;	
}
