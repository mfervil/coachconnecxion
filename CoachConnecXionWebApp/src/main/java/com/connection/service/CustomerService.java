package com.connection.service;

import java.util.List;

import org.springframework.stereotype.Component;

import com.connection.bean.CustomerBean;
import com.connection.model.Customer;

@Component
public interface CustomerService {
	public void addCustomer(Customer customer);

	public List<Customer> listCustomer();
	
	
	public boolean cheking(String emailId);
	
	/*public Customer getEmployee(int customerid);*/
	
	public List<Customer> login(String email,String password);
	
	public List<Object[]>  unReadMsg(Customer customer);
	
	public List<Customer> listSearchCustomer(String searchvalue);
	
	public void deleteCustomer(Customer customer);
	public List<Object[]> fileDownload(Customer customer);
	public Customer loadCustomer(CustomerBean customerBean);
	public List<Customer> forgotPassword(String email);
	public List<Customer> loadCustomerbymailId(CustomerBean customerBean);
}
