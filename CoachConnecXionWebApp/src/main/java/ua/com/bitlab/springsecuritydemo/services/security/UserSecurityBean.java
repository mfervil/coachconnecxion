package ua.com.bitlab.springsecuritydemo.services.security;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;

public class UserSecurityBean extends User {

    private String saltString;
    private Long id;

    public UserSecurityBean(String username, String password, boolean enabled, boolean accountNonExpired,
                            boolean credentialsNonExpired, boolean accountNonLocked, Collection<? extends GrantedAuthority> authorities,
                            String salt, Long id) {
        super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
        this.saltString = salt;
        this.id = id;
    }  

    public String getSaltString() {
        return saltString;
    }

    public Long getId() {
        return id;
    }
}
