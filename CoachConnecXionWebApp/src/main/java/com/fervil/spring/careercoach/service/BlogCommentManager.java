package com.fervil.spring.careercoach.service;

import java.io.Serializable;
import java.util.List;

import org.jetbrains.annotations.NotNull;
import org.springframework.transaction.annotation.Transactional;

import com.fervil.spring.careercoach.model.domain.BlogComment;
import com.fervil.spring.careercoach.model.domain.BlogPost;

@Transactional
public interface BlogCommentManager  extends Serializable {
	

    public void storeBlogComment(BlogComment blogComment) throws Exception;
    public BlogComment findById(long id) throws Exception;	
    public List<BlogComment> findByBlogId(long blogid) throws Exception;	
    public List<BlogComment> findByBlogIdStatus(long blogid, int status) throws Exception;	
}
