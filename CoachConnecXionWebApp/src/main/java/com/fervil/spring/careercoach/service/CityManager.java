package com.fervil.spring.careercoach.service;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;

import org.jetbrains.annotations.NotNull;
import org.springframework.transaction.annotation.Transactional;

import com.fervil.spring.careercoach.model.domain.BlogPost;
import com.fervil.spring.careercoach.model.domain.CityExtended;

@Transactional
public interface CityManager  extends Serializable {
	
    public CityExtended findById(int id) throws Exception;	
    public List<CityExtended> findByStateCode(String statecode) throws Exception;	
	public List<HashMap> findCitiesWithCoaches(String statecode, int coachtype) throws Exception;    
}
