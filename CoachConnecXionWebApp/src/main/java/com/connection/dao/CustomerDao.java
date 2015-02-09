package com.connection.dao;

import java.util.List;

import com.connection.bean.CustomerBean;
import com.connection.model.Customer;




public interface CustomerDao {

	public void addCustomer(Customer customer);
	public List<Customer> listCustomer();
	
	@SuppressWarnings("rawtypes")
	public List<Customer> login(String email,String password);
	
	public List<Customer> listSearchCustomer(String searchvalue);
	
	public List<Object[]>  unReadMsg(Customer customer);
	
	public boolean cheking(String emailId);

	public void deleteCustomer(Customer customer);
	public List<Object[]> fileDownload(Customer customer);
	public Customer loadCustomer(CustomerBean customerBean);
	
	public List<Customer> forgotPassword(String email);
	public List<Customer> loadCustomerbymailId(CustomerBean customerBean);
}
