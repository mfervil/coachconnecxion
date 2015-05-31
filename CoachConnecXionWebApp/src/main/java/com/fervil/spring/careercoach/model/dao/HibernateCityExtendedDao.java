package com.fervil.spring.careercoach.model.dao;

import java.util.HashMap;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.context.internal.ThreadLocalSessionContext;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fervil.spring.careercoach.model.domain.CityExtended;

@Repository
public class HibernateCityExtendedDao implements CityExtendedDao {

	@Autowired
	private SessionFactory sessionFactory;

    private static final Logger log = LoggerFactory.getLogger(HibernateCityExtendedDao.class);

	@Override
	public CityExtended findById(int id) throws Exception {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		ThreadLocalSessionContext.bind(session);

		try {
			CityExtended cityext = (CityExtended) sessionFactory.getCurrentSession()
					.get(CityExtended.class, id);

			return cityext;
		} catch (Exception e) {
			throw e;
		} finally {
			session.close();
		}
	}

	@Override
	public List<CityExtended> findByState(String statecode) throws Exception {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		ThreadLocalSessionContext.bind(session);

		try {

			Criteria crit = sessionFactory.getCurrentSession().createCriteria(
					CityExtended.class);
			
			crit.add(Restrictions.eq("statecode", statecode));
			crit.addOrder(Order.desc("city"));
			List list = crit.list();
			return ((List<CityExtended>) list);

		} catch (Exception e) {
			throw e;
		} finally {
			session.close();
		}
	}

	@Override
	public List<HashMap> findCitiesWithCoaches(String statecode, int coachType) throws Exception {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		ThreadLocalSessionContext.bind(session);

		try {

			String sql = "select distinct u.city, c.state_code, s.state " +
				" from cities_extended c, user_profile u, states s" +
				" Where c.state_code = '" + statecode + "'" +
				" and c.state_code = u.state " + 
				" and  (u.coachingcategory1 = " + coachType + " or " +
				"  u.coachingcategory2 = " + coachType + " or " +
				"  u.coachingcategory3 = " + coachType + ")" +
				" and s.state_code = c.state_code ";
			
			log.info(" The info is: " + sql);
			
			Query query = sessionFactory.getCurrentSession().createSQLQuery(sql); 
			
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			
			List list = query.list();
			return ((List<HashMap>) list);
			
			/*
			Criteria crit = sessionFactory.getCurrentSession().createCriteria(
					CityExtended.class);
			crit.add(Restrictions.eq("statecode", statecode));
			crit.addOrder(Order.desc("city"));
			List list = crit.list();
			return ((List<CityExtended>) list);
			*/
			
		} catch (Exception e) {
			throw e;
		} finally {
			session.close();
		}
	}
	
	
}
