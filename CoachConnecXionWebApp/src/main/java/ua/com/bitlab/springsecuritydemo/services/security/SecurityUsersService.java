package ua.com.bitlab.springsecuritydemo.services.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import ua.com.bitlab.springsecuritydemo.dao.entities.UserRole;
import ua.com.bitlab.springsecuritydemo.services.UsersService;
import ua.com.bitlab.springsecuritydemo.web.beans.WebUser;
  
import java.util.LinkedList;
import java.util.List;

/**
 * @author Anna Novikova
 * @version 12.10.12
 */
public class SecurityUsersService implements UserDetailsService {
	
	
    private final static Logger log = LoggerFactory.getLogger(SecurityUsersService.class);

    
    @Autowired
    private UsersService usersService;

    
    @Override  
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        WebUser webUser = usersService.getUserByUsername(username);
        if (webUser == null) {
            String msg = "User [" + username + "] not found";
            log.debug(msg);
            throw new UsernameNotFoundException(msg);
        }
        log.debug("User [" + username + "] found");
        List<GrantedAuthority> authorities = new LinkedList<GrantedAuthority>();
        authorities.add(new SimpleGrantedAuthority(webUser.getRole().name()));
        if (UserRole.ROLE_ADMIN.equals(webUser.getRole())) {
            //admin is user as well
            authorities.add(new SimpleGrantedAuthority(UserRole.ROLE_USER.name()));
        }
        return new UserSecurityBean(webUser.getUsername(), webUser.getPasswordHash(), webUser.getStatus(), true, true, true, authorities, webUser.getSalt(), webUser.getId());
    }
}
