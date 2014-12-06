package com.fervil.spring.careercoach.service;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fervil.spring.careercoach.model.domain.EducationDetails;
import com.fervil.spring.careercoach.web.CoachingRequestController;

@Service("addEducationService")
@Transactional
public class AddEducationService {
    private static final Logger logger = LoggerFactory.getLogger(AddEducationService.class);

	@Resource(name = "sessionFactory")
	private SessionFactory sessionFactory;
	
	public List<EducationDetails> getAll() throws Exception {
		logger.debug("Displaying All education details");
		Session session = sessionFactory.getCurrentSession();
		try {
			Query query = session.createQuery("FROM  EducationDetails order by id Desc");
			return query.list();
		} catch (Exception e) {
			logger.error("Exception " + e.getMessage()); 
		}
		return null;
		
	}

	public List<EducationDetails> getEducationById(long userProfileId)  throws Exception {
		logger.debug("Displaying All education details: getEducationById");
		Session session = sessionFactory.getCurrentSession();
		try {
			Query query = session.createQuery("FROM  EducationDetails where user_profile_id = " + userProfileId + "order by id Desc");
			
			return query.list();
		} catch (Exception e) {
			logger.error("Exception: AddEducationService: getEducationById: " + e.getMessage()); 
		}
		return null;
	}
	
		
	
	
	public EducationDetails get(Integer id)  throws Exception {
		logger.debug("getting Education based on id");
		Session session = sessionFactory.getCurrentSession();
		EducationDetails educationDetails = (EducationDetails) session.get(EducationDetails.class, id);
		return educationDetails;
	}

	public void add(EducationDetails educationDetails)  throws Exception {	
		logger.debug("Adding new Education");
		Session session = sessionFactory.getCurrentSession();
		session.save(educationDetails);
	}

	public void delete(Integer id)  throws Exception {
		logger.debug("Deleting existing Education");
		Session session = sessionFactory.getCurrentSession();
		EducationDetails educationDetails = (EducationDetails) session.get(EducationDetails.class, id);
		session.delete(educationDetails);
	}

	
	public void edit(EducationDetails educationDetails)  throws Exception {
		logger.debug("Editing existing education Details");
		Session session = sessionFactory.getCurrentSession();
		EducationDetails existingEducation = (EducationDetails) session.get(EducationDetails.class, educationDetails.getId());
		existingEducation.setDegreeLevel(educationDetails.getDegreeLevel());
		existingEducation.setSchoolName(educationDetails.getSchoolName());
		existingEducation.setFromDate(educationDetails.getFromDate());
		existingEducation.setToDate(educationDetails.getToDate());
		existingEducation.setGraduatedId(educationDetails.getGraduatedId());
		existingEducation.setConcentrationsName(educationDetails.getConcentrationsName());
		existingEducation.setCountryName(educationDetails.getCountryName());
		existingEducation.setLocationsName(educationDetails.getLocationsName());
		session.save(existingEducation);
	}
}
