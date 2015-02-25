package com.connection.dao;

import java.util.List;

import com.connection.bean.CustomerBean;
import com.connection.model.Customer;




public interface CustomerDao {

	public void addCustomer(Customer customer) throws Exception;
	public List<Customer> listCustomer() throws Exception;
	
	@SuppressWarnings("rawtypes")
	public List<Customer> login(String email,String password) throws Exception;
	
	public List<Customer> listSearchCustomer(String searchvalue) throws Exception;
	
	public List<Object[]>  unReadMsg(Customer customer) throws Exception;
	
	public boolean cheking(String emailId) throws Exception;

	public void deleteCustomer(Customer customer) throws Exception;
	public List<Object[]> fileDownload(Customer customer) throws Exception;
	public Customer loadCustomer(CustomerBean customerBean) throws Exception;
	
	public List<Customer> forgotPassword(String email) throws Exception;
	public List<Customer> loadCustomerbymailId(CustomerBean customerBean) throws Exception;
}
