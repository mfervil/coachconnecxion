package ua.com.bitlab.springsecuritydemo.web.beans;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

import ua.com.bitlab.springsecuritydemo.dao.entities.UserRole;

import javax.validation.constraints.AssertTrue;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.util.Date;
                
/**
 * User: anna
 * Date: 10/12/12
 */
public class WebUser {

    private Long id;
    private String username;
    @NotEmpty
    @Email
    @Pattern(regexp = "^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$", message="Your email address is invalid")
    private String email;
    @Size(min = 3, max = 20, message = "{password.error.size}")
    @Pattern(regexp = "[^\\s\\{\\}]+$", message = "{password.error.symbols}")
    private String password;
    @Size(min = 3, max = 20, message = "{password.error.size}")
    @Pattern(regexp = "[^\\s\\{\\}]+$", message = "{password.error.symbols}")
    private String confirmedPassword;

    private String passwordHash;
    private UserRole role = UserRole.ROLE_USER;
    private String salt;
    private String activationCode;
    private boolean status;
    private Date createdDate;

    @AssertTrue(message = "{confirm.password.error}")
    public boolean isConfirmationPassword() {
        return password == null || password.equals(confirmedPassword);
    }

    public WebUser() {
    }

    public WebUser(Long id, String username, String email) {
        this.id = id;
        this.username = username;
        this.email = email;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(String passwordHash) {
        this.passwordHash = passwordHash;
    }

    public UserRole getRole() {
        return role;
    }

    public void setRole(UserRole role) {
        this.role = role;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmedPassword() {
        return confirmedPassword;
    }

    public void setConfirmedPassword(String confirmedPassword) {
        this.confirmedPassword = confirmedPassword;
    }

    public String getActivationCode() {
        return activationCode;
    }

    public void setActivationCode(String activationCode) {
        this.activationCode = activationCode;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }
}
