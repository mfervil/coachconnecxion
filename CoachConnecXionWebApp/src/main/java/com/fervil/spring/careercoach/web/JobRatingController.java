package com.fervil.spring.careercoach.web;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.fervil.spring.careercoach.model.domain.JobratingDetails;
import com.fervil.spring.careercoach.service.JobRatingService;
import com.fervil.spring.careercoach.util.Constants;

/**
 * Handles and retrieves person request
 */
@Controller
public class JobRatingController {

    private static final Logger log = LoggerFactory.getLogger(JobRatingController.class);


	@Resource(name = "jobRatingService")
	private JobRatingService jobRatingService;

	@RequestMapping(value = "/jobRating", method = RequestMethod.GET)
	public String getJobRating(Model model) {
		log.debug("Received request to show all JOB Ratings");
		
		try{
			List<JobratingDetails> addJobratingDetails = jobRatingService.getAll();
			model.addAttribute("addJobratingDetails", addJobratingDetails);
			return "rating/JobRating";
			
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
		}	
		
		
	}

	public static float Round(float Rval, int Rpl) {
		float p = (float) Math.pow(10, Rpl);
		Rval = Rval * p;
		float tmp = Math.round(Rval);
		return (float) tmp / p;
	}

	@RequestMapping(value = "/feedbackAdd", method = RequestMethod.POST)
	public String feedbackAdd(
			@ModelAttribute("feedbackUrlAttribute") JobratingDetails jobratingDetails,
			Model model, HttpServletRequest request) {
		log.debug("Received request to update new Feedback");
		model.addAttribute("successMessage", "");
		//TODO.  Remove dummy quantity and award date below
		
		try {
			Float quality11 = new Float(request.getParameter("my_text_input"));
			quality11 = quality11 / 20;
			Float quality22 = new Float(request.getParameter("my_text_input1"));
			quality22 = quality22 / 20;
			Float quality33 = new Float(request.getParameter("my_text_input2"));
			quality33 = quality33 / 20;
			Float quality44 = new Float(request.getParameter("my_text_input3"));
			quality44 = quality44 / 20;

			//Get the customer Id and the date Also save vendor Id, packageId, payment id

			jobratingDetails.setCustomerId(Integer.valueOf(request.getParameter("customerId"))  );
			jobratingDetails.setPackageId(jobratingDetails.getPackageId()  );
			jobratingDetails.setPaymentId(jobratingDetails.getPaymentId()  );
			jobratingDetails.setVendorId(Long.valueOf(request.getParameter("vendorId"))  );
			
			jobratingDetails.setProjectName(request.getParameter("projectName"));
			jobratingDetails.setVendorName(request.getParameter("vendorName"));
			
			jobratingDetails.setAwardedDate( new Date().toString() );  //Used to be awarded date

			jobratingDetails.setFeedBacks(request.getParameter("TextArea1"));
 			jobratingDetails.setQualityDetails(quality11);
			jobratingDetails.setExperienceDetails(quality22);
			jobratingDetails.setResponseDetails(quality33);
			jobratingDetails.setProfessionalismDetails(quality44);
			float averageRating = (quality11 + quality22 + quality33 + quality44) / 4;
			averageRating = Round(averageRating, 1);
			jobratingDetails.setRatingDone(1);
			Date date = new Date();
			DateFormat formatter = new SimpleDateFormat("MMM-dd-yyyy");
			String s = formatter.format(date);
			jobratingDetails.setRatingDate(s);
			jobratingDetails.setAverageRating(averageRating);
			if (request.getParameter("TextArea1") == ""
					|| request.getParameter("TextArea1").isEmpty()) {
				model.addAttribute("errorMessage", "Comments Should not empty");
				model.addAttribute("successMessage", "");
			} else {
				
				jobRatingService.edit(jobratingDetails);
				model.addAttribute("successMessage",
						"Your ratings have been successfully added  "
								+ jobratingDetails.getProjectName());
			}
		//} catch (Exception e) {
		//	model.addAttribute("errorMessage",
		//			"Error occured during submission, please try after some time");
		//	model.addAttribute("successMessage", "");
		//}
		return "rating/Feedbackcomments";

		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
		}	

	}

	@RequestMapping(value = "/feedbackComments", method = RequestMethod.GET)
	public String getFeedbackComments(Model model) {
		log.debug("Received request to show feedback Comments Page");
		try{	
			return "rating/Feedbackcomments";
			
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
		}	
		
		
	}

	@RequestMapping(value = "/feedbackAdd", method = RequestMethod.GET)
	public String getFeedbackAdd(
			@RequestParam(value = "vendorId", required = true) Integer vendorId,
			@RequestParam(value = "packageId", required = true) Integer packageId,
			@RequestParam(value = "paymentId", required = true) Integer paymentId,
			@RequestParam(value = "customerId", required = true) Integer customerId,
			@RequestParam(value = "projectName", required = true) String projectName,
			@RequestParam(value = "vendorName", required = true) String vendorName,

			Model model, JobratingDetails jobratingDetails) {
		log.debug("Received request to show new feedback page");
		try{	
			
			//Has to be a rating by project
			if (jobRatingService.ratingDone(paymentId) == true) {
				model.addAttribute("RatingDone", "Yes");
				model.addAttribute("errorMessage",
						"This project has already been rated, try another project");
			} else {
				model.addAttribute("RatingDone", "");
			}
			Date date = new Date();
			DateFormat formatter = new SimpleDateFormat("MMM-dd-yyyy");
			String s = formatter.format(date);
			jobratingDetails.setRatingDate(s);
			model.addAttribute("ratingDate1", s);
			model.addAttribute("vendorId", vendorId);
			model.addAttribute("packageId", packageId);
			model.addAttribute("paymentId", paymentId);
			model.addAttribute("customerId", customerId);
			model.addAttribute("projectName", projectName);
			model.addAttribute("vendorName", vendorName);
			
			JobratingDetails pjobratingDetails = jobRatingService.getByPaymentId(paymentId);
			//model.addAttribute("feedbackUrlAttribute", pjobratingDetails);
			if (pjobratingDetails == null){
				model.addAttribute("jobratingDetailId", -1);
				model.addAttribute("feedbackUrlAttribute", new JobratingDetails());
			} else {
				model.addAttribute("feedbackUrlAttribute", pjobratingDetails);
				model.addAttribute("jobratingDetailId", pjobratingDetails.getPaymentId());
			}

			return "rating/Feedbackcomments";
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
		}	
	}

	@RequestMapping(value = "/responseAdd", method = RequestMethod.GET)
	public String responseAdd(Model model, HttpServletRequest request) {
		log.debug("Received request to add new feedback page");
		try{	
 			jobRatingService.updateResponse(request.getParameter("jobratingId"),
					request.getParameter("commentDetails1"));
			List<JobratingDetails> addJobratingDetails = jobRatingService.getAll();
			model.addAttribute("addJobratingDetails", addJobratingDetails);
			return "rating/JobRating";
	
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
		}	
	}

}
