package com.fervil.spring.careercoach.web.tutor;

import java.io.OutputStream;
import java.sql.Blob;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fervil.spring.careercoach.model.domain.ResumesCertificates;
import com.fervil.spring.careercoach.service.AddEducationService;
import com.fervil.spring.careercoach.service.AddWorkExperienceService;
import com.fervil.spring.careercoach.service.AddresumeService;
import com.fervil.spring.careercoach.service.JobRatingService;
import com.fervil.spring.careercoach.service.PackageDetailsService;
import com.fervil.spring.careercoach.service.UserProfileManager;
import com.fervil.spring.careercoach.util.Constants;

/**
 * Handles and retrieves ProfileView request
 */
@Transactional
@Controller
public class TutorProfileViewResumeController {

    private static final Logger log = LoggerFactory.getLogger(TutorProfileViewResumeController.class);
	
	@Autowired
	private SessionFactory sessionFactory;

	@Resource(name = "addresumeService")
	private AddresumeService addresumeService;
	
	@Resource(name = "addEducationService")
	private AddEducationService addEducationService;

	@Resource(name = "addWorkExperienceService")
	private AddWorkExperienceService addWorkExperienceService;
	@Resource(name = "jobRatingService")
	private JobRatingService jobRatingService;

	@Resource(name = "userProfileManager")
	private UserProfileManager userProfileManager;

	@Resource(name = "packageDetailsService")
	private PackageDetailsService packageDetailsService;
	
	@RequestMapping(value = "/tutor/addResume", method = RequestMethod.GET)
	public String getAddResumeById(Model model, org.springframework.web.context.request.WebRequest webRequest) {
		log.debug("Received request to show  Resume page");

		try{
			model.addAttribute("resumeAttribute", new ResumesCertificates());
			List<ResumesCertificates> addResumes = addresumeService.getResumesById(Long.valueOf(webRequest.getParameter("profileId")));
	
			model.addAttribute("profileId", webRequest.getParameter("profileId"));
	
			model.addAttribute("addResumes", addResumes);
			return "tutor/profile/AddResume";
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "tutor/public/common/error/errorpage";
		}	
			
	}
	
	
	@RequestMapping(value = "/tutor/addResume", method = RequestMethod.POST)
	public String saveaddResume(
			@ModelAttribute("resumeAttribute") ResumesCertificates resumescertificates,
			@RequestParam("file") MultipartFile file, 
			@RequestParam(value = "profileId", required = true) long profileId,
			Model model, org.springframework.web.context.request.WebRequest webRequest) {         

		String extension=file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));		
		resumescertificates.setFileName(resumescertificates.getFileName() +  extension);

		try{
			log.debug("Received request to add new Resume");
			boolean errorValid = true;
			String fileName;
			if (resumescertificates.getFileName().trim().equals("") || resumescertificates.getFileName().isEmpty()) {
				model.addAttribute("errorMessage", "File Name Sholud not be empty");
				errorValid = false;
			}
			if (file.isEmpty()) {
				model.addAttribute("errorMessage1", "Please Select the file");
				errorValid = false;
			}
 			if (errorValid == true) {
				try {
					//Blob blob = Hibernate.createBlob(file.getInputStream());
					
					Session session = sessionFactory.getCurrentSession();
					Blob blob = Hibernate.getLobCreator(session).createBlob(file.getInputStream(), file.getSize());
					
					//resumescertificates.setCustomerid(customerId);
					// resumescertificates.setFileName(file.getOriginalFilename());
	
					//if (file.getOriginalFilename().isEmpty() || file.getOriginalFilename().trim().equals("")) {
					//	resumescertificates.setFileName(file.getName());
					//}
					resumescertificates.setContent(blob);
					resumescertificates.setContenttype(file.getContentType());
					resumescertificates.setProfileId(profileId);
 					addresumeService.save(resumescertificates);
					model.addAttribute("successMessage", "Added Successfully");
					fileName=resumescertificates.getFileName();
					//resumescertificates.setFileName("");
				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("errorMessage",
							"Error occured during submission, please try after some time");
				}
			}
			
			List<ResumesCertificates> addResumes = addresumeService.getResumesById(profileId);
			model.addAttribute("profileId", profileId);
	
			model.addAttribute("addResumes", addResumes);
	
			return "tutor/profile/AddResume";
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "tutor/public/common/error/errorpage";
		}	
	}
	
	@RequestMapping(value = "/tutor/download", method = RequestMethod.GET)
	public String download(
			@RequestParam(value = "id", required = true) Integer id,
			HttpServletResponse response, Model model) {
		log.info("Received request to download resume");
		try {
			ResumesCertificates resumesCertificates = addresumeService.get(id);

			response.setHeader("Content-Disposition", "inline;filename=\""
					+ resumesCertificates.getFileName() + "\"");
			OutputStream out = response.getOutputStream();
			response.setContentType(resumesCertificates.getContenttype());
			IOUtils.copy(resumesCertificates.getContent().getBinaryStream(),
					out);
			out.flush();
			out.close();
			return null;

		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "tutor/public/common/error/errorpage";
		}	
	}

	@RequestMapping(value = "/tutor/remove", method = RequestMethod.GET)
	public String remove(
			@ModelAttribute("resumeAttribute") ResumesCertificates resumescertificates,
			@RequestParam(value = "id", required = true) Integer id, Model model) {
		log.debug("Received request to remove Resume");
		try {
			addresumeService.remove(id);
			model.addAttribute("resumeMessage",
					"Your record has been successfully deleted");
			//} catch (Exception e) {
			//	model.addAttribute("resumeMessage1",
			//			"Sorry this record already deleted");
			//}
			List<ResumesCertificates> addResumes = addresumeService.getAllResumes();
			model.addAttribute("addResumes", addResumes);
			return "tutor/profile/AddResume";
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "tutor/public/common/error/errorpage";
		}	

	}
	
}
