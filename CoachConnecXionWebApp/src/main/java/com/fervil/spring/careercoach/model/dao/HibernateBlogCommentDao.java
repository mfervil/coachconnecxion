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

@Repository
public class HibernateBlogCommentDao implements BlogCommentDao {

	@Autowired
	private SessionFactory sessionFactory;

    private static final Logger log = LoggerFactory.getLogger(HibernateBlogPostDao.class);

	@Override
	public void store(BlogComment blogComment) throws Exception {
		// TODO Auto-generated method stub

		try {

			sessionFactory.getCurrentSession().saveOrUpdate(blogComment);
		} catch (Exception e) {
			e.printStackTrace();	
			throw e;

			// } finally {
			// session.close();

		}
		
	}

	@Override
	public BlogComment findById(long id) throws Exception {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		ThreadLocalSessionContext.bind(session);

		try {
			BlogComment bc = (BlogComment) sessionFactory.getCurrentSession()
					.get(BlogComment.class, id);

			return bc;
		} catch (Exception e) {
			throw e;
		} finally {
			session.close();
		}
	}

	@Override
	public List<BlogComment> findByBlogId(long blogId) throws Exception {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		ThreadLocalSessionContext.bind(session);

		try {

			Criteria crit = sessionFactory.getCurrentSession().createCriteria(
					BlogComment.class);
			
			crit.add(Restrictions.eq("blogid", blogId));
			crit.addOrder(Order.desc("createddate"));
			List list = crit.list();
			return ((List<BlogComment>) list);

		} catch (Exception e) {
			throw e;
		} finally {
			session.close();
		}
	}

	@Override
	public List<BlogComment> findByBlogIdStatus(long blogId, int status) throws Exception {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		ThreadLocalSessionContext.bind(session);

		try {

			Criteria crit = sessionFactory.getCurrentSession().createCriteria(
					BlogComment.class);
			
			crit.add(Restrictions.eq("blogid", blogId));
			crit.add(Restrictions.eq("status", status));
			
			crit.addOrder(Order.desc("createddate"));
			List list = crit.list();
			return ((List<BlogComment>) list);

		} catch (Exception e) {
			throw e;
		} finally {
			session.close();
		}
	}


}
