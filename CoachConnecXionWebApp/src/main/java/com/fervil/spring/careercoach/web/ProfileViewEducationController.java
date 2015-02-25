package com.fervil.spring.careercoach.web;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

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
import com.fervil.spring.careercoach.service.AddEducationService;
import com.fervil.spring.careercoach.util.Constants;

/**
 * Handles and retrieves Work Experience request
 */
@Transactional
@Controller
public class ProfileViewEducationController {

    private static final Logger log = LoggerFactory.getLogger(ProfileViewEducationController.class);
	
	@Autowired
	
	@Resource(name = "addEducationService")
	private AddEducationService addEducationService;

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
								} else if (date3.compareTo(date4) == 0) {
								} else {
									errorValid = false;
									model.addAttribute("errorMessage6",
											"To Date Should be ahead of the From Date");
								}
							}
						} catch (ParseException e) {
							model.addAttribute("successMessage", "");
							errorValid = false;
							model.addAttribute("errorMessage6",
									"Unknown Date format :" + startDate);
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
								} else if (date3.compareTo(date4) == 0) {
								} else {
									errorValid = false;
									model.addAttribute("errorMessage6",
											"To Date Should be ahead of the From Date");
								}
							}
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
									
									//System.out.println("Date1 is before Date2");
								} else if (date3.compareTo(date4) == 0) {
									//System.out.println("Date1 is equal to Date2");
								} else {
									errorValid = false;
									model.addAttribute("errorMessage6",
											"To Date Should be ahead of the From Date");
								}
							}
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
	public String educationDelete(@RequestParam(value = "id", required = true) Integer id, Model model, org.springframework.web.context.request.WebRequest webRequest) {
		log.debug("Received request to delete existing package");
		try {
			addEducationService.delete(id);
			model.addAttribute("message","Your record has been successfully deleted.");
			//} catch (Exception e) {
			//	model.addAttribute("message", "Sorry this record already deleted");
			//}
			List<EducationDetails> addEducations = addEducationService.getEducationById(Long.valueOf(webRequest.getParameter("profileId")));
			model.addAttribute("addEducations", addEducations);
			model.addAttribute("profileId", Integer.valueOf(webRequest.getParameter("profileId")));
			return "education/Education";
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
		}	
		
	}	
	
}
