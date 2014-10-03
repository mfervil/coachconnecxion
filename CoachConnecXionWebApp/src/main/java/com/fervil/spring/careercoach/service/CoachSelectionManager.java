package com.fervil.spring.careercoach.service;

import java.io.Serializable;
import java.util.List;

import org.jetbrains.annotations.NotNull;
import org.springframework.transaction.annotation.Transactional;

import com.fervil.spring.careercoach.model.domain.UserProfile;

@Transactional
public interface CoachSelectionManager  extends Serializable {
	
    @NotNull
	public List<UserProfile> getUserProfiles() throws Exception;
    public void storeUserProfile(UserProfile userProfile) throws Exception;
    public void deleteUserProfile(String id) throws Exception;
    public UserProfile findById(String id) throws Exception;	
}
