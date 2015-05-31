package com.fervil.spring.careercoach.model.dao;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.context.internal.ThreadLocalSessionContext;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fervil.spring.careercoach.model.domain.UserProfile;
import com.fervil.spring.careercoach.web.CoachSelectionFormController;

import java.util.HashMap;
import java.util.List;

@Repository
public class HibernateUserProfileDao implements UserProfileDao {

	@Autowired
	private SessionFactory sessionFactory;

	private ServiceRegistry serviceRegistry;

    private static final Logger log = LoggerFactory.getLogger(CoachSelectionFormController.class);
	
	/*
	 * public HibernateUserProfileDao() { Configuration configuration = new
	 * Configuration().configure();
	 * 
	 * serviceRegistry = new
	 * ServiceRegistryBuilder().applySettings(configuration
	 * .getProperties()).buildServiceRegistry(); sessionFactory =
	 * configuration.buildSessionFactory(serviceRegistry);
	 * 
	 * //sessionFactory = configuration. .buildSessionFactory(); }
	 */
	public void store(UserProfile UserProfile)  throws Exception {
		// Session session = sessionFactory.openSession();
		// Transaction tx = sessionFactory.getCurrentSession().getTransaction();
		try {

			// tx.begin();
			sessionFactory.getCurrentSession().saveOrUpdate(UserProfile);
			// session.save(UserProfile);

			// tx.commit();

		} catch (Exception e) {
			// tx.rollback();
			throw e;

			// } finally {
			// session.close();

		}
	}

	public void delete(long id)  throws Exception {
		Session session = sessionFactory.openSession();
		Transaction tx = session.getTransaction();
		try {
			tx.begin();
			UserProfile UserProfile = (UserProfile) sessionFactory
					.getCurrentSession().get(UserProfile.class, id);
			session.delete(UserProfile);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			throw e;
		} finally {
			session.close();
		}
	}

	public List<UserProfile> findAll() throws Exception {
		// Session session = sessionFactory.openSession();
		// ThreadLocalSessionContext.bind(session);

		try {
			// session.beginTransaction();
			List list = sessionFactory.getCurrentSession()
					.createCriteria(UserProfile.class).list();
			return ((List<UserProfile>) list);

			// Query query = sessionFactory.getCurrentSession().createQuery(
			// "from UserProfile");
			// return query.list();

		} catch (Exception e) {
			// tx.rollback();
			throw e;
		}
	}

	public String getInitialSQL(){
		
		String sql = " select u.city, u.state, u.user_profile_id, u.language, u.display_name, u.coaching_category, u.overview, u.profilepicture, u.profilepicturestring, u.profile_picture_type, " +
		" (select c.coaching_category_name from coaching_category c where u.coachingcategory1 = c.coaching_category_id) coaching_category_name1, " +
		" (select c.coaching_category_name from coaching_category c where u.coachingcategory2 = c.coaching_category_id) coaching_category_name2, " +
		" (select c.coaching_category_name from coaching_category c where u.coachingcategory3 = c.coaching_category_id) coaching_category_name3, " +
		" (select count(*) from packages_sold ps where ps.user_profile_id = u.user_profile_id) num_clients, " +  
		" (select min(p.price)  from package p where p.user_profile_id = u.user_profile_id) packages_from, " + 
		" (select avg(averagerating) from jobratingdetails j where j.user_profile_id=u.user_profile_id) rating " + 
		" from user_profile u ";
		
		return sql;
		
	}
	public String getCriteria(int coachingCategory,
			int coachingSubcategory, int industryExperience,
			String companyExperience, String coachFirstName,
			String coachLastName, String city, String state, int pageSize, int pageNumber)  throws Exception {

		String CRITERIA = "";
		
		if (coachingCategory > 0) CRITERIA = " where (coachingcategory1 = " + coachingCategory + " or coachingcategory2 = " + coachingCategory  + " or coachingcategory3 = " + coachingCategory + ") ";

		if (industryExperience > 0) {
			CRITERIA += CRITERIA.contains("where")?" and ":" where ";
			//CRITERIA = CRITERIA + " industry_experience = " + industryExperience;
			CRITERIA = CRITERIA + " (industryfocus1 = " + industryExperience + " or industryfocus2 = " + industryExperience  + " or industryfocus3 = " + industryExperience + ") ";				
		}

		if (companyExperience != null  && !companyExperience.equals("")) {
			CRITERIA += CRITERIA.contains("where")?" and ":" where ";
			//CRITERIA = CRITERIA + " company_experience like '%" + companyExperience + "%' ";
			CRITERIA = CRITERIA + " (companyexperience1 like '%" + companyExperience + "%' or companyexperience2 like '%" + companyExperience  + "%' or companyexperience3 = '%" + companyExperience + "%' ) ";
		}
		
		if (coachFirstName != null  && !coachFirstName.equals("")) {
			CRITERIA += CRITERIA.contains("where")?" and ":" where ";
			CRITERIA = CRITERIA + " firstname like '%" + coachFirstName + "%' ";
		}

		if (coachLastName != null  && !coachLastName.equals("")) {
			CRITERIA += CRITERIA.contains("where")?" and ":" where ";
			CRITERIA = CRITERIA + " lastname like '%" + coachLastName + "%' ";
		}

		if (city != null  && !city.equals("")) {
			CRITERIA += CRITERIA.contains("where")?" and ":" where ";
			CRITERIA = CRITERIA + " city like '%" + city + "%' ";
		}

		if (state != null  && !state.equals("")) {
			CRITERIA += CRITERIA.contains("where")?" and ":" where ";
			CRITERIA = CRITERIA + " state = '" + state + "' ";
		}

		CRITERIA += CRITERIA.contains("where")?" and ":" where ";
		CRITERIA = CRITERIA + " account_type = 1";

		return CRITERIA;
	}	

	public int findFilteredUserProfilesCount(int coachingCategory,
			int coachingSubcategory, int industryExperience,
			String companyExperience, String coachFirstName,
			String coachLastName, String city, String state, int pageSize, int pageNumber)  throws Exception {
		
		try {
			// session.beginTransaction();
			
		    log.info("Coaching Category: " + coachingCategory);
		    log.info("Coaching Sub Category: " + coachingSubcategory);

			Criteria crit = sessionFactory.getCurrentSession().createCriteria(
					UserProfile.class);

			String  CRITERIA = getCriteria(coachingCategory,
					coachingSubcategory, industryExperience,
					companyExperience, coachFirstName,
					coachLastName, city, state, pageSize, pageNumber);
	
			String sql = " select count(*) from user_profile u " + CRITERIA;
			
			log.info(" findFilteredUserProfilesCount:::: " + sql);

			int count = ((java.math.BigInteger)sessionFactory.getCurrentSession().createSQLQuery(sql).uniqueResult()).intValue() ; 
			
			//query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			//List list = query.list();
		    log.info(" findFilteredUserProfilesCount::Number of Coaches found: " + count);
		    
			return count;

		} catch (Exception e) {
			// tx.rollback();
			throw e;
		}
	}
	
	public List findFilteredUserProfiles(int coachingCategory,
			int coachingSubcategory, int industryExperience,
			String companyExperience, String coachFirstName,
			String coachLastName, String city, String state, int pageSize, int pageNumber)  throws Exception {

		try {
			// session.beginTransaction();
			
		    log.info("Coaching Category: " + coachingCategory);
		    log.info("Coaching Sub Category: " + coachingSubcategory);

			Criteria crit = sessionFactory.getCurrentSession().createCriteria(
					UserProfile.class);

			String  CRITERIA = getCriteria(coachingCategory,
					coachingSubcategory, industryExperience,
					companyExperience, coachFirstName,
					coachLastName, city, state, pageSize, pageNumber);

			/*
			 2/19/2015 Moved this code to getCriteria
			 
			String CRITERIA = "";
			
			if (coachingCategory > 0) CRITERIA = " where (coachingcategory1 = " + coachingCategory + " or coachingcategory2 = " + coachingCategory  + " or coachingcategory3 = " + coachingCategory + ") ";

			if (industryExperience > 0) {
				CRITERIA += CRITERIA.contains("where")?" and ":" where ";
				//CRITERIA = CRITERIA + " industry_experience = " + industryExperience;
				CRITERIA = CRITERIA + " (industryfocus1 = " + industryExperience + " or industryfocus2 = " + industryExperience  + " or industryfocus3 = " + industryExperience + ") ";				
			}

			if (companyExperience != null  && !companyExperience.equals("")) {
				CRITERIA += CRITERIA.contains("where")?" and ":" where ";
				//CRITERIA = CRITERIA + " company_experience like '%" + companyExperience + "%' ";
				CRITERIA = CRITERIA + " (companyexperience1 like '%" + companyExperience + "%' or companyexperience2 like '%" + companyExperience  + "%' or companyexperience3 = '%" + companyExperience + "%' ) ";
			}
			
			if (coachFirstName != null  && !coachFirstName.equals("")) {
				CRITERIA += CRITERIA.contains("where")?" and ":" where ";
				CRITERIA = CRITERIA + " firstname like '%" + coachFirstName + "%' ";
			}

			if (coachLastName != null  && !coachLastName.equals("")) {
				CRITERIA += CRITERIA.contains("where")?" and ":" where ";
				CRITERIA = CRITERIA + " lastname like '%" + coachLastName + "%' ";
			}

			if (city != null  && !city.equals("")) {
				CRITERIA += CRITERIA.contains("where")?" and ":" where ";
				CRITERIA = CRITERIA + " city like '%" + city + "%' ";
			}

			if (state != null  && !state.equals("")) {
				CRITERIA += CRITERIA.contains("where")?" and ":" where ";
				CRITERIA = CRITERIA + " state = '" + state + "' ";
			}

			CRITERIA += CRITERIA.contains("where")?" and ":" where ";
			CRITERIA = CRITERIA + " account_type = 1";
			*/
	
			String sql = getInitialSQL() + " " + CRITERIA;
			/*
			String sql = " select u.city, u.state, u.user_profile_id, u.language, u.display_name, u.coaching_category, u.overview, u.profilepicture, u.profilepicturestring, u.profile_picture_type, " +
			" (select c.coaching_category_name from coaching_category c where u.coachingcategory1 = c.coaching_category_id) coaching_category_name1, " +
			" (select c.coaching_category_name from coaching_category c where u.coachingcategory2 = c.coaching_category_id) coaching_category_name2, " +
			" (select c.coaching_category_name from coaching_category c where u.coachingcategory3 = c.coaching_category_id) coaching_category_name3, " +
			" (select count(*) from packages_sold ps where ps.user_profile_id = u.user_profile_id) num_clients, " +  
			" (select min(p.price)  from package p where p.user_profile_id = u.user_profile_id) packages_from, " + 
			" (select avg(averagerating) from jobratingdetails j where j.user_profile_id=u.user_profile_id) rating " + 
			" from user_profile u " +
			 CRITERIA;
			*/
			
			log.info(" findFilteredUserProfiles:::: " + sql);

			Query query = sessionFactory.getCurrentSession().createSQLQuery(sql); 
		    log.info("1 findFilteredUserProfiles::Number of Coaches found: " + query.list().size());
			
	        //query.setFirstResult(((pageNumber - 1) * pageSize) + 1 );

	        query.setFirstResult(((pageNumber - 1) * pageSize) );
	        log.info("2 findFilteredUserProfiles::Number of Coaches found: " + query.list().size());
	        query.setMaxResults(pageSize);
			
		    log.info("3 findFilteredUserProfiles::Number of Coaches found: " + query.list().size());
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
		    log.info("4 findFilteredUserProfiles::Number of Coaches found: " + query.list().size());
			List list = query.list();
		    log.info("5 findFilteredUserProfiles::Number of Coaches found: " + query.list().size());
		    
			return ((List<HashMap>) list);

		} catch (Exception e) {
			// tx.rollback();
			throw e;
		}
	}
	
	public void delete(String id)  throws Exception {
		Session session = sessionFactory.openSession();
		Transaction tx = session.getTransaction();
		try {
			tx.begin();
			UserProfile userProfile = (UserProfile) sessionFactory
					.getCurrentSession().get(UserProfile.class, id);
			session.delete(userProfile);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			throw e;
		} finally {
			session.close();
		}

	}

	public UserProfile findById(String id)  throws Exception {
		Session session = sessionFactory.openSession();
		ThreadLocalSessionContext.bind(session);

		try {
			UserProfile up = (UserProfile) sessionFactory.getCurrentSession()
					.get(UserProfile.class, Long.valueOf(id));

			return up;
		} catch (Exception e) {
			throw e;
		} finally {
			session.close();
		}
	}
	
	public UserProfile findById(long id)  throws Exception {
		Session session = sessionFactory.openSession();
		ThreadLocalSessionContext.bind(session);

		try {
			UserProfile up = (UserProfile) sessionFactory.getCurrentSession()
					.get(UserProfile.class, id);

			return up;
		} catch (Exception e) {
			throw e;
		} finally {
			session.close();
		}
	}
	
	public List<UserProfile> findByUserId(long userId)  throws Exception {
		Session session = sessionFactory.openSession();
		ThreadLocalSessionContext.bind(session);

		try {

			Criteria crit = sessionFactory.getCurrentSession().createCriteria(
					UserProfile.class);
			
			crit.add(Restrictions.eq("user_user_id", userId));
			crit.addOrder(Order.desc("userProfileId"));
			List list = crit.list();
			return ((List<UserProfile>) list);

		} catch (Exception e) {
			throw e;
		} finally {
			session.close();
		}
	}
	
}
