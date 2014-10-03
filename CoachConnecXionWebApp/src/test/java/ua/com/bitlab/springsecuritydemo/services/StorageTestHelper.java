package ua.com.bitlab.springsecuritydemo.services;

import org.springframework.transaction.annotation.Transactional;

/**
 * User: anna
 * Date: 10/12/12
 */
@Transactional
public interface StorageTestHelper {

    void clearTables(Class... entityClasses);

    void clearRelationTables();
}
