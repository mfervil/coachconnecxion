package com.fervil.spring.careercoach.web;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

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

import com.fervil.spring.careercoach.model.domain.Experiencedetails;
import com.fervil.spring.careercoach.service.AddEducationService;
import com.fervil.spring.careercoach.service.AddWorkExperienceService;
import com.fervil.spring.careercoach.service.AddresumeService;
import com.fervil.spring.careercoach.service.JobRatingService;
import com.fervil.spring.careercoach.service.PackageDetailsService;
import com.fervil.spring.careercoach.service.UserProfileManager;
import com.fervil.spring.careercoach.util.Constants;

/**
 * Handles and retrieves Work Experience request
 */
@Transactional
@Controller
public class ProfileViewWorkExperienceController {
    private static final Logger log = LoggerFactory.getLogger(ProfileViewWorkExperienceController.class);
	
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
	
							//System.out.println("Month :" + month + "Date :" + date1
							//		+ "DATE 1 :" + date);
						} catch (ParseException e) {
							model.addAttribute("successMessage", "");
							errorValid = false;
							model.addAttribute("errorMessage6",
									"Unknown Date format :" + startDate);
							log.error("Exception :" + e);
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
									//System.out.println("Date1 is before Date2");
								} else if (date3.compareTo(date4) == 0) {
									//System.out.println("Date1 is equal to Date2");
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
							log.error("Exception :" + e);
							//System.out.println("Exception :" + e);
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
				//System.out.println("Start Date :" + startDate);
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
	
							//System.out.println("Month :" + month + "Date :" + date1
							//		+ "DATE 1 :" + date);
						} catch (ParseException e) {
							model.addAttribute("successMessage", "");
							errorValid = false;
							model.addAttribute("errorMessage6",
									"Unknown Date format :" + startDate);
							log.error("Exception :" + e);
							//System.out.println("Exception :" + e);
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
				//System.out.println("Start Date :" + startDate);
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
									//System.out.println("Date1 is before Date2");
								} else if (date3.compareTo(date4) == 0) {
									//System.out.println("Date1 is equal to Date2");
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
							log.error("Exception :" + e);
							//System.out.println("Exception :" + e);
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
				//System.out.println("Start Date :" + startDate);
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
	
							//System.out.println("Month :" + month + "Date :" + date1
							//		+ "DATE 1 :" + date);
						} catch (ParseException e) {
							model.addAttribute("successMessage", "");
							errorValid = false;
							model.addAttribute("errorMessage6",
									"Unknown Date format :" + startDate);
							//System.out.println("Exception :" + e);
							log.error("Exception :" + e);
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
				//System.out.println("Start Date :" + startDate);
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
									//System.out.println("Date1 is before Date2");
								} else if (date3.compareTo(date4) == 0) {
									//System.out.println("Date1 is equal to Date2");
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
							//System.out.println("Exception :" + e);
							log.error("Exception :" + e);
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
	
	@RequestMapping(value = "/experienceDelete", method = RequestMethod.GET)
	public String experienceDelete(@RequestParam(value = "id", required = true) Integer id, Model model, org.springframework.web.context.request.WebRequest webRequest) {
		log.debug("Received request to delete existing package");
		try {
			addWorkExperienceService.delete(id);
			model.addAttribute("message","Your record has been successfully deleted.");
			//} catch (Exception e) {
			//	model.addAttribute("message", "Sorry this record already deleted");
			//}
			List<Experiencedetails> addExperiences = addWorkExperienceService.getWorkExperiencesById(Long.valueOf(webRequest.getParameter("profileId")));
			model.addAttribute("addExperiences", addExperiences);
			model.addAttribute("profileId", Integer.valueOf(webRequest.getParameter("profileId")));
			return "workexperience/WorkExperience";
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
		}	
		
	}
	
}
