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

import com.fervil.spring.careercoach.model.domain.CoachingCategory;
import com.fervil.spring.careercoach.model.domain.RequestDetails;

@Service("requestDetailService")
@Transactional
public class RequestDetailService {
    private static final Logger logger = LoggerFactory.getLogger(RequestDetailService.class);

	@Resource(name = "sessionFactory")
	private SessionFactory sessionFactory;
	Integer noOfRecords;
	Integer noOfRecords1;
	
	public int getNoOfRecords()  throws Exception {
		Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("FROM  RequestDetails ");
			noOfRecords=query.list().size();
			
        return noOfRecords;
    }
	
	public int getNoOfRecords1(List<Integer> categoryListData) throws Exception {
		Session session = sessionFactory.getCurrentSession();
//		try {
			Query query = null;
			String categroyId="";
			String mg = "";
			for (int i = 0; i < categoryListData.size(); i++) {				
				categroyId = categroyId+" " +" "+mg+" "+ "coachingcategoryId=" + categoryListData.get(i);
				mg = "or";
			}
			String fianlQuery="FROM  RequestDetails where"+categroyId;	
			query = session.createQuery(fianlQuery);
			noOfRecords1=query.list().size();	
        return noOfRecords1;
    }
	
	public RequestDetails get(Integer id)  throws Exception {
		Session session = sessionFactory.getCurrentSession();
		RequestDetails requestDetails = (RequestDetails) session.get(RequestDetails.class, id);
		float i1 = requestDetails.getDesiredRate();
 		return requestDetails;
	}

	public List<RequestDetails> getAll()  throws Exception {
		Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("FROM  RequestDetails order by id Desc");
			return query.list();
	}
	
	public List<RequestDetails> getAll(int offset,int noOfRecords)  throws Exception {
		Session session = sessionFactory.getCurrentSession();
		
			Query query = session.createQuery("FROM  RequestDetails order by id Desc");
			query.setFirstResult(offset);
			query.setMaxResults(noOfRecords);
			return query.list();
	}
	
	public List<RequestDetails> getRequestedData(List<Integer> categoryListData)  throws Exception {
		Session session = sessionFactory.getCurrentSession();
		List<RequestDetails> requestDetails = null;	
			Query query = null;
			String categroyId="";
			String mg = "";
			for (int i = 0; i < categoryListData.size(); i++) {				
				categroyId = categroyId+" " +" "+mg+" "+ "coachingcategoryId=" + categoryListData.get(i);
				mg = "or";
			}
			String fianlQuery="FROM  RequestDetails where"+categroyId + " order by id Desc";			
			query = session.createQuery(fianlQuery);		
			return query.list();						
	}
	public List<RequestDetails> getRequestedDatawithLimit(List<Integer> categoryListData,int offset,int noOfRecords)  throws Exception {
		Session session = sessionFactory.getCurrentSession();
		List<RequestDetails> requestDetails = null;	
			Query query = null;
			String categroyId="";
			String mg = "";
			for (int i = 0; i < categoryListData.size(); i++) {				
				categroyId = categroyId+" " +" "+mg+" "+ "coachingcategoryId=" + categoryListData.get(i);
				mg = "or";
			}
			String fianlQuery="FROM  RequestDetails where"+categroyId +" order by id Desc";			
			query = session.createQuery(fianlQuery);
		
			query.setFirstResult(offset);
			query.setMaxResults(noOfRecords);
			return query.list();		
	}
	public List<CoachingCategory> getRequestedData1(Integer id)  throws Exception {
		Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("FROM  CoachingCategory where parentId='" + id+ "'");
			return query.list();
	}

	public List<CoachingCategory> getCoachingCategory()  throws Exception  {
		Session session = sessionFactory.getCurrentSession();
			Query query = session
					.createQuery("FROM  CoachingCategory where coaching_category_parent_id='0'");
			return query.list();
	}

	public List<CoachingCategory> getSubCoachingCategory(Integer id)  throws Exception {
		Session session = sessionFactory.getCurrentSession();
			Query query = session
					.createQuery("FROM  CoachingCategory where coaching_category_parent_id='"
							+ id + "'");
			return query.list();
	}

	public void add(RequestDetails requestDetails)  throws Exception {
		Session session = sessionFactory.getCurrentSession();
		session.save(requestDetails);
	}

	public String getparentName(Integer id)  throws Exception {
		Session session = sessionFactory.getCurrentSession();
		String name1 = "";
		String name2 = "";

			int parentID = 0;
			Query query = session
					.createQuery("FROM  CoachingCategory where coaching_category_id='"
							+ id + "'");
			List<CoachingCategory> results = query.list();
			for (int i = 0; i < results.size(); i++) {
				parentID = results.get(i).getParentId();
				name1 = results.get(i).getCategoryName();
			}
			if (parentID != 0) {
				Query query1 = session
						.createQuery("FROM  CoachingCategory where coaching_category_id='"
								+ parentID + "'");
				List<CoachingCategory> results1 = query1.list();
				for (int i = 0; i < results1.size(); i++) {
					name2 = results1.get(i).getCategoryName();
				}
			}
			return name2 + " " + name1;
	}
}
