package com.fervil.spring.careercoach.model.dao;

import java.util.HashMap;
import java.util.List;

import com.fervil.spring.careercoach.model.domain.CityExtended;

public interface CityExtendedDao {

    //public void store(CityExtended cityExtended) throws Exception;  

    public CityExtended findById(int id) throws Exception ;

    public List<CityExtended> findByState(String statecode) throws Exception ;
    
    public List<HashMap> findCitiesWithCoaches(String statecode, int coachType) throws Exception ;
}
