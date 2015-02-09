package com.connection.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.connection.bean.CustomerBean;
import com.connection.dao.CustomerDao;
import com.connection.model.Customer;




@Service("customerService")
@Component
@Transactional(propagation = Propagation.REQUIRES_NEW , timeout = 180)
public class CustomerServiceImpl implements CustomerService{
	CustomerServiceImpl(){
		
	}
	@Autowired
	private CustomerDao customerDao;
	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void addCustomer(Customer customer) {
		customerDao.addCustomer(customer);
	}
	
	public List<Customer> listCustomer() {
		return customerDao.listCustomer();
	}
	
	public List<Customer> listSearchCustomer(String searchvalue) {
		return customerDao.listSearchCustomer(searchvalue);
	}
	
	
	public List<Customer> login(String email,String password){
		
		@SuppressWarnings("unchecked")
		List<Customer> list=customerDao.login(email,password);
		return list;
	}
	
	public List<Customer> forgotPassword(String email){
		List<Customer> list=customerDao.forgotPassword(email);
		return list;
	}
	
	public List<Object[]> unReadMsg(Customer customer){
		List<Object[]>  list=customerDao.unReadMsg(customer);
		return list;
		
	}
	
	public List<Object[]> fileDownload(Customer customer){
		List<Object[]>  list=customerDao.fileDownload(customer);
		return list;
	}
	
	public boolean cheking(String emailId){
		boolean flag=customerDao.cheking(emailId);
		return flag;
	}
	

	public void deleteCustomer(Customer customer) {
		customerDao.deleteCustomer(customer);
	}
	public Customer loadCustomer(CustomerBean customerBean) {
		return customerDao.loadCustomer(customerBean);
	}
	public List<Customer> loadCustomerbymailId(CustomerBean customerBean){
		return customerDao.loadCustomerbymailId(customerBean);
	}
}
