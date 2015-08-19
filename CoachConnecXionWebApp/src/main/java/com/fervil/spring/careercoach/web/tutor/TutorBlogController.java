package com.fervil.spring.careercoach.web.tutor;

import java.text.DateFormat;
import java.text.DateFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import com.fervil.spring.careercoach.model.domain.BlogComment;
import com.fervil.spring.careercoach.model.domain.BlogPost;
import com.fervil.spring.careercoach.model.domain.CoachingCategory;
import com.fervil.spring.careercoach.model.domain.UserProfile;
import com.fervil.spring.careercoach.service.BlogCommentManager;
import com.fervil.spring.careercoach.service.BlogManager;
import com.fervil.spring.careercoach.service.CoachingCategoryManager;
import com.fervil.spring.careercoach.service.CreateBlogPostValidator;
import com.fervil.spring.careercoach.service.UserProfileManager;
import com.fervil.spring.careercoach.util.Constants;
import com.fervil.spring.careercoach.util.SystemUtil;


@Controller       
public class TutorBlogController {
	
    private static final Logger log = LoggerFactory.getLogger(TutorBlogController.class);
	
	@Autowired
	private SessionFactory sessionFactory;

	@Resource(name = "blogManager")
	private BlogManager blogManager;

	@Resource(name = "blogCommentManager")
	private BlogCommentManager blogCommentManager;   

	@Resource(name = "userProfileManager")
	private UserProfileManager userProfileManager;

	@Resource(name = "coachingCategoryManager")
	private CoachingCategoryManager coachingCategoryManager;
	
	@Resource(name = "createBlogPostValidator")
	private CreateBlogPostValidator validator;

/*	
	//Creating a brand new blog GET
	@RequestMapping(value = "/blogentry/update-blog", method = RequestMethod.GET)
	public String createNewBlog(ModelMap model, org.springframework.web.context.request.WebRequest webRequest,
			HttpSession session, HttpServletRequest request) {

		try{
			long blogId = -1;
			BlogPost blogPost = new BlogPost();

//			if (webRequest.getParameter("blogId") == null && session.getAttribute("createUserProfileProfileId") == null){
			if (webRequest.getParameter("blogId") == null ){
				blogId = -1;	
			} else{
					blogId =  Long.valueOf(webRequest.getParameter("blogId"));
					blogPost =  blogManager.findById(blogId);
			}

			List<CoachingCategory> coachingCategoryListing = coachingCategoryManager.findAll();
			UserProfile curProfile = SystemUtil.getUserProfile(request, userProfileManager);
			String curEmail = curProfile.getEmail();
			model.addAttribute("userEmail", curEmail);
			
			model.addAttribute("coachingCategoryListing", coachingCategoryListing);
			model.addAttribute("blogId", blogId);
			model.addAttribute("blogPost", blogPost);
			return "blogentry/updateblog"; 
			
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
		}	
	} 	
	
*/	
	//Creating a brand new blog GET
	@RequestMapping(value = "/tutor/update-blog", method = RequestMethod.GET)
	public String printHello(ModelMap model, org.springframework.web.context.request.WebRequest webRequest,
			HttpSession session, HttpServletRequest request) {

		try{
			long blogId = -1;
			BlogPost blogPost = new BlogPost();

//			if (webRequest.getParameter("blogId") == null && session.getAttribute("createUserProfileProfileId") == null){
			if (webRequest.getParameter("blogId") == null ){
				blogId = -1;	
			} else{
					blogId =  Long.valueOf(webRequest.getParameter("blogId"));
					blogPost =  blogManager.findById(blogId);
			}

			List<CoachingCategory> coachingCategoryListing = coachingCategoryManager.findAll();
			UserProfile curProfile = SystemUtil.getUserProfile(request, userProfileManager);
			String curEmail = curProfile.getEmail();
			model.addAttribute("userEmail", curEmail);
			
			model.addAttribute("coachingCategoryListing", coachingCategoryListing);
			model.addAttribute("blogId", blogId);
			model.addAttribute("blogPost", blogPost);
			return "tutor/blogentry/updateblog"; 
			
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "tutor/public/common/error/errorpage";
		}	
	} 

/*	
	//Updating an existing blog GET
	@RequestMapping(value = "/blogentry/update-blog/blogId/{blogId}", method = RequestMethod.GET)
	public String updateExistingBlogPost(@PathVariable("blogId") long blogId,  Model model, HttpServletRequest request ) {
		
		try {
				BlogPost blogPost =  blogManager.findById(blogId);
				model.addAttribute("blogId", blogId);
				model.addAttribute("blogPost", blogPost);

				UserProfile curProfile = SystemUtil.getUserProfile(request, userProfileManager);
				String curEmail = curProfile.getEmail();
				model.addAttribute("userEmail", curEmail);
				
				return "blogentry/updateblog"; 
		} catch (Exception e) {
	            String msg = "Failed to find Blog by id (updateExistingBlogPost). Error " + e;
	            log.error(msg, e);
				model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				return "public/common/error/errorpage";
		}
	}
*/
	
	//Updating an existing blog GET
	//@RequestMapping(value = "/update-blog/blogId/{blogId}", method = RequestMethod.GET)
	//public String updateExistingBlogPost(@PathVariable("blogId") long blogId,  Model model, HttpServletRequest request ) {

	@RequestMapping(value = "/tutor/update-blog/blogId/{blogId}", method = RequestMethod.GET)
	public String updateExistingBlogPost(@PathVariable("blogId") long blogId, ModelMap model, 
				org.springframework.web.context.request.WebRequest webRequest,
				HttpSession session, HttpServletRequest request) {
		try {
				BlogPost blogPost =  blogManager.findById(blogId);
				model.addAttribute("blogId", blogId);
				
				model.addAttribute("blogPost", blogPost);

				UserProfile curProfile = SystemUtil.getUserProfile(request, userProfileManager);
				String curEmail = curProfile.getEmail();
				model.addAttribute("userEmail", curEmail);

				List<CoachingCategory> coachingCategoryListing = coachingCategoryManager.findAll();
				model.addAttribute("coachingCategoryListing", coachingCategoryListing);
				
				return "tutor/blogentry/updateblog"; 
		} catch (Exception e) {
	            String msg = "Failed to find Blog by id (updateExistingBlogPost). Error " + e;
	            log.error(msg, e);
				model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				return "public/common/error/errorpage";
		}
	}
	
/*	
	//Saving a brand new blog POST
	@RequestMapping(value = "/blogentry/update-blog", method = RequestMethod.POST)
	public String saveBlogPost(
			@ModelAttribute("blogPost") BlogPost blogPost,
			BindingResult result, SessionStatus status, ModelMap model, HttpServletRequest request, HttpServletResponse response,
			org.springframework.web.context.request.WebRequest webRequest, HttpSession crdUsersession) {
		
			validator.validate(blogPost, result);

		try {
		
	        if (result.hasErrors()) {

	        	long blogId = -1;

				List<CoachingCategory> coachingCategoryListing = coachingCategoryManager.findAll();
				UserProfile curProfile = SystemUtil.getUserProfile(request, userProfileManager);
				String curEmail = curProfile.getEmail();
				model.addAttribute("userEmail", curEmail);
				
				model.addAttribute("coachingCategoryListing", coachingCategoryListing);
				model.addAttribute("blogId", blogId);
				model.addAttribute("blogPost", blogPost);
	        	
	        	return "blogentry/updateblog";
			} else {
				UserProfile curProfile = SystemUtil.getUserProfile(request, userProfileManager);
				long currentLoggedInUserProfileId =  curProfile.getUserProfileId();
				String curEmail = curProfile.getEmail();
				String curFirstName = curProfile.getFirstname();
				String curLastName = curProfile.getLastname();

				int publishyear = Calendar.getInstance().get(Calendar.YEAR);
				int publishmonth = Calendar.getInstance().get(Calendar.MONTH);
				int publishday = Calendar.getInstance().get(Calendar.DAY_OF_MONTH);
				
				blogPost.setUserprofileid(currentLoggedInUserProfileId);
				blogPost.setCreatoremail(curEmail);
				blogPost.setCreatorfirstname(curFirstName);
				blogPost.setCreatorlastname(curLastName);
				blogPost.setPublishyear(publishyear);
				blogPost.setPublishmonth(publishmonth);
				blogPost.setPublishday(publishday);
				
				String[] coachingCategoryInfo = blogPost.getCoachingcategory().split(Constants.);
				blogPost.setCoachingcategoryId(Long.valueOf(coachingCategoryInfo[0]));
				blogPost.setCoachingcategoryName(coachingCategoryInfo[1]);
				
				if (webRequest.getParameter("blogId") == null ){
					if ( new Long(webRequest.getParameter("blogId")) > 0)
						blogPost.setBlogid(	new Long(webRequest.getParameter("blogId")) );
				}
				blogManager.storeBlog(blogPost);
				
				model.addAttribute("monthname", new DateFormatSymbols().getMonths()[publishmonth]);
				
				model.addAttribute("blogId", blogPost.getBlogid());
				model.addAttribute("blog", blogPost);


				///////// Comments ///////////////////////
				BlogComment blogComment = new BlogComment();
				blogComment.setBlogid(blogPost.getBlogid());
				
				model.addAttribute("blogComment", blogComment);

				List<BlogComment> blogComments = blogCommentManager.findByBlogIdStatus(blogPost.getBlogid(), 1); //Only get the approved comments
				model.addAttribute("blogComments", blogComments);
				
				
				return "blogview/blogposting";
			}
		} catch (Exception e) {
	            String msg = "Failed to create Blog. Error " + e;
	            log.error(msg, e);
				model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				return "public/common/error/errorpage";
		}
	}
*/

//Saving a brand new blog POST
@RequestMapping(value = "/tutor/update-blog", method = RequestMethod.POST)
public String saveBlogPost(
		@ModelAttribute("blogPost") BlogPost blogPost,
		BindingResult result, SessionStatus status, ModelMap model, HttpServletRequest request, HttpServletResponse response,
		org.springframework.web.context.request.WebRequest webRequest, HttpSession crdUsersession) {
	
		validator.validate(blogPost, result);

	try {
	
        if (result.hasErrors()) {

        	long blogId = -1;

			List<CoachingCategory> coachingCategoryListing = coachingCategoryManager.findAll();
			UserProfile curProfile = SystemUtil.getUserProfile(request, userProfileManager);
			String curEmail = curProfile.getEmail();
			model.addAttribute("userEmail", curEmail);
			
			model.addAttribute("coachingCategoryListing", coachingCategoryListing);
			model.addAttribute("blogId", blogId);
			model.addAttribute("blogPost", blogPost);
        	
        	return "tutor/blogentry/updateblog";
		} else {
			UserProfile curProfile = SystemUtil.getUserProfile(request, userProfileManager);
			long currentLoggedInUserProfileId =  curProfile.getUserProfileId();
			String curEmail = curProfile.getEmail();
			String curFirstName = curProfile.getFirstname();
			String curLastName = curProfile.getLastname();

			int publishyear = Calendar.getInstance().get(Calendar.YEAR);
			int publishmonth = Calendar.getInstance().get(Calendar.MONTH);
			int publishday = Calendar.getInstance().get(Calendar.DAY_OF_MONTH);
			
			blogPost.setUserprofileid(currentLoggedInUserProfileId);
			blogPost.setCreatoremail(curEmail);
			blogPost.setCreatorfirstname(curFirstName);
			blogPost.setCreatorlastname(curLastName);
			blogPost.setPublishyear(publishyear);
			blogPost.setPublishmonth(publishmonth);
			blogPost.setPublishday(publishday);
			
			String[] coachingCategoryInfo = blogPost.getCoachingcategory().split(Constants.COACHING_CATEGORY_NAME_SEPERATOR);
			blogPost.setCoachingcategoryId(Long.valueOf(coachingCategoryInfo[0]));
			blogPost.setCoachingcategoryName(coachingCategoryInfo[1]);
			
			if (webRequest.getParameter("blogId") == null ){
				if ( new Long(webRequest.getParameter("blogId")) > 0)
					blogPost.setBlogid(	new Long(webRequest.getParameter("blogId")) );
			}
			blogManager.storeBlog(blogPost);
			
			model.addAttribute("monthname", new DateFormatSymbols().getMonths()[publishmonth]);
			
			model.addAttribute("blogId", blogPost.getBlogid());
			model.addAttribute("blog", blogPost);


			///////// Comments ///////////////////////
			BlogComment blogComment = new BlogComment();
			blogComment.setBlogid(blogPost.getBlogid());
			
			model.addAttribute("blogComment", blogComment);

			List<BlogComment> blogComments = blogCommentManager.findByBlogIdStatus(blogPost.getBlogid(), 1); //Only get the approved comments
			model.addAttribute("blogComments", blogComments);
			
			model.addAttribute("blogmonths", getMonthsForArchive());
			
			return "tutor/blogview/blogposting";
		}
	} catch (Exception e) {
            String msg = "Failed to create Blog. Error " + e;
            log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
	}
}

/*
	//Saving an existing blog POST
	@RequestMapping(value = "/blogentry/update-blog/blogId/{blogId}", method = RequestMethod.POST)
	public String saveBlogPostWithId(@PathVariable("blogId") long blogId, 
			@ModelAttribute("blogPost") BlogPost blogPost,
			BindingResult result, SessionStatus status, ModelMap model, HttpServletRequest request, HttpServletResponse response,
			org.springframework.web.context.request.WebRequest webRequest, HttpSession crdUsersession) {
		
			validator.validate(blogPost, result);

		try {
		
	        if (result.hasErrors()) {
	      
				List<CoachingCategory> coachingCategoryListing = coachingCategoryManager.findAll();
				UserProfile curProfile = SystemUtil.getUserProfile(request, userProfileManager);
				String curEmail = curProfile.getEmail();
				model.addAttribute("userEmail", curEmail);
				
				model.addAttribute("coachingCategoryListing", coachingCategoryListing);
				model.addAttribute("blogId", blogId);
				model.addAttribute("blogPost", blogPost);
	        	
	        	return "blogentry/updateblog";
			} else {
				UserProfile curProfile = SystemUtil.getUserProfile(request, userProfileManager);
				long currentLoggedInUserProfileId =  curProfile.getUserProfileId();
				String curEmail = curProfile.getEmail();
				String curFirstName = curProfile.getFirstname();
				String curLastName = curProfile.getLastname();

				int publishyear = Calendar.getInstance().get(Calendar.YEAR);
				int publishmonth = Calendar.getInstance().get(Calendar.MONTH);
				int publishday = Calendar.getInstance().get(Calendar.DAY_OF_MONTH);
				
				blogPost.setUserprofileid(currentLoggedInUserProfileId);
				blogPost.setCreatoremail(curEmail);
				blogPost.setCreatorfirstname(curFirstName);
				blogPost.setCreatorlastname(curLastName);
				blogPost.setPublishyear(publishyear);
				blogPost.setPublishmonth(publishmonth);
				blogPost.setPublishday(publishday);

				//if (webRequest.getParameter("blogId") == null ){
				//	if ( new Long(webRequest.getParameter("blogId")) > 0)
				//		blogPost.setBlogid(	new Long(webRequest.getParameter("blogId")) );
				//}
				
				blogPost.setBlogid(blogId);

				String[] coachingCategoryInfo = blogPost.getCoachingcategory().split("***");
				blogPost.setCoachingcategoryId(Long.valueOf(coachingCategoryInfo[0]));
				blogPost.setCoachingcategoryName(coachingCategoryInfo[1]);
				
				blogManager.storeBlog(blogPost);
				model.addAttribute("blogId", blogPost.getBlogid());
				model.addAttribute("blog", blogPost);

				///////// Comments ///////////////////////
				BlogComment blogComment = new BlogComment();
				blogComment.setBlogid(blogId);
				//List<BlogComment> blogCommentList = blogCommentManager.findByBlogId(blogid);
				
				model.addAttribute("blogComment", blogComment);
				//model.addAttribute("blogCommentList", blogCommentList);

				List<BlogComment> blogComments = blogCommentManager.findByBlogIdStatus(blogId, 1); //Only get the approved comments
				model.addAttribute("blogComments", blogComments);
				
				
				return "blogview/blogposting";
			}
		} catch (Exception e) {
	            String msg = "Failed to create Blog. Error " + e;
	            log.error(msg, e);
				model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				return "public/common/error/errorpage";
		}
	}
*/

//Saving an existing blog POST
@RequestMapping(value = "/tutor/update-blog/blogId/{blogId}", method = RequestMethod.POST)
public String saveBlogPostWithId(@PathVariable("blogId") long blogId, 
		@ModelAttribute("blogPost") BlogPost blogPost,
		BindingResult result, SessionStatus status, ModelMap model, HttpServletRequest request, HttpServletResponse response,
		org.springframework.web.context.request.WebRequest webRequest, HttpSession crdUsersession) {
	
		validator.validate(blogPost, result);

	try {
	
        if (result.hasErrors()) {
      
			List<CoachingCategory> coachingCategoryListing = coachingCategoryManager.findAll();
			UserProfile curProfile = SystemUtil.getUserProfile(request, userProfileManager);
			String curEmail = curProfile.getEmail();
			model.addAttribute("userEmail", curEmail);
			
			model.addAttribute("coachingCategoryListing", coachingCategoryListing);
			model.addAttribute("blogId", blogId);
			model.addAttribute("blogPost", blogPost);
        	
        	return "tutor/blogentry/updateblog";
		} else {
			UserProfile curProfile = SystemUtil.getUserProfile(request, userProfileManager);
			long currentLoggedInUserProfileId =  curProfile.getUserProfileId();
			String curEmail = curProfile.getEmail();
			String curFirstName = curProfile.getFirstname();
			String curLastName = curProfile.getLastname();

			//int publishyear = Calendar.getInstance().get(Calendar.YEAR);
			//int publishmonth = Calendar.getInstance().get(Calendar.MONTH);
			//int publishday = Calendar.getInstance().get(Calendar.DAY_OF_MONTH);
			
			blogPost.setUserprofileid(currentLoggedInUserProfileId);
			blogPost.setCreatoremail(curEmail);
			blogPost.setCreatorfirstname(curFirstName);
			blogPost.setCreatorlastname(curLastName);
			blogPost.setPublishyear(blogPost.getPublishyear());
			blogPost.setPublishmonth(blogPost.getPublishmonth());
			blogPost.setPublishday(blogPost.getPublishday() );    

			//if (webRequest.getParameter("blogId") == null ){
			//	if ( new Long(webRequest.getParameter("blogId")) > 0)
			//		blogPost.setBlogid(	new Long(webRequest.getParameter("blogId")) );
			//}
			
			blogPost.setBlogid(blogId);

			String[] coachingCategoryInfo = blogPost.getCoachingcategory().split(Constants.COACHING_CATEGORY_NAME_SEPERATOR);
			blogPost.setCoachingcategoryId(Long.valueOf(coachingCategoryInfo[0]));
			blogPost.setCoachingcategoryName(coachingCategoryInfo[1]);

			System.out.println("Before Storing" + blogPost.toString());
			
			blogManager.storeBlog(blogPost);

			System.out.println("After Storing" + blogPost.toString());

			model.addAttribute("blogId", blogPost.getBlogid());
			model.addAttribute("blog", blogPost);

			///////// Comments ///////////////////////
			BlogComment blogComment = new BlogComment();
			blogComment.setBlogid(blogId);
			//List<BlogComment> blogCommentList = blogCommentManager.findByBlogId(blogid);
			
			model.addAttribute("monthname", new DateFormatSymbols().getMonths()[blogPost.getPublishmonth()]);
			
			model.addAttribute("blogComment", blogComment);
			//model.addAttribute("blogCommentList", blogCommentList);

			List<BlogComment> blogComments = blogCommentManager.findByBlogIdStatus(blogId, 1); //Only get the approved comments
			model.addAttribute("blogComments", blogComments);
			
			model.addAttribute("blogmonths", getMonthsForArchive());
			
			return "tutor/blogview/blogposting";
		}
	} catch (Exception e) {
            String msg = "Failed to create Blog. Error " + e;
            log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
			return "public/common/error/errorpage";
	}
}


	//Getting the last 10 blogs
	@RequestMapping(value = "/tutor/blogview/recent-personal-coach-blogs", method = RequestMethod.GET)
	public String getRecentCoachBlogs( Model model ) {
		
		try {
				List<BlogPost> blogPostListing = blogManager.getRecentBlogPosts(10);
				model.addAttribute("blogPostListing", blogPostListing);
				model.addAttribute("blogmonths", getMonthsForArchive());
				return "tutor/blogview/blogListing"; 
		} catch (Exception e) {
	            String msg = "Failed to find Blog by id. Error " + e;
	            log.error(msg, e);
				model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				return "tutor/public/common/error/errorpage";
		}
	}

	@RequestMapping(value = "/tutor/blogview/professional-coaches/month/{month}/year/{year}", method = RequestMethod.GET)
	public String getCoachBlogYearMonth(@PathVariable("month") int blogMonth, @PathVariable("year") int blogYear, Model model ) {
		try {
			List<BlogPost> blogPostListing =  blogManager.findBlogPostsByMonthYear(blogMonth, blogYear);
			model.addAttribute("blogPostListing", blogPostListing);
			model.addAttribute("blogmonths", getMonthsForArchive());
			return "tutor/blogview/blogListing"; 
		} catch (Exception e) {
	            String msg = "Failed to find Blog by Month and Year. Error " + e;
	            log.error(msg, e);
				model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				return "tutor/public/common/error/errorpage";
		}
	}

	@RequestMapping(value = "/tutor/blogview/professional-and-life-coaches/blogref/{blogref}/cattitle/{cattitle}", method = RequestMethod.GET)
	public String getindIndividualBlog(@PathVariable("blogref") int blogid, @PathVariable("cattitle") String cattitle, Model model ) {
		try {
			BlogPost blogPost =  blogManager.findById(blogid);
			
			model.addAttribute("monthname", new DateFormatSymbols().getMonths()[blogPost.getPublishmonth()]);
			model.addAttribute("blogmonths", getMonthsForArchive());
			
			model.addAttribute("blogId", blogPost.getBlogid());
			model.addAttribute("blogPost", blogPost);
			
			BlogComment blogComment = new BlogComment();
			blogComment.setBlogid(blogid);
			//List<BlogComment> blogCommentList = blogCommentManager.findByBlogId(blogid);
			
			model.addAttribute("blogComment", blogComment);
			//model.addAttribute("blogCommentList", blogCommentList);

			List<BlogComment> blogComments = blogCommentManager.findByBlogIdStatus(blogid, 1); //Only get the approved comments
			model.addAttribute("blogComments", blogComments);
			model.addAttribute("blogTitle", blogPost.getBlogtitle());

			return "tutor/blogview/blogposting";
			
		} catch (Exception e) {
	            String msg = "Failed to find selected Blog. Error " + e;
	            log.error(msg, e);
				model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				return "tutor/public/common/error/errorpage";
		}
	}
	
	@RequestMapping(value = "/tutor/blogview/blog-comment-update/blogref/{blogref}", method = RequestMethod.POST)
	public String updateBlog(@PathVariable("blogref") long blogId, 
			@ModelAttribute("blogComment") BlogComment blogComment,
			BindingResult result, SessionStatus status, ModelMap model, HttpServletRequest request, HttpServletResponse response,
			org.springframework.web.context.request.WebRequest webRequest, HttpSession crdUsersession) {
		
			validator.validateComment(blogComment, result);

		try {

			BlogPost blogPost =  blogManager.findById(blogId);
			
	        if (result.hasErrors()) {
				model.addAttribute("blogmonths", getMonthsForArchive());
				model.addAttribute("blogPost", blogPost);
				model.addAttribute("blogComment", blogComment);
				return "tutor/blogview/blogposting";
			} else {
				blogComment.setCreateddate(new Date());
				blogCommentManager.storeBlogComment(blogComment);
				
				model.addAttribute("blogmonths", getMonthsForArchive());

				blogComment.setEmail("");
				blogComment.setName("");
				blogComment.setWebsite("");
				blogComment.setComment("");
			
				List<BlogComment> blogComments = blogCommentManager.findByBlogIdStatus(blogId, 1); //Only get the approved comments
				model.addAttribute("blogComments", blogComments);

				model.addAttribute("blogPost", blogPost);
				model.addAttribute("blogComment", blogComment);
				
				model.addAttribute("reviewCommnet", "<br>Your new comment will be made available after review.");
				
				model.addAttribute("blogTitle", blogPost.getBlogtitle());
				
				return "tutor/blogview/blogposting";
			}	
		} catch (Exception e) {
	            String msg = "Failed to update the blog comment. Error " + e;
	            log.error(msg, e);
				model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
				return "tutor/public/common/error/errorpage";
		}
	}

	
	public List<String> getMonthsForArchive(){
		//DateFormat df = new SimpleDateFormat("MMMM dd, yyyy"); 

		DateFormat df = new SimpleDateFormat("MMMM, yyyy"); 
		Date date;
		
		ArrayList<String> monthList = new ArrayList<String>(); 
		Calendar cal;
		for (int i = 1; i < 25; i++){
			cal = Calendar.getInstance();
			cal.add(Calendar.MONTH, (i * -1));
			date = cal.getTime();
			int blogMonth = cal.get(cal.MONTH) + 1;
			monthList.add(df.format(date) + "*" + blogMonth + "*" + cal.get(Calendar.YEAR));
		}
		
		return monthList;
	}
}
