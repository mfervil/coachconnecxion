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

import com.fervil.spring.careercoach.model.dao.BlogPostDao;
import com.fervil.spring.careercoach.model.dao.UserProfileDao;
import com.fervil.spring.careercoach.model.domain.BlogPost;
import com.fervil.spring.careercoach.model.domain.UserProfile;

@Service
public class BasicBlogManager implements BlogManager {
    private static final Logger logger = LoggerFactory.getLogger(BasicUserProfileManager.class);

    /**
	 * 
	 */
	private static final long serialVersionUID = 5074238788090809666L;
	/**
	 * 
	 */
	@Autowired
	private BlogPostDao blogPostDao;
	//private UserProfileDao userProfileDao;

    public BlogPostDao getBlogPostDao() {
		return blogPostDao;
	}

	public void setBlogPostDao(BlogPostDao blogPostDao) {
		this.blogPostDao = blogPostDao;
	}

	@NotNull
    @Override
    public List<BlogPost> getAllBlogPosts() throws Exception {
        return blogPostDao.findAll();
	}

	@NotNull
    @Override
    public List<BlogPost> getRecentBlogPosts(int count) throws Exception {
        return blogPostDao.findRecentBlogPosts(count);
	}

	@Override
	public void storeBlog(BlogPost blogPost) throws Exception {
		blogPostDao.store(blogPost);
	}

	@Override
	public List<BlogPost> findByProfileId(long profileid) throws Exception {
		return blogPostDao.findByUserProfileId(profileid);
	}

	@Override
	public BlogPost findById(long id) throws Exception {
		return blogPostDao.findById(id) ;
	}


	@Override
	public List<BlogPost> findBlogPostsByMonthYear(int month, int year)
			throws Exception {
		return blogPostDao.findBlogPostsByMonthYear(month, year);
	}
}