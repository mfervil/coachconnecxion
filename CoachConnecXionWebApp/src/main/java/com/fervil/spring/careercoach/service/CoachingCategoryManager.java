package com.fervil.spring.careercoach.service;

import java.io.Serializable;
import java.util.List;

import org.jetbrains.annotations.NotNull;
import org.springframework.transaction.annotation.Transactional;

import com.fervil.spring.careercoach.model.domain.BlogComment;
import com.fervil.spring.careercoach.model.domain.BlogPost;
import com.fervil.spring.careercoach.model.domain.CoachingCategory;

@Transactional
public interface CoachingCategoryManager  extends Serializable {
	

    public void storeCoachingCategory(CoachingCategory coachingCategory) throws Exception;
    public CoachingCategory findById(long id) throws Exception;	
    public List<CoachingCategory> findAll() throws Exception;	
}
