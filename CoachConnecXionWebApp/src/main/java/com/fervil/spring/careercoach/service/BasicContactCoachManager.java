package com.fervil.spring.careercoach.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fervil.spring.careercoach.model.dao.ContactCoachDao;
import com.fervil.spring.careercoach.model.domain.ContactCoach;

@Service
public class BasicContactCoachManager implements ContactCoachManager {
    private static final Logger logger = LoggerFactory.getLogger(BasicContactCoachManager.class);

    /**
	 * 
	 */
	@Autowired
	private ContactCoachDao contactCoachDao;

	@Override
	public List<ContactCoach> getContactCoachRequests() throws Exception {
        return contactCoachDao.findAll();
	}

	@Override
	public void storeContactCoach(ContactCoach contactcoach) throws Exception {
		contactCoachDao.store(contactcoach);
		
	}

	@Override
	public ContactCoach findById(long id) throws Exception {
		return contactCoachDao.findById(id);
	}

	public void setContactCoachDao(ContactCoachDao contactCoachDao) {
		this.contactCoachDao = contactCoachDao;
	}
	

	
}