package com.fervil.spring.careercoach.model.dao;

import java.util.List;

import javax.imageio.spi.ServiceRegistry;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.context.internal.ThreadLocalSessionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.fervil.spring.careercoach.model.domain.CoachingRequest;

@Repository
public class HibernateCoachingRequestDao implements CoachingRequestDao {

	@Autowired
	private SessionFactory sessionFactory;
	private ServiceRegistry serviceRegistry;
	

/*	
	public HibernateCoachingRequestDao() {
		Configuration configuration = new Configuration().configure();
		//sessionFactory = configuration.buildSessionFactory();

	    serviceRegistry = new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();        
	    sessionFactory = configuration.buildSessionFactory(serviceRegistry);
		
		
	}
*/
	public void store(CoachingRequest CoachingRequest) throws Exception {

		//sessionFactory.getCurrentSession().saveOrUpdate(CoachingRequest);

		
		//Session session = sessionFactory.openSession();
		//Transaction tx = session.getTransaction();
		//Session session = sessionFactory.openSession();
		//ThreadLocalSessionContext.bind(session); 

		try {
			/*
			tx.begin();
			session.saveOrUpdate(CoachingRequest);
			
			tx.commit();
			*/

			sessionFactory.getCurrentSession().saveOrUpdate(CoachingRequest);
			
		} catch (Exception e) {
			//tx.rollback();			
			throw e;
		} //finally {
			//session.close();
		//}
	}

	public void delete(long id)  throws Exception {
		Session session = sessionFactory.openSession();
		Transaction tx = session.getTransaction();
		try {
			tx.begin();
			CoachingRequest CoachingRequest = (CoachingRequest) sessionFactory
					.getCurrentSession().get(CoachingRequest.class, id);
			session.delete(CoachingRequest);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			throw e;
		} finally {
			session.close();
		}
	}

	public List<CoachingRequest> findAll()  throws Exception {
		Session session = sessionFactory.openSession();
		ThreadLocalSessionContext.bind(session); 

		try {

			Query query = sessionFactory.getCurrentSession().createQuery(
					"from CoachingRequest");
			return query.list();
		} catch (Exception e) {
			//tx.rollback();
			throw e;
		} finally {
			session.close();
		}
	}

	public void delete(String id)  throws Exception {
		Session session = sessionFactory.openSession();
		Transaction tx = session.getTransaction();
		try {
			tx.begin();
			CoachingRequest coachingRequest = (CoachingRequest) sessionFactory
					.getCurrentSession().get(CoachingRequest.class, id);
			session.delete(coachingRequest);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			throw e;
		} finally {
			session.close();
		}
		
	}

	public CoachingRequest findById(long id)  throws Exception {
		Session session = sessionFactory.openSession();
		ThreadLocalSessionContext.bind(session); 
		
		try {
			CoachingRequest up =  (CoachingRequest)sessionFactory.getCurrentSession().get(
					CoachingRequest.class, id);
			
			return up;
		} catch (Exception e){
			throw e;
			//throw new Exception(e);
			//return null;
		} finally {
			session.close();
		}
	}
}
