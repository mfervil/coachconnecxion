package com.fervil.spring.careercoach.web.tutor;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fervil.spring.careercoach.model.domain.CoachingCategory;
import com.fervil.spring.careercoach.model.domain.RequestDetails;
import com.fervil.spring.careercoach.service.RequestDetailService;
import com.fervil.spring.careercoach.util.Constants;

/**
 * Handles and retrieves person request
 */
@Controller
public class TutorWorkController {
    private static final Logger log = LoggerFactory.getLogger(TutorWorkController.class);
	
Integer requestId=1;
	@Resource(name = "requestDetailService")
	private RequestDetailService requestDetailService;

	@RequestMapping(value = "/tutor/public/selectCoachingCategories", method = RequestMethod.GET)
	public String getSelectCoachingCategories(Model model) {
		log.debug("Received request to show all Select Coaching Categories");
		try{	
			List<RequestDetails> requestDetails = requestDetailService.getAll();
			model.addAttribute("requestDetails", requestDetails);
			model.addAttribute("HeaderName", "All Requests");
			List<CoachingCategory> coachingCategory = requestDetailService
					.getCoachingCategory();
			for (int i = 0; i < coachingCategory.size(); i++) {
				List<CoachingCategory> coachingCategory1 = requestDetailService.getSubCoachingCategory(coachingCategory.get(i).getCategoryId());
				model.addAttribute("coachingCategory"+ coachingCategory.get(i).getCategoryId(),coachingCategory1);
			}
			model.addAttribute("coachingCategory", coachingCategory);
			return "tutor/public/findcoach/SelectCoachingCategories";
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "tutor/public/common/error/errorpage";
		}	
	}
    
	@RequestMapping(value = "/tutor/public/Allrequests", method = RequestMethod.GET)
	public String getAllRequests(Model model,HttpServletRequest request) {

		try{
			requestId=1;
			Integer page = 1;
			Integer recordsPerPage = 5;
			log.debug("Received request to show all Requests");
			model.addAttribute("pageRefresh", "1");
			List<RequestDetails> requestDetails = requestDetailService.getAll((page - 1) * recordsPerPage, recordsPerPage);
			int noOfRecords = requestDetailService.getNoOfRecords();
			int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
			request.setAttribute("noOfPages", noOfPages);
			request.setAttribute("currentPage", page);
			model.addAttribute("header", "All Requests");
			model.addAttribute("requestDetails", requestDetails);
			model.addAttribute("HeaderName", "All Requests");
			List<CoachingCategory> coachingCategory = requestDetailService.getCoachingCategory();
			for (int i = 0; i < coachingCategory.size(); i++) {
				List<CoachingCategory> coachingCategory1 = requestDetailService.getSubCoachingCategory(coachingCategory.get(i).getCategoryId());
				model.addAttribute("coachingCategory"+ coachingCategory.get(i).getCategoryId(),coachingCategory1);
			}
			model.addAttribute("coachingCategory", coachingCategory);
			return "tutor/public/findcoach/AllRequests";
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "tutor/public/common/error/errorpage";
		}	
			
	}

	@RequestMapping(value = "/tutor/public/requestNames", method = RequestMethod.GET)
	public String getRequestNames(
			@RequestParam(value = "id", required = true) Integer id, Model model) {
		log.debug("Received request to show request name");
		try{
			model.addAttribute("requestNameAttribute", requestDetailService.get(id));
			return "tutor/public/findcoach/RequestNames";
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "tutor/public/common/error/errorpage";
		}	
			
	}

	@RequestMapping(value = "/tutor/public/requestNames", method = RequestMethod.POST)
	public String saverequestNames(
			@ModelAttribute("requestNameAttribute") RequestDetails requestDetails,
			@RequestParam(value = "id", required = true) Integer id,
			Model model, HttpServletRequest request) {
		log.debug("Received request to update Request Fields"
				+ requestDetails.getDatePosted());
		
		try{
			requestDetails.setId(id);
			requestDetails.setCustomerId(1);
	
			boolean errorValid = true;
			Float hourlyRate1 = (float) 0;
			if (request.getParameter("proposedhourlyrate1") == ""
					|| request.getParameter("proposedhourlyrate1").isEmpty()) {
				errorValid = false;
				model.addAttribute("errorMessage", "Hourly Rate should not empty");
			} else {
				try {
					String hourlyRate = request.getParameter("proposedhourlyrate1");
					hourlyRate1 = new Float(hourlyRate);
					requestDetails.setProposedhourlyrate(hourlyRate1);
				} catch (Exception e) {
					model.addAttribute("errorMessage",
							"Give proper format for Hourly Rate. Ex:00.0");
					errorValid = false;
				}
			}
			if (request.getParameter("proposalDescription") == ""
					|| request.getParameter("proposalDescription").isEmpty()) {
				errorValid = false;
				model.addAttribute("errorMessage",
						"Proposal Description should not empty");
			} else {
				requestDetails.setProposalDescription(request
						.getParameter("proposalDescription"));
			}
	
			if (errorValid == true) {
				requestDetailService.add(requestDetails);
				model.addAttribute("successMessage",
						"Your Proposal Submitted Successfully");
			} else {
				model.addAttribute("successMessage", "");
			}
			model.addAttribute("id", id);
			return "tutor/public/findcoach/RequestNames";
			
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "tutor/public/common/error/errorpage";
		}	
			
	}

	@RequestMapping(value = "/tutor/public/Executiverequests", method = RequestMethod.GET)
	public String getExecutiverequests(Model model) {
		log.debug("Received request to show all persons");
		try{
			List<RequestDetails> requestDetails = requestDetailService.getAll();
			model.addAttribute("requestDetails", requestDetails);
			return "tutor/public/findcoach/ExecutiveRequest";
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "tutor/public/common/error/errorpage";
		}	
	}

	@RequestMapping(value = "/tutor/public/BusinessExecutive", method = RequestMethod.GET)
	public String getBusinessExecutive(Model model) {
		log.debug("Received request to show all persons");
		try{
			List<RequestDetails> requestDetails = requestDetailService.getAll();
			model.addAttribute("requestDetails", requestDetails);
			return "tutor/public/findcoach/BusinessExecutive";
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "tutor/public/common/error/errorpage";
		}	
			
	}

	@RequestMapping(value = "/tutor/public/BusinessManager", method = RequestMethod.GET)
	public String getBusinessManager(Model model) {
		log.debug("Received request to show all persons");
		try{
			List<RequestDetails> requestDetails = requestDetailService.getAll();
			model.addAttribute("requestDetails", requestDetails);
			return "tutor/public/findcoach/BusinessManager";
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "tutor/public/common/error/errorpage";
		}	
			
	}

	@RequestMapping(value = "/tutor/public/BusinessNewBusiness", method = RequestMethod.GET)
	public String getBusinessNewBusiness(Model model) {
		log.debug("Received request to show all persons");
		try{
			List<RequestDetails> requestDetails = requestDetailService.getAll();
			model.addAttribute("requestDetails", requestDetails);
			return "tutor/public/findcoach/BusinessNewBusiness";
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "tutor/public/common/error/errorpage";
		}	
			
	}

	@RequestMapping(value = "/tutor/public/getRequestDetails", method = RequestMethod.GET)
	public String getRequestDetails(
			@RequestParam(value = "id", required = true) Integer id,
			Model model, HttpServletRequest request) {
		try{
			requestId=id;
			Integer page = 1;
			Integer recordsPerPage = 5;
			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			String name1 = requestDetailService.getparentName(id);
			model.addAttribute("HeaderName", name1);
			model.addAttribute("pageRefresh", "0");
			List<Integer> categoryListData = new ArrayList<Integer>();
			if (id == 1) {
				List<RequestDetails> requestDetails = requestDetailService.getAll((page - 1) * recordsPerPage, recordsPerPage);
				int noOfRecords = requestDetailService.getNoOfRecords();
				int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
				request.setAttribute("noOfPages", noOfPages);
				request.setAttribute("currentPage", page);
				model.addAttribute("header", "All Requests");
				model.addAttribute("requestDetails", requestDetails);
			} else {
				categoryListData.add(id);
				List<CoachingCategory> categoryrequestDetails = requestDetailService.getRequestedData1(id);
				for (int i = 0; i < categoryrequestDetails.size(); i++) {
					categoryListData.add(categoryrequestDetails.get(i).getCategoryId());
				}
				int noOfRecords = requestDetailService.getNoOfRecords1(categoryListData);
				int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
				request.setAttribute("noOfPages", noOfPages);
				request.setAttribute("currentPage", page);			
				List<RequestDetails> requestDetails = requestDetailService.getRequestedDatawithLimit(categoryListData,(page - 1) * recordsPerPage, recordsPerPage);
				model.addAttribute("requestDetails", requestDetails);
			}
	
			List<CoachingCategory> coachingCategory = requestDetailService.getCoachingCategory();
			for (int i = 0; i < coachingCategory.size(); i++) {
				List<CoachingCategory> coachingCategory1 = requestDetailService.getSubCoachingCategory(coachingCategory.get(i).getCategoryId());
				model.addAttribute("coachingCategory"+ coachingCategory.get(i).getCategoryId(),coachingCategory1);
			}
			model.addAttribute("coachingCategory", coachingCategory);
	
			return "tutor/public/findcoach/AllRequests";
			
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "tutor/public/common/error/errorpage";
		}	
			
	}
	
	@RequestMapping(value = "/tutor/public/getRequestDetails1", method = RequestMethod.GET)
	public String getRequestDetails1(
			@RequestParam(value = "page", required = true) Integer id,
			Model model, HttpServletRequest request) {

		try{
			Integer page = 1;
			Integer recordsPerPage = 5;
			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			String name1 = requestDetailService.getparentName(requestId);
			model.addAttribute("HeaderName", name1);
			model.addAttribute("pageRefresh", "0");
			List<Integer> categoryListData = new ArrayList<Integer>();
			if (requestId == 1) {
				List<RequestDetails> requestDetails = requestDetailService.getAll((page - 1) * recordsPerPage, recordsPerPage);
				int noOfRecords = requestDetailService.getNoOfRecords();
				int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
				request.setAttribute("noOfPages", noOfPages);
				request.setAttribute("currentPage", page);
				model.addAttribute("header", "All Requests");
				model.addAttribute("requestDetails", requestDetails);
			} else {
				categoryListData.add(requestId);
				List<CoachingCategory> categoryrequestDetails = requestDetailService.getRequestedData1(requestId);
				for (int i = 0; i < categoryrequestDetails.size(); i++) {
					categoryListData.add(categoryrequestDetails.get(i).getCategoryId());
				}
				int noOfRecords = requestDetailService.getNoOfRecords1(categoryListData);
				int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
				request.setAttribute("noOfPages", noOfPages);
				request.setAttribute("currentPage", page);			
				List<RequestDetails> requestDetails = requestDetailService.getRequestedDatawithLimit(categoryListData,(page - 1) * recordsPerPage, recordsPerPage);
				model.addAttribute("requestDetails", requestDetails);
			}
	
			List<CoachingCategory> coachingCategory = requestDetailService.getCoachingCategory();
			for (int i = 0; i < coachingCategory.size(); i++) {
				List<CoachingCategory> coachingCategory1 = requestDetailService.getSubCoachingCategory(coachingCategory.get(i).getCategoryId());
				model.addAttribute("coachingCategory"+ coachingCategory.get(i).getCategoryId(),coachingCategory1);
			}
			model.addAttribute("coachingCategory", coachingCategory);
			return "tutor/public/findcoach/AllRequests";

		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "tutor/public/common/error/errorpage";
		}	
			
	}
}
