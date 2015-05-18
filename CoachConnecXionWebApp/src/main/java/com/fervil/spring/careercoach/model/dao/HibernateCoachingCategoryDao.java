package com.fervil.spring.careercoach.model.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.context.internal.ThreadLocalSessionContext;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fervil.spring.careercoach.model.domain.BlogComment;
import com.fervil.spring.careercoach.model.domain.BlogPost;
import com.fervil.spring.careercoach.model.domain.CoachingCategory;

@Repository
public class HibernateCoachingCategoryDao implements CoachingCategoryDao {

	@Autowired
	private SessionFactory sessionFactory;

    private static final Logger log = LoggerFactory.getLogger(HibernateBlogPostDao.class);

	@Override
	public void store(CoachingCategory coachingCategory) throws Exception {
		// TODO Auto-generated method stub

		try {

			sessionFactory.getCurrentSession().saveOrUpdate(coachingCategory);
		} catch (Exception e) {
			e.printStackTrace();	
			throw e;

			// } finally {
			// session.close();

		}
		
	}

	@Override
	public CoachingCategory findById(long id) throws Exception {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		ThreadLocalSessionContext.bind(session);

		try {
			CoachingCategory bc = (CoachingCategory) sessionFactory.getCurrentSession()
					.get(CoachingCategory.class, id);

			return bc;
		} catch (Exception e) {
			throw e;
		} finally {
			session.close();
		}
	}

	@Override
	public List<CoachingCategory> findAll() throws Exception {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		ThreadLocalSessionContext.bind(session);

		try {

			Criteria crit = sessionFactory.getCurrentSession().createCriteria(
					CoachingCategory.class);
			
			List list = crit.list();
			return ((List<CoachingCategory>) list);

		} catch (Exception e) {
			throw e;
		} finally {
			session.close();
		}
	}

}
