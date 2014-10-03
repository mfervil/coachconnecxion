package com.fervil.spring.careercoach.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fervil.spring.careercoach.model.domain.SubcategoryDetails;

@Service("subCategoryService")
@Transactional
public class SubCategoryService {
    private static final Logger logger = LoggerFactory.getLogger(SubCategoryService.class);

	@Resource(name = "sessionFactory")
	private SessionFactory sessionFactory;

	public List<SubcategoryDetails> getAllCategory(Integer id) throws Exception {
		logger.debug("Retrieving all Packages" + id);

		// Retrieve session from Hibernate
		Session session = sessionFactory.getCurrentSession();

		// Create a Hibernate query (HQL)		
			Query query = session.createQuery("FROM  SubcategoryDetails where parentid='"+id+"'");
			return query.list();
	}
}
