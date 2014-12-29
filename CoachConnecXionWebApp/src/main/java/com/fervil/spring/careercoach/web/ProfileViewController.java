package com.fervil.spring.careercoach.web;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
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

import com.fervil.spring.careercoach.model.domain.EducationDetails;
import com.fervil.spring.careercoach.model.domain.Experiencedetails;
import com.fervil.spring.careercoach.model.domain.PackageDetails;
import com.fervil.spring.careercoach.model.domain.ResumesCertificates;
import com.fervil.spring.careercoach.model.domain.UserProfile;
import com.fervil.spring.careercoach.service.AddEducationService;
import com.fervil.spring.careercoach.service.AddWorkExperienceService;
import com.fervil.spring.careercoach.service.AddresumeService;
import com.fervil.spring.careercoach.service.JobRatingService;
import com.fervil.spring.careercoach.service.PackageDetailsService;
import com.fervil.spring.careercoach.service.UserProfileManager;
import com.fervil.spring.careercoach.util.Constants;
import com.fervil.spring.careercoach.util.SystemUtil;

/**
 * Handles and retrieves ProfileView request
 */
@Transactional
@Controller
public class ProfileViewController {
	
    private static final Logger log = LoggerFactory.getLogger(ProfileViewController.class);
	
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

	
	@RequestMapping(value = "/public/profile", method = RequestMethod.GET)
	public String getProfile(Model model, org.springframework.web.context.request.WebRequest webRequest, 
			HttpServletRequest request, HttpSession session) {
		log.debug("Received request to show profile");

		try{	
			long profileId = -1;
			
			// Updated for breadcrumb functionality
			//if (webRequest.getParameter("profileId") == null){

			if (webRequest.getParameter("BREADCRUMB") != null) {
				profileId = (Long.valueOf((String)session.getAttribute("profileViewCoachProfileId"))); //Added for breadcruumb
System.out.println("1111111" + profileId);				
			}else if (webRequest.getParameter("profileId") == null ){
System.out.println("222222" + profileId);				
				//cuin is the current logged in user
				if (webRequest.getParameter("cuin") == null){
System.out.println("3333333" + profileId);				
					return "redirect:users/login";
				} else { //Don't have profileId but am logged into the system
System.out.println("444444" + profileId);				

					//This logic is for new members who have created an account but have not yet created a profile
					profileId = SystemUtil.getUserProfileId(request, userProfileManager);
System.out.println("555555" + profileId);				

					if (profileId < 1){ //If no profile exists in the system for this user, send him/her to create a profile
System.out.println("666666" + profileId);				

						return "redirect:/createuserprofile";
					}
				}
			} else { //If here, I have logged in, and have a profileId
					profileId = Long.valueOf(webRequest.getParameter("profileId"));
System.out.println("77777" + profileId);				
					
			}
			session.setAttribute("profileViewCoachProfileId", webRequest.getParameter("profileId"));

			//session.setAttribute("coachProfileId", webRequest.getParameter("profileId"));
			
			//List<ResumesCertificates> addResumes = addresumeService.getAllResumes();
			List<ResumesCertificates> addResumes = addresumeService.getResumesById(profileId);
			model.addAttribute("addResumes", addResumes);
			
			//List<Imagess> addImages = addImageService.getImagesById(profileId);
			//model.addAttribute("addImages", addImages);
			
			//List<EducationDetails> addEducations = addEducationService.getAll();
			List<EducationDetails> addEducations = addEducationService.getEducationById(profileId);
			model.addAttribute("addEducations", addEducations);
	
			//List<Experiencedetails> addExperiences = addWorkExperienceService.getAllexperiences();
			List<Experiencedetails> addExperiences = addWorkExperienceService.getWorkExperiencesById(profileId);
			model.addAttribute("addExperiences", addExperiences);
			
			List<PackageDetails> availablePackages = packageDetailsService.getPackagesByProfileId(profileId);
			model.addAttribute("availablePackages", availablePackages);
	
			float averageRate1 = jobRatingService.getProfileRating(profileId);
			Integer totalClients = jobRatingService.totalClientCount(profileId);
	
		    //UserProfileManager userProfileManager = new BasicUserProfileManager();
			//userProfileManager = new BasicUserProfileManager();
		    //myModel.put("userProfileInfo", userProfileManager.findById(profileId));
			//List<EducationDetails> addEducations = addEducationService.getAll();
			//List<ProfileInfo> profileInfo = addEducationService.getEducationById(profileId);
			UserProfile userProfile = userProfileManager.findById(profileId);
			
			long loggedInUserProfileId = SystemUtil.getUserProfileId(request, userProfileManager);
			if (loggedInUserProfileId == profileId){
				model.addAttribute("profileOfCurrentUser", true);
			}
			
			String youtubeEmbed = "";
			if (userProfile.getVideo_url() != null && userProfile.getVideo_url().length() > 8){
				youtubeEmbed = getYouTubeEmbed(userProfile.getVideo_url());
				model.addAttribute("embed", youtubeEmbed);
			}
			
			model.addAttribute("profileInfo", userProfile);
			model.addAttribute("averageRate1", averageRate1);
			model.addAttribute("totalClients", totalClients);
			model.addAttribute("profileId", profileId);
	
			return "public/profile/ProfileOverview";
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
		}	
	}

	String getYouTubeEmbed(String videoURL){
		String embed = "";
		
		if (videoURL.indexOf(".be") > 0){
			String lastInfo = videoURL.substring(16, videoURL.length());
			String[] splitLink = lastInfo.split("\\?");
			embed = splitLink[0];
		} else if (videoURL.indexOf("channel") > 0){
			String lastInfo = videoURL.substring(31, videoURL.length());
			String[] splitLink = lastInfo.split("\\?");
			embed = splitLink[0];
		} else if (videoURL.indexOf("v=") > 0){
			String lastInfo = videoURL.substring(31, videoURL.length());
			embed = lastInfo;
		}
		
		return embed;
	}
	
	/*	
	@RequestMapping(value = "/education", method = RequestMethod.GET)
	public String getEducation(Model model) {
		log.debug("Received request to show all education details");
		List<EducationDetails> addEducations = addEducationService.getAll();
		model.addAttribute("addEducations", addEducations);
		return "education/Education";
	}

	@RequestMapping(value = "/addEditWorkExperience", method = RequestMethod.GET)
	public String getAddEditWorkExperience(Model model) {
		log.debug("Received request to show Edit Work Experiecnce page from Profile");
		return "workexperience/AddEditWorkExperience";
	}

	@RequestMapping(value = "/addResume_initial", method = RequestMethod.GET)
	public String getAddResume(Model model) {
		log.debug("Received request to show  Resume page");
		model.addAttribute("resumeAttribute", new ResumesCertificates());
		List<ResumesCertificates> addResumes = addresumeService.getAllResumes();
		model.addAttribute("addResumes", addResumes);
		return "profile/AddResume";
	}
*/	

	/*
	@RequestMapping(value = "/workexperience", method = RequestMethod.GET)
	public String getWorkexperience(Model model, org.springframework.web.context.request.WebRequest webRequest) {
		log.debug("Received request to show all workexperience");
		try{
			List<Experiencedetails> addExperiences = addWorkExperienceService.getWorkExperiencesById(Integer.valueOf(webRequest.getParameter("profileId")));
			model.addAttribute("profileId", Integer.valueOf(webRequest.getParameter("profileId")));
			model.addAttribute("addExperiences", addExperiences);
			return "workexperience/WorkExperience";
		
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
		}	
		
	}
*/
/* Moved to education controller 	
	@RequestMapping(value = "/education", method = RequestMethod.GET)
	public String getEducation(Model model, org.springframework.web.context.request.WebRequest webRequest) {
		log.debug("Received request to show all education details");

		try{
			List<EducationDetails> addEducations = addEducationService.getEducationById(Integer.valueOf(webRequest.getParameter("profileId")));
			model.addAttribute("profileId", Integer.valueOf(webRequest.getParameter("profileId")));
			model.addAttribute("addEducations", addEducations);
			return "education/Education";
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
		}	
	}
*/
/*	
	@RequestMapping(value = "/addEditWorkExperience", method = RequestMethod.GET)
	public String getAddEditWorkExperience(Model model, org.springframework.web.context.request.WebRequest webRequest) {
		log.debug("Received request to show Edit Work Experiecnce page from Profile");

		try{
			model.addAttribute("profileId", Integer.valueOf(webRequest.getParameter("profileId")));
			return "workexperience/AddEditWorkExperience";
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
		}	

	
	}
*/	
/*  Moved to Resume Controller 	
	@RequestMapping(value = "/addResume", method = RequestMethod.GET)
	public String getAddResumeById(Model model, org.springframework.web.context.request.WebRequest webRequest) {
		log.debug("Received request to show  Resume page");

		try{
			model.addAttribute("resumeAttribute", new ResumesCertificates());
			System.out.println(" The Profile Id is: " + webRequest.getParameter("profileId") );
			List<ResumesCertificates> addResumes = addresumeService.getResumesById(Long.valueOf(webRequest.getParameter("profileId")));
	
			model.addAttribute("profileId", webRequest.getParameter("profileId"));
	
			model.addAttribute("addResumes", addResumes);
			return "profile/AddResume";
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
		}	
			
	}
	
	
	@RequestMapping(value = "/addResume", method = RequestMethod.POST)
	public String saveaddResume(
			@ModelAttribute("resumeAttribute") ResumesCertificates resumescertificates,
			@RequestParam("file") MultipartFile file, 
			@RequestParam(value = "profileId", required = true) long profileId,
			Model model, org.springframework.web.context.request.WebRequest webRequest) {         

		//System.out.println(" The profile Id in AddResume is /addResume -- RequestMethod.POST: " );

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
			System.out.println(resumescertificates.getFileName());
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
					System.out.println("The profile Id is: " + profileId);
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
	
			return "profile/AddResume";
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
		}	
			
	}
*/	

/* Moved to add resume controller

	@RequestMapping(value = "/download", method = RequestMethod.GET)
	public String download(
			@RequestParam(value = "id", required = true) Integer id,
			HttpServletResponse response, Model model) {
		log.debug("Received request to download resume");
		//System.out.println("ID VALUE :" + id);
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
			return "public/common/error/errorpage";
		}	
	}

  	
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
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
			return "profile/AddResume";
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
		}	

	}
*/
	@RequestMapping(value = "/remove1", method = RequestMethod.GET)
	public String remove1(
			@ModelAttribute("resumeAttribute") ResumesCertificates resumescertificates,
			@RequestParam(value = "id", required = true) Integer id, Model model) {
		try {
			addresumeService.remove(id);
			model.addAttribute("resumeMessage",
					"Your record has been successfully deleted");
			List<ResumesCertificates> addResumes = addresumeService.getAllResumes();
			model.addAttribute("addResumes", addResumes);
			List<EducationDetails> addEducations = addEducationService.getAll();
			model.addAttribute("addEducations", addEducations);
			List<Experiencedetails> jobHostoryAttribute = addWorkExperienceService
					.getAllexperiences();
			model.addAttribute("jobHostoryAttribute", jobHostoryAttribute);
			return "public/profile/ProfileOverview";
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
		}	
		
	}
/*
	@RequestMapping(value = "/educationAdd", method = RequestMethod.GET)
	public String getEducationAdd(Model model, org.springframework.web.context.request.WebRequest webRequest) {
		model.addAttribute("educationAttribute", new EducationDetails());
		model.addAttribute("profileId", Integer.valueOf(webRequest.getParameter("profileId")));
		try{
			return "education/AddEducation";
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
		}	
	}

	@RequestMapping(value = "/educationAdd", method = RequestMethod.POST)
	public String packageAdd(
			@ModelAttribute("educationAttribute") EducationDetails educationDetails,
			Model model, org.springframework.web.context.request.WebRequest webRequest) {
		log.debug("Received request to add new Education");
		
		try{
			long profileId = webRequest.getParameter("profileId")==null?-1:Long.valueOf(webRequest.getParameter("profileId"));
			
			boolean errorValid = true;
			if (educationDetails.getDegreeLevel().equals("-1")) {
				model.addAttribute("errorMessage", "Select value for DegreeLevel");
				errorValid = false;
			}
			if (educationDetails.getSchoolName() == ""
					|| educationDetails.getSchoolName().isEmpty()) {
				model.addAttribute("errorMessage1",
						"School Name should not be empty");
				errorValid = false;
			}
			if (educationDetails.getFromDate() == ""
					|| educationDetails.getFromDate().isEmpty()) {
				model.addAttribute("errorMessage2", "From date should not be empty");
				errorValid = false;
			} else {
				String startDate = educationDetails.getFromDate();
				System.out.println("Start Date :" + startDate);
				DateFormat formatter;
				Date date;
				if (startDate.length() == 10) {
					if (startDate.substring(2, 3).equals("/")
							&& startDate.substring(5, 6).equals("/")) {
						int i = 0;
						try {
							formatter = new SimpleDateFormat("mm/dd/yyyy");
							date = (Date) formatter.parse(startDate);
							int month = Integer.parseInt(startDate.substring(0, 2));
							int date1 = Integer.parseInt(startDate.substring(3, 5));
							int year1 = Integer
									.parseInt(startDate.substring(6, 10));
							System.out.println("YEAR1 :" + year1);
							if (year1 == 0) {
								model.addAttribute("errorMessage2",
										"Year Should not be 0000");
								errorValid = false;
								i = 1;
							}
							if (month == 0) {
								model.addAttribute("errorMessage2",
										"month Should not be 00");
								errorValid = false;
								i = 1;
							}
							if (date1 == 0) {
								model.addAttribute("errorMessage2",
										"Day should not be 00");
								errorValid = false;
								i = 1;
							}
							if (month > 12) {
								model.addAttribute("errorMessage2",
										"month Should  be less than 12");
								errorValid = false;
								i = 1;
							} else {
								if (month == 2) {
									if (date1 > 28) {
										model.addAttribute("errorMessage2",
												"Date Should  be less than 28");
										model.addAttribute("successMessage", "");
										errorValid = false;
										i = 1;
									}
								}
							}
							if (date1 > 31) {
								model.addAttribute("errorMessage2",
										"Date Should  be less than 31");
								model.addAttribute("successMessage", "");
								errorValid = false;
								i = 1;
							}
						} catch (ParseException e) {
							model.addAttribute("successMessage", "");
							errorValid = false;
							model.addAttribute("errorMessage2",
									"Unknown Date format :" + startDate);
							System.out.println("Exception :" + e);
						}
					} else {
						model.addAttribute("successMessage", "");
						model.addAttribute("errorMessage2", "Unknown Date format :"
								+ startDate);
						errorValid = false;
					}
				} else {
					model.addAttribute("successMessage", "");
					model.addAttribute("errorMessage2", "Unknown Date format :"
							+ startDate);
					errorValid = false;
				}
	
			}
			if (educationDetails.getToDate() == ""
					|| educationDetails.getToDate().isEmpty()) {
			} else {
				String startDate = educationDetails.getToDate();
				System.out.println("Start Date :" + startDate);
				DateFormat formatter;
				Date date;
				if (startDate.length() == 10) {
					if (startDate.substring(2, 3).equals("/")
							&& startDate.substring(5, 6).equals("/")) {
						int i = 0;
						try {
							formatter = new SimpleDateFormat("mm/dd/yyyy");
							date = (Date) formatter.parse(startDate);
							int month = Integer.parseInt(startDate.substring(0, 2));
							int date1 = Integer.parseInt(startDate.substring(3, 5));
							int year1 = Integer
									.parseInt(startDate.substring(6, 10));
							System.out.println("YEAR1 :" + year1);
							if (year1 == 0) {
								model.addAttribute("errorMessage6",
										"Year Should not be 0000");
								errorValid = false;
								i = 1;
							}
							if (month == 0) {
								model.addAttribute("errorMessage6",
										"month Should not be 00");
								errorValid = false;
								i = 1;
							}
							if (date1 == 0) {
								model.addAttribute("errorMessage6",
										"Day should not be 00");
								errorValid = false;
								i = 1;
							}
	
							if (month > 12) {
								model.addAttribute("errorMessage6",
										"month Should  be less than 12");
								errorValid = false;
								i = 1;
							} else {
								if (month == 2) {
									if (date1 > 28) {
										model.addAttribute("errorMessage6",
												"Date Should  be less than 28");
										model.addAttribute("successMessage", "");
										errorValid = false;
										i = 1;
									}
								}
							}
							if (date1 > 31) {
								model.addAttribute("errorMessage6",
										"Date Should  be less than 31");
								model.addAttribute("successMessage", "");
								errorValid = false;
								i = 1;
							}
							if (i == 0) {
								SimpleDateFormat sdf = new SimpleDateFormat(
										"MM/dd/yyyy");
								Date date3 = sdf.parse(educationDetails
										.getFromDate());
								Date date4 = sdf
										.parse(educationDetails.getToDate());
								if (date3.compareTo(date4) < 0) {
									System.out.println("Date1 is before Date2");
								} else if (date3.compareTo(date4) == 0) {
									System.out.println("Date1 is equal to Date2");
								} else {
									errorValid = false;
									model.addAttribute("errorMessage6",
											"To Date Should be ahead of the From Date");
								}
							}
							System.out.println("Month :" + month + "Date :" + date1
									+ "DATE 1 :" + date);
						} catch (ParseException e) {
							model.addAttribute("successMessage", "");
							errorValid = false;
							model.addAttribute("errorMessage6",
									"Unknown Date format :" + startDate);
							System.out.println("Exception :" + e);
						}
					} else {
						model.addAttribute("successMessage", "");
						model.addAttribute("errorMessage6", "Unknown Date format :"
								+ startDate);
						errorValid = false;
					}
				} else {
					model.addAttribute("successMessage", "");
					model.addAttribute("errorMessage6", "Unknown Date format :"
							+ startDate);
					errorValid = false;
				}
			}
	
			if (educationDetails.getConcentrationsName() == ""
					|| educationDetails.getConcentrationsName().isEmpty()) {
				model.addAttribute("errorMessage3",
						"Concentrations value should not be empty");
				errorValid = false;
			}
			if (educationDetails.getCountryName() == ""
					|| educationDetails.getCountryName().isEmpty()) {
				model.addAttribute("errorMessage4",
						"Country Name Should not be empty");
				errorValid = false;
			}
			if (educationDetails.getLocationsName() == ""
					|| educationDetails.getLocationsName().isEmpty()) {
				model.addAttribute("errorMessage5", "Location Should not be empty");
				errorValid = false;
			}
			if (errorValid == true) {
				try {
					educationDetails.setProfileId(profileId);
					addEducationService.add(educationDetails);
					model.addAttribute("successMessage",
							"Education details Added successfully");
				} catch (Exception e) {
					model.addAttribute("errorMessage",
							"Your records not updated successfully, please try after some time");
					model.addAttribute("successMessage", "");
				}
			} else {
				model.addAttribute("successMessage", "");
			}
			model.addAttribute("profileId", profileId);
			return "education/AddEducation";
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
		}	
			
	}

	@RequestMapping(value = "/educationEdit", method = RequestMethod.GET)
	public String getEducationEdit(
			@RequestParam(value = "id", required = true) Integer id, Model model, org.springframework.web.context.request.WebRequest webRequest) {
		try{
			System.out.println("The Id from WebRequest is: " + webRequest.getParameter("profileId"));
			model.addAttribute("profileId", webRequest.getParameter("profileId"));
			model.addAttribute("educationAttribute", addEducationService.get(id));
			return "education/EditEducation";
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
		}	
			
	}

	@RequestMapping(value = "/educationEdit", method = RequestMethod.POST)
	public String saveeducationEdit(
			@ModelAttribute("educationAttribute") EducationDetails educationDetails,
			@RequestParam(value = "id", required = true) Integer id, Model model, org.springframework.web.context.request.WebRequest webRequest) {

		try{
			educationDetails.setId(id);
			boolean errorValid = true;
			if (educationDetails.getDegreeLevel().equals("-1")) {
				model.addAttribute("errorMessage", "Select value for DegreeLevel");
				errorValid = false;
			}
			if (educationDetails.getSchoolName() == ""
					|| educationDetails.getSchoolName().isEmpty()) {
				model.addAttribute("errorMessage1",
						"School Name should not be empty");
				errorValid = false;
			}
			if (educationDetails.getFromDate() == ""
					|| educationDetails.getFromDate().isEmpty()) {
				model.addAttribute("errorMessage2", "From date should not be empty");
				errorValid = false;
			} else {
				String startDate = educationDetails.getFromDate();
				System.out.println("Start Date :" + startDate);
				DateFormat formatter;
				Date date;
				if (startDate.length() == 10) {
					if (startDate.substring(2, 3).equals("/")
							&& startDate.substring(5, 6).equals("/")) {
						int i = 0;
						try {
							formatter = new SimpleDateFormat("mm/dd/yyyy");
							date = (Date) formatter.parse(startDate);
							int month = Integer.parseInt(startDate.substring(0, 2));
							int date1 = Integer.parseInt(startDate.substring(3, 5));
							int year1 = Integer
									.parseInt(startDate.substring(6, 10));
							System.out.println("YEAR1 :" + year1);
							if (year1 == 0) {
								model.addAttribute("errorMessage2",
										"Year Should not be 0000");
								errorValid = false;
								i = 1;
							}
							if (month == 0) {
								model.addAttribute("errorMessage2",
										"month Should not be 00");
								errorValid = false;
								i = 1;
							}
							if (date1 == 0) {
								model.addAttribute("errorMessage2",
										"Day should not be 00");
								errorValid = false;
								i = 1;
							}
							if (month > 12) {
								model.addAttribute("errorMessage2",
										"month Should  be less than 12");
								errorValid = false;
								i = 1;
							} else {
								if (month == 2) {
									if (date1 > 28) {
										model.addAttribute("errorMessage2",
												"Date Should  be less than 28");
										model.addAttribute("successMessage", "");
										errorValid = false;
										i = 1;
									}
								}
							}
							if (date1 > 31) {
								model.addAttribute("errorMessage2",
										"Date Should  be less than 31");
								model.addAttribute("successMessage", "");
								errorValid = false;
								i = 1;
							}
						} catch (ParseException e) {
							model.addAttribute("successMessage", "");
							errorValid = false;
							model.addAttribute("errorMessage2",
									"Unknown Date format :" + startDate);
							System.out.println("Exception :" + e);
						}
					} else {
						model.addAttribute("successMessage", "");
						model.addAttribute("errorMessage2", "Unknown Date format :"
								+ startDate);
						errorValid = false;
					}
				} else {
					model.addAttribute("successMessage", "");
					model.addAttribute("errorMessage2", "Unknown Date format :"
							+ startDate);
					errorValid = false;
				}
	
			}
			if (educationDetails.getToDate() == ""
					|| educationDetails.getToDate().isEmpty()) {
			} else {
				String startDate = educationDetails.getToDate();
				System.out.println("Start Date :" + startDate);
				DateFormat formatter;
				Date date;
				if (startDate.length() == 10) {
					if (startDate.substring(2, 3).equals("/")
							&& startDate.substring(5, 6).equals("/")) {
						int i = 0;
						try {
							formatter = new SimpleDateFormat("mm/dd/yyyy");
							date = (Date) formatter.parse(startDate);
							int month = Integer.parseInt(startDate.substring(0, 2));
							int date1 = Integer.parseInt(startDate.substring(3, 5));
							int year1 = Integer
									.parseInt(startDate.substring(6, 10));
							System.out.println("YEAR1 :" + year1);
							if (year1 == 0) {
								model.addAttribute("errorMessage6",
										"Year Should not be 0000");
								errorValid = false;
								i = 1;
							}
							if (month == 0) {
								model.addAttribute("errorMessage6",
										"month Should not be 00");
								errorValid = false;
								i = 1;
							}
							if (date1 == 0) {
								model.addAttribute("errorMessage6",
										"Day should not be 00");
								errorValid = false;
								i = 1;
							}
	
							if (month > 12) {
								model.addAttribute("errorMessage6",
										"month Should  be less than 12");
								errorValid = false;
								i = 1;
							} else {
								if (month == 2) {
									if (date1 > 28) {
										model.addAttribute("errorMessage6",
												"Date Should  be less than 28");
										model.addAttribute("successMessage", "");
										errorValid = false;
										i = 1;
									}
								}
							}
							if (date1 > 31) {
								model.addAttribute("errorMessage6",
										"Date Should  be less than 31");
								model.addAttribute("successMessage", "");
								errorValid = false;
								i = 1;
							}
							if (i == 0) {
								SimpleDateFormat sdf = new SimpleDateFormat(
										"MM/dd/yyyy");
								Date date3 = sdf.parse(educationDetails
										.getFromDate());
								Date date4 = sdf
										.parse(educationDetails.getToDate());
								if (date3.compareTo(date4) < 0) {
									System.out.println("Date1 is before Date2");
								} else if (date3.compareTo(date4) == 0) {
									System.out.println("Date1 is equal to Date2");
								} else {
									errorValid = false;
									model.addAttribute("errorMessage6",
											"To Date Should be ahead of the From Date");
								}
							}
							System.out.println("Month :" + month + "Date :" + date1
									+ "DATE 1 :" + date);
						} catch (ParseException e) {
							model.addAttribute("successMessage", "");
							errorValid = false;
							model.addAttribute("errorMessage6",
									"Unknown Date format :" + startDate);
							System.out.println("Exception :" + e);
						}
					} else {
						model.addAttribute("successMessage", "");
						model.addAttribute("errorMessage6", "Unknown Date format :"
								+ startDate);
						errorValid = false;
					}
				} else {
					model.addAttribute("successMessage", "");
					model.addAttribute("errorMessage6", "Unknown Date format :"
							+ startDate);
					errorValid = false;
				}
			}
	
			if (educationDetails.getConcentrationsName() == ""
					|| educationDetails.getConcentrationsName().isEmpty()) {
				model.addAttribute("errorMessage3",
						"Concentrations value should not be empty");
				errorValid = false;
			}
			if (educationDetails.getCountryName() == ""
					|| educationDetails.getCountryName().isEmpty()) {
				model.addAttribute("errorMessage4",
						"Country Name Should not be empty");
				errorValid = false;
			}
			if (educationDetails.getLocationsName() == ""
					|| educationDetails.getLocationsName().isEmpty()) {
				model.addAttribute("errorMessage5", "Location Should not be empty");
				errorValid = false;
			}
	
			if (errorValid == true) {
				try {
					addEducationService.edit(educationDetails);
					model.addAttribute("successMessage",
							"Your Education details updated successfully");
				} catch (Exception e) {
					model.addAttribute("errorMessage",
							"Your Education details not updated successfully, please try after some time");
					model.addAttribute("successMessage", "");
				}
			} else {
				model.addAttribute("successMessage", "");
			}
			System.out.println("The Id from WebRequest is: + " + webRequest.getParameter("profileId"));
			model.addAttribute("profileId", webRequest.getParameter("profileId"));
			model.addAttribute("id", id);
			return "education/EditEducation";
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
		}	
			
	}
*/
	
/* Moving work Experience       	
	@RequestMapping(value = "/experienceEdit", method = RequestMethod.GET)
	public String getExperienceEdit(
			@RequestParam(value = "id", required = true) Integer id, Model model) {
		log.debug("Received request to show edit page");
		try{
			model.addAttribute("jobHistoryAttribute",
					addWorkExperienceService.get(id));
			return "workexperience/EditWorkExperience";
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
		}	

	}

	@RequestMapping(value = "/experienceEdit", method = RequestMethod.POST)
	public String saveexperienceEdit(
			@ModelAttribute("jobHistoryAttribute") Experiencedetails experiencedetails,
			@RequestParam(value = "id", required = true) Integer id, Model model) {

		try{
			log.debug("Received request to update Experience");
			experiencedetails.setId(id);
			boolean errorValid = true;
	
			if (experiencedetails.getStartDate() == ""
					|| experiencedetails.getStartDate().isEmpty()) {
				model.addAttribute("errorMessage6", "Start Date Should not empty");
				errorValid = false;
			} else {
				String startDate = experiencedetails.getStartDate();
				System.out.println("Start Date :" + startDate);
				DateFormat formatter;
				Date date;
				if (startDate.length() == 10) {
					if (startDate.substring(2, 3).equals("/")
							&& startDate.substring(5, 6).equals("/")) {
						try {
							formatter = new SimpleDateFormat("mm/dd/yyyy");
							date = (Date) formatter.parse(startDate);
							int month = Integer.parseInt(startDate.substring(0, 2));
							int date1 = Integer.parseInt(startDate.substring(3, 5));
							int year1 = Integer
									.parseInt(startDate.substring(6, 10));
							if (year1 == 0) {
								model.addAttribute("errorMessage6",
										"Year Should not be 0000");
								errorValid = false;
							}
							if (month == 0) {
								model.addAttribute("errorMessage6",
										"month Should not be 00");
								errorValid = false;
							}
							if (date1 == 0) {
								model.addAttribute("errorMessage6",
										"Day should not be 00");
								errorValid = false;
							}
							if (month > 12) {
								model.addAttribute("errorMessage6",
										"month Should  be less than 12");
								model.addAttribute("successMessage", "");
								errorValid = false;
							} else {
								if (month == 2) {
									if (date1 > 28) {
										model.addAttribute("errorMessage6",
												"Date Should  be less than 28");
										model.addAttribute("successMessage", "");
										errorValid = false;
									}
								}
							}
							if (date1 > 31) {
								model.addAttribute("errorMessage6",
										"Date Should  be less than 31");
								model.addAttribute("successMessage", "");
								errorValid = false;
							}
	
							System.out.println("Month :" + month + "Date :" + date1
									+ "DATE 1 :" + date);
						} catch (ParseException e) {
							model.addAttribute("successMessage", "");
							errorValid = false;
							model.addAttribute("errorMessage6",
									"Unknown Date format :" + startDate);
							System.out.println("Exception :" + e);
						}
					} else {
						model.addAttribute("successMessage", "");
						model.addAttribute("errorMessage6", "Unknown Date format :"
								+ startDate);
						errorValid = false;
					}
				} else {
					model.addAttribute("successMessage", "");
					model.addAttribute("errorMessage6", "Unknown Date format :"
							+ startDate);
					errorValid = false;
				}
			}
			if (experiencedetails.getEndDate() == ""
					|| experiencedetails.getEndDate().isEmpty()) {
			} else {
				String startDate = experiencedetails.getEndDate();
				System.out.println("Start Date :" + startDate);
				DateFormat formatter;
				Date date;
				if (startDate.length() == 10) {
					if (startDate.substring(2, 3).equals("/")
							&& startDate.substring(5, 6).equals("/")) {
						int i = 0;
						try {
							formatter = new SimpleDateFormat("mm/dd/yyyy");
							date = (Date) formatter.parse(startDate);
							int month = Integer.parseInt(startDate.substring(0, 2));
							int date1 = Integer.parseInt(startDate.substring(3, 5));
							int year1 = Integer
									.parseInt(startDate.substring(6, 10));
							if (year1 == 0) {
								model.addAttribute("errorMessage7",
										"Year Should not be 0000");
								errorValid = false;
							}
							if (month == 0) {
								model.addAttribute("errorMessage7",
										"month Should not be 00");
								errorValid = false;
							}
							if (date1 == 0) {
								model.addAttribute("errorMessage7",
										"Day should not be 00");
								errorValid = false;
							}
							if (month > 12) {
								model.addAttribute("errorMessage7",
										"month Should  be less than 12");
								model.addAttribute("successMessage", "");
								i = 1;
								errorValid = false;
							} else {
								if (month == 2) {
									if (date1 > 28) {
										model.addAttribute("errorMessage7",
												"Date Should  be less than 28");
										model.addAttribute("successMessage", "");
										errorValid = false;
										i = 1;
									}
								}
							}
							if (date1 > 31) {
								model.addAttribute("errorMessage7",
										"Date Should  be less than 31");
								model.addAttribute("successMessage", "");
								errorValid = false;
								i = 1;
							}
							if (i == 0) {
								SimpleDateFormat sdf = new SimpleDateFormat(
										"MM/dd/yyyy");
								Date date3 = sdf.parse(experiencedetails
										.getStartDate());
								Date date4 = sdf.parse(experiencedetails
										.getEndDate());
								if (date3.compareTo(date4) < 0) {
									System.out.println("Date1 is before Date2");
								} else if (date3.compareTo(date4) == 0) {
									System.out.println("Date1 is equal to Date2");
								} else {
									errorValid = false;
									model.addAttribute("errorMessage7",
											"End Date Should be ahead of the Start date");
								}
							}
						} catch (ParseException e) {
							model.addAttribute("successMessage", "");
							errorValid = false;
							model.addAttribute("errorMessage7",
									"Unknown Date format :" + startDate);
							System.out.println("Exception :" + e);
						}
					} else {
						model.addAttribute("successMessage", "");
						model.addAttribute("errorMessage7", "Unknown Date format :"
								+ startDate);
						errorValid = false;
					}
				} else {
					model.addAttribute("successMessage", "");
					model.addAttribute("errorMessage7", "Unknown Date format :"
							+ startDate);
					errorValid = false;
				}
			}
			if (experiencedetails.getDescriptionDetails() == ""
					|| experiencedetails.getDescriptionDetails().isEmpty()) {
				model.addAttribute("errorMessage5",
						"Job Description Should not empty");
				errorValid = false;
			}
			if (experiencedetails.getLocationName() == ""
					|| experiencedetails.getLocationName().isEmpty()) {
				model.addAttribute("errorMessage4",
						"Location Name Should not empty");
				errorValid = false;
			}
			if (experiencedetails.getCountryName() == ""
					|| experiencedetails.getCountryName().isEmpty()) {
				model.addAttribute("errorMessage3", "Country Name Should not empty");
				errorValid = false;
			}
			if (experiencedetails.getLabelName() == ""
					|| experiencedetails.getLabelName().isEmpty()) {
				model.addAttribute("errorMessage2", "Title Should not empty");
				errorValid = false;
			}
			if (experiencedetails.getEmployerName() == ""
					|| experiencedetails.getEmployerName().isEmpty()) {
				model.addAttribute("errorMessage1",
						"Employer Name Should not empty");
				errorValid = false;
			}
	
			if (errorValid == true) {
				try {
					addWorkExperienceService.edit(experiencedetails);
					model.addAttribute("id", id);
					model.addAttribute("successMessage",
							"Your Work Experience updated successfully");
				} catch (Exception e) {
					model.addAttribute("errorMessage",
							"Sorry work experience record not found in the database");
					model.addAttribute("successMessage", "");
				}
	
			} else {
				model.addAttribute("successMessage", "");
			}
			
			return "workexperience/EditWorkExperience";
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
		}	
	}

	@RequestMapping(value = "/jobhistoryAdd", method = RequestMethod.GET)
	public String getJobhistoryAdd(Model model, org.springframework.web.context.request.WebRequest webRequest) {
		try{
			model.addAttribute("jobHistoryAttribute", new Experiencedetails());
			model.addAttribute("profileId", Integer.valueOf(webRequest.getParameter("profileId")));
			return "workexperience/AddWorkExperience";
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
		}	
			
	}

	@RequestMapping(value = "/jobhistoryAdd", method = RequestMethod.POST)
	public String jobhistoryAdd(
			@ModelAttribute("jobHistoryAttribute") Experiencedetails experiencedetails,
			Model model, org.springframework.web.context.request.WebRequest webRequest) {

		try{
			long profileId = webRequest.getParameter("profileId")==null?-1:Long.valueOf(webRequest.getParameter("profileId"));
	
			log.debug("Received request to add new Education");
			boolean errorValid = true;
			if (experiencedetails.getStartDate() == ""
					|| experiencedetails.getStartDate().isEmpty()) {
				model.addAttribute("errorMessage6", "Start Date Should not empty");
				errorValid = false;
			} else {
				String startDate = experiencedetails.getStartDate();
				System.out.println("Start Date :" + startDate);
				DateFormat formatter;
				Date date;
				if (startDate.length() == 10) {
					if (startDate.substring(2, 3).equals("/")
							&& startDate.substring(5, 6).equals("/")) {
						try {
							formatter = new SimpleDateFormat("mm/dd/yyyy");
							date = (Date) formatter.parse(startDate);
							int month = Integer.parseInt(startDate.substring(0, 2));
							int date1 = Integer.parseInt(startDate.substring(3, 5));
							int year1 = Integer
									.parseInt(startDate.substring(6, 10));
							if (year1 == 0) {
								model.addAttribute("errorMessage6",
										"Year Should not be 0000");
								errorValid = false;
							}
							if (month == 0) {
								model.addAttribute("errorMessage6",
										"month Should not be 00");
								errorValid = false;
							}
							if (date1 == 0) {
								model.addAttribute("errorMessage6",
										"Day should not be 00");
								errorValid = false;
							}
							if (month > 12) {
								model.addAttribute("errorMessage6",
										"month Should  be less than 12");
								model.addAttribute("successMessage", "");
								errorValid = false;
							} else {
								if (month == 2) {
									if (date1 > 28) {
										model.addAttribute("errorMessage6",
												"Date Should  be less than 28");
										model.addAttribute("successMessage", "");
										errorValid = false;
									}
								}
							}
							if (date1 > 31) {
								model.addAttribute("errorMessage6",
										"Date Should  be less than 31");
								model.addAttribute("successMessage", "");
								errorValid = false;
							}
	
							System.out.println("Month :" + month + "Date :" + date1
									+ "DATE 1 :" + date);
						} catch (ParseException e) {
							model.addAttribute("successMessage", "");
							errorValid = false;
							model.addAttribute("errorMessage6",
									"Unknown Date format :" + startDate);
							System.out.println("Exception :" + e);
						}
					} else {
						model.addAttribute("successMessage", "");
						model.addAttribute("errorMessage6", "Unknown Date format :"
								+ startDate);
						errorValid = false;
					}
				} else {
					model.addAttribute("successMessage", "");
					model.addAttribute("errorMessage6", "Unknown Date format :"
							+ startDate);
					errorValid = false;
				}
			}
			if (experiencedetails.getEndDate() == ""
					|| experiencedetails.getEndDate().isEmpty()) {
			} else {
				String startDate = experiencedetails.getEndDate();
				System.out.println("Start Date :" + startDate);
				DateFormat formatter;
				Date date;
				if (startDate.length() == 10) {
					if (startDate.substring(2, 3).equals("/")
							&& startDate.substring(5, 6).equals("/")) {
						int i = 0;
						try {
							formatter = new SimpleDateFormat("mm/dd/yyyy");
							date = (Date) formatter.parse(startDate);
							int month = Integer.parseInt(startDate.substring(0, 2));
							int date1 = Integer.parseInt(startDate.substring(3, 5));
							int year1 = Integer
									.parseInt(startDate.substring(6, 10));
							if (year1 == 0) {
								model.addAttribute("errorMessage7",
										"Year Should not be 0000");
								errorValid = false;
							}
							if (month == 0) {
								model.addAttribute("errorMessage7",
										"month Should not be 00");
								errorValid = false;
							}
							if (date1 == 0) {
								model.addAttribute("errorMessage7",
										"Day should not be 00");
								errorValid = false;
							}
							if (month > 12) {
								model.addAttribute("errorMessage7",
										"month Should  be less than 12");
								model.addAttribute("successMessage", "");
								i = 1;
								errorValid = false;
							} else {
								if (month == 2) {
									if (date1 > 28) {
										model.addAttribute("errorMessage7",
												"Date Should  be less than 28");
										model.addAttribute("successMessage", "");
										errorValid = false;
										i = 1;
									}
								}
							}
							if (date1 > 31) {
								model.addAttribute("errorMessage7",
										"Date Should  be less than 31");
								model.addAttribute("successMessage", "");
								errorValid = false;
								i = 1;
							}
							if (i == 0) {
								SimpleDateFormat sdf = new SimpleDateFormat(
										"MM/dd/yyyy");
								Date date3 = sdf.parse(experiencedetails
										.getStartDate());
								Date date4 = sdf.parse(experiencedetails
										.getEndDate());
								if (date3.compareTo(date4) < 0) {
									System.out.println("Date1 is before Date2");
								} else if (date3.compareTo(date4) == 0) {
									System.out.println("Date1 is equal to Date2");
								} else {
									errorValid = false;
									model.addAttribute("errorMessage7",
											"End Date Should be ahead of the Start date");
								}
							}
						} catch (ParseException e) {
							model.addAttribute("successMessage", "");
							errorValid = false;
							model.addAttribute("errorMessage7",
									"Unknown Date format :" + startDate);
							System.out.println("Exception :" + e);
						}
					} else {
						model.addAttribute("successMessage", "");
						model.addAttribute("errorMessage7", "Unknown Date format :"
								+ startDate);
						errorValid = false;
					}
				} else {
					model.addAttribute("successMessage", "");
					model.addAttribute("errorMessage7", "Unknown Date format :"
							+ startDate);
					errorValid = false;
				}
			}
			if (experiencedetails.getDescriptionDetails() == ""
					|| experiencedetails.getDescriptionDetails().isEmpty()) {
				model.addAttribute("errorMessage5",
						"Job Description Should not empty");
				errorValid = false;
			}
			if (experiencedetails.getLocationName() == ""
					|| experiencedetails.getLocationName().isEmpty()) {
				model.addAttribute("errorMessage4",
						"Location Name Should not empty");
				errorValid = false;
			}
			if (experiencedetails.getCountryName() == ""
					|| experiencedetails.getCountryName().isEmpty()) {
				model.addAttribute("errorMessage3", "Country Name Should not empty");
				errorValid = false;
			}
			if (experiencedetails.getLabelName() == ""
					|| experiencedetails.getLabelName().isEmpty()) {
				model.addAttribute("errorMessage2", "Title Should not empty");
				errorValid = false;
			}
			if (experiencedetails.getEmployerName() == ""
					|| experiencedetails.getEmployerName().isEmpty()) {
				model.addAttribute("errorMessage1",
						"Employer Name Should not empty");
				errorValid = false;
			}
			if (errorValid == true) {
				try {
					experiencedetails.setProfileId(profileId);
					addWorkExperienceService.add(experiencedetails);
					
					model.addAttribute("successMessage",
							"Your work experience added successfully");
				} catch (Exception e) {
					model.addAttribute("errorMessage",
							"Sorry your work experience not updated please try after some time");
					model.addAttribute("successMessage", "");
				}
			} else {
				model.addAttribute("successMessage", "");
			}
			
			model.addAttribute("profileId", profileId);
			return "workexperience/AddWorkExperience";
			
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
		}	
			
	}

	@RequestMapping(value = "/profilejobhistoryAdd", method = RequestMethod.GET)
	public String getprofilejobhistoryAdd(Model model, org.springframework.web.context.request.WebRequest webRequest) {
		try{
			model.addAttribute("jobHistoryAttribute", new Experiencedetails());
			model.addAttribute("profileId", Long.valueOf(webRequest.getParameter("profileId")));
			
			return "profile/ProfileAddworkExperience";
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
		}	
	}

	@RequestMapping(value = "/profilejobhistoryAdd", method = RequestMethod.POST)
	public String profilejobhistoryAdd(
			@ModelAttribute("jobHistoryAttribute") Experiencedetails experiencedetails,
			Model model, org.springframework.web.context.request.WebRequest webRequest) {
		log.debug("Received request to add new Education");
		
		try{
			boolean errorValid = true;
			if (experiencedetails.getStartDate() == ""
					|| experiencedetails.getStartDate().isEmpty()) {
				model.addAttribute("errorMessage6", "Start Date Should not empty");
				errorValid = false;
			} else {
				String startDate = experiencedetails.getStartDate();
				System.out.println("Start Date :" + startDate);
				DateFormat formatter;
				Date date;
				if (startDate.length() == 10) {
					if (startDate.substring(2, 3).equals("/")
							&& startDate.substring(5, 6).equals("/")) {
						try {
							formatter = new SimpleDateFormat("mm/dd/yyyy");
							date = (Date) formatter.parse(startDate);
							int month = Integer.parseInt(startDate.substring(0, 2));
							int date1 = Integer.parseInt(startDate.substring(3, 5));
							int year1 = Integer
									.parseInt(startDate.substring(6, 10));
							if (year1 == 0) {
								model.addAttribute("errorMessage6",
										"Year Should not be 0000");
								errorValid = false;
							}
							if (month == 0) {
								model.addAttribute("errorMessage6",
										"month Should not be 00");
								errorValid = false;
							}
							if (date1 == 0) {
								model.addAttribute("errorMessage6",
										"Day should not be 00");
								errorValid = false;
							}
							if (month > 12) {
								model.addAttribute("errorMessage6",
										"month Should  be less than 12");
								model.addAttribute("successMessage", "");
								errorValid = false;
							} else {
								if (month == 2) {
									if (date1 > 28) {
										model.addAttribute("errorMessage6",
												"Date Should  be less than 28");
										model.addAttribute("successMessage", "");
										errorValid = false;
									}
								}
							}
							if (date1 > 31) {
								model.addAttribute("errorMessage6",
										"Date Should  be less than 31");
								model.addAttribute("successMessage", "");
								errorValid = false;
							}
	
							System.out.println("Month :" + month + "Date :" + date1
									+ "DATE 1 :" + date);
						} catch (ParseException e) {
							model.addAttribute("successMessage", "");
							errorValid = false;
							model.addAttribute("errorMessage6",
									"Unknown Date format :" + startDate);
							System.out.println("Exception :" + e);
						}
					} else {
						model.addAttribute("successMessage", "");
						model.addAttribute("errorMessage6", "Unknown Date format :"
								+ startDate);
						errorValid = false;
					}
				} else {
					model.addAttribute("successMessage", "");
					model.addAttribute("errorMessage6", "Unknown Date format :"
							+ startDate);
					errorValid = false;
				}
			}
			if (experiencedetails.getEndDate() == ""
					|| experiencedetails.getEndDate().isEmpty()) {
			} else {
				String startDate = experiencedetails.getEndDate();
				System.out.println("Start Date :" + startDate);
				DateFormat formatter;
				Date date;
				if (startDate.length() == 10) {
					if (startDate.substring(2, 3).equals("/")
							&& startDate.substring(5, 6).equals("/")) {
						int i = 0;
						try {
							formatter = new SimpleDateFormat("mm/dd/yyyy");
							date = (Date) formatter.parse(startDate);
							int month = Integer.parseInt(startDate.substring(0, 2));
							int date1 = Integer.parseInt(startDate.substring(3, 5));
							int year1 = Integer
									.parseInt(startDate.substring(6, 10));
							if (year1 == 0) {
								model.addAttribute("errorMessage7",
										"Year Should not be 0000");
								errorValid = false;
							}
							if (month == 0) {
								model.addAttribute("errorMessage7",
										"month Should not be 00");
								errorValid = false;
							}
							if (date1 == 0) {
								model.addAttribute("errorMessage7",
										"Day should not be 00");
								errorValid = false;
							}
							if (month > 12) {
								model.addAttribute("errorMessage7",
										"month Should  be less than 12");
								model.addAttribute("successMessage", "");
								i = 1;
								errorValid = false;
							} else {
								if (month == 2) {
									if (date1 > 28) {
										model.addAttribute("errorMessage7",
												"Date Should  be less than 28");
										model.addAttribute("successMessage", "");
										errorValid = false;
										i = 1;
									}
								}
							}
							if (date1 > 31) {
								model.addAttribute("errorMessage7",
										"Date Should  be less than 31");
								model.addAttribute("successMessage", "");
								errorValid = false;
								i = 1;
							}
							if (i == 0) {
								SimpleDateFormat sdf = new SimpleDateFormat(
										"MM/dd/yyyy");
								Date date3 = sdf.parse(experiencedetails
										.getStartDate());
								Date date4 = sdf.parse(experiencedetails
										.getEndDate());
								if (date3.compareTo(date4) < 0) {
									System.out.println("Date1 is before Date2");
								} else if (date3.compareTo(date4) == 0) {
									System.out.println("Date1 is equal to Date2");
								} else {
									errorValid = false;
									model.addAttribute("errorMessage7",
											"End Date Should be ahead of the Start date");
								}
							}
						} catch (ParseException e) {
							model.addAttribute("successMessage", "");
							errorValid = false;
							model.addAttribute("errorMessage7",
									"Unknown Date format :" + startDate);
							System.out.println("Exception :" + e);
						}
					} else {
						model.addAttribute("successMessage", "");
						model.addAttribute("errorMessage7", "Unknown Date format :"
								+ startDate);
						errorValid = false;
					}
				} else {
					model.addAttribute("successMessage", "");
					model.addAttribute("errorMessage7", "Unknown Date format :"
							+ startDate);
					errorValid = false;
				}
			}
			if (experiencedetails.getDescriptionDetails() == ""
					|| experiencedetails.getDescriptionDetails().isEmpty()) {
				model.addAttribute("errorMessage5",
						"Job Description Should not empty");
				errorValid = false;
			}
			if (experiencedetails.getLocationName() == ""
					|| experiencedetails.getLocationName().isEmpty()) {
				model.addAttribute("errorMessage4",
						"Location Name Should not empty");
				errorValid = false;
			}
			if (experiencedetails.getCountryName() == ""
					|| experiencedetails.getCountryName().isEmpty()) {
				model.addAttribute("errorMessage3", "Country Name Should not empty");
				errorValid = false;
			}
			if (experiencedetails.getLabelName() == ""
					|| experiencedetails.getLabelName().isEmpty()) {
				model.addAttribute("errorMessage2", "Title Should not empty");
				errorValid = false;
			}
			if (experiencedetails.getEmployerName() == ""
					|| experiencedetails.getEmployerName().isEmpty()) {
				model.addAttribute("errorMessage1",
						"Employer Name Should not empty");
				errorValid = false;
			}
			if (errorValid == true) {
				try {
					experiencedetails.setProfileId(Long.valueOf(webRequest.getParameter("profileId")));
					addWorkExperienceService.add(experiencedetails);
					model.addAttribute("successMessage",
							"Your work experience added successfully");
				} catch (Exception e) {
					model.addAttribute("errorMessage",
							"Sorry your work experience  not updated please try after some time");
					model.addAttribute("successMessage", "");
				}
			} else {
				model.addAttribute("successMessage", "");
			}
	
			model.addAttribute("profileId", Long.valueOf(webRequest.getParameter("profileId")));
			return "profile/ProfileAddworkExperience";
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
		}	
			
	}
*/
/*  Moved to Education Controller 	
	@RequestMapping(value = "/profileeducationAdd", method = RequestMethod.GET)
	public String getProfileeducationAdd(Model model, org.springframework.web.context.request.WebRequest webRequest) {
		try{
			model.addAttribute("educationAttribute", new EducationDetails());
			model.addAttribute("profileId", Integer.valueOf(webRequest.getParameter("profileId")));
			
			return "profile/ProfileAddEducation";
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
		}	
			
	}

	@RequestMapping(value = "/profileeducationAdd", method = RequestMethod.POST)
	public String profileeducationAdd(
			@ModelAttribute("educationAttribute") EducationDetails educationDetails,
			Model model, org.springframework.web.context.request.WebRequest webRequest) {
		log.debug("Received request to add new Education");
		try{
			boolean errorValid = true;
			if (educationDetails.getDegreeLevel().equals("-1")) {
				model.addAttribute("errorMessage", "Select value for DegreeLevel");
				errorValid = false;
			}
			if (educationDetails.getSchoolName() == ""
					|| educationDetails.getSchoolName().isEmpty()) {
				model.addAttribute("errorMessage1",
						"School Name should not be empty");
				errorValid = false;
			}
			if (educationDetails.getFromDate() == ""
					|| educationDetails.getFromDate().isEmpty()) {
				model.addAttribute("errorMessage2", "From date should not be empty");
				errorValid = false;
			} else {
				String startDate = educationDetails.getFromDate();
				System.out.println("Start Date :" + startDate);
				DateFormat formatter;
				Date date;
				if (startDate.length() == 10) {
					if (startDate.substring(2, 3).equals("/")
							&& startDate.substring(5, 6).equals("/")) {
						int i = 0;
						try {
							formatter = new SimpleDateFormat("mm/dd/yyyy");
							date = (Date) formatter.parse(startDate);
							int month = Integer.parseInt(startDate.substring(0, 2));
							int date1 = Integer.parseInt(startDate.substring(3, 5));
							int year1 = Integer
									.parseInt(startDate.substring(6, 10));
							System.out.println("YEAR1 :" + year1);
							if (year1 == 0) {
								model.addAttribute("errorMessage2",
										"Year Should not be 0000");
								errorValid = false;
								i = 1;
							}
							if (month == 0) {
								model.addAttribute("errorMessage2",
										"month Should not be 00");
								errorValid = false;
								i = 1;
							}
							if (date1 == 0) {
								model.addAttribute("errorMessage2",
										"Day should not be 00");
								errorValid = false;
								i = 1;
							}
							if (month > 12) {
								model.addAttribute("errorMessage2",
										"month Should  be less than 12");
								errorValid = false;
								i = 1;
							} else {
								if (month == 2) {
									if (date1 > 28) {
										model.addAttribute("errorMessage2",
												"Date Should  be less than 28");
										model.addAttribute("successMessage", "");
										errorValid = false;
										i = 1;
									}
								}
							}
							if (date1 > 31) {
								model.addAttribute("errorMessage2",
										"Date Should  be less than 31");
								model.addAttribute("successMessage", "");
								errorValid = false;
								i = 1;
							}
						} catch (ParseException e) {
							model.addAttribute("successMessage", "");
							errorValid = false;
							model.addAttribute("errorMessage2",
									"Unknown Date format :" + startDate);
							System.out.println("Exception :" + e);
						}
					} else {
						model.addAttribute("successMessage", "");
						model.addAttribute("errorMessage2", "Unknown Date format :"
								+ startDate);
						errorValid = false;
					}
				} else {
					model.addAttribute("successMessage", "");
					model.addAttribute("errorMessage2", "Unknown Date format :"
							+ startDate);
					errorValid = false;
				}
	
			}
			if (educationDetails.getToDate() == ""
					|| educationDetails.getToDate().isEmpty()) {
			} else {
				String startDate = educationDetails.getToDate();
				System.out.println("Start Date :" + startDate);
				DateFormat formatter;
				Date date;
				if (startDate.length() == 10) {
					if (startDate.substring(2, 3).equals("/")
							&& startDate.substring(5, 6).equals("/")) {
						int i = 0;
						try {
							formatter = new SimpleDateFormat("mm/dd/yyyy");
							date = (Date) formatter.parse(startDate);
							int month = Integer.parseInt(startDate.substring(0, 2));
							int date1 = Integer.parseInt(startDate.substring(3, 5));
							int year1 = Integer
									.parseInt(startDate.substring(6, 10));
							System.out.println("YEAR1 :" + year1);
							if (year1 == 0) {
								model.addAttribute("errorMessage6",
										"Year Should not be 0000");
								errorValid = false;
								i = 1;
							}
							if (month == 0) {
								model.addAttribute("errorMessage6",
										"month Should not be 00");
								errorValid = false;
								i = 1;
							}
							if (date1 == 0) {
								model.addAttribute("errorMessage6",
										"Day should not be 00");
								errorValid = false;
								i = 1;
							}
	
							if (month > 12) {
								model.addAttribute("errorMessage6",
										"month Should  be less than 12");
								errorValid = false;
								i = 1;
							} else {
								if (month == 2) {
									if (date1 > 28) {
										model.addAttribute("errorMessage6",
												"Date Should  be less than 28");
										model.addAttribute("successMessage", "");
										errorValid = false;
										i = 1;
									}
								}
							}
							if (date1 > 31) {
								model.addAttribute("errorMessage6",
										"Date Should  be less than 31");
								model.addAttribute("successMessage", "");
								errorValid = false;
								i = 1;
							}
							if (i == 0) {
								SimpleDateFormat sdf = new SimpleDateFormat(
										"MM/dd/yyyy");
								Date date3 = sdf.parse(educationDetails
										.getFromDate());
								Date date4 = sdf
										.parse(educationDetails.getToDate());
								if (date3.compareTo(date4) < 0) {
									System.out.println("Date1 is before Date2");
								} else if (date3.compareTo(date4) == 0) {
									System.out.println("Date1 is equal to Date2");
								} else {
									errorValid = false;
									model.addAttribute("errorMessage6",
											"To Date Should be ahead of the From Date");
								}
							}
							System.out.println("Month :" + month + "Date :" + date1
									+ "DATE 1 :" + date);
						} catch (ParseException e) {
							model.addAttribute("successMessage", "");
							errorValid = false;
							model.addAttribute("errorMessage6",
									"Unknown Date format :" + startDate);
							System.out.println("Exception :" + e);
						}
					} else {
						model.addAttribute("successMessage", "");
						model.addAttribute("errorMessage6", "Unknown Date format :"
								+ startDate);
						errorValid = false;
					}
				} else {
					model.addAttribute("successMessage", "");
					model.addAttribute("errorMessage6", "Unknown Date format :"
							+ startDate);
					errorValid = false;
				}
			}
	
			if (educationDetails.getConcentrationsName() == ""
					|| educationDetails.getConcentrationsName().isEmpty()) {
				model.addAttribute("errorMessage3",
						"Concentrations value should not be empty");
				errorValid = false;
			}
			if (educationDetails.getCountryName() == ""
					|| educationDetails.getCountryName().isEmpty()) {
				model.addAttribute("errorMessage4",
						"Country Name Should not be empty");
				errorValid = false;
			}
			if (educationDetails.getLocationsName() == ""
					|| educationDetails.getLocationsName().isEmpty()) {
				model.addAttribute("errorMessage5", "Location Should not be empty");
				errorValid = false;
			}
			if (errorValid == true) {
				try {
					addEducationService.add(educationDetails);
					model.addAttribute("successMessage",
							"Education details Added successfully");
				} catch (Exception e) {
					model.addAttribute("errorMessage",
							"Your records not updated successfully, please try after some time");
					model.addAttribute("successMessage", "");
				}
			} else {
				model.addAttribute("successMessage", "");
			}
			model.addAttribute("profileId", Long.valueOf(webRequest.getParameter("profileId")));
			return "profile/ProfileAddEducation";
			
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
		}	
			
	}
	
	@RequestMapping(value = "/educationDelete", method = RequestMethod.GET)
	public String educationDelete(@RequestParam(value = "id", required = true) Integer id, Model model) {
		log.debug("Received request to delete existing package");
		try {
			addEducationService.delete(id);
			model.addAttribute("message","Your record has been successfully deleted.");
			//} catch (Exception e) {
			//	model.addAttribute("message", "Sorry this record already deleted");
			//}
			List<EducationDetails> addEducations = addEducationService.getAll();
			model.addAttribute("addEducations", addEducations);
			return "education/Education";
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
		}	
		
	}
*/	
	
/*  Moved to Experience controller	
	@RequestMapping(value = "/experienceDelete", method = RequestMethod.GET)
	public String experienceDelete(@RequestParam(value = "id", required = true) Integer id, Model model) {
		log.debug("Received request to delete existing package");
		try {
			addWorkExperienceService.delete(id);
			model.addAttribute("message","Your record has been successfully deleted.");
			//} catch (Exception e) {
			//	model.addAttribute("message", "Sorry this record already deleted");
			//}
			List<Experiencedetails> addExperiences = addWorkExperienceService.getAllexperiences();
			model.addAttribute("addExperiences", addExperiences);
			return "workexperience/WorkExperience";
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
		}	
		
	}
*/
	
	//@RequestMapping(value = "/imageDisplay/{profileId}", method = RequestMethod.GET)
    //public void getDocumentFileContent(final HttpServletResponse response, @RequestParam(value = "profileId", required = true) final String profileId) throws IOException {
/*
	@RequestMapping(value = "/showimg", method = RequestMethod.GET)
	public String getDocumentFileContent(@RequestParam(value = "id", required = true) Integer id, Model model) {
		log.debug("Received request to show all workexperience");
		//List<Experiencedetails> addExperiences = addWorkExperienceService
		//		.getAllexperiences();
		//model.addAttribute("addExperiences", addExperiences);
		return "workexperience/WorkExperience";
	}	
*/
	
	@RequestMapping(value = "/displayImage", method = RequestMethod.GET)
    public void getDocumentFileContent(final HttpServletResponse response, @RequestParam(value = "profileId", required = true) final String profileId, Model model) throws IOException {
		//ApplicationContext appContext = new ClassPathXmlApplicationContext("spring/config/BeanLocations.xml");
		//ProductService service = (ProductService)appContext.getBean("productService");
                //Retrieves the product image from my database using the JdbcTemplate
        try {

			List<ResumesCertificates> addResumes = addresumeService.getResumesById(Long.valueOf(profileId));
			log.info("imageController" + Long.valueOf(profileId));
			
			ResumesCertificates resumeCert = (ResumesCertificates)addResumes.get(0);
				writeFileContentToHttpResponse(resumeCert.getContent(), response);
			//} catch (SQLException e) {
				//Initial catch was for SQLException
			//	e.printStackTrace();
			//}
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
	        //TODO Check if I should return anything else......................
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			//return "public/common/error/errorpage";
		}	
    }

    public static void writeFileContentToHttpResponse(final Blob image, final HttpServletResponse response) throws Exception {

    	ServletOutputStream out = response.getOutputStream();
    	InputStream in = image.getBinaryStream();
    	int lenght = (int)image.length();
    	int bufferSize = 1024;
    	byte[] buffer = new byte[bufferSize];
    	
	    	response.setContentType("image/jpeg");
	    	while((lenght = in.read(buffer)) != -1) {
	    		out.write(buffer, 0, lenght);
	    	}
	    	in.close();
	    	out.flush();
    }
/*	
	@RequestMapping(value = "/displayProfileImage", method = RequestMethod.GET)
    public void getProfileImage(final HttpServletResponse response, @RequestParam(value = "profileId", required = true) final String profileId, Model model)  throws IOException, SQLException {

        try {
    		UserProfile userProfile = userProfileManager.findById(Long.valueOf(profileId)); 
    		Blob profileImage = userProfile.getProfilepicture();
        	
			if (profileImage != null){
				ServletOutputStream out = response.getOutputStream();
		    	InputStream in = profileImage.getBinaryStream();
		    	int lenght = (int)profileImage.length();
		    	int bufferSize = 1024;
		    	byte[] buffer = new byte[bufferSize];
		    	
		    	response.setContentType("image/jpeg");
		    	while((lenght = in.read(buffer)) != -1) {
		    		out.write(buffer, 0, lenght);
		    	}
		    	in.close();
		    	out.flush();
			}	
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
	        //TODO see If I should return something else...
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
		}	
			
	}
*/

/*
	@RequestMapping(value = "/imageDisplay", method = RequestMethod.GET)
	public String imageDisplay(@RequestParam(value = "imageBytes", required = true) byte[] imageBytes, HttpResponse response, Model model) {
		response.setContentType("image/jpeg");
		response.setContentLength(imageBytes.length); // imageBytes - image in bytes
		response.getOutputStream().write(imageBytes);// 
		outStream.flush();   
		outStream.close(); 
	}	
*/	
}
