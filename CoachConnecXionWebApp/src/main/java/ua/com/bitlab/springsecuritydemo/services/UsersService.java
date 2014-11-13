package ua.com.bitlab.springsecuritydemo.services;

import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.springframework.transaction.annotation.Transactional;
import ua.com.bitlab.springsecuritydemo.web.beans.WebUser;

import java.util.List;

/**
 * Low-level user service
 */
@Transactional
public interface UsersService {

    /**
     * Finds user by username
     *
     * @param username username
     * @return user or NULL if not found
     */
    @Nullable
    WebUser getUserByUsername(String username);

    /**
     * Saves new user
     *
     * @param user user bean
     * @return created user bean
     */
    WebUser saveUser(WebUser user);

    /**
     * resets user new user
     *
     * @param user user bean
     * @return created user bean
     */
    WebUser resetUser(WebUser user);
    
    
    /**
     * Activates existing user
     *
     * @param id             user ID to activate
     * @param activationCode activation code
     * @return activated user
     * @throws UserServiceException if user or code is invalid or user already activated
     */
    WebUser activateUser(long id, String activationCode);

    /**
     * resets an existing user
     *
     * @param id             user ID to activate
     * @param activationCode activation code
     * @return activated user
     * @throws UserServiceException if user or code is invalid or user already activated
     */
    WebUser activateResetUser(long id, String activationCode);  
    
    /**
     * Gets user by ID
     *
     * @param userId user ID
     * @return user bean
     * @throws IllegalArgumentException is user doesn't exist
     */
    @NotNull
    WebUser getUserById(long userId);

    /**
     * Lists all users
     *
     * @return list of users
     */
    @NotNull
    List<WebUser> listUsers();
}
