package com.connection.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.connection.bean.CustomerBean;
import com.connection.model.Customer;
import com.connection.model.Message;




@Repository("customerDao")

public class CustomerDaoImpl implements CustomerDao{

	
	@Autowired
	private SessionFactory sessionFactory;
	
	public void addCustomer(Customer customer)  throws Exception{
		
		Session session=sessionFactory.getCurrentSession();
		//Transaction transaction=session.beginTransaction();
		try{
		session.saveOrUpdate(customer);
		//transaction.commit();
		}catch(Exception e){
			throw e;
			//transaction.rollback();
		}
	}

	@SuppressWarnings("unchecked")
	public List<Customer> listCustomer()  throws Exception{
		return (List<Customer>) sessionFactory.openSession().createCriteria(Customer.class).list();
	}
	
	public List<Customer> login(String email,String Password)  throws Exception{
		Criteria cr = sessionFactory.openSession().createCriteria(Customer.class); 
		cr.add(Restrictions.eq("emailid",email));
		cr.add(Restrictions.eq("password",Password));
		@SuppressWarnings({"unchecked" })
		List<Customer> list = (List<Customer>)cr.list();
		
		
		return list;
		
		//return Customer sessionFactory.getCurrentSession().createQuery("SELECT * FROM customer WHERE emailid="+email+" AND PASSWORD="+Password).e
	}
	
	public List<Customer> forgotPassword(String email) throws Exception{
		Criteria cr = sessionFactory.openSession().createCriteria(Customer.class);
		cr.add(Restrictions.eq("emailid",email));
		//cr.add(Restrictions.eq("password",Password));
		@SuppressWarnings({"unchecked" })
		List<Customer> list = (List<Customer>)cr.list();
		
		
		return list;
		
		//return Customer sessionFactory.getCurrentSession().createQuery("SELECT * FROM customer WHERE emailid="+email+" AND PASSWORD="+Password).e
	}
	

	public List<Object[]> unReadMsg(Customer customer) throws Exception{
		//Criteria cr=sessionFactory.getCurrentSession().createCriteria(Message.class);
		Session session=sessionFactory.getCurrentSession();
		////session.flush();
		//Transaction transaction=session.beginTransaction();
		List<Object[]> list=new ArrayList<Object[]>();
		try{
		Query query=session.createQuery("SELECT c.customername,DATE_FORMAT(m.date,GET_FORMAT(DATE,'ISO')),COUNT(*),c.customerid FROM Customer c,Message m  WHERE c.customerid=m.fromuser  AND m.touser=:touser  AND m.read_status=:status  GROUP BY c.customername ORDER BY c.customername,m.date DESC");
		query.setParameter("touser", customer);
		query.setParameter("status", "1");
		//@SuppressWarnings("unchecked") 
		list=(List<Object[]>)query.list(); 
		//transaction.commit();
		}catch(Exception e){
			throw e;
			//transaction.rollback();
		}
			//session.close();
		return list;
	
	}
		
	public List<Object[]> fileDownload(Customer customer) throws Exception{
		Session session=sessionFactory.getCurrentSession();
		////session.flush();
		//Transaction transaction=session.beginTransaction();
		List<Object[]> groupList=new ArrayList<Object[]>();
		try{
		Query query=session.createQuery("SELECT c.customername,DATE_FORMAT(m.date,GET_FORMAT(DATE,'ISO')),a.attachment_name,a.attachid FROM Customer c,Message m,Attachment a  WHERE a.messageid=m.messageid AND c.customerid = m.fromuser AND a.attachment_name IS NOT NULL AND a.attachment_name <> '' AND m.touser =:touser ORDER BY c.customername,m.date DESC ");
		query.setParameter("touser", customer);	
		
		groupList=query.list();
		//transaction.commit();
		}catch(Exception e){
			throw e;
			//transaction.rollback();
		}
		//session.close();
		return groupList;
		
	}
	
	//start Code Tanumoy
		public Customer loadCustomer(CustomerBean customerBean)  throws Exception{ 
			Session session= sessionFactory.getCurrentSession(); 
			//Transaction transaction=session.beginTransaction();
			try{
			
			////session.flush();
			//Transaction transaction=session.beginTransaction();
			Customer bean=(Customer)session.get(Customer.class, customerBean.getId());       
			//transaction.commit();
			//session.close();
			return bean;
			}catch(Exception e){
				throw e;
				//transaction.rollback();
				//e.printStackTrace();
			}
			
			//2/21/2015 return null;
		}
		//end Code Tanumoy
	
	
	
	
	public List<Customer> listSearchCustomer(String searchvalue)  throws Exception{
		Session session=sessionFactory.getCurrentSession();
		////session.flush();
		//Transaction transaction=session.beginTransaction();
		List<Customer> list =new ArrayList<Customer>();
		try{
		Criteria cr = session.createCriteria(Customer.class);
		cr.add(Restrictions.or(Restrictions.like("emailid","%"+searchvalue+"%"), Restrictions.like("customername","%"+searchvalue+"%")));
		cr.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);
		//cr.add();
		
		//query.setParameter("email", email);
		//query.setParameter("pass", Password);
		
		list= (List<Customer>)cr.list();
		//transaction.commit();
		}catch(Exception e){
			throw e;
			//transaction.rollback();
		}
		//session.close();
		
		return list;
		
		//return Customer sessionFactory.getCurrentSession().createQuery("SELECT * FROM customer WHERE emailid="+email+" AND PASSWORD="+Password).e
	}
	
	
	public boolean cheking(String emailId)  throws Exception{
		 boolean flag=false;
		 Session session=sessionFactory.getCurrentSession();
		 //Transaction transaction=session.beginTransaction();
		 //session.flush();
		 List list=new ArrayList();
		 try{
		 Criteria cr = session.createCriteria(Customer.class);
			cr.add(Restrictions.eq("emailid",emailId));
			//cr.add(Restrictions.eq("password",Password));
		//query.setParameter("pass", Password);
		
		 list = cr.list();
		 //transaction.commit();
		 }catch(Exception e){
			 //transaction.rollback();
		 }
		//session.close();
		if(list.size()>0){
			flag=true;
			return flag;
		}
		else{
			return flag;
		}
	}
	
	
	
	
	public void deleteCustomer(Customer customer)  throws Exception{
		sessionFactory.getCurrentSession().createQuery("DELETE FROM Customer WHERE customerid = "+customer.getCustomerid()).executeUpdate();
	}

			public List<Customer> loadCustomerbymailId(CustomerBean customerBean)   throws Exception{ 
				
				Session session=sessionFactory.getCurrentSession();
				 //Transaction transaction=session.beginTransaction();
				 List<Customer> list=new ArrayList<Customer>();
				//session.flush();
				 try{
				Criteria cr = session.createCriteria(Customer.class);
				cr.add(Restrictions.eq("emailid",customerBean.getEmailid()));
				//cr.add(Restrictions.eq("password",Password));
				
				list= (List<Customer>)cr.list();
				//transaction.commit();
				 }catch(Exception e){
					 //transaction.rollback();
				 }
				//session.close();
				return list;
			}
		
	
	public static void main(String args[]) throws Exception{
		CustomerDaoImpl customerDaoImpl=new  CustomerDaoImpl();
	}
}
