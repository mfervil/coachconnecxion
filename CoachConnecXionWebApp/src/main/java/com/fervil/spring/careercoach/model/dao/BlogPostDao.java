package com.fervil.spring.careercoach.model.dao;

import java.util.List;

import com.fervil.spring.careercoach.model.domain.BlogPost;

public interface BlogPostDao {

    public void store(BlogPost blogPost) throws Exception;  

    public BlogPost findById(long id) throws Exception ;

    public List<BlogPost> findByUserProfileId(long id) throws Exception ;

    public List<BlogPost> findAll() throws Exception ; 

    public List<BlogPost> findRecentBlogPosts(int count) throws Exception ; 
    
    public List<BlogPost> findBlogPostsByMonthYear(int month, int year) throws Exception;

	List<BlogPost> findAllPostTutors() throws Exception;

	List<BlogPost> findRecentBlogPostsTutors(int count) throws Exception;

	List<BlogPost> findBlogPostsByMonthYearTutor(int month, int year)
			throws Exception;	
    
}
