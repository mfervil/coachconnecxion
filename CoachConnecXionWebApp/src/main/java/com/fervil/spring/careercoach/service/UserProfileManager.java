package com.fervil.spring.careercoach.service;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;

import org.jetbrains.annotations.NotNull;
import org.springframework.transaction.annotation.Transactional;

import com.fervil.spring.careercoach.model.domain.PackageDetails;
import com.fervil.spring.careercoach.model.domain.UserProfile;

@Transactional
public interface UserProfileManager  extends Serializable {
	
    @NotNull
	public List<UserProfile> getUserProfiles() throws Exception;

//Used for city and state searches    
    @NotNull
	public int findFilteredUserProfilesCount(int coachingCategory, 
			int coachingSubcategory, int industryExperience, 
			String companyExperience, String coachFirstName, 
			String coachLastName, String city, String state, int pageSize, int pageNumber) throws Exception;

    @NotNull
	public int findFilteredUserProfilesCountForTutor(int coachingCategory, 
			int coachingSubcategory, int industryExperience, 
			String companyExperience, String coachFirstName, 
			String coachLastName, String city, String state, int pageSize, int pageNumber) throws Exception;
    
////End of city and state searches /////////////////////////////////////////////////////////////////////////////    

    //Added this area for the zipcode functionality
    @NotNull
	public int findFilteredUserProfilesCount(int coachingCategory, 
			int coachingSubcategory, int industryExperience, 
			String companyExperience, String coachFirstName, 
			String coachLastName, String city, String state, int pageSize, int pageNumber,
			String zipcodes, String tmpcoachstyleinperson, String tmpcoachstyleonline, String sort) throws Exception; //Added 12/17/15  

    //Added this area for the zipcode functionality
    @NotNull
	public int findFilteredUserProfilesCountForTutors(int coachingCategory, 
			int coachingSubcategory, int industryExperience, 
			String companyExperience, String coachFirstName, 
			String coachLastName, String city, String state, int pageSize, int pageNumber,
			String gradelevel, int maxrate, String subject, String zipcodes, 
			String tmpcoachstyleinperson, String tmpcoachstyleonline, String sort) throws Exception;
    
    //Added this area for the zipcode functionality
    @NotNull
	public List<HashMap> getUserProfiles(int coachingCategory, 
			int coachingSubcategory, int industryExperience, 
			String companyExperience, String coachFirstName, 
			String coachLastName, String city, String state, int pageSize, int pageNumber,
			String zipcodes, String tmpcoachstyleinperson, String tmpcoachstyleonline, String sort) throws Exception; //Added 12/17/15  

    //Used for city and state searches
    @NotNull
	public List<HashMap> getUserProfiles(int coachingCategory, 
			int coachingSubcategory, int industryExperience, 
			String companyExperience, String coachFirstName, 
			String coachLastName, String city, String state, int pageSize, int pageNumber) throws Exception; 

    @NotNull
	public List<HashMap> getUserProfilesForTutor(int coachingCategory, 
			int coachingSubcategory, int industryExperience, 
			String companyExperience, String coachFirstName, 
			String coachLastName, String city, String state, int pageSize, int pageNumber) throws Exception; 
    
    ////End of for city and state searches
    
    @NotNull
	public List<HashMap> getUserProfilesForTutors(int coachingCategory, 
			int coachingSubcategory, int industryExperience, 
			String companyExperience, String coachFirstName, 
			String coachLastName, String city, String state, int pageSize, int pageNumber, 
			String gradelevel, int maxrate, String subject, String zipcodes, 
			String tmpcoachstyleinperson, String tmpcoachstyleonline, String sort) throws Exception;
    
    public void storeUserProfile(UserProfile userProfile) throws Exception;
    public void storeUserProfileForTutor(UserProfile userProfile, PackageDetails tutorPackage) throws Exception;
    public void deleteUserProfile(String id) throws Exception;
    public UserProfile findById(String id) throws Exception;	
    public UserProfile findById(long id) throws Exception;	
    public List<UserProfile> findByUserId(long id) throws Exception;	
    
    public List<HashMap> getUserProfilesOfTutors(int category, String course, 
    		int coachstyleinperson, int coachstyleonline,  String zipcodes) throws Exception;
    
    public List<HashMap> getUserProfilesOfCoachesToContact(int category, int coachstyleinperson, int coachstyleonline,  String zipcodes) throws Exception;
    
}
