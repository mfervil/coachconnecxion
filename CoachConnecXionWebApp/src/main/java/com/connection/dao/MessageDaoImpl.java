package com.connection.dao;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.FlushMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.StatelessSession;
import org.hibernate.Transaction;
import org.hibernate.context.internal.ThreadLocalSessionContext;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.LogicalExpression;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.mapping.Array;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.connection.model.Attachment;
import com.connection.model.Customer;
import com.connection.model.Message;
import com.connection.model.UserAttachment;
import com.connection.model.Usermessage;
import com.fervil.spring.careercoach.model.domain.CategoryDetails;
import com.fervil.spring.careercoach.model.domain.UserProfile;
@Repository("messageDao")
@Scope("prototype")
public class MessageDaoImpl implements MessageDao {
	@Autowired(required=false)
	private SessionFactory sessionFactory;

	public Usermessage saveUserMessage(Usermessage message2)  throws Exception{
		Set<UserAttachment> attachments=new HashSet<UserAttachment>();
		attachments=message2.getUserattachment();
		Iterator<UserAttachment> iterator=attachments.iterator();
		String extension="";
		
		StatelessSession session=sessionFactory.openStatelessSession();
		//Transaction transaction=session.beginTransaction();
		try{
		session.insert(message2);
		
		//Set<Attachment> attachments=new HashSet<Attachment>();
		//attachments=(Set<Attachment>) message2.getAttachment(); 
		//session.save(message2);
		//Iterator<Attachment> iterator=attachments.iterator();
		
		while(iterator.hasNext()){
			
			//Session session=sessionFactory.getCurrentSession();
		//	session.setFlushMode(FlushMode.COMMIT);
			//Transaction transaction=session.beginTransaction();
		UserAttachment attachment=iterator.next();
		try{
		attachment.setMessageid(message2); 
		session.insert(attachment);
		//transaction.commit(); 
		//session.
		}catch(Exception e){
			throw e;
			//e.printStackTrace();
			//transaction.rollback();
		}
		
	}
	
		//transaction.commit();
		session.close();
		}catch(Exception e){
			throw e;
			//e.printStackTrace();
			//transaction.rollback();
		}
		return message2;     
		
	}
	
	public Message saveMessage(Message message2)  throws Exception{
		Set<Attachment> attachments=new HashSet<Attachment>();
		attachments=message2.getAttachment();
		Iterator<Attachment> iterator=attachments.iterator();
		String extension="";
		StatelessSession session=sessionFactory.openStatelessSession();
		//Transaction transaction=session.beginTransaction();
		try{
		session.insert(message2);
		
		//Set<Attachment> attachments=new HashSet<Attachment>();
		//attachments=(Set<Attachment>) message2.getAttachment(); 
		//session.save(message2);
		//Iterator<Attachment> iterator=attachments.iterator();
		
		while(iterator.hasNext()){
			
			//Session session=sessionFactory.getCurrentSession();
		//	session.setFlushMode(FlushMode.COMMIT);
			//Transaction transaction=session.beginTransaction();
		Attachment attachment=iterator.next();
		try{
		attachment.setMessageid(message2); 
		session.insert(attachment);
		//transaction.commit(); 
		//session.
		}catch(Exception e){
			e.printStackTrace();
			//transaction.rollback();
		}
	}
		
		//transaction.commit();
		session.close();
		}catch(Exception e){
			throw e;
			//e.printStackTrace();
			//transaction.rollback();
		}
		return message2;     
		
	}
	public Message saveAttachment(Message message2) throws Exception{
		
		
		//session.beginTransaction();
		//session.flush();
		
			Set<Attachment> attachments=new HashSet<Attachment>();
			attachments=(Set<Attachment>) message2.getAttachment(); 
			//session.save(message2);
			Iterator<Attachment> iterator=attachments.iterator();
			
			while(iterator.hasNext()){
				
					Session session=sessionFactory.getCurrentSession();
					session.setFlushMode(FlushMode.COMMIT);
					//Transaction transaction=session.beginTransaction();
				Attachment attachment=iterator.next();
				try{
				attachment.setMessageid(message2); 
				session.save(attachment);
				//transaction.commit(); 
				//session.
				}catch(Exception e){
					throw e;
					//e.printStackTrace();
					//transaction.rollback();
				}
			}
			
		
		return message2;
		
	}

	public Usermessage saveUserAttachment(Usermessage message2) throws Exception{
		
		
		//session.beginTransaction();
		//session.flush();
		
			Set<UserAttachment> attachments=new HashSet<UserAttachment>();
			attachments=(Set<UserAttachment>) message2.getUserattachment();    
			//session.save(message2);
			Iterator<UserAttachment> iterator=attachments.iterator();
			
			while(iterator.hasNext()){
				
					Session session=sessionFactory.getCurrentSession();
					session.setFlushMode(FlushMode.COMMIT);
					//Transaction transaction=session.beginTransaction();
				UserAttachment attachment=iterator.next();
				try{
				attachment.setMessageid(message2); 
				session.save(attachment);
				//transaction.commit(); 
				//session.
				}catch(Exception e){
					throw e;
					//e.printStackTrace();
					//transaction.rollback();
				}
			}
			
		
		return message2;
		
	}

	

	@SuppressWarnings("unchecked")
	public List<Message> getUserMessages(Customer fromCustomer, Customer toCustomer)  throws Exception{ 
		List<Message> messages=new ArrayList<Message>();
		//Session session=sessionFactory.openSession(); 
		
		
		Session session=sessionFactory.getCurrentSession();  
		
		try{
		Criteria crit = session.createCriteria(Message.class); 
		
		Criterion touser = Restrictions.eq("touser",toCustomer); 
		Criterion fromuser = Restrictions.eq("fromuser", fromCustomer);    
		LogicalExpression andExp = Restrictions.and(touser,fromuser); 
		Criterion touser2 = Restrictions.eq("touser",fromCustomer ); 
		Criterion fromuser2 = Restrictions.eq("fromuser", toCustomer);     
		
		LogicalExpression andExp1 = Restrictions.and(fromuser2,touser2); 
		LogicalExpression orExp = Restrictions.or(andExp,andExp1); 
		crit.add(orExp);    
		crit.addOrder(Order.desc("date"));
		crit.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY); 
		
		
		messages.addAll((List<Message>)crit.list()); 
		//transaction.commit(); 
		}catch(Exception e){
			throw e;
			//transaction.rollback();
		}
		//transaction.commit(); 
		
		return messages;
		
	}

	@Override
	public List<Message> getUserMessagesUnRead(Customer fromCustomer,
			Customer toCustomer)  throws Exception{
		List<Message> messages=new ArrayList<Message>();
		
		Session session=sessionFactory.getCurrentSession();
		session.flush();
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
		crit.add(totalAnd);     
		crit.addOrder(Order.desc("date"));
		crit.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY); 
		
		
		return messages;
	}

	@Override
	public List<Usermessage> getUserMessagesByProfileId (long orderid)  throws Exception{
		List<Usermessage> messages=new ArrayList<Usermessage>();
		//Session session=sessionFactory.openSession(); 
		
		Session session=sessionFactory.getCurrentSession();  
		
		//session.flush();
		//session.clear();
	//	session.close();
		//Transaction transaction=session.beginTransaction();
		//transaction.begin();
		try{
		Criteria crit = session.createCriteria(Usermessage.class); 

/*		
		Criterion touser = Restrictions.eq("toprofileid", toProfileId); 
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
		
		messages.addAll((List<Usermessage>)crit.list()); 
		//transaction.commit(); 
		}catch(Exception e){
			throw e;
			//e.printStackTrace();
			//transaction.rollback();
		}
		//transaction.commit(); 
		
		return messages;
	}

	@Override
	public List<Message> getUserMessagesUnReadByProfileId(long orderid)  throws Exception{
		List<Message> messages=new ArrayList<Message>();
		
		Session session=sessionFactory.getCurrentSession();
		session.flush();
		Criteria crit = session.createCriteria(Message.class); 
		
/*		
		Criterion touser = Restrictions.eq("toprofileid",toprofileid); 
		Criterion fromuser = Restrictions.eq("fromprofileid", fromprofileid);    
		LogicalExpression andExp = Restrictions.and(touser,fromuser); 
		Criterion touser2 = Restrictions.eq("toprofileid",fromprofileid ); 
		Criterion fromuser2 = Restrictions.eq("fromprofileid", toprofileid);     
		Criterion unRead = Restrictions.eq("read_status", "1");    
		LogicalExpression andExp1 = Restrictions.and(fromuser2,touser2); 
		LogicalExpression orExp = Restrictions.or(andExp,andExp1); 
		LogicalExpression totalAnd=Restrictions.and(orExp,unRead);
*/
		
		Criterion unRead = Restrictions.eq("read_status", "1");    
		Criterion crtorderid = Restrictions.eq("orderid", orderid); 
		LogicalExpression totalAnd=Restrictions.and(crtorderid,unRead);
		
		
		crit.add(totalAnd);     
		crit.addOrder(Order.desc("date"));
		crit.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY); 
		
		return messages;
	}
	
	@Override
	public int getNumberOfUnreadMsgByProfileId(long profileId) throws Exception {

		Session session = sessionFactory.openSession();
		ThreadLocalSessionContext.bind(session);

		try {

			//String sql = "select count(*) from message where toprofileid=" + profileId + " and "
			//		+ " read_status=1 ) unreadmessages ";

			Criteria crit = sessionFactory.getCurrentSession().createCriteria(
					Message.class);
			
			crit.add(Restrictions.eq("toprofileid", profileId));
			crit.add(Restrictions.eq("read_status", "1"));
			
	         // To get total row count.
	         crit.setProjection(Projections.rowCount());
	         List rowCount = crit.list();
	        
	         
	         return Integer.valueOf(rowCount.get(0).toString() );

		} catch (Exception e) {
			throw e;
		} finally {
			session.close();
		}
		
	}
	
	public void updateReadStatus (long orderid, long userCommunicatingTotoProfileId, long currentLoggedInUserProfileId, int readStatus) throws Exception {
		Session session = sessionFactory.openSession();
		ThreadLocalSessionContext.bind(session);

		try {

			Transaction tx = null;
		    tx = session.beginTransaction();

		            Query query = session
		                    .createQuery(" update Message set read_status = " + readStatus + 
		                    		" where orderid= " + orderid +  
		                    		" and toprofileid= " + currentLoggedInUserProfileId +  
		                    		" and fromprofileid= " + userCommunicatingTotoProfileId );
		        query.executeUpdate();
		    tx.commit();

		} catch (Exception e) {
			throw e;
		} finally {
			session.close();
		}
	}
}
