package com.fervil.spring.careercoach.web;

import java.math.BigInteger;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils;

import com.fervil.spring.careercoach.model.domain.AccountSummaryPackage;
import com.fervil.spring.careercoach.model.domain.PackageDetails;
import com.fervil.spring.careercoach.model.domain.UserProfile;
import com.fervil.spring.careercoach.model.domain.SubcategoryDetails;
import com.fervil.spring.careercoach.service.CategoryService;
import com.fervil.spring.careercoach.service.PackageDetailsService;
import com.fervil.spring.careercoach.service.SubCategoryService;
import com.fervil.spring.careercoach.service.UserProfileManager;
import com.fervil.spring.careercoach.util.Constants;
import com.fervil.spring.careercoach.util.SystemUtil;

/**
 * Handles and retrieves AccountSummary request
 */
@Controller
public class PackageController {
    private static final Logger log = LoggerFactory.getLogger(PackageController.class);
	
	int categoryIdValue;
	
	@Resource(name = "packageDetailsService")
	private PackageDetailsService packageDetailsService;
	@Resource(name = "categoryService")
	private CategoryService categoryService;
	@Resource(name = "subCategoryService")
	private SubCategoryService subCategoryService;

	@Resource(name = "userProfileManager")
	private UserProfileManager userProfileManager;

	private UserProfile getUserProfile(){
		UserProfile userProfile = new UserProfile();
		userProfile.setModifiedDate(new Date());
		userProfile.setAccountType(1);
		userProfile.setUserProfileType(1);		
		return userProfile;
	}
	
	@RequestMapping(value = "/packages", method = RequestMethod.GET)
	public String getPackages(Model model, HttpServletRequest request, 
			org.springframework.web.context.request.WebRequest webRequest,
			HttpSession session) {
		log.debug("Received request to display Packages");
		try{	
			
			//////////////////////////////////////////////////////////////////////////////////////////////////////////////
			//           Get the user profile id

			long userProfileId = -1;
			if (webRequest.getParameter("profileId") != null ) {
				userProfileId = Long.valueOf(webRequest.getParameter("profileId"));
				session.setAttribute("packagesProfileId", userProfileId); //For Breadcrumb
			} else if (session.getAttribute("packagesProfileId") != null){ //For Breadcrumb
				userProfileId = Long.valueOf((String)session.getAttribute("packagesProfileId"));
			} else {
				//If no profileId is passed, then we assume the current user is trying to view and update his/her packages
				userProfileId = SystemUtil.getUserProfileId(request, userProfileManager);
				if (userProfileId <= 0){
					model.addAttribute("errorMessage", "You must first create a profile before adding packages. Enter your information below to create your profile.");
					model.addAttribute("userprofileid", userProfileId);
					model.addAttribute("userProfile", getUserProfile());
					return "userprofile/createuserprofile";
				}
				session.setAttribute("packagesProfileId", userProfileId); //For Breadcrumb
			}
			//////////////////////////////////////////////////////////////////////////////////////////////

			//List<AccountSummaryPackage> packages = packageDetailsService.getAll1();
			List<AccountSummaryPackage> packages = packageDetailsService.getPackageSummaryById(userProfileId);
			Integer totalSold = 0;
			int totalClients=0;
			for(int j=0; j<packages.size();j++ ){			
				BigInteger totalSold1=(BigInteger) packages.get(j).getNumberSold();			
				totalSold=totalSold+Integer.parseInt(totalSold1.toString());
			}
			totalClients=packageDetailsService.totalClientCount(userProfileId);
			model.addAttribute("totalClients", totalClients);
			model.addAttribute("totalSold", totalSold);
			model.addAttribute("persons", packages);
			Map<Integer, String> categoryId = new LinkedHashMap<Integer, String>();
			categoryId = categoryService.getAllCategory();
			model.addAttribute("categoryId", categoryId);
			List<SubcategoryDetails> subcategoryId = subCategoryService.getAllCategory(categoryIdValue);
			model.addAttribute("subcategoryId", subcategoryId);
			return "package/accountsummarymyPackages";
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
		}	
	}

	@RequestMapping(value = "/packagesCurrentUser", method = RequestMethod.GET)
	public String getPackagesCurrentUser(Model model, HttpServletRequest request, org.springframework.web.context.request.WebRequest webRequest) {
		log.debug("Received request to display Packages");
		try{	
			
			//////////////////////////////////////////////////////////////////////////////////////////////////////////////
			//           Get the user profile id
			long userProfileId = SystemUtil.getUserProfileId(request, userProfileManager);

			if (userProfileId < 0){
				model.addAttribute("errorMessage", "You must first create a profile before adding packages. Enter your information below to create your profile.");
				model.addAttribute("userprofileid", userProfileId);
				model.addAttribute("userProfile", getUserProfile());
				return "userprofile/createuserprofile";
			}

			//List<AccountSummaryPackage> packages = packageDetailsService.getAll1();
			List<AccountSummaryPackage> packages = packageDetailsService.getPackageSummaryById(userProfileId);
			Integer totalSold = 0;
			int totalClients=0;
			for(int j=0; j<packages.size();j++ ){			
				BigInteger totalSold1=(BigInteger) packages.get(j).getNumberSold();			
				totalSold=totalSold+Integer.parseInt(totalSold1.toString());
			}
			totalClients=packageDetailsService.totalClientCount(userProfileId);
			model.addAttribute("totalClients", totalClients);
			model.addAttribute("totalSold", totalSold);
			model.addAttribute("persons", packages);
			Map<Integer, String> categoryId = new LinkedHashMap<Integer, String>();
			categoryId = categoryService.getAllCategory();
			model.addAttribute("categoryId", categoryId);
			List<SubcategoryDetails> subcategoryId = subCategoryService.getAllCategory(categoryIdValue);
			model.addAttribute("subcategoryId", subcategoryId);
			return "package/accountsummarymyPackages";
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
		}	
	}
	
	
	@RequestMapping(value = "/packageAdd", method = RequestMethod.GET)
	public String getPackageAdd(Model model, HttpServletRequest request) {
		log.debug("Received request to  add New Package");
		try{	
			//////////////////////////////////////////////////////////////////////////////////////////////////////////////
			//           Get the user profile id
			long userProfileId = SystemUtil.getUserProfileId(request, userProfileManager);

			if (userProfileId <= 0){
				model.addAttribute("errorMessage", "Please setup your profile to start selling coaching packages.");
				model.addAttribute("userprofileid", userProfileId);
				model.addAttribute("userProfile", getUserProfile());
				return "userprofile/createuserprofile";
			}
			//////////////////////////////////////////////////////////////////////////////////////////////
			
 			
			Map<Integer, String> categoryId = new LinkedHashMap<Integer, String>();
			categoryId = categoryService.getAllCategory();
			model.addAttribute("categoryId", categoryId);
			List<SubcategoryDetails> subcategoryId = subCategoryService
					.getAllCategory(categoryIdValue);
			model.addAttribute("subcategoryId", subcategoryId);
			PackageDetails pkg = new PackageDetails();
			pkg.setProfileId(userProfileId);
			model.addAttribute("packageAttribute", pkg);
			return "package/createPackage";
			
		} catch (Exception e) {
	        String msg = "Failed while displaying create user page. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
		}	
		
	}

	@RequestMapping(value = "/packageAdd", method = RequestMethod.POST)
	public String packageAdd(
			@ModelAttribute("packageAttribute") PackageDetails packageDetails,
			BindingResult binding, Model model, HttpServletRequest request) {
		log.debug("Received request to update new package");
		try{

			//////////////////////////////////////////////////////////////////////////////////////////////////////////////
			//           Get the user profile id
			long userProfileId = SystemUtil.getUserProfileId(request, userProfileManager);

			if (userProfileId <= 0){
				model.addAttribute("errorMessage", "You must first create a profile before adding packages. Enter your information below to create your profile.");
				model.addAttribute("userprofileid", userProfileId);
				model.addAttribute("userProfile", getUserProfile());
				return "userprofile/createuserprofile";
			}
			//////////////////////////////////////////////////////////////////////////////////////////////
			/*
			Map<Integer, String> categoryId = new LinkedHashMap<Integer, String>();
			categoryId = categoryService.getAllCategory();
			model.addAttribute("categoryId", categoryId);
			List<SubcategoryDetails> subcategoryId = subCategoryService
					.getAllCategory(categoryIdValue);
			model.addAttribute("subcategoryId", subcategoryId);
			*/
			
			packageDetails.setProfileId(userProfileId);
			
			boolean errorValid = true;
			if (packageDetails.getPackageName().isEmpty()
					|| packageDetails.getPackageName() == "") {
				errorValid = false;
				model.addAttribute("errorMessage1", "Package Name should not empty");
			}
			/*
			if (packageDetails.getCategoryIndex() == -1) {
				errorValid = false;
				model.addAttribute("errorMessage2", "Please select category");
			} 
			if (packageDetails.getSubcategoryIndex() == -1) {
				errorValid = false;
				model.addAttribute("errorMessage3", "Please select subcategory");
			} */
			if (binding.hasErrors()) {
				if (binding.getFieldError("priceValue") != null){
					model.addAttribute("errorMessage4",
						"Price value should be a proper dollar amount. ex: 224 or 224.50");
					errorValid = false;
				}
			} else {
				if (packageDetails.getPriceValue() == 0.0) {
					errorValid = false;
					model.addAttribute("errorMessage4",
							"Price value should not empty");
				}
			}
 			if (packageDetails.getOverView().trim() == ""
					|| packageDetails.getOverView().isEmpty()
					|| packageDetails.getOverView().equals("&nbsp;")) {
				errorValid = false;
				model.addAttribute("errorMessage5", "Over view should not empty");
			}
			if (packageDetails.getPackageDetails().trim() == ""
					|| packageDetails.getPackageDetails().isEmpty()
					|| packageDetails.getPackageDetails().equals("&nbsp;")) {
				errorValid = false;
				model.addAttribute("errorMessage6",
						"Package Details should not empty");
			}
			/*
			if (packageDetails.getOptOutDays().equals("-1")) {
				errorValid = false;
				model.addAttribute("errorMessage7", "Please select opt Out of days");
 			}
			*/
			if (errorValid == true) {
				try {
					packageDetailsService.add(packageDetails);
					model.addAttribute("successMessage",
							"Your package details added successfully");
				} catch (Exception e) {
					model.addAttribute("successMessage", "");
 				}
			} else {
				model.addAttribute("successMessage", "");
			}
	
 			return "package/createPackage";
		
		} catch (Exception e) {
	        String msg = "Failed to create user. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "userprofile/createuserprofile";
		}
	}

	@RequestMapping(value = "/packages", method = RequestMethod.POST)
	public String packagesreturn(
			@ModelAttribute("packageAttribute") PackageDetails packageDetails, Model model, HttpServletRequest request) {
		log.debug("Received request to show all packages");

		try{	
			
			//////////////////////////////////////////////////////////////////////////////////////////////////////////////
			//           Get the user profile id
			long userProfileId = SystemUtil.getUserProfileId(request, userProfileManager);

			if (userProfileId < 0){
				model.addAttribute("errorMessage", "You must first create a profile before adding packages. Enter your information below to create your profile.");
				model.addAttribute("userprofileid", userProfileId);
				model.addAttribute("userProfile", getUserProfile());
				return "userprofile/createuserprofile";
			}
			//////////////////////////////////////////////////////////////////////////////////////////////
			
			
			return "package/accountsummarymyPackages";
			
		} catch (Exception e) {
	        String msg = "Failed to create user. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "userprofile/createuserprofile";
		}
	}

	@RequestMapping(value = "/AddUser.htm", method = RequestMethod.GET)
	public @ResponseBody
	List<SubcategoryDetails> addUser(
			@ModelAttribute("packageAttribute") PackageDetails packageDetails,
			BindingResult result,
			@RequestParam(value = "credit", required = true) Integer id,
			Model model, HttpServletRequest request) {
		try{	

			categoryIdValue = id;
			List<SubcategoryDetails> subcategoryId = subCategoryService
					.getAllCategory(categoryIdValue);
			model.addAttribute("subcategoryId", subcategoryId);
 			return subCategoryService.getAllCategory(categoryIdValue);
//TODO Need to catch the exceptions for this page....			
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return null;
		}	
		
	}

	@RequestMapping(value = "/packageEdit", method = RequestMethod.GET)
	public String getPackageEdit(
			@RequestParam(value = "id", required = true) Integer id, Model model, HttpServletRequest request) {
		log.debug("Received request to show packageEdit" + id);

		try{	
			
			//////////////////////////////////////////////////////////////////////////////////////////////////////////////
			//           Get the user profile id
			long userProfileId = SystemUtil.getUserProfileId(request, userProfileManager);

			if (userProfileId < 0){
				model.addAttribute("errorMessage", "You must first create a profile before adding packages. Enter your information below to create your profile.");
				model.addAttribute("userprofileid", userProfileId);
				model.addAttribute("userProfile", getUserProfile());
				return "userprofile/createuserprofile";
			}
			//////////////////////////////////////////////////////////////////////////////////////////////
			/*
			Map<Integer, String> categoryId = new LinkedHashMap<Integer, String>();
			categoryId = categoryService.getAllCategory();
			model.addAttribute("categoryId", categoryId);
			*/
			
			PackageDetails packageDetails1 = packageDetailsService.get(id);
			model.addAttribute("packageAttribute", packageDetailsService.get(id));
			return "package/editPackage";
			
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
		}	
	}

	@RequestMapping(value = "/packageEdit", method = RequestMethod.POST)
	public String savepackageEdit(
			@ModelAttribute("packageAttribute") PackageDetails packageDetails,
			BindingResult binding,
			@RequestParam(value = "id", required = true) Integer id, Model model, HttpServletRequest request) {
		log.debug("Received request to update package Edit");

		try{
			
			//////////////////////////////////////////////////////////////////////////////////////////////////////////////
			//           Get the user profile id
			long userProfileId = SystemUtil.getUserProfileId(request, userProfileManager);

			if (userProfileId < 0){
				model.addAttribute("errorMessage", "You must first create a profile before adding packages. Enter your information below to create your profile.");
				model.addAttribute("userprofileid", userProfileId);
				model.addAttribute("userProfile", getUserProfile());
				return "userprofile/createuserprofile";
			}
			//////////////////////////////////////////////////////////////////////////////////////////////
			
			packageDetails.setId(id);
			Map<Integer, String> categoryId = new LinkedHashMap<Integer, String>();
			categoryId = categoryService.getAllCategory();
			model.addAttribute("categoryId", categoryId);
	
			List<SubcategoryDetails> subcategoryId = subCategoryService
					.getAllCategory(categoryIdValue);
			model.addAttribute("subcategoryId", subcategoryId);
	
			boolean errorValid = true;
			if (packageDetails.getPackageName().isEmpty()
					|| packageDetails.getPackageName().trim() == "") {
				errorValid = false;
				model.addAttribute("errorMessage1", "Package Name should not empty");
			}
			/*
			if (packageDetails.getCategoryIndex() == -1) {
				errorValid = false;
				model.addAttribute("errorMessage2", "Please select category");
			}
			if (packageDetails.getSubcategoryIndex() == -1) {
				errorValid = false;
				model.addAttribute("errorMessage3", "Please select subcategory");
			}
			*/
			if (binding.hasErrors()) {
				if (binding.getFieldError("priceValue") != null){
					model.addAttribute("errorMessage4",
						"Price value should be a proper dollar amount. ex: 224 or 224.50");
					errorValid = false;
				}
			} else {
				if (packageDetails.getPriceValue() == 0.0) {
					errorValid = false;
					model.addAttribute("errorMessage4",
							"Price value should not empty");
				}
			}
			if (packageDetails.getOverView().equals("&nbsp;")
					|| packageDetails.getOverView().isEmpty()
					|| packageDetails.getOverView().trim() == "") {
				errorValid = false;
				model.addAttribute("errorMessage5", "Over view should not empty");
			}
			if (packageDetails.getPackageDetails().equals("&nbsp;")
					|| packageDetails.getPackageDetails().isEmpty()
					|| packageDetails.getPackageDetails().trim() == "") {
				errorValid = false;
				model.addAttribute("errorMessage6",
						"Package Details should not empty");
			}
			/*
			if (packageDetails.getOptOutDays().equals("-1")) {
				errorValid = false;
				model.addAttribute("errorMessage7", "Please select opt Out of days");
			}
			*/
			if (errorValid == true) {
				try {
					packageDetailsService.edit(packageDetails);
					model.addAttribute("successMessage",
							"Your package details added successfully");
				} catch (Exception e) {
					model.addAttribute("successMessage", "");
 				}
			} else {
				model.addAttribute("successMessage", "");
			}
	
			model.addAttribute("id", id);
			return "package/editPackage";
		
		} catch (Exception e) {
	        String msg = "Failed to create user. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "userprofile/createuserprofile";
		}
		
	}

	@RequestMapping(value = "/packagedelete", method = RequestMethod.GET)
	public String packagedelete(
			@RequestParam(value = "id", required = true) Integer id, Model model, HttpServletRequest request) {
		log.debug("Received request to delete existing package");
		try {
			
			/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			//           Get the user profile id
			long userProfileId = SystemUtil.getUserProfileId(request, userProfileManager);

			if (userProfileId < 0){
				model.addAttribute("errorMessage", "You must first create a profile before adding packages. Enter your information below to create your profile.");
				model.addAttribute("userprofileid", userProfileId);
				model.addAttribute("userProfile", getUserProfile());
				return "userprofile/createuserprofile";
			}
			/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			
				packageDetailsService.delete(id);
				model.addAttribute("message",
						"Your record has been successfully deleted.");
			//} catch (Exception e) {
			//	model.addAttribute("message", "Sorry this record already deleted");
			//}
			model.addAttribute("id", id);
			List<AccountSummaryPackage> packages = packageDetailsService.getPackageSummaryById(userProfileId);	
			Integer totalSold = 0;
			for(int j=0; j<packages.size();j++ ){			
				BigInteger totalSold1=(BigInteger) packages.get(j).getNumberSold();			
				totalSold=totalSold+Integer.parseInt(totalSold1.toString());
			}
			model.addAttribute("totalSold", totalSold);
			model.addAttribute("persons", packages);
			Map<Integer, String> categoryId = new LinkedHashMap<Integer, String>();
			categoryId = categoryService.getAllCategory();
			model.addAttribute("categoryId", categoryId);
			List<SubcategoryDetails> subcategoryId = subCategoryService.getAllCategory(categoryIdValue);
			model.addAttribute("subcategoryId", subcategoryId);
			return "package/accountsummarymyPackages";
		//}
		} catch (Exception e) {
		    String msg = "The request failed. Error " + e;
		    log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
		}	
	}
}
