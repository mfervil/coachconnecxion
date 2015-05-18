package com.fervil.spring.careercoach.model.dao;

import java.util.List;

import com.fervil.spring.careercoach.model.domain.CoachingCategory;

public interface CoachingCategoryDao {

    public void store(CoachingCategory coachingCategory) throws Exception;  

    public CoachingCategory findById(long id) throws Exception ;

    public List<CoachingCategory> findAll() throws Exception ;
}
