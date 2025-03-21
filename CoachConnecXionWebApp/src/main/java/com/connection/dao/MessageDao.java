package com.connection.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.connection.model.Customer;
import com.connection.model.Message;
import com.connection.model.Usermessage;

public interface MessageDao {

	Message saveMessage(Message message2)  throws Exception;

	Usermessage saveUserMessage(Usermessage message2)  throws Exception;
	
	//List<Message> getUserMessages(Integer customerid, Integer id); 

	List<Message> getUserMessages(Customer fromCustomer, Customer customer) throws Exception;

	List<Message> getUserMessagesUnRead(Customer customer, Customer customer2) throws Exception;      
 
	List<Usermessage> getUserMessagesByProfileId(long orderid) throws Exception;
	
	public List<Message> getUserMessagesUnReadByProfileId(long orderid) throws Exception;
	
	public int getNumberOfUnreadMsgByProfileId(long profileId) throws Exception;

	public void updateReadStatus (long orderid, long userCommunicatingTotoProfileId, long currentLoggedInUserProfileId, int readStaus) throws Exception;
}
