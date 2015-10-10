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

import com.fervil.spring.careercoach.model.domain.BlogPost;

@Repository
public class HibernateBlogPostDao implements BlogPostDao {

	@Autowired
	private SessionFactory sessionFactory;

    private static final Logger log = LoggerFactory.getLogger(HibernateBlogPostDao.class);
	
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
	public void store(BlogPost blogPost)  throws Exception {
		// Session session = sessionFactory.openSession();
		// Transaction tx = sessionFactory.getCurrentSession().getTransaction();
		try {

			sessionFactory.getCurrentSession().saveOrUpdate(blogPost);
		} catch (Exception e) {
			e.printStackTrace();	
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
			BlogPost blogPost = (BlogPost) sessionFactory
					.getCurrentSession().get(BlogPost.class, id);
			session.delete(blogPost);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			throw e;
		} finally {
			session.close();
		}
	}

	@Override
	public List<BlogPost> findAll() throws Exception {

		try {
			// session.beginTransaction();
			List list = sessionFactory.getCurrentSession()
					.createCriteria(BlogPost.class).list();
			return ((List<BlogPost>) list);

		} catch (Exception e) {
			// tx.rollback();
			throw e;
		}
	}

	@Override
	public List<BlogPost> findRecentBlogPosts(int count) throws Exception {

		try {
			// session.beginTransaction();
			List list = sessionFactory.getCurrentSession()
					.createCriteria(BlogPost.class).addOrder(Order.desc("publishyear")).setMaxResults(count).list();
			return ((List<BlogPost>) list);

		} catch (Exception e) {
			// tx.rollback();
			throw e;
		}
	}
	
	
	@Override
	public BlogPost findById(long id)  throws Exception {
		Session session = sessionFactory.openSession();
		ThreadLocalSessionContext.bind(session);

		try {
			BlogPost bp = (BlogPost) sessionFactory.getCurrentSession()
					.get(BlogPost.class, id);

			return bp;
		} catch (Exception e) {
			throw e;
		} finally {
			session.close();
		}
	}
	
	@Override
	public List<BlogPost> findByUserProfileId(long userId)  throws Exception {
		Session session = sessionFactory.openSession();
		ThreadLocalSessionContext.bind(session);

		try {

			Criteria crit = sessionFactory.getCurrentSession().createCriteria(
					BlogPost.class);
			
			crit.add(Restrictions.eq("blogid", userId));
			crit.addOrder(Order.desc("publishdate"));
			List list = crit.list();
			return ((List<BlogPost>) list);

		} catch (Exception e) {
			throw e;
		} finally {
			session.close();
		}
	}

	@Override
	public List<BlogPost> findBlogPostsByMonthYear(int month, int year) throws Exception {
		Session session = sessionFactory.openSession();
		ThreadLocalSessionContext.bind(session);
	
		try {
	
			Criteria crit = sessionFactory.getCurrentSession().createCriteria(
					BlogPost.class);
			
			crit.add(Restrictions.eq("publishyear", year));
			crit.add(Restrictions.eq("publishmonth", month));
			crit.addOrder(Order.desc("publishdate"));
			List list = crit.list();
			return ((List<BlogPost>) list);
	
		} catch (Exception e) {
			throw e;
		} finally {
			session.close();
		}
	}	
}
