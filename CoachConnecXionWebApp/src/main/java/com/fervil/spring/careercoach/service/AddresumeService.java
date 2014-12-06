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

import com.fervil.spring.careercoach.model.domain.ResumesCertificates;


/**
 * Service for processing Persons
 *     
 */   
@Service("addresumeService")
@Transactional
public class AddresumeService {
    private static final Logger logger = LoggerFactory.getLogger(AddresumeService.class);

	@Resource(name = "sessionFactory")
	private SessionFactory sessionFactory;
	
	
	
	public List<ResumesCertificates> getAllResumes() throws Exception {
		logger.debug("Dispaying all resumes details");
		Session session = sessionFactory.getCurrentSession();
		try {
			Query query = session.createQuery("FROM  ResumesCertificates order by id Desc");
			return query.list();
		} catch (Exception e) {
			logger.error("Exception " + e.getMessage());
		}
		return null;
	}

	public List<ResumesCertificates> getResumesById(long userProfileId) throws Exception {
		logger.debug("Dispaying all resumes details");
		Session session = sessionFactory.getCurrentSession();
		try {
			Query query = session.createQuery("FROM  ResumesCertificates where user_profile_id = " + userProfileId + " order by id Desc");
																			   
			return query.list();
		} catch (Exception e) {
			logger.error("Exception AddresumeService: getResumesById: " + e.getMessage());
		}
		return null;
	}
	
	
	
	public void save(ResumesCertificates resumescertificates)  throws Exception {
		logger.debug("Save new Resume details");
        Session session = sessionFactory.getCurrentSession();
        session.save(resumescertificates);
    }
	public ResumesCertificates get(Integer id)  throws Exception {
		logger.debug("getting  Resume details based on id");
        Session session = sessionFactory.getCurrentSession();
        return (ResumesCertificates)session.get(ResumesCertificates.class, id);
    }
	 public void remove(Integer id)  throws Exception {
		 logger.debug("Remove Resume details based on id");
	        Session session = sessionFactory.getCurrentSession();
	        ResumesCertificates resumescertificates = (ResumesCertificates)session.get(ResumesCertificates.class, id);         
	        session.delete(resumescertificates);
	    }
}