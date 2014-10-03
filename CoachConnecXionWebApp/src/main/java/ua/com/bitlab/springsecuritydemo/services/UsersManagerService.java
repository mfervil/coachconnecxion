package ua.com.bitlab.springsecuritydemo.services;

import org.springframework.transaction.annotation.Transactional;
import ua.com.bitlab.springsecuritydemo.web.beans.WebUser;

/**
 * High-level user service
 */
@Transactional
public interface UsersManagerService {

    /**
     * Creates user and sends activation email
     *
     * @param user user details
     * @return created user ID
     * @throws UserServiceException on errors
     */
    long createUser(WebUser user) throws Exception;

    long resetUser(WebUser user) throws Exception ;

}
