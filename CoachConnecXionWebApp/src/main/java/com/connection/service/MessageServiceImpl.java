package com.connection.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;




import com.connection.dao.CustomerDao;
import com.connection.dao.MessageDao;
import com.connection.model.Customer;
import com.connection.model.Message;
import com.connection.model.Usermessage;

@Service("messageService") 
@Component
@Scope("prototype")
@Transactional(propagation = Propagation.REQUIRES_NEW , timeout = 180)
public class MessageServiceImpl implements MessageService{ 
	@Autowired
	private MessageDao messageDao; 
	MessageServiceImpl(){
		
	}
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false) 
	public Message saveMessage(Message message2) {
		
		return messageDao.saveMessage(message2);   
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false) 
	public Usermessage saveUserMessage(Usermessage userMessage2) {
		
		return messageDao.saveUserMessage(userMessage2);   
	}
	
	
	@Override
	public List<Message> getUserMessages(Customer fromCustomer,
			Customer customer) {
		// TODO Auto-generated method stub
		System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$ SERVICE_IMPLE getUserMessages $$$$$$$$$$$$$$$$$$$$$$ "); 
		return messageDao.getUserMessages(fromCustomer,customer); 
	}
	
	@Override
	public List<Usermessage> getUserMessagesByProfileId(long orderid) {
		// TODO Auto-generated method stub
		System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$ SERVICE_IMPLE getUserMessages $$$$$$$$$$$$$$$$$$$$$$ "); 
		return messageDao.getUserMessagesByProfileId(orderid); 
	}
	
	
	@Override
	public List<Message> getUserMessagesUnRead(Customer customer,
			Customer customer1) {
		// TODO Auto-generated method stub
		return messageDao.getUserMessagesUnRead(customer,customer);  
	}

	@Override
	public List<Message> getUserMessagesUnReadByProfileId(long orderid) {
		// TODO Auto-generated method stub
		return messageDao.getUserMessagesUnReadByProfileId(orderid);  
	}
	
	@Override
	public int getNumberOfUnreadMsgByProfileId (long profileId) throws Exception{
		return messageDao.getNumberOfUnreadMsgByProfileId(profileId);
	}
	
	@Override
	public void updateReadStatus(long orderid, long userCommunicatingTotoProfileId, long currentLoggedInUserProfileId, int readStaus) throws Exception{
		 messageDao.updateReadStatus(orderid, userCommunicatingTotoProfileId, currentLoggedInUserProfileId, readStaus);
	}
	
}
