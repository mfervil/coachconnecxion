package com.fervil.spring.careercoach.service;

import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fervil.spring.careercoach.model.domain.JobratingDetails;

@Service("jobRatingService")
@Transactional
public class JobRatingService {
    private static final Logger logger = LoggerFactory.getLogger(JobRatingService.class);

	@Resource(name = "sessionFactory")
	private SessionFactory sessionFactory;

	public List<JobratingDetails> getAll()  throws Exception {
		Session session = sessionFactory.getCurrentSession();
		try {
			Query query = session
					.createQuery("FROM  JobratingDetails order by ratingDone ASC");
			return query.list();
		} catch (Exception e) {
			logger.error("Exception " + e.getMessage());
		}
		return null;
	}

	public Float getProfileRating(long Id)  throws Exception {
		Session session = sessionFactory.getCurrentSession();
		float ratingData = 0;
		int count = 0;
		try {
			Query query = session.createQuery("SELECT averageRating FROM  JobratingDetails where user_profile_id='"+ Id + "'");
			List results = query.list();
			Iterator it = results.iterator();
			while (it.hasNext()) {
				Float obj = (Float) it.next();
				ratingData = ratingData + obj;
				count++;
			}
			if (count > 0) ratingData = ratingData / count;
			return ratingData;
		} catch (Exception e) {
			logger.error("Exception " + e.getMessage());
		}
		return ratingData;
	}

	public Integer totalClientCount(long Id)  throws Exception {
		Session session = sessionFactory.getCurrentSession();
		float ratingData = 0;
		int count = 0;
		try {
			Query query = session
					.createQuery("SELECT averageRating FROM  JobratingDetails where user_profile_id='"
							+ Id + "'");
			List results = query.list();
			Iterator it = results.iterator();
			while (it.hasNext()) {
				Float obj = (Float) it.next();
				ratingData = ratingData + obj;
				count++;
			}
			ratingData = ratingData / count;
			return count;
		} catch (Exception e) {
			logger.error("Exception " + e.getMessage());
		}
		return count;
	}

	public JobratingDetails get(Integer id)  throws Exception {
		Session session = sessionFactory.getCurrentSession();
		JobratingDetails jobratingDetails = (JobratingDetails) session.get(
				JobratingDetails.class, id);
		return jobratingDetails;
	}

	public JobratingDetails getByPaymentId(Integer paymentId)  throws Exception {
		Session session = sessionFactory.getCurrentSession();
		JobratingDetails jobratingDetails = (JobratingDetails) session.get(
				JobratingDetails.class, paymentId);
		return jobratingDetails;
	}
	
	public boolean ratingDone(long paymentId)  throws Exception {
		Session session = sessionFactory.getCurrentSession();

		Criteria crit = sessionFactory.getCurrentSession().createCriteria(
				JobratingDetails.class);
		
		crit.add(Restrictions.eq("paymentId", paymentId));
		List<JobratingDetails> jrlist = crit.list(); 

		if (jrlist.isEmpty())
			return false;
		else
			return true;
	}

	public void add(JobratingDetails jobratingDetails)  throws Exception {
		Session session = sessionFactory.getCurrentSession();
		session.save(jobratingDetails);
	}

	public void edit(JobratingDetails jobratingDetails)  throws Exception {
		logger.debug("Editing existing Package");
		Session session = sessionFactory.getCurrentSession();
		long paymentId = jobratingDetails.getPaymentId();
		
		
		Criteria crit = sessionFactory.getCurrentSession().createCriteria(
				JobratingDetails.class);
		
		crit.add(Restrictions.eq("paymentId", paymentId));
		crit.addOrder(Order.desc("ratingDate"));
		List<JobratingDetails> jrlist = crit.list(); 

		JobratingDetails existingJobrating = null;
		
		if (jrlist.isEmpty())
			existingJobrating = new JobratingDetails();
		else
			existingJobrating = jrlist.get(0);
		
		existingJobrating.setPackageId(jobratingDetails.getPackageId());
		existingJobrating.setPaymentId(jobratingDetails.getPaymentId());
		existingJobrating.setCommentDetails(jobratingDetails.getCommentDetails());
		existingJobrating.setProjectName(jobratingDetails.getProjectName());
		existingJobrating.setVendorName(jobratingDetails.getVendorName());
		
		existingJobrating.setVendorId(jobratingDetails.getVendorId());
		existingJobrating.setCustomerId(jobratingDetails.getCustomerId());
		existingJobrating.setProjectName(jobratingDetails.getProjectName());
		existingJobrating.setClientName(jobratingDetails.getClientName());
		existingJobrating.setAwardedDate(jobratingDetails.getAwardedDate());
		existingJobrating.setFeedBacks(jobratingDetails.getFeedBacks());
		existingJobrating.setCommentDetails(jobratingDetails.getCommentDetails());
		existingJobrating.setQualityDetails(jobratingDetails.getQualityDetails());
		existingJobrating.setResponseDetails(jobratingDetails.getResponseDetails());
		existingJobrating.setExperienceDetails(jobratingDetails.getExperienceDetails());
		existingJobrating.setProfessionalismDetails(jobratingDetails.getProfessionalismDetails());
		existingJobrating.setAverageRating(jobratingDetails.getAverageRating());
		existingJobrating.setRatingDate(jobratingDetails.getRatingDate());
		existingJobrating.setRatingDone(1);
		
		session.saveOrUpdate(existingJobrating);
	}

	public String updateResponse(String id, String responseData)  throws Exception {
		Session session = sessionFactory.getCurrentSession();
		Query query = session
				.createQuery("update JobratingDetails set comments ='"+responseData+"',clientresponse='1' where id = '"+id+"'");	
		int result = query.executeUpdate();
		return null;
	}
}
