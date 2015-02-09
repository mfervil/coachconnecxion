package com.connection.dao;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.LogicalExpression;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.mapping.Array;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.connection.model.Attachment;
import com.connection.model.Customer;
import com.connection.model.Message;
import com.connection.model.UserAttachment;
import com.connection.model.Usermessage;
@Repository("messageDao")
public class MessagedDaoImpl implements MessageDao {
	@Autowired
	private SessionFactory sessionFactory;

	
	public Message saveMessage(Message message2) {
		Session session=sessionFactory.openSession();
		//Transaction transaction=session.beginTransaction();
		try{
			Set<Attachment> attachments=new HashSet<Attachment>();
			attachments=(Set<Attachment>) message2.getAttachment(); 
			session.save(message2);
			Iterator<Attachment> iterator=attachments.iterator();
			System.out.println("########## MESSAGEID "+message2.getMessageid()); 
			while(iterator.hasNext()){
				Attachment attachment=iterator.next();
				attachment.setMessageid(message2); 
				session.save(attachment); 
			}
			//transaction.commit();
			Iterator<Attachment> iterator1=message2.getAttachment().iterator(); 
			System.out.println("########## MESSAGEID "+message2.getMessageid()); 
			while(iterator1.hasNext()){
				System.out.println("&&&&&&&&&&&&&&&&&&&&&&  "+iterator1.next().getAttachid()); 
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return message2; 
		
	}


	

	@SuppressWarnings("unchecked")
	public List<Message> getUserMessages(Customer fromCustomer, Customer toCustomer) { 
		List<Message> messages=new ArrayList<Message>();
		//Customer customer=new Customer();
		//Customer customer1=new Customer();
		//customer.setCustomerid(customerid);
		//customer1.setCustomerid(id); 
		Session session=sessionFactory.openSession();
		//Transaction transaction=session.beginTransaction(); 
		//String SQL_QUERY = "FROM Message where (fromuser=:fromuser1 and touser=:touser1) or (fromuser=:fromuser2 and touser=:touser2)";
		
		Criteria crit = session.createCriteria(Message.class); 
		
		Criterion touser = Restrictions.eq("touser",toCustomer); 
		Criterion fromuser = Restrictions.eq("fromuser", fromCustomer);    
		LogicalExpression andExp = Restrictions.and(touser,fromuser); 
		Criterion touser2 = Restrictions.eq("touser",fromCustomer ); 
		Criterion fromuser2 = Restrictions.eq("fromuser", toCustomer);     
		
		LogicalExpression andExp1 = Restrictions.and(fromuser2,touser2); 
		LogicalExpression orExp = Restrictions.or(andExp,andExp1); 
		//Criterion test1=Restrictions.eq("description", "hello");
		//Criterion test2=Restrictions.eq("description", "TEST SERVICES");
		//LogicalExpression orExp = Restrictions.or(Restrictions.eq("description", "hello"),Restrictions.eq("description", "TEST SERVICES")); 
		crit.add(orExp);    
		crit.addOrder(Order.desc("date"));
		crit.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY); 
		messages=(List<Message>)crit.list();
		//transaction.commit();
		return messages;
	}




	@Override
	public List<Message> getUserMessagesUnRead(Customer fromCustomer,
			Customer toCustomer) {
		List<Message> messages=new ArrayList<Message>();
		//Customer customer=new Customer();
		//Customer customer1=new Customer();
		//customer.setCustomerid(customerid);
		//customer1.setCustomerid(id); 
		Session session=sessionFactory.openSession();
		//Transaction transaction=session.beginTransaction(); 
		//String SQL_QUERY = "FROM Message where (fromuser=:fromuser1 and touser=:touser1) or (fromuser=:fromuser2 and touser=:touser2)";
		
		Criteria crit = session.createCriteria(Message.class); 
		
		Criterion touser = Restrictions.eq("touser",toCustomer); 
		Criterion fromuser = Restrictions.eq("fromuser", fromCustomer);    
		LogicalExpression andExp = Restrictions.and(touser,fromuser); 
		Criterion touser2 = Restrictions.eq("touser",fromCustomer ); 
		Criterion fromuser2 = Restrictions.eq("fromuser", toCustomer);     
		Criterion unRead = Restrictions.eq("read_status", "1");    
		LogicalExpression andExp1 = Restrictions.and(fromuser2,touser2); 
		LogicalExpression orExp = Restrictions.or(andExp,andExp1); 
		LogicalExpression totalAnd=Restrictions.and(orExp,unRead);
		//Criterion test1=Restrictions.eq("description", "hello");
		//Criterion test2=Restrictions.eq("description", "TEST SERVICES");
		//LogicalExpression orExp = Restrictions.or(Restrictions.eq("description", "hello"),Restrictions.eq("description", "TEST SERVICES")); 
		crit.add(totalAnd);     
		crit.addOrder(Order.desc("date"));
		crit.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY); 
		messages=(List<Message>)crit.list();
		//transaction.commit();
		System.out.println("TOTAL MESSAGE SIZE "+messages.size()); 
		return messages;
	}

/* ================================================================================================================================================= */

	public Usermessage saveUserMessage(Usermessage message2) {
		Session session=sessionFactory.openSession();
		//Transaction transaction=session.beginTransaction();
		try{
			Set<UserAttachment> attachments=new HashSet<UserAttachment>();
			attachments=(Set<UserAttachment>) message2.getUserattachment(); 
			session.save(message2);
			Iterator<UserAttachment> iterator=attachments.iterator();
			System.out.println("########## MESSAGEID "+message2.getMessageid()); 
			while(iterator.hasNext()){
				UserAttachment attachment=iterator.next();
				attachment.setMessageid(message2); 
				session.save(attachment); 
			}
			//transaction.commit();
			Iterator<UserAttachment> iterator1=message2.getUserattachment().iterator(); 
			System.out.println("########## MESSAGEID "+message2.getMessageid()); 
			while(iterator1.hasNext()){
				System.out.println("&&&&&&&&&&&&&&&&&&&&&&  "+iterator1.next().getAttachid()); 
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return message2; 
	}


	

	@SuppressWarnings("unchecked")
	public List<Usermessage> getUserMessagesByProfileId(long orderid) { 
		List<Usermessage> messages=new ArrayList<Usermessage>();
		//Customer customer=new Customer();
		//Customer customer1=new Customer();
		//customer.setCustomerid(customerid);
		//customer1.setCustomerid(id); 
		Session session=sessionFactory.openSession();
		//Transaction transaction=session.beginTransaction(); 
		//String SQL_QUERY = "FROM Message where (fromuser=:fromuser1 and touser=:touser1) or (fromuser=:fromuser2 and touser=:touser2)";
		
		Criteria crit = session.createCriteria(Message.class); 
/*		
		Criterion touser = Restrictions.eq("toprofileid",toProfileId); 
		Criterion fromuser = Restrictions.eq("fromprofileid", fromProfileId);    
		LogicalExpression andExp = Restrictions.and(touser,fromuser); 
		Criterion touser2 = Restrictions.eq("toprofileid",fromProfileId ); 
		Criterion fromuser2 = Restrictions.eq("fromprofileid", toProfileId);     
		
		LogicalExpression andExp1 = Restrictions.and(fromuser2,touser2); 
		LogicalExpression orExp = Restrictions.or(andExp,andExp1); 
		crit.add(orExp);    
*/		
		Criterion crtorderid = Restrictions.eq("orderid", orderid); 
		crit.add(crtorderid);    

		crit.addOrder(Order.desc("date"));
		crit.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY); 
		messages=(List<Usermessage>)crit.list();
		//transaction.commit();
		return messages;
	}

	@Override
	public List<Message> getUserMessagesUnReadByProfileId(long orderid) {
		List<Message> messages=new ArrayList<Message>();
		//Customer customer=new Customer();
		//Customer customer1=new Customer();
		//customer.setCustomerid(customerid);
		//customer1.setCustomerid(id); 
		Session session=sessionFactory.openSession();
		//Transaction transaction=session.beginTransaction(); 
		//String SQL_QUERY = "FROM Message where (fromuser=:fromuser1 and touser=:touser1) or (fromuser=:fromuser2 and touser=:touser2)";
		
		Criteria crit = session.createCriteria(Message.class); 
/*		
		Criterion touser = Restrictions.eq("toprofileid",toProfileId); 
		Criterion fromuser = Restrictions.eq("fromprofileid", fromProfileId);    
		LogicalExpression andExp = Restrictions.and(touser,fromuser); 
		Criterion touser2 = Restrictions.eq("toprofileid",fromProfileId ); 
		Criterion fromuser2 = Restrictions.eq("fromprofileid", toProfileId);     
		Criterion unRead = Restrictions.eq("read_status", "1");    
		LogicalExpression andExp1 = Restrictions.and(fromuser2,touser2); 
		LogicalExpression orExp = Restrictions.or(andExp,andExp1); 
		LogicalExpression totalAnd=Restrictions.and(orExp,unRead);
*/
		
		//Criterion test1=Restrictions.eq("description", "hello");
		//Criterion test2=Restrictions.eq("description", "TEST SERVICES");
		//LogicalExpression orExp = Restrictions.or(Restrictions.eq("description", "hello"),Restrictions.eq("description", "TEST SERVICES")); 

		Criterion unRead = Restrictions.eq("read_status", "1");    
		Criterion crtorderid = Restrictions.eq("orderid", orderid); 
		LogicalExpression totalAnd=Restrictions.and(crtorderid,unRead);

		crit.add(crtorderid);    
		
		
		crit.add(totalAnd);     
		crit.addOrder(Order.desc("date"));
		crit.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY); 
		messages=(List<Message>)crit.list();
		//transaction.commit();
		System.out.println("TOTAL MESSAGE SIZE "+messages.size()); 
		return messages;
	}
}