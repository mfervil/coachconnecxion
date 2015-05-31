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
import com.fervil.spring.careercoach.model.domain.State;

@Repository
public class HibernateStateDao implements StateDao {

	@Autowired
	private SessionFactory sessionFactory;

    private static final Logger log = LoggerFactory.getLogger(HibernateStateDao.class);

	@Override
	public State findById(String statecode) throws Exception {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		ThreadLocalSessionContext.bind(session);

		try {
			State state = (State) sessionFactory.getCurrentSession()
					.get(BlogComment.class, statecode);

			return state;
		} catch (Exception e) {
			throw e;
		} finally {
			session.close();
		}
	}

	@Override
	public List<State> getAllStates() throws Exception {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		ThreadLocalSessionContext.bind(session);

		try {

			Criteria crit = sessionFactory.getCurrentSession().createCriteria(
					BlogComment.class);
			
			crit.addOrder(Order.desc("state"));
			List list = crit.list();
			return ((List<State>) list);

		} catch (Exception e) {
			throw e;
		} finally {
			session.close();
		}
	}

}
