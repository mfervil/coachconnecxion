package ua.com.bitlab.springsecuritydemo.services;

import ua.com.bitlab.springsecuritydemo.dao.entities.UserEntity;
import ua.com.bitlab.springsecuritydemo.web.beans.WebUser;

/**
 * User: anna
 * Date: 10/12/12
 */
public final class BeanConverter {

    private BeanConverter() {
    }


    public static UserEntity convert(WebUser user) {
        UserEntity userEntity = new UserEntity();
        userEntity.setId(user.getId());
        userEntity.setEmail(user.getEmail());
        userEntity.setPasswordHash(user.getPasswordHash());
        userEntity.setRole(user.getRole());
        userEntity.setSalt(user.getSalt());
        userEntity.setUsername(user.getUsername());
        return userEntity;
    }

    public static WebUser convert(UserEntity userEntity) {
        WebUser webUser = new WebUser(userEntity.getId(), userEntity.getUsername(), userEntity.getEmail());
        webUser.setPasswordHash(userEntity.getPasswordHash());
        webUser.setRole(userEntity.getRole());
        webUser.setSalt(userEntity.getSalt());
        webUser.setActivationCode(userEntity.getActivationCode());
        webUser.setCreatedDate(userEntity.getCreateDate());
        if (userEntity.getActivationDate() != null) {
            webUser.setStatus(true);
        }
        return webUser;
    }
}
