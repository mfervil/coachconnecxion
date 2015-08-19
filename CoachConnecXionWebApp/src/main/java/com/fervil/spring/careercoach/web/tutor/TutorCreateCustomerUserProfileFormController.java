package com.fervil.spring.careercoach.web.tutor;

import java.io.File;
import java.util.Date;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils;

import com.amazonaws.AmazonClientException;
import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.profile.ProfileCredentialsProvider;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.fervil.spring.careercoach.model.domain.UserProfile;
import com.fervil.spring.careercoach.service.CreateCustomerUserProfileValidator;
import com.fervil.spring.careercoach.service.UserProfileManager;
import com.fervil.spring.careercoach.util.Constants;
import com.fervil.spring.careercoach.util.SystemUtil;

@Transactional
@Controller       
@RequestMapping("/tutor/createcustomeruserprofile") 
public class TutorCreateCustomerUserProfileFormController {
	
    private static final Logger log = LoggerFactory.getLogger(TutorCreateCustomerUserProfileFormController.class);
	
	@Autowired
	private SessionFactory sessionFactory;

//Testing only
	@Resource(name = "customerUserProfileValidator")
	private CreateCustomerUserProfileValidator validator;
	
	@Resource(name = "userProfileManager")
	private UserProfileManager userProfileManager;

	@Autowired
	ServletContext context;	
	
    private static String bucketName     = "ccxvi";
    private static String keyName        = "Object-"+UUID.randomUUID();	
    private static String uploadFileNamePrefix = "ccxv1";
    
	@RequestMapping(method = RequestMethod.GET) 
	public String getCustomerUserProfile(ModelMap model, org.springframework.web.context.request.WebRequest webRequest,
			HttpSession session) {
//TODO: This code takes you to createUser Profile rather or not your profile has already been created.

		try{
			long profileId = -1;

			UserProfile userProfile = new UserProfile();

			//if (webRequest.getParameter("profileId") == null){ //Breadcrumb changes
			if (webRequest.getParameter("profileId") == null && session.getAttribute("createUserProfileProfileId") == null){
				userProfile.setModifiedDate(new Date());
				userProfile.setAccountType(1);
				userProfile.setUserProfileType(1);
				
				userProfile.setCoachingcategory1(-1);
				userProfile.setCoachingcategory2(-1);
				userProfile.setCoachingcategory3(-1);
				
				userProfile.setIndustryfocus1(-1);
				userProfile.setIndustryfocus2(-1);
				userProfile.setIndustryfocus3(-1);
			} else{
				if (webRequest.getParameter("profileId") !=null){
					profileId = Long.valueOf(webRequest.getParameter("profileId"));
					session.setAttribute("createUserProfileProfileId", profileId);
					
				} else {
					profileId = Long.valueOf(session.getAttribute("createUserProfileProfileId").toString() );
					
				}				
				userProfile = userProfileManager.findById(profileId);

				// Breadcrumb changes.  Only item that was in the else clause
				//userProfile = userProfileManager.findById(Long.valueOf(webRequest.getParameter("profileId")));
			}

			//model.addAttribute("profileId", webRequest.getParameter("profileId")); //Removed for breadcrumb
			
			model.addAttribute("profileId", profileId);
			model.addAttribute("userProfile", userProfile);
			return "tutor/userprofile/createcustomeruserprofile"; 
			
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "tutor/public/common/error/errorpage";
		}	
	} 
	
	@RequestMapping(method = RequestMethod.POST)
	public String postCustomerUserProfile(
			@ModelAttribute("userProfile") UserProfile userProfile,
			BindingResult result, SessionStatus status, ModelMap model, HttpServletRequest request, HttpServletResponse response,
			org.springframework.web.context.request.WebRequest webRequest, HttpSession crdUsersession) {
		
			validator.validate(userProfile, result);

		try {
		
	        if (result.hasErrors()) {
				return "tutor/userprofile/createcustomeruserprofile";
			} else {
				long userProfileId = SystemUtil.getUserProfileId(request, userProfileManager);
				if (webRequest.getParameter("profileId") != null && !((String)webRequest.getParameter("profileId")).equals("")  && Long.valueOf((String)webRequest.getParameter("profileId")) > 0){
					userProfile.setUserProfileId(Long.valueOf(webRequest.getParameter("profileId")));
				} else if (userProfileId > 0){
					userProfile.setUserProfileId(userProfileId);
				}
				
				userProfile.setUser_userId(SecurityUtils.getCurrentUser().getId());
				userProfile.setModifiedDate(new Date());
				userProfile.setAccountType(2);
				userProfile.setUserProfileType(2);

				userProfileManager.storeUserProfile(userProfile);
				status.setComplete();

				return "redirect:tutor/createcustomeruserprofilesuccess/userProfileId/" + userProfile.getUserProfileId();				
				
//				if (crdUsersession.getAttribute("createUserProfileProfileId") == null){
					//If it is a new user, after a profile is created, they need to create a package
//					return "redirect:packageAdd";
//				} else {
//					return "redirect:createuserprofilesuccess/userProfileId/" + userProfile.getUserProfileId();
//				}
			}
		} catch (Exception e) {
	            String msg = "Failed to create user. Error " + e;
	            log.error(msg, e);
				model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				return "tutor/userprofile/createuserprofile";
		}
	}

	private String calculateDestinationDirectory(UserProfile userProfile) {
        String result = this.context.getRealPath("");
        //result += "/";
        result += Constants.UPLOAD_DIRECTORY;
        result += "/";
        result += userProfile.getUserProfileId();
        
        return result;
    }
 
    private String calculateDestinationPath(MultipartFile file, UserProfile userProfile) {
        String result = this.calculateDestinationDirectory(userProfile);
        result += "/";
        result += "USERPROFILEIMAGE" + userProfile.getUserProfileId() + "." + getFileExtension(file);
        //result += file.getOriginalFilename();

        return result;
    }
 
    	
    	
    private void saveMultipartToAmazonS3(MultipartFile multipart, UserProfile userProfile) throws Exception {
    	
        AmazonS3 s3client = new AmazonS3Client(new ProfileCredentialsProvider());
        try {
            //File fileName = new File(uploadFileNamePrefix + userProfile.getUserProfileId());
            
            File convFile = new File( multipart.getOriginalFilename());
            multipart.transferTo(convFile);
            //return convFile;            
    
            String[] split = convFile.getName().split("\\.");
            String ext = split[split.length - 1];
            
            PutObjectRequest por = new PutObjectRequest(bucketName, uploadFileNamePrefix + userProfile.getUserProfileId() + "." + ext, convFile);
            por.setCannedAcl(CannedAccessControlList.PublicRead);
            s3client.putObject(por);
            
            //s3client.putObject(new PutObjectRequest(
            //		bucketName, uploadFileNamePrefix + userProfile.getUserProfileId() + "." + ext, convFile ) );
            
         } catch (AmazonServiceException ase) {
        	 String msg = "Caught an AmazonServiceException, which " +
             		"means your request made it " +
                     "to Amazon S3, but was rejected with an error response" +
                     " for some reason. ";
			     	 msg += "::Error Message:    " + ase.getMessage();
			     	 msg += "::HTTP Status Code: " + ase.getStatusCode();
			     	 msg += "::AWS Error Code:   " + ase.getErrorCode();
			     	 msg += "::Error Type:       " + ase.getErrorType();
			     	 msg += "::Request ID:       " + ase.getRequestId();
			
			     	 log.error(msg, ase);
        } catch (AmazonClientException ace) {
            String msg = "Caught an AmazonClientException, which " +
            		"means the client encountered " +
                    "an internal error while trying to " +
                    "communicate with S3, " +
                    "such as not being able to access the network.";
            
        	 log.error(msg, ace);
        }  catch (Exception e) {
            String msg = "Caught a General Amazon Exception, which ";			                
        	log.error(msg, e);
        }     	
    }	

    private void saveMultipartToDisk(MultipartFile file, UserProfile userProfile) throws Exception {
    	
    	
    	File dir = new File(this.calculateDestinationDirectory(userProfile));
        if(!dir.exists()) {
            dir.mkdirs();
        }
        File multipartFile = new File(this.calculateDestinationPath(file, userProfile));
        file.transferTo(multipartFile);
    }	
    
    
    private String getFileExtension(MultipartFile file ) {
		String filename = file.getOriginalFilename();
		return filename.substring(filename.lastIndexOf( "." ) + 1 );
	}
}
