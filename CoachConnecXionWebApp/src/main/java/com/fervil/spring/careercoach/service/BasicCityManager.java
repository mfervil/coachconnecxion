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
import com.fervil.spring.careercoach.model.dao.CityExtendedDao;
import com.fervil.spring.careercoach.model.dao.UserProfileDao;
import com.fervil.spring.careercoach.model.domain.BlogPost;
import com.fervil.spring.careercoach.model.domain.CityExtended;
import com.fervil.spring.careercoach.model.domain.UserProfile;

@Service
public class BasicCityManager implements CityManager {
    private static final Logger logger = LoggerFactory.getLogger(BasicUserProfileManager.class);

    /**
	 * 
	 */
	private static final long serialVersionUID = 5074238788090809666L;
	/**
	 * 
	 */
	@Autowired
	private CityExtendedDao cityExtendedDao;

    public CityExtendedDao getCityExtendedDao() {
		return cityExtendedDao;
	}

	public void setCityExtendedDao(CityExtendedDao cityextendedDao) {
		this.cityExtendedDao = cityextendedDao;
	}

	@Override
	public CityExtended findById(int id) throws Exception {
		// TODO Auto-generated method stub
		return cityExtendedDao.findById(id)  ;
	}

	@Override
	public List<CityExtended> findByStateCode(String statecode)
			throws Exception {
		// TODO Auto-generated method stub

		return cityExtendedDao.findByState(statecode);
	}

	@Override
	public List<CityExtended> findByStateCodeForTutor(String statecode)
			throws Exception {
		// TODO Auto-generated method stub

		return cityExtendedDao.findByStateForTutor(statecode);
	}
	
	
	@Override
	public List<HashMap> findCitiesWithCoaches(String statecode, int coachType)
			throws Exception {
		// TODO Auto-generated method stub

		return cityExtendedDao.findCitiesWithCoaches(statecode, coachType);
	}
	
	@Override
	public List<HashMap> findCitiesWithCoachesForTutor(String statecode, int coachType)
			throws Exception {
		// TODO Auto-generated method stub

		return cityExtendedDao.findCitiesWithCoachesForTutor(statecode, coachType);
	}
	
}