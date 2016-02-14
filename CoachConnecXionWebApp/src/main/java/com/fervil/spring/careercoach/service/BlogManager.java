package com.fervil.spring.careercoach.service;

import java.io.Serializable;
import java.util.List;

import org.jetbrains.annotations.NotNull;
import org.springframework.transaction.annotation.Transactional;

import com.fervil.spring.careercoach.model.domain.BlogPost;

@Transactional
public interface BlogManager  extends Serializable {
	
    public void storeBlog(BlogPost blogPost) throws Exception;
    public BlogPost findById(long id) throws Exception;	
    public List<BlogPost> findByProfileId(long profileid) throws Exception;	

    public List<BlogPost> findBlogPostsByMonthYear(int month, int year) throws Exception;	
    
    @NotNull
	public List<BlogPost> getAllBlogPosts() throws Exception;

	public List<BlogPost> getRecentBlogPosts(int count) throws Exception;
	public List<BlogPost> getRecentBlogPostsTutor(int i) throws Exception;
	public List<BlogPost> findBlogPostsByMonthYearTutor(int blogMonth,
			int blogYear) throws Exception;
    
}
