package ua.com.bitlab.springsecuritydemo.services;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ua.com.bitlab.springsecuritydemo.web.beans.WebUser;

import java.io.File;
import java.io.IOException;

@Service
public class UsersManagerServiceImpl implements UsersManagerService {

    private static final Logger log = LoggerFactory.getLogger(UsersManagerServiceImpl.class);
  
    @Autowired
    private UsersService usersService;
    @Autowired
    private MailService mailService;

    @Override
    public long createUser(WebUser user) throws Exception {
        log.info("UsersManagerService.createUser(WebUser user): " + user);

    	long tt = System.currentTimeMillis();
        log.debug("Creating new user: " + user);
        user = usersService.saveUser(user);
        log.debug("User Created: " + user);
        
        try {
            log.debug("Before Sending Email " + user);
            mailService.sendActivationEmail(user);
            log.debug("After Sending Email " + user);
        } catch (IOException e) {
            String msg = "Failed to send user activation email. Error " + e;
            log.error(msg, e);
            throw new UserServiceException(msg, e, "Cannot send email for completing activation.");
        }
        
        log.info("User [" + user + "] created in " + (System.currentTimeMillis() - tt) + " ms");
        return user.getId();
    }
    
    @Override
    public long resetUser(WebUser user) throws Exception {
        log.info("UsersManagerService.resetUser(WebUser user): " + user);
        
        long tt = System.currentTimeMillis();
        log.debug("Resetting user: " + user);
        user = usersService.resetUser(user);
        try {
            mailService.sendResetEmail(user);
        } catch (IOException e) {
            String msg = "Failed to send user activation email. Error " + e;
            log.error(msg, e);
            throw new UserServiceException(msg, e, "Cannot send email for completing activation.");
        }
        log.info("User [" + user + "] created in " + (System.currentTimeMillis() - tt) + " ms");
        return user.getId();
    }
}