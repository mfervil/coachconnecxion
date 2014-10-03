package ua.com.bitlab.springsecuritydemo.services;

import junit.framework.Assert;
import org.junit.Test;
import org.mockito.Mockito;
import org.springframework.test.util.ReflectionTestUtils;
import ua.com.bitlab.springsecuritydemo.web.beans.WebUser;

import static org.mockito.Mockito.*;

/**
 * User: anna
 * Date: 10/12/12
 */
public class UsersManagerServiceTest {

    @Test
    public void testCreateUser() throws Exception {
        String userName = "homer";
        WebUser user = TestUtils.createWebUser(userName);
        user.setId(2l);

        UsersManagerServiceImpl service = new UsersManagerServiceImpl();
        UsersService usersService = mock(UsersService.class);
        MailService mailService = mock(MailService.class);
        when(usersService.saveUser(user)).thenReturn(user);

        ReflectionTestUtils.setField(service, "usersService", usersService);
        ReflectionTestUtils.setField(service, "mailService", mailService);

        service.createUser(user);

        verify(usersService).saveUser(user);
        verify(mailService).sendActivationEmail(user);
    }

    @Test
    public void testCreateUserSaveUserIncorrect() throws Exception {
        String userName = "homer";
        WebUser user = TestUtils.createWebUser(userName);
        user.setId(2l);

        UsersManagerServiceImpl service = new UsersManagerServiceImpl();
        UsersService usersService = mock(UsersService.class);
        MailService mailService = mock(MailService.class);
        when(usersService.saveUser(user)).thenThrow(new RuntimeException());

        ReflectionTestUtils.setField(service, "usersService", usersService);
        ReflectionTestUtils.setField(service, "mailService", mailService);

        try {
            service.createUser(user);
            Assert.fail();
        } catch (RuntimeException e) {
        }

        verify(usersService).saveUser(user);
        verify(mailService, never()).sendActivationEmail(any(WebUser.class));
    }
}
