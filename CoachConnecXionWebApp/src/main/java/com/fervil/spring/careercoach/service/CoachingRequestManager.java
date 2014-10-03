package com.fervil.spring.careercoach.service;

import java.io.Serializable;
import java.util.List;

import org.jetbrains.annotations.NotNull;
import org.springframework.transaction.annotation.Transactional;

import com.fervil.spring.careercoach.model.domain.CoachingRequest;

@Transactional
public interface CoachingRequestManager  extends Serializable {

    @NotNull
	public List<CoachingRequest> getCoachingRequests() throws Exception ;
    public void storeCoachingRequest(CoachingRequest coachingRequest) throws Exception ;
    public void deleteCoachingRequest(String id) throws Exception ;
    public CoachingRequest findById(long id) throws Exception ;	
}
