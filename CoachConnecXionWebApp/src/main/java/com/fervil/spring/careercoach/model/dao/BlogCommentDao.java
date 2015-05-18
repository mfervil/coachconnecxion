package com.fervil.spring.careercoach.model.dao;

import java.util.List;

import com.fervil.spring.careercoach.model.domain.BlogComment;

public interface BlogCommentDao {

    public void store(BlogComment blogComment) throws Exception;  

    public BlogComment findById(long id) throws Exception ;

    public List<BlogComment> findByBlogId(long blogId) throws Exception ;

    public List<BlogComment> findByBlogIdStatus(long blogId, int status) throws Exception ;
    
}
