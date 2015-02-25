package ua.com.bitlab.springsecuritydemo.web.controllers;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ua.com.bitlab.springsecuritydemo.services.UserServiceException;
import ua.com.bitlab.springsecuritydemo.services.UsersManagerService;
import ua.com.bitlab.springsecuritydemo.services.UsersService;
import ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils;
import ua.com.bitlab.springsecuritydemo.services.security.UserSecurityBean;
import ua.com.bitlab.springsecuritydemo.web.beans.WebUser;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import java.util.List;


@Controller
@RequestMapping("/users")
public class UsersController {

    private static final Logger log = LoggerFactory.getLogger(UsersController.class);

    @Autowired
    private UsersService usersService;
    @Autowired
    private UsersManagerService usersManagerService;


    @RequestMapping(value = "create", method = RequestMethod.GET)
    public void create(Model model) {
        model.addAttribute("user", new WebUser());
    }

    @RequestMapping(value = "reset", method = RequestMethod.GET)
    public void reset(Model model) {
        model.addAttribute("user", new WebUser());
    }    
    
    @RequestMapping(value = "create", method = RequestMethod.POST)
    public String create(@Valid WebUser user, final BindingResult result, final Model model) {
        //public String create(@Valid WebUser user, Model model, final BindingResult result) {

    	String errorMsg = "";
    	boolean emailErrorFound = false;
    	boolean passwordErrorFound = false;
    	boolean confirmEmailErrorFound = false;
    	
    	user.setUsername(user.getEmail());  //Using the email as the user name.
    	
        List<FieldError> errors = result.getFieldErrors();
        for (FieldError error : errors ) {
            //model.addAttribute("errorMsg", e.getPrintableMessage());
        	//if (error.getField().equalsIgnoreCase("username")) errorMsg = errorMsg  + "User Name: " + error.getDefaultMessage() + "<br>";
        	if (error.getField().equalsIgnoreCase("email")) {
        		if (!emailErrorFound) errorMsg =  errorMsg + "Email: " + error.getDefaultMessage() + "<br>";
        		emailErrorFound = true; 
        	}
        	if (error.getField().equalsIgnoreCase("password")) {
        		if (!passwordErrorFound) errorMsg = errorMsg  + "Password: " + error.getDefaultMessage() + "<br>";
        		passwordErrorFound = true;
        	}
        	if (error.getField().equalsIgnoreCase("confirmedPassword")) {
        		if (!confirmEmailErrorFound) errorMsg =  errorMsg + "Confirm Password: " + error.getDefaultMessage() + "<br>";
        		confirmEmailErrorFound = true;
        	} else if (!user.getPassword().equals(user.getConfirmedPassword())){
        		errorMsg = errorMsg  + "Passwords do not match: <br>";
        	}
        }

        if (result.hasErrors()){
        	model.addAttribute("user", user);
        	model.addAttribute("errorMsg", errorMsg);
        	
            return "users/create";
        }
        
        log.debug("Creating user " );
        try {
            usersManagerService.createUser(user);
           
            
        } catch (UserServiceException e) {
            log.error("Failed to create new user user '" + user.getUsername() + "'. Error: " + e, e);
            model.addAttribute("errorMsg", e.getPrintableMessage());
            model.addAttribute("user", user);
            return "users/create";
        } catch (Exception e) {
            log.error("Failed to create new user user '" + user.getUsername() + "'. Error: " + e, e);
            model.addAttribute("errorMsg", "SYSTEM ERROR::An error occured while creating your account.  Please try again later.");
            model.addAttribute("user", user);
            return "users/create";
        }

        log.info("User created: " + user);
        return "redirect:/users/successfulRegistration";
        
    }
    
    @RequestMapping(value = "reset", method = RequestMethod.POST)
    public String reset(@Valid WebUser user, final BindingResult result, final Model model) {
    	String errorMsg = "";
    	boolean emailErrorFound = false;
    	boolean passwordErrorFound = false;
    	boolean confirmEmailErrorFound = false;
    	
        List<FieldError> errors = result.getFieldErrors();
        for (FieldError error : errors ) {
            //model.addAttribute("errorMsg", e.getPrintableMessage());
        	//if (error.getField().equalsIgnoreCase("username")) errorMsg = errorMsg  + "User Name: " + error.getDefaultMessage() + "<br>";
        	if (error.getField().equalsIgnoreCase("email")) {
        		if (!emailErrorFound) errorMsg =  errorMsg + "Email: " + error.getDefaultMessage() + "<br>";
        		emailErrorFound = true; 
        	}
        	if (error.getField().equalsIgnoreCase("password")) {
        		if (!passwordErrorFound) errorMsg = errorMsg  + "Password: " + error.getDefaultMessage() + "<br>";
        		passwordErrorFound = true;
        	}
        	if (error.getField().equalsIgnoreCase("confirmedPassword")) {
        		if (!confirmEmailErrorFound) errorMsg =  errorMsg + "Confirm Password: " + error.getDefaultMessage() + "<br>";
        		confirmEmailErrorFound = true;
        	}

        }

        if (result.getErrorCount() > 1 ){ // Since user name is not being used in the reset form, there will always be 1 validation error
        	model.addAttribute("user", user);
        	model.addAttribute("errorMsg", errorMsg);
        	
            return "users/reset";
        }

        log.debug("Resetting user " + user);
        try {
            usersManagerService.resetUser(user);
        } catch (UserServiceException e) {
            log.error("Failed to reset user user '" + user.getUsername() + "'. Error: " + e, e);
            model.addAttribute("errorMsg", e.getPrintableMessage());
            model.addAttribute("user", user);
            return "users/reset";
        } catch (Exception e) {
            log.error("Failed to reset user user '" + user.getUsername() + "'. Error: " + e, e);
            model.addAttribute("errorMsg", "SYSTEM ERROR:::There was a problem resetting your account.  Please try again later.");
            model.addAttribute("user", user);
            return "users/reset";
        }
        
        

        log.info("User account Reset: " + user);
        return "redirect:/users/successfulAccountReset";
        
    }
    
    
    @RequestMapping(value = "activate", method = RequestMethod.GET)
    public String activate(long id, String code, Model model, HttpSession session) {
        log.debug("Activating user with id [" + id + "] and activation code [" + code + "]");
        if (StringUtils.isBlank(code)) {
            log.error("Parameter  activation code cannot be empty.");
            model.addAttribute("message", "Activation code is incorrect.");
            return "users/activate";
        }
        try {
            WebUser user = usersService.activateUser(id, code);
            model.addAttribute("message", "User '" + user.getUsername() + "' was activated successfully.");
            model.addAttribute("cuin", id);
        } catch (UserServiceException e) {
            log.error("Failed to activate  user with id'" + id + "'. Error: " + e, e);
            model.addAttribute("message", e.getPrintableMessage());
        } catch (Exception e) {
            log.error("Failed to activate  user with id'" + id + "'. Error: " + e, e);
            model.addAttribute("message", "SYSTEM ERROR:::There was a problem activating your account.  Please try again later.");
        }
        log.info("User [" + id + "] activated");

        session.setAttribute("newusercreated", "1"); 
        
        return "users/activate";
    }

    
    @RequestMapping(value = "activateReset", method = RequestMethod.GET)
    public String activateReset(long id, String code, Model model) {
        log.debug("Reset user with id [" + id + "] and activation code [" + code + "]");
        if (StringUtils.isBlank(code)) {
            log.error("Parameter  activation code cannot be empty.");
            model.addAttribute("message", "Activation code is incorrect.");
            return "users/activate";
        }
        try {
            WebUser user = usersService.activateResetUser(id, code);

            model.addAttribute("message", "User account '" + user.getUsername() + "' was reset successfully.");
            model.addAttribute("cuin", id);
        } catch (UserServiceException e) {
            log.error("Failed to activate  user with id'" + id + "'. Error: " + e, e);
            model.addAttribute("message", e.getPrintableMessage());
        } catch (Exception e) {
            log.error("Failed to activate  user with id'" + id + "'. Error: " + e, e);
            model.addAttribute("message", "SYSTEM ERROR:::There was a problem activating your account.  Please try again later.");
        }
        log.info("User [" + id + "] activated");
        return "users/activate";
    }
   
    
    @RequestMapping(value = "home")
    public void home(Model model) {
    	
        //UserSecurityBean currentUser = SecurityUtils.getCurrentUser();
        //Long userId = currentUser.getId();
        //WebUser user = usersService.getUserById(userId);
        //model.addAttribute("user", user);
    }

    @Secured("ROLE_USER")
    @RequestMapping(value = "view")
    public void view(Model model) {
        UserSecurityBean currentUser = SecurityUtils.getCurrentUser();
        Long userId = currentUser.getId();
        WebUser user = usersService.getUserById(userId);
        model.addAttribute("user", user);
    }

    @Secured("ROLE_ADMIN")
    @RequestMapping(value = "list")
    public void list(Model model) {
        List<WebUser> users = usersService.listUsers();
        model.addAttribute("users", users);
    }

    @ResponseBody
    @RequestMapping(value = "checkUserName", method = RequestMethod.GET)
    public Boolean checkMasterByOfferName(String username) {
        WebUser webUser = usersService.getUserByUsername(username);
        return webUser == null;
    }
}
