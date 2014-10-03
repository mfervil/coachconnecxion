package ua.com.bitlab.springsecuritydemo.services;


import ua.com.bitlab.springsecuritydemo.web.beans.WebUser;

/**
 * User: anna
 * Date: 10/12/12
 */
public final class TestUtils {

    private TestUtils() {
    }

    public static WebUser createWebUser(String username) {
        WebUser webUser = new WebUser();
        webUser.setUsername(username);
        webUser.setEmail("anna@example.com");
        webUser.setPassword("123");
        webUser.setConfirmedPassword("123");
        return webUser;
    }
}
