/*
 * Copyright 2011-2012 Soramaki Networks Oy
 * All rights reserved.
 */

package ua.com.bitlab.springsecuritydemo.services;

import ua.com.bitlab.springsecuritydemo.dao.entities.UserEntity;
import ua.com.bitlab.springsecuritydemo.web.beans.WebUser;

import java.io.IOException;

/**
 * Operates with emails
 */
public interface MailService {

    /**
     * Sends activation email to user
     *
     * @param user user
     * @throws IOException on errors
     */
    void sendActivationEmail(WebUser user) throws IOException;
    
    void sendMessage(final String email, final String subject, final String text) throws IOException;
    
    public void sendResetEmail(WebUser user) throws IOException; 

    public void sendResetMessage(final String email, final String subject, final String text);    	
}
