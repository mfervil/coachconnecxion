package com.fervil.spring.careercoach.service;

import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fervil.spring.careercoach.model.domain.CategoryDetails;

/**
 * Service for processing Persons
 * 
 */
@Service("categoryService")
@Transactional
public class CategoryService {
    private static final Logger logger = LoggerFactory.getLogger(CategoryService.class);

	@Resource(name = "sessionFactory")
	private SessionFactory sessionFactory;

	/**
	 * Retrieves all persons
	 * 
	 * @return a list of categoryId
	 */
	public Map<Integer, String> getAllCategory()  throws Exception {
		logger.debug("Retrieving all Packages");

		// Retrieve session from Hibernate
		Session session = sessionFactory.getCurrentSession();

		// Create a Hibernate query (HQL)
		Map<Integer, String> MapData=new LinkedHashMap<Integer,String>();
		try {
			Query query = session.createQuery("FROM  CategoryDetails");
			List results = query.list();
			for (Iterator iter = results.iterator(); iter.hasNext();) {
				CategoryDetails categoryData = (CategoryDetails) iter.next();
				Integer id = categoryData.getCategoryId();
				String value = categoryData.getCategoryName();
				MapData.put(id, value);
				
			}
			return MapData;
		} catch (Exception e) {
			logger.error("Exception " + e.getMessage());
		}
		return null;
	}

}