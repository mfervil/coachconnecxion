package ua.com.bitlab.springsecuritydemo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;

/**
 * User: anna
 * Date: 10/12/12
 */
@ContextConfiguration(locations = {"classpath:spring/test-app-config.xml"})
public abstract class AbstractServiceTest extends AbstractJUnit4SpringContextTests {

    @Autowired
    protected StorageTestHelper storageHelper;

}
