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

import com.fervil.spring.careercoach.model.domain.ProfileMedias;


/**
 * Service for processing Persons
 * 
 */
@Service("addProfileService")
@Transactional
public class AddProfileMediaService {
    private static final Logger logger = LoggerFactory.getLogger(AddProfileMediaService.class);
    
	@Resource(name = "sessionFactory")
	private SessionFactory sessionFactory;
	
	
	
	public List<ProfileMedias> getAllProfileMedias() throws Exception {
		logger.debug("Dispaying all Media details");
		Session session = sessionFactory.getCurrentSession();
		try {
			Query query = session.createQuery("FROM  PROFILEMEDIAINFO order by id Desc");
			return query.list();
		} catch (Exception e) {
			logger.error("Exception " + e.getMessage());
		}
		return null;
	}

	public List<ProfileMedias> getProfileMediasById(long userProfileId) throws Exception {
		logger.debug("Dispaying all Profile Media details");
		Session session = sessionFactory.getCurrentSession();
		try {
			Query query = session.createQuery("FROM  ResumesCertificates where user_profile_id = " + userProfileId + " order by id Desc");
																			   
			return query.list();
		} catch (Exception e) {
			logger.error("Exception AddresumeService: getResumesById: " + e.getMessage());
		}
		return null;
	}
	
	public void save(ProfileMedias profileMedias)  throws Exception {
		logger.debug("Save new Media details");
        Session session = sessionFactory.getCurrentSession();
        session.save(profileMedias);
    }
	public ProfileMedias get(Integer id)  throws Exception {
		logger.debug("getting  Resume details based on id");
        Session session = sessionFactory.getCurrentSession();
        return (ProfileMedias)session.get(ProfileMedias.class, id);
    }
	 public void remove(Integer id)  throws Exception {
		 logger.debug("Remove Resume details based on id");
	        Session session = sessionFactory.getCurrentSession();
	        ProfileMedias profileMedias = (ProfileMedias)session.get(ProfileMedias.class, id);         
	        session.delete(profileMedias);
	    }
}