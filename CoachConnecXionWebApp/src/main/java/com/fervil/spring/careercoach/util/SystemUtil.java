package com.fervil.spring.careercoach.util;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils;

import com.fervil.spring.careercoach.model.dao.HibernateUserProfileDao;
import com.fervil.spring.careercoach.model.dao.UserProfileDao;
import com.fervil.spring.careercoach.model.domain.UserProfile;
import com.fervil.spring.careercoach.service.BasicUserProfileManager;
import com.fervil.spring.careercoach.service.UserProfileManager;

public class SystemUtil<Static> {

	//@Resource(name = "userProfileManager")
	//private static UserProfileManager userProfileManager;
	
	public synchronized static long getUserProfileId(HttpServletRequest request, UserProfileManager userProfileManager) throws Exception {
		long userProfileId = -1;
		HttpSession session = request.getSession();

		userProfileId = session.getAttribute("userProfileId") == null?-1:(Long)session.getAttribute("userProfileId");
		
		if (userProfileId < 0){
			long userId = SecurityUtils.getCurrentUser() == null?-1:SecurityUtils.getCurrentUser().getId();

			List<UserProfile> usrList = userProfileManager.findByUserId(userId);
			
			int profileType = 0;
			for(int j=0; j<usrList.size();j++ ){			
				
				profileType= usrList.get(j).getUserProfileType();
				userProfileId = (profileType==1 || profileType==2)?usrList.get(j).getUserProfileId():0;
				session.setAttribute("userProfileId", userProfileId);

				session.setMaxInactiveInterval(7200);
				break;
			}
		}
		return userProfileId;
		
	}

	public synchronized static UserProfile getUserProfile(HttpServletRequest request, UserProfileManager userProfileManager) throws Exception {
		//long userProfileId = -1;
		HttpSession session = request.getSession();

		//userProfileId = session.getAttribute("userProfileId") == null?-1:(Long)session.getAttribute("userProfileId");
		
		UserProfile userProfile = null;
		
		long userId = SecurityUtils.getCurrentUser() == null?-1:SecurityUtils.getCurrentUser().getId();

		List<UserProfile> usrList = userProfileManager.findByUserId(userId);
		
		//int profileType = 0;
		for(int j=0; j<usrList.size();j++ ){			
			userProfile = usrList.get(j);
			break;
		}

		return userProfile;
		
	}



}
