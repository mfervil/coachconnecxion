package com.connection.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.connection.model.Customer;
import com.connection.model.Message;
import com.connection.model.Usermessage;

public interface MessageDao {

	Message saveMessage(Message message2);

	Usermessage saveUserMessage(Usermessage message2);
	
	//List<Message> getUserMessages(Integer customerid, Integer id); 

	List<Message> getUserMessages(Customer fromCustomer, Customer customer);

	List<Message> getUserMessagesUnRead(Customer customer, Customer customer2);      
 
	List<Usermessage> getUserMessagesByProfileId(long orderid);
	
	public List<Message> getUserMessagesUnReadByProfileId(long orderid);

}
