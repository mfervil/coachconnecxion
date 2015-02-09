package com.connection.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository("attachmentDao")

public class AttachmentDaoImpl implements AttachmentDao {
	@Autowired
	private SessionFactory sessionFactory;
}
