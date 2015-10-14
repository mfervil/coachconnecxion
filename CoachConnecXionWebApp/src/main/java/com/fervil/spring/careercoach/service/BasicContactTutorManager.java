package com.fervil.spring.careercoach.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fervil.spring.careercoach.model.dao.ContactTutorDao;
import com.fervil.spring.careercoach.model.dao.UserProfileDao;
import com.fervil.spring.careercoach.model.domain.Contacttutor;
import com.fervil.spring.careercoach.model.domain.UserProfile;

@Service
public class BasicContactTutorManager implements ContactTutorManager {
    private static final Logger logger = LoggerFactory.getLogger(BasicContactTutorManager.class);

    /**
	 * 
	 */
	@Autowired
	private ContactTutorDao contactTutorDao;
/*
    @NotNull
    @Override
    public List<UserProfile> getUserProfiles()  throws Exception {
        return userProfileDao.findAll();

	}

    public void storeUserProfile(UserProfile userProfile) throws Exception {
    	userProfileDao.store(userProfile);
    }

	public UserProfile findById(String id) throws Exception {
		return userProfileDao.findById(id);
	}
	
	public void deleteUserProfile(String id) throws Exception {
		userProfileDao.delete(id);
	}
	
    public void setUserProfileDao(UserProfileDao userProfileDao) throws Exception {
        this.userProfileDao = userProfileDao;
    }
*/
	
	@Override
	public List<Contacttutor> getContactTutorRequests() throws Exception {
        return contactTutorDao.findAll();
	}

	@Override
	public void storeContactTutor(Contacttutor contacttutor) throws Exception {
		contactTutorDao.store(contacttutor);
		
	}

/*	
	@Override
	public void deleteContactTutor(String id) throws Exception {
		// TODO Auto-generated method stub
	}
*/
	
	@Override
	public Contacttutor findById(long id) throws Exception {
		return contactTutorDao.findById(id);
	}

	public void setContactTutorDao(ContactTutorDao contactTutorDao) {
		this.contactTutorDao = contactTutorDao;
	}
	

	
}