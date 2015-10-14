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
import com.fervil.spring.careercoach.model.domain.Contacttutor;

@Repository
public class HibernateContactTutorDao implements ContactTutorDao {

	@Autowired
	private SessionFactory sessionFactory;

    private static final Logger log = LoggerFactory.getLogger(HibernateBlogPostDao.class);

	@Override
	public void store(Contacttutor contacttutor) throws Exception {
		// TODO Auto-generated method stub

		try {

			sessionFactory.getCurrentSession().saveOrUpdate(contacttutor);
		} catch (Exception e) {
			e.printStackTrace();	
			throw e;

			// } finally {
			// session.close();

		}
		
	}

	@Override
	public Contacttutor findById(long id) throws Exception {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		ThreadLocalSessionContext.bind(session);

		try {
			Contacttutor bc = (Contacttutor) sessionFactory.getCurrentSession()
					.get(Contacttutor.class, id);

			return bc;
		} catch (Exception e) {
			throw e;
		} finally {
			session.close();
		}
	}

	@Override
	public List<Contacttutor> findAll() throws Exception {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		ThreadLocalSessionContext.bind(session);

		try {

			Criteria crit = sessionFactory.getCurrentSession().createCriteria(
					Contacttutor.class);
			
			List list = crit.list();
			return ((List<Contacttutor>) list);

		} catch (Exception e) {
			throw e;
		} finally {
			session.close();
		}
	}

}
