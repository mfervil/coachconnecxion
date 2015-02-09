package com.connection.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.connection.dao.AttachmentDao;

@Service("attachmentService")
@Component
@Transactional(propagation = Propagation.REQUIRES_NEW , timeout = 180)
public class AttachmentServiceImpl implements AttachmentService{
	AttachmentServiceImpl(){
		
	}
	@Autowired
	private AttachmentDao attachmentDao;  
}
