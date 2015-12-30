package com.fervil.spring.careercoach.model.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.context.internal.ThreadLocalSessionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fervil.spring.careercoach.model.domain.ContactCoach;

@Repository
public class HibernateContactCoachDao implements ContactCoachDao {

	@Autowired
	private SessionFactory sessionFactory;

    private static final Logger log = LoggerFactory.getLogger(HibernateBlogPostDao.class);

	@Override
	public void store(ContactCoach contactcoach) throws Exception {
		// TODO Auto-generated method stub

		try {

			sessionFactory.getCurrentSession().saveOrUpdate(contactcoach);
		} catch (Exception e) {
			e.printStackTrace();	
			throw e;

			// } finally {
			// session.close();

		}
		
	}

	@Override
	public ContactCoach findById(long id) throws Exception {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		ThreadLocalSessionContext.bind(session);

		try {
			ContactCoach bc = (ContactCoach) sessionFactory.getCurrentSession()
					.get(ContactCoach.class, id);

			return bc;
		} catch (Exception e) {
			throw e;
		} finally {
			session.close();
		}
	}

	@Override
	public List<ContactCoach> findAll() throws Exception {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		ThreadLocalSessionContext.bind(session);

		try {

			Criteria crit = sessionFactory.getCurrentSession().createCriteria(
					ContactCoach.class);
			
			List list = crit.list();
			return ((List<ContactCoach>) list);

		} catch (Exception e) {
			throw e;
		} finally {
			session.close();
		}
	}

}
