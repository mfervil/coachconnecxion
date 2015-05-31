package com.fervil.spring.careercoach.service;

import java.sql.Blob;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.apache.commons.codec.binary.Base64;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fervil.spring.careercoach.model.dao.BlogPostDao;
import com.fervil.spring.careercoach.model.dao.StateDao;
import com.fervil.spring.careercoach.model.dao.UserProfileDao;
import com.fervil.spring.careercoach.model.domain.BlogPost;
import com.fervil.spring.careercoach.model.domain.State;
import com.fervil.spring.careercoach.model.domain.UserProfile;

@Service
public class BasicStateManager implements StateManager {
    private static final Logger logger = LoggerFactory.getLogger(BasicStateManager.class);

    /**
	 * 
	 */
	private static final long serialVersionUID = 5074238788090809666L;
	/**
	 * 
	 */
	@Autowired
	private StateDao stateDao;
	//private UserProfileDao userProfileDao;

    public StateDao getStateDao() {
		return stateDao;
	}

	public void setStateDao(StateDao stateDao) {
		this.stateDao = stateDao;
	}

	@Override
	public State findById(String id) throws Exception {
		// TODO Auto-generated method stub
		return stateDao.findById(id) ;
	}

	@Override
	public List<State> getAllStates() throws Exception {
		// TODO Auto-generated method stub
		return stateDao.getAllStates();
	}
}