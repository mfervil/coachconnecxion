package com.fervil.spring.careercoach.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fervil.spring.careercoach.model.dao.CoachingCategoryDao;
import com.fervil.spring.careercoach.model.domain.CoachingCategory;

@Service
public class BasicCoachingCategoryManager implements CoachingCategoryManager {
    private static final Logger logger = LoggerFactory.getLogger(BasicCoachingCategoryManager.class);

    /**
	 * 
	 */
	private static final long serialVersionUID = 5074238788090809666L;
	/**
	 * 
	 */
	@Autowired
	private CoachingCategoryDao coachingCategoryDao;

    public CoachingCategoryDao getCoachingCategoryDao() {
		return coachingCategoryDao;
	}

	public void setCoachingCategoryDao(CoachingCategoryDao coachingCategoryDao) {
		this.coachingCategoryDao = coachingCategoryDao;
	}

	@Override
	public void storeCoachingCategory(CoachingCategory coachingCategory) throws Exception {
		coachingCategoryDao.store(coachingCategory);
	}

	@Override
	public List<CoachingCategory> findAll() throws Exception {
		return coachingCategoryDao.findAll();
	}
	
	@Override
	public CoachingCategory findById(long id) throws Exception {
		return coachingCategoryDao.findById(id) ;
	}
}