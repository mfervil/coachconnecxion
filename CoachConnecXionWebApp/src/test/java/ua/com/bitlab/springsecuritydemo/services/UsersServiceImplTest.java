package ua.com.bitlab.springsecuritydemo.services;

import junit.framework.Assert;
import org.junit.After;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import ua.com.bitlab.springsecuritydemo.dao.entities.UserEntity;
import ua.com.bitlab.springsecuritydemo.dao.entities.UserRole;
import ua.com.bitlab.springsecuritydemo.web.beans.WebUser;


/**
 * User: anna
 * Date: 10/12/12
 */
public class UsersServiceImplTest extends AbstractServiceTest {

	
    @Autowired
    private UsersService usersService;

    @After
    public void tearDown() throws Exception {
        storageHelper.clearTables(
                UserEntity.class
        );
    }

    @Test
    public void testCreateUser() throws Exception {
        String userName = "homer";
        WebUser user = TestUtils.createWebUser(userName);
        WebUser createdUser = usersService.saveUser(user);

        WebUser actualUser = usersService.getUserByUsername(userName);
        Assert.assertTrue(createdUser.getId() == actualUser.getId());
        Assert.assertEquals(userName, actualUser.getUsername());
        Assert.assertEquals(user.getEmail(), actualUser.getEmail());
        Assert.assertEquals(UserRole.ROLE_USER, actualUser.getRole());
        Assert.assertNotNull(actualUser.getPasswordHash());
        Assert.assertNotNull(actualUser.getSalt());
        Assert.assertNotNull(actualUser.getCreatedDate());
        Assert.assertNotNull(actualUser.getActivationCode());
        Assert.assertFalse(actualUser.getStatus());
    }

    @Test(expected = UserServiceException.class)
    public void testDuplicateCreateUser() throws Exception {
        String userName = "homer";
        WebUser user = TestUtils.createWebUser(userName);
        usersService.saveUser(user);
        usersService.saveUser(user);
    }

    @Test
    public void testActivateCreateUser1() throws Exception {
        String userName = "homer";
        WebUser user = TestUtils.createWebUser(userName);
        WebUser createdUser = usersService.saveUser(user);
        WebUser actualUser = usersService.getUserByUsername(userName);
        usersService.activateUser(createdUser.getId(), actualUser.getActivationCode());

        WebUser activatedUser = usersService.getUserByUsername(userName);
        Assert.assertNull(activatedUser.getActivationCode());
        Assert.assertTrue(activatedUser.getStatus());
    }

    @Test(expected = UserServiceException.class)
    public void testActivateCreateUserIncorrectUserId() throws Exception {
        String userName = "homer";
        WebUser user = TestUtils.createWebUser(userName);
        long userId = usersService.saveUser(user).getId();
        WebUser actualUser = usersService.getUserByUsername(userName);
        usersService.activateUser(userId + 2, actualUser.getActivationCode());
    }

    @Test(expected = UserServiceException.class)
    public void testActivateCreateUserIncorrectActivationCode() throws Exception {
        String userName = "homer";
        WebUser user = TestUtils.createWebUser(userName);
        long userId = usersService.saveUser(user).getId();
        WebUser actualUser = usersService.getUserByUsername(userName);
        usersService.activateUser(userId, actualUser.getActivationCode() + "45245");
    }

    @Test(expected = UserServiceException.class)
    public void testActivateCreateUserAlreadyActivated() throws Exception {
        String userName = "homer";
        WebUser user = TestUtils.createWebUser(userName);
        long userId = usersService.saveUser(user).getId();
        WebUser actualUser = usersService.getUserByUsername(userName);
        usersService.activateUser(userId, actualUser.getActivationCode());
        usersService.activateUser(userId, actualUser.getActivationCode());
    }

    @Test
    public void testListUsers() throws Exception {
        String userName1 = "homer";
        WebUser user1 = TestUtils.createWebUser(userName1);
        long userId1 = usersService.saveUser(user1).getId();

        String userName2 = "bart";
        WebUser user2 = TestUtils.createWebUser(userName2);
        long userId2 = usersService.saveUser(user2).getId();
        Assert.assertEquals(2, usersService.listUsers().size());

    }
}
