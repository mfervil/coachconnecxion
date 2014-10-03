package com.fervil.spring.careercoach.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;

import com.fervil.spring.careercoach.model.dao.CoachingRequestDao;
import com.fervil.spring.careercoach.model.domain.CoachingRequest;


public class BasicCoachingRequestManager implements CoachingRequestManager {

    private static final Logger logger = LoggerFactory.getLogger(BasicCoachingRequestManager.class);

    /**
	 * 
	 */
	@Autowired
	private CoachingRequestDao coachingRequestDao;

	@NotNull
    @Override
    public List<CoachingRequest> getCoachingRequests()  throws Exception {
        return coachingRequestDao.findAll();

	}

    public void storeCoachingRequest(CoachingRequest coachingRequest)  throws Exception {
    	
    	coachingRequestDao.store(coachingRequest);
    }

	public CoachingRequest findById(long id)  throws Exception {
		return coachingRequestDao.findById(id);
	}
	
	public void deleteCoachingRequest(String id)  throws Exception {
		coachingRequestDao.delete(id);
	}
	
    public void setCoachingRequestDao(CoachingRequestDao coachingRequestDao)  throws Exception {
        this.coachingRequestDao = coachingRequestDao;
    }

}