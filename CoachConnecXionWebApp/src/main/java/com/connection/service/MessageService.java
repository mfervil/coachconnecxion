package com.connection.service;

import java.util.List;

import org.springframework.stereotype.Component;

import com.connection.model.Customer;
import com.connection.model.Message;
import com.connection.model.Usermessage;
@Component
public interface MessageService {

	public Message saveMessage(Message message2);

	public Usermessage saveUserMessage(Usermessage message2);
	
//	public List<Message> getUserMessages(Integer customerid, Integer id);

	public List<Message> getUserMessages(Customer fromCustomer, 
			Customer customer);
	
	public List<Usermessage> getUserMessagesByProfileId (long orderid);

	public List<Message> getUserMessagesUnRead(Customer customer,
			Customer customer1);            

	public List<Message> getUserMessagesUnReadByProfileId(long orderid);            
	
}
