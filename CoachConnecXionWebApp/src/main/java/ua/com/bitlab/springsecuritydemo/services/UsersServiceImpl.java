package ua.com.bitlab.springsecuritydemo.services;

import org.apache.commons.lang.RandomStringUtils;
import org.hibernate.exception.ConstraintViolationException;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Service;

import com.fervil.spring.careercoach.util.Constants;

import ua.com.bitlab.springsecuritydemo.dao.UsersDao;
import ua.com.bitlab.springsecuritydemo.dao.entities.UserEntity;
import ua.com.bitlab.springsecuritydemo.web.beans.WebUser;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

/**
 * User: anna
 * Date: 10/12/12
 */
@Service
public class UsersServiceImpl implements UsersService {

    private static final Logger log = LoggerFactory.getLogger(UsersServiceImpl.class);

    @Autowired
    private ShaPasswordEncoder passwordEncoder;
    @Autowired
    private UsersDao usersDao;

    @Nullable
    @Override
    public WebUser getUserByUsername(String username) {
        log.info("UsersServiceImpl: getUserByUsername(String username)");

    	log.debug("Getting user by username [" + username + "]");
        UserEntity userEntity = usersDao.getUserByUserName(username);
        if (userEntity == null) {
            log.warn("User [" + username + "] doesn't exist.");
            return null;
        }
        return BeanConverter.convert(userEntity);
    }

    @Override
    public WebUser saveUser(WebUser user) {
        log.info("UsersServiceImpl: saveUser(WebUser user)");

        String username = user.getUsername();
        UserEntity userEntityDuplicate = usersDao.getUserByUserName(username);
        if (userEntityDuplicate != null) {
            String msg = "Username [" + username + "] already exists. Failed to create new user with this uername";
            log.error(msg);
            throw new UserServiceException(msg, "Username '" + username + "' already exists.");
        }
        log.info("Encoding password...");
        String salt = RandomStringUtils.randomAlphanumeric(15);
        String hash = passwordEncoder.encodePassword(user.getPassword(), salt);
        user.setPasswordHash(hash);
        user.setSalt(salt);
        UserEntity userEntity = BeanConverter.convert(user);

        String activationCode = RandomStringUtils.randomAlphanumeric(15);
        userEntity.setActivationCode(activationCode);
        log.debug("Generate activation code as [" + activationCode + "] for user [" + username + "]");
        userEntity.setCreateDate(new Date());

        System.out.println("NEW DATE VALUE IS USER ENTITY: " + userEntity.getCreateDate());
        
        log.debug("Create user [" + user + "]");
        long userId = usersDao.save(userEntity);
        log.info("Save to DB user with id [" + userId + "]");
        user = BeanConverter.convert(userEntity);
        user.setId(userId);
        return user;
    }

    @Override
    public WebUser resetUser(WebUser user) {
        log.info("UsersServiceImpl: resetUser(WebUser user)");
    	
        String username = "";
        
        UserEntity userEntity = null;
        UserEntity oldUserEntity = null;
        UserEntity oldTempUserEntity = null; //Used in case the user already started the reset process
        
        long userId = 0;
        try{
        	log.info("Encoding password...");
            //Get the user object if this user already exists, and set the id.
            //oldUserEntity = usersDao.getUserByUserName(user.getUsername());
            oldTempUserEntity = usersDao.getUserByUserName(Constants.RESET_PLACE_HOLDER + user.getEmail());  
            oldUserEntity = usersDao.getUserByUserName(user.getEmail());  

            if (oldUserEntity == null) {
                String msg = "There is no account associated with Email: [" + user.getEmail() + "]. Please register to create a new account";
                log.error(msg);
                throw new UserServiceException(msg, "Email '" + user.getEmail() + "' does not exist.");
            } else if (oldUserEntity != null) {
                user.setUsername(Constants.RESET_PLACE_HOLDER + oldUserEntity.getUsername());
                username = oldUserEntity.getUsername();
            	userId = oldUserEntity.getId();
            	user.setId(userId);
            }
            
            String salt = RandomStringUtils.randomAlphanumeric(15);
	        String hash = passwordEncoder.encodePassword(user.getPassword(), salt);
	        user.setPasswordHash(hash);
	        user.setSalt(salt);
	        
			String activationCode = RandomStringUtils.randomAlphanumeric(15);
			if (oldTempUserEntity != null){  //If the user already started the reset process
		        oldTempUserEntity.setActivationCode(activationCode);
		        oldTempUserEntity.setCreateDate(new Date());
		        oldTempUserEntity.setPasswordHash(hash);
		        oldTempUserEntity.setSalt(salt);
		        oldTempUserEntity.setActivationDate(null);
		        userId = oldTempUserEntity.getId();
		        user = BeanConverter.convert(oldTempUserEntity);

			} else {

				userEntity = BeanConverter.convert(user);  // UserEntity has an id at this point
		        userEntity.setActivationCode(activationCode);
		        log.debug("Generate activation code as [" + activationCode + "] for user [" + username + "]");
		        userEntity.setCreateDate(new Date());
		        
				log.debug("Create user [" + user + "]");
		        user = BeanConverter.convert(userEntity);
	
		        userId = usersDao.save(userEntity);
		        
		        //if (userId == 0) userId = usersDao.save(userEntity);  // If the user did not already exist, then create the new user and get the id
		        log.info("Save to DB user with id [" + userId + "]");
			}
			user.setId(userId);
			
        }catch (ConstraintViolationException e){
        	//IF we get this exception then the user already exist, so don't do anything and continue
           log.error("The temp user we're trying to create already exist: user Id: " + userEntity.getId() + "User Name: " + user.getUsername());
	   }
	   return user;
    }
    
    
    @Override
    public WebUser activateUser(long id, String activationCode) {
        log.info("UsersServiceImpl.activateUser(long id, String activationCode)");
    	
        UserEntity userEntity = usersDao.getUserById(id);
        if (userEntity == null) {
            String msg = "User with id [" + id + "] doesn't exist.";
            log.error(msg);
            throw new UserServiceException(msg, "This user doesn't exist.");
        }
        String username = userEntity.getUsername();
        if (userEntity.getActivationDate() != null) {
            String msg = "User with id [" + id + "] was already activated";
            log.error(msg);
            throw new UserServiceException(msg, "User '" + username + "' was already activated.");
        }
        if (!userEntity.getActivationCode().equals(activationCode)) {
            String msg = "For user user [" + username + "] activation code is incorrect";
            log.error(msg);
            throw new UserServiceException(msg, "Activation code for user '" + username + "' is incorrect.");
        }
        userEntity.setActivationCode(null);
        userEntity.setActivationDate(new Date());
        log.debug("User '" + username + "' is activated successfully.");
        return BeanConverter.convert(userEntity);
    }

    @Override
    public WebUser activateResetUser(long id, String activationCode) {
        log.info("UsersServiceImpl.activateResetUser(long id, String activationCode)");
    	
        UserEntity userEntity = usersDao.getUserById(id);
        if (userEntity == null) {  //Check for the newly created temporary user
            String msg = "User with id [" + id + "] doesn't exist.";
            log.error(msg);
            throw new UserServiceException(msg, "This user doesn't exist.");
        }

        String username = userEntity.getUsername();
        if (userEntity.getActivationDate() != null) { //Check for the newly created temporary user
            String msg = "User with id [" + id + "] was already activated";
            log.error(msg);
            throw new UserServiceException(msg, "User '" + username + "' was already activated.");
        }
        if (!userEntity.getActivationCode().equals(activationCode)) { //Check for the newly created temporary user
            String msg = "For user user [" + username + "] activation code is incorrect";
            log.error(msg);
            throw new UserServiceException(msg, "Activation code for user '" + username + "' is incorrect.");
        }
        userEntity.setActivationCode(null);
        userEntity.setActivationDate(new Date());
        log.debug("User '" + username + "' is activated successfully.");
        
        //WebUser convertedUser = BeanConverter.convert(userEntity);
        
        UserEntity initialUser = usersDao.getUserByUserName(userEntity.getUsername().replaceFirst(Constants.RESET_PLACE_HOLDER , "") );
        
        ///
        initialUser.setActivationCode(userEntity.getActivationCode());
        initialUser.setEmail(userEntity.getEmail());
        initialUser.setPasswordHash(userEntity.getPasswordHash());
        initialUser.setSalt(userEntity.getSalt());
        initialUser.setActivationCode(null);
        initialUser.setActivationDate(new Date());
        usersDao.save(initialUser);
        
        //Change the user name of the temporary user in case the user has to reset the id several times
        userEntity.setUsername(userEntity.getUsername() + new Date() );
        usersDao.save(userEntity);
        ////////////////////////////////////////////////////////////////////////////////////
        
        return BeanConverter.convert(initialUser);
    }
    
    @NotNull
    @Override
    public WebUser getUserById(long userId) {
        log.info("UsersServiceImpl.getUserById(long userId)");
    	
        UserEntity userEntity = usersDao.getUserById(userId);
        if (userEntity == null) {
            String msg = "User with ID [" + userId + "] not found";
            log.error(msg);
            throw new IllegalArgumentException(msg);
        }
        return BeanConverter.convert(userEntity);
    }

    @NotNull
    @Override
    public List<WebUser> listUsers() {
        log.info("UsersServiceImpl.List<WebUser> listUsers()");
    	
        List<UserEntity> userEntities = usersDao.list();
        List<WebUser> users = new LinkedList<WebUser>();
        for (UserEntity userEntity : userEntities) {
            users.add(BeanConverter.convert(userEntity));
        }
        return users;
    }

}
