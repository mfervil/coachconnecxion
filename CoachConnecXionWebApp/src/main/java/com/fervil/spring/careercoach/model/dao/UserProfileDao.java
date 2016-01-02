package com.fervil.spring.careercoach.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jetbrains.annotations.NotNull;
import org.springframework.transaction.annotation.Transactional;

import com.fervil.spring.careercoach.model.domain.PackageDetails;
import com.fervil.spring.careercoach.model.domain.UserProfile;

public interface UserProfileDao {

    public void store(UserProfile userProfile) throws Exception;  
    
    public void delete(String id) throws Exception ;

    public UserProfile findById(String id) throws Exception ;

    public UserProfile findById(long id) throws Exception ;

    public List<UserProfile> findByUserId(long id) throws Exception ;

    public List<UserProfile> findAll() throws Exception ; 
    
//Used for city and state searches    
    public List<HashMap> findFilteredUserProfiles(int coachingCategory,
    		int coachingSubcategory, int industryExperience,
    		String companyExperience, String coachFirstName,
    		String coachLastName, String city, String state, int pageSize, int pageNumber) throws Exception ; 

    public List<HashMap> findFilteredUserProfilesForTutor(int coachingCategory,
    		int coachingSubcategory, int industryExperience,
    		String companyExperience, String coachFirstName,
    		String coachLastName, String city, String state, int pageSize, int pageNumber) throws Exception ; 
    
/////    End of used for city and state searches  //////////////////////////////////////////////////////////////////    

    public List<HashMap> findFilteredUserProfiles(int coachingCategory,
    		int coachingSubcategory, int industryExperience,
    		String companyExperience, String coachFirstName,
    		String coachLastName, String city, String state, int pageSize, int pageNumber,
			String zipcodes, String coachstyleinperson, String coachstyleonline, String sort) throws Exception ; // Added 12/12/15

    public List<HashMap> findFilteredUserProfilesForTutors(int coachingCategory,
    		int coachingSubcategory, int industryExperience,
    		String companyExperience, String coachFirstName,
    		String coachLastName, String city, String state, int pageSize, 
    		int pageNumber, String gradelevel, int maxrate, String subject, 
    		String zipcodes, String coachstyleinperson, String coachstyleonline, String sort) throws Exception ;
    
//Used for city and state searches    
    public int findFilteredUserProfilesCount(int coachingCategory,
    		int coachingSubcategory, int industryExperience,
    		String companyExperience, String coachFirstName,
    		String coachLastName, String city, String state, int pageSize, int pageNumber) throws Exception ;

    public int findFilteredUserProfilesCountForTutor(int coachingCategory,
    		int coachingSubcategory, int industryExperience,
    		String companyExperience, String coachFirstName,
    		String coachLastName, String city, String state, int pageSize, int pageNumber) throws Exception ;
    
//End of city and state searches    

	public int findFilteredUserProfilesCountForTutors(int coachingCategory, int coachingSubcategory, int industryExperience, String companyExperience, String coachFirstName, String coachLastName, String city, String state, int pageSize, int pageNumber, String gradelevel, int maxrate, String subject, String zipcodes, String coachstyleinperson, String coachstyleonline, String sort) throws Exception;    
    
    public int findFilteredUserProfilesCount(int coachingCategory,
    		int coachingSubcategory, int industryExperience,
    		String companyExperience, String coachFirstName,
    		String coachLastName, String city, String state, int pageSize, int pageNumber,
			String zipcodes, String coachstyleinperson, String coachstyleonline, String sort) throws Exception ; // Added 12/12/15

    
    public List<HashMap> findTutorsToContact(int category, String course, int coachstyleinperson, int coachstyleonline, String zipcodes) throws Exception ;

    public List<HashMap> findCoachesToContact(int category, int coachstyleinperson, int coachstyleonline, String zipcodes) throws Exception ;

}
