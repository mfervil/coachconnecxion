package com.connection.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.connection.dao.AttachmentDao;

@Service("attachmentService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class AttachmentServiceImpl implements AttachmentService{
	AttachmentServiceImpl(){
		  
	}    
	@Autowired
	private AttachmentDao attachmentDao;  
}
