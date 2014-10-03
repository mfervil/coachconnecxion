package com.fervil.spring.careercoach.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fervil.spring.careercoach.model.domain.Experiencedetails;


/**
 * Service for processing Persons
 * 
 */
@Service("addWorkExperienceService")
@Transactional
public class AddWorkExperienceService {
    private static final Logger logger = LoggerFactory.getLogger(AddWorkExperienceService.class);

	@Resource(name = "sessionFactory")
	private SessionFactory sessionFactory;
	
	public List<Experiencedetails> getAllexperiences() throws Exception {
		Session session = sessionFactory.getCurrentSession();
		try {
			Query query = session.createQuery("FROM  Experiencedetails order by id Desc");
			return query.list();
		} catch (Exception e) {
			logger.error("Exception " + e.getMessage());
		}
		return null;
	}

	public List<Experiencedetails> getWorkExperiencesById(long userProfileId) throws Exception {
		Session session = sessionFactory.getCurrentSession();
		try {
			Query query = session.createQuery("FROM  Experiencedetails where user_profile_id = " + userProfileId + "order by id Desc");
			
			return query.list();
		} catch (Exception e) {
			logger.error("Exception: AddWorkExperienceService: getWorkExperiencesById " + e.getMessage());
		}
		return null;
	}
	
	
	public Experiencedetails get(Integer id)  throws Exception {
		Session session = sessionFactory.getCurrentSession();
		Experiencedetails experiencedetails = (Experiencedetails) session.get(Experiencedetails.class, id);
		return experiencedetails;
	}

	public void add(Experiencedetails experiencedetails)  throws Exception {		
		Session session = sessionFactory.getCurrentSession();
		session.save(experiencedetails);
	}
	public void edit(Experiencedetails experiencedetails)  throws Exception {
		logger.debug("Editing existing Package");
		Session session = sessionFactory.getCurrentSession();
		Experiencedetails existingExperience = (Experiencedetails) session.get(Experiencedetails.class, experiencedetails.getId());
		existingExperience.setCustomerId(experiencedetails.getCustomerId());
		existingExperience.setEmployerName(experiencedetails.getEmployerName());
		existingExperience.setLabelName(experiencedetails.getLabelName());
		existingExperience.setCountryName(experiencedetails.getCountryName());
		existingExperience.setLocationName(experiencedetails.getLocationName());
		existingExperience.setDescriptionDetails(experiencedetails.getDescriptionDetails());
		existingExperience.setStartDate(experiencedetails.getStartDate());
		existingExperience.setEndDate(experiencedetails.getEndDate());
		session.save(existingExperience);
	}
	
	public void delete(Integer id)  throws Exception {
		logger.debug("Deleting existing Experience");
		Session session = sessionFactory.getCurrentSession();
		Experiencedetails experiencedetails = (Experiencedetails) session.get(Experiencedetails.class, id);
		session.delete(experiencedetails);
	}
}
