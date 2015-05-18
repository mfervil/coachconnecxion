package com.fervil.spring.careercoach.service;

import java.sql.Blob;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.apache.commons.codec.binary.Base64;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fervil.spring.careercoach.model.dao.BlogCommentDao;
import com.fervil.spring.careercoach.model.dao.BlogPostDao;
import com.fervil.spring.careercoach.model.dao.UserProfileDao;
import com.fervil.spring.careercoach.model.domain.BlogComment;
import com.fervil.spring.careercoach.model.domain.BlogPost;
import com.fervil.spring.careercoach.model.domain.UserProfile;

@Service
public class BasicBlogCommentManager implements BlogCommentManager {
    private static final Logger logger = LoggerFactory.getLogger(BasicBlogCommentManager.class);

    /**
	 * 
	 */
	private static final long serialVersionUID = 5074238788090809666L;
	/**
	 * 
	 */
	@Autowired
	private BlogCommentDao blogCommentDao;

    public BlogCommentDao getBlogCommentDao() {
		return blogCommentDao;
	}

	public void setBlogCommentDao(BlogCommentDao blogCommentDao) {
		this.blogCommentDao = blogCommentDao;
	}

	@Override
	public void storeBlogComment(BlogComment blogComment) throws Exception {
		blogCommentDao.store(blogComment);
	}

	@Override
	public List<BlogComment> findByBlogId(long blogid) throws Exception {
		return blogCommentDao.findByBlogId(blogid);
	}

	@Override
	public List<BlogComment> findByBlogIdStatus(long blogid, int status) throws Exception {
		return blogCommentDao.findByBlogIdStatus(blogid, status);
	}
	
	@Override
	public BlogComment findById(long id) throws Exception {
		return blogCommentDao.findById(id) ;
	}
}