package com.fervil.spring.careercoach.service;

import java.sql.Blob;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.apache.commons.codec.binary.Base64;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fervil.spring.careercoach.model.dao.UserProfileDao;
import com.fervil.spring.careercoach.model.domain.PackageDetails;
import com.fervil.spring.careercoach.model.domain.UserProfile;

@Service
public class BasicUserProfileManager implements UserProfileManager {
    private static final Logger logger = LoggerFactory.getLogger(BasicUserProfileManager.class);

    /**
	 * 
	 */
	private static final long serialVersionUID = 5074238788090809666L;
	/**
	 * 
	 */

	@Autowired
	private UserProfileDao userProfileDao;

	@Resource(name = "packageDetailsService")
	private PackageDetailsService packageDetailsService;
	
    @NotNull
    @Override
    public List<UserProfile> getUserProfiles() throws Exception {
        return userProfileDao.findAll();
	}

    @NotNull
    @Override
	public List<HashMap> getUserProfiles(int coachingCategory, int coachingSubcategory, int industryExperience, String companyExperience, String coachFirstName, String coachLastName, String city, String state, int pageSize, int pageNumber) throws Exception {
        return userProfileDao.findFilteredUserProfiles(coachingCategory, coachingSubcategory, industryExperience, companyExperience, coachFirstName, coachLastName, city, state, pageSize, pageNumber);
    }

    @NotNull
    @Override
	public List<HashMap> getUserProfilesForTutors(int coachingCategory, int coachingSubcategory, int industryExperience, String companyExperience, String coachFirstName, String coachLastName, String city, String state, int pageSize, int pageNumber, String gradelevel, int maxrate, String subject) throws Exception {
        return userProfileDao.findFilteredUserProfilesForTutors(coachingCategory, coachingSubcategory, industryExperience, companyExperience, coachFirstName, coachLastName, city, state, pageSize, pageNumber, gradelevel, maxrate, subject);
    }
    
    
    @NotNull
    @Override
	public int findFilteredUserProfilesCount(int coachingCategory, int coachingSubcategory, int industryExperience, String companyExperience, String coachFirstName, String coachLastName, String city, String state, int pageSize, int pageNumber) throws Exception {
        return userProfileDao.findFilteredUserProfilesCount(coachingCategory, coachingSubcategory, industryExperience, companyExperience, coachFirstName, coachLastName, city, state, pageSize, pageNumber);
    }
    
    
    @NotNull
	public List<HashMap> getUserProfilesPictureString(int coachingCategory, int coachingSubcategory, int industryExperience, String companyExperience, String coachFirstName, String coachLastName, String city, String state, int pageSize, int pageNumber) throws Exception {
        //return userProfileDao.findFilteredUserProfiles(coachingCategory, coachingSubcategory, industryExperience, companyExperience, coachFirstName, coachLastName, city, state);
    
    	List<HashMap> userProfiles = userProfileDao.findFilteredUserProfiles(coachingCategory, coachingSubcategory, industryExperience, companyExperience, coachFirstName, coachLastName, city, state, pageSize, pageNumber);
        
    	//List<UserProfile> newUserProfiles = new ArrayList<UserProfile>();
    	
    	//UserProfile tmpUserProfile = null;
    	
        for (Iterator<HashMap> iter = userProfiles.iterator(); iter.hasNext(); ) {
        	
        	//tmpUserProfile = new UserProfile();
        	
        	//HashMap userProfilemap = new HashMap();
        	HashMap userProfilemap = (HashMap)iter.next();

        	/*
        	tmpUserProfile.setUserProfileId(userProfilemap.get("userProfileId") == null?null:(Long)userProfilemap.get("userProfileId"));
        	tmpUserProfile.setPhone(userProfilemap.get("phone") == null?null:(String)userProfilemap.get("phone")); 
        	tmpUserProfile.setDisplayName(userProfilemap.get("displayName") == null?null:(String) userProfilemap.get("displayName"));
        	tmpUserProfile.setUserProfileType(userProfilemap.get("userProfileType") == null?-1:(Integer) userProfilemap.get("userProfileType"));
        	tmpUserProfile.setUser_userId(userProfilemap.get("user_user_id") == null?-1:(Long) userProfilemap.get("user_user_id"));
        	tmpUserProfile.setAccountType(userProfilemap.get("accountType") == null?-1:(Integer) userProfilemap.get("accountType")); 
        	tmpUserProfile.setEmail(userProfilemap.get("email") == null?null:(String) userProfilemap.get("email"));
        	tmpUserProfile.setCoachingcategory1(userProfilemap.get("coachingcategory1") == null?-1:((Integer) userProfilemap.get("coachingcategory1")).intValue());
        	tmpUserProfile.setCoachingcategory2(userProfilemap.get("coachingcategory2") == null?-1:(Integer) userProfilemap.get("coachingcategory2"));
        	tmpUserProfile.setCoachingcategory3(userProfilemap.get("coachingcategory3") == null?-1:(Integer) userProfilemap.get("coachingcategory3"));
        	tmpUserProfile.setIndustryfocus1(userProfilemap.get("industryfocus1") == null?-1:(Integer) userProfilemap.get("industryfocus1")); 
        	tmpUserProfile.setIndustryfocus2(userProfilemap.get("industryfocus2") == null?-1:(Integer) userProfilemap.get("industryfocus2")); 
        	tmpUserProfile.setIndustryfocus3(userProfilemap.get("industryfocus3") == null?-1:(Integer) userProfilemap.get("industryfocus3"));
        	tmpUserProfile.setCompanyexperience1(userProfilemap.get("companyexperience1") == null?null:(String) userProfilemap.get("companyexperience1"));
        	tmpUserProfile.setCompanyexperience2(userProfilemap.get("companyexperience2") == null?null:(String) userProfilemap.get("companyexperience2"));
        	tmpUserProfile.setCompanyexperience3(userProfilemap.get("companyexperience3") == null?null:(String) userProfilemap.get("companyexperience3")); 
        	tmpUserProfile.setAddress(userProfilemap.get("address") == null?null:(String) userProfilemap.get("address")); 
        	tmpUserProfile.setApartment(userProfilemap.get("apartment") == null?null:(String) userProfilemap.get("apartment")); 
        	tmpUserProfile.setCity(userProfilemap.get("city") == null?null:(String) userProfilemap.get("city"));
        	tmpUserProfile.setState(userProfilemap.get("state") == null?null:(String) userProfilemap.get("state")); 
        	tmpUserProfile.setZipcode(userProfilemap.get("zipcode") == null?null:(String) userProfilemap.get("zipcode")); 
        	tmpUserProfile.setOverview(userProfilemap.get("overview") == null?null:(String) userProfilemap.get("overview")); 
        	tmpUserProfile.setServiceDescription(userProfilemap.get("serviceDescription") == null?null:(String) userProfilemap.get("serviceDescription"));
        	tmpUserProfile.setSkillsExpertise(userProfilemap.get("skillsExpertise") == null?null:(String) userProfilemap.get("skillsExpertise"));
        	tmpUserProfile.setSummaryOfHighestPosition(userProfilemap.get("summaryOfHighestPosition") == null?null:(String) userProfilemap.get("summaryOfHighestPosition"));
        	tmpUserProfile.setHourlyRate(userProfilemap.get("hourlyRate") == null?-1:(Double) userProfilemap.get("hourlyRate")); 
        	tmpUserProfile.setPaymentTerms(userProfilemap.get("paymentTerms") == null?null:(String) userProfilemap.get("paymentTerms")); 
        	tmpUserProfile.setKeywords(userProfilemap.get("keywords") == null?null:(String) userProfilemap.get("keywords")); 
        	tmpUserProfile.setModifiedDate(userProfilemap.get("modifiedDate") == null?null:(Date) userProfilemap.get("modifiedDate")); 
        	tmpUserProfile.setFirstname(userProfilemap.get("firstname") == null?null:(String) userProfilemap.get("firstname")); 
        	tmpUserProfile.setMiddleinitial(userProfilemap.get("middleinitial") == null?null:(String) userProfilemap.get("middleinitial"));
        	tmpUserProfile.setLastname(userProfilemap.get("lastname") == null?null:(String) userProfilemap.get("lastname")); 
        	tmpUserProfile.setLanguage(userProfilemap.get("language") == null?null:(String) userProfilemap.get("language"));
        	tmpUserProfile.setCountryname(userProfilemap.get("countryname") == null?null:(String) userProfilemap.get("countryname")); 
        	tmpUserProfile.setProfilepicture(userProfilemap.get("profilepicture") == null?null:(Blob) userProfilemap.get("profilepicture")); 
        	tmpUserProfile.setProfile_picture_type(userProfilemap.get("profile_picture_type") == null?null:(String) userProfilemap.get("profile_picture_type")); 
        	tmpUserProfile.setProfile_picture_name(userProfilemap.get("profile_picture_name") == null?null:(String) userProfilemap.get("profile_picture_name")); 
        	tmpUserProfile.setVideo_url(userProfilemap.get("video_url") == null?null:(String) userProfilemap.get("video_url"));         	
        	*/
        	
        	String byteArrayBlobString ="";
        	
        	if (userProfilemap.get("profilepicture") != null) {
        		
	        	//Blob profilePictureBlob = (Blob) userProfilemap.get("profilepicture");
	    		//String imgLen = String.valueOf(profilePictureBlob);		
	    		
	    		//byte [] rb = new byte[imgLen.length() ];
            	byte [] rb = (byte[])userProfilemap.get("profilepicture");
	    		
	    		//int blobLength = (int) profilePictureBlob.length();  
	    		//byte[] blobAsBytes = profilePictureBlob.getBytes(1, blobLength);			
	    			
	    		//byteArrayBlobString = new String(blobAsBytes );

            	//byteArrayBlobString = new String(rb);
            	
            	Base64 bs=new Base64();
            	
            	//byteArrayBlobString = bs.encodeToString(rb);  Does not compile but should be used.........
	    		
        	}	
    		
    		//tmpUserProfile.setProfilepicturestring(byteArrayBlobString);
    		//newUserProfiles.add(tmpUserProfile);

        	userProfilemap.put("profilepicturestring", byteArrayBlobString);

        }        
        return userProfiles;
        
    }
    
    public void storeUserProfile(UserProfile userProfile) throws Exception {
    	userProfileDao.store(userProfile);
    }

    public void storeUserProfileForTutor(UserProfile userProfile, PackageDetails tutorPackage) throws Exception {
    	userProfileDao.store(userProfile);

    	tutorPackage.setProfileId(userProfile.getUserProfileId());
    	packageDetailsService.add(tutorPackage);
    }

	public UserProfile findById(String id) throws Exception {
		return userProfileDao.findById(id);
	}

	public UserProfile findById(long id) throws Exception {
		return userProfileDao.findById(id);
	}

	public List<UserProfile> findByUserId(long id) throws Exception {
		return userProfileDao.findByUserId(id);
	}
	
	public void deleteUserProfile(String id) throws Exception {
		userProfileDao.delete(id);
	}
	
    public void setUserProfileDao(UserProfileDao userProfileDao) throws Exception {
        this.userProfileDao = userProfileDao;
    }
}