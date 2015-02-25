package ua.com.bitlab.springsecuritydemo.services.security;

import org.jetbrains.annotations.Nullable;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;

/**
 * User: anna
 * Date: 4/28/11
 */
public final class SecurityUtils {

    private final static Logger log = LoggerFactory.getLogger(SecurityUtils.class);

    private SecurityUtils() {
    }

    @Nullable
    public static UserSecurityBean getCurrentUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null) {
            String msg = "No authenticated user";
            //log.error(msg);
            return null;
        } else {
            Object principal = authentication.getPrincipal();
            if (!(principal instanceof User)) {
                String msg = "Not AuthenticatedUser principal";
                //log.error(msg);
                return null;
            }
            return ((UserSecurityBean) principal);
        }
    }
}
