package com.fervil.spring.careercoach.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.fervil.spring.careercoach.model.domain.UserProfile;

public interface UserProfileDao {

    public void store(UserProfile userProfile) throws Exception;  

    public void delete(String id) throws Exception ;

    public UserProfile findById(String id) throws Exception ;

    public UserProfile findById(long id) throws Exception ;

    public List<UserProfile> findByUserId(long id) throws Exception ;

    public List<UserProfile> findAll() throws Exception ; 
    
    public List<HashMap> findFilteredUserProfiles(int coachingCategory,
    		int coachingSubcategory, int industryExperience,
    		String companyExperience, String coachFirstName,
    		String coachLastName, String city, String state) throws Exception ;
}    
