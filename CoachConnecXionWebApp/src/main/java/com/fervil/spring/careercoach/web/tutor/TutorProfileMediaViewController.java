package com.fervil.spring.careercoach.web.tutor;

import java.sql.Blob;

import javax.annotation.Resource;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fervil.spring.careercoach.model.domain.ProfileMedias;
import com.fervil.spring.careercoach.model.domain.UserProfile;
import com.fervil.spring.careercoach.service.AddProfileMediaService;
import com.fervil.spring.careercoach.service.UserProfileManager;
import com.fervil.spring.careercoach.util.Constants;

public class TutorProfileMediaViewController {
    private static final Logger log = LoggerFactory.getLogger(TutorProfileMediaViewController.class);
	
	@Autowired
	private SessionFactory sessionFactory;


	@Resource(name = "addProfileMediaService")
	private AddProfileMediaService addProfileMediaService;

	@Resource(name = "userProfileManager")
	private UserProfileManager userProfileManager;
	
	@RequestMapping(value = "/tutor/addProfileMedia", method = RequestMethod.GET)
	public String getProfileMediaById(Model model, org.springframework.web.context.request.WebRequest webRequest) {
		log.debug("Received request to show Profile Media page");
		try{	
			model.addAttribute("profileMediaAttribute", new ProfileMedias());
			//List<ProfileMedias> addResumes = addProfileMediaService.getProfileMediasById(Long.valueOf(webRequest.getParameter("profileId")));
			UserProfile userProfile = userProfileManager.findById(Long.valueOf(webRequest.getParameter("profileId")));
	
			model.addAttribute("profileId", webRequest.getParameter("profileId"));
	
			model.addAttribute("userProfile", userProfile);
			return "tutor/profile/AddProfileMediaInfo";
			
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "tutor/public/common/error/errorpage";
		}	
	}


	@RequestMapping(value = "/tutor/addProfileMedia", method = RequestMethod.POST)
	public String saveImage(
			@ModelAttribute("profileMediaAttribute") UserProfile userProfile,
			@RequestParam("file") MultipartFile file, 
			@RequestParam(value = "profileId", required = true) long profileId,
			Model model, org.springframework.web.context.request.WebRequest webRequest) {         

 		try {

			log.debug("Received request to add new ProfileMedia");
			boolean errorValid = true;
			String fileName;
			if (file.isEmpty()) {
				model.addAttribute("errorMessage1", "Please Select an image to upload");
				errorValid = false;
			}
			if (errorValid == true) {
					
					Session session = sessionFactory.getCurrentSession();
					Blob blob = Hibernate.getLobCreator(session).createBlob(file.getInputStream(), file.getSize());
					
					userProfile.setUserProfileId(profileId);
					//userProfile.setContent(blob);
					//userProfile.setContenttype(file.getContentType());
					//userProfile.setVideoUrl(file.getContentType());
					userProfileManager.storeUserProfile(userProfile);
					model.addAttribute("successMessage", "Added Successfully");
					//fileName=images.getFileName();
				//} catch (Exception e) {
				//	e.printStackTrace();
				//	model.addAttribute("errorMessage",
				//			"Error occured during submission, please try again.");
				//}
					//List<ProfileMedias> addResumes = addProfileMediaService.getProfileMediasById(profileId);
					model.addAttribute("profileId", profileId);
				}
				//TODO  Check to make sure logic still works, we changed the try and if block around a bit.
				return "tutor/profile/AddProfileMedia";

			} catch (Exception e) {
		        String msg = "The request failed. Error " + e;
		        log.error(msg, e);
				model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				return "tutor/public/common/error/errorpage";
			}	
		}
}
