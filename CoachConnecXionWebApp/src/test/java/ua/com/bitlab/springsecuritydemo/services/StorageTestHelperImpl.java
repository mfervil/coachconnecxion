package ua.com.bitlab.springsecuritydemo.services;

import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.hibernate.metadata.CollectionMetadata;
import org.hibernate.persister.collection.AbstractCollectionPersister;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Map;

/**
 * User: anna
 * Date: 10/12/12
 */
@Component
public class StorageTestHelperImpl implements StorageTestHelper {

    private final static Logger log = LoggerFactory.getLogger(StorageTestHelperImpl.class);

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void clearTables(Class... entityClasses) {
        clearRelationTables();
        for (Class entityClass : entityClasses) {
            String entityName = sessionFactory.getClassMetadata(entityClass).getEntityName();
            log.info("Deleting from table " + entityName);
            String hql = "delete from " + entityName;
            sessionFactory.getCurrentSession().createQuery(hql).executeUpdate();
        }
    }

    @SuppressWarnings("unchecked")
    @Override
    public void clearRelationTables() {
        Map<String, CollectionMetadata> metadata = sessionFactory.getAllCollectionMetadata();
        for (CollectionMetadata collectionMetadata : metadata.values()) {
            String relationEntityName = collectionMetadata.getRole();
            if (collectionMetadata instanceof AbstractCollectionPersister) {
                log.info("Deleting from relation table " + relationEntityName);
                AbstractCollectionPersister persister = (AbstractCollectionPersister) collectionMetadata;
                if (persister.isManyToMany() || persister.isCollection() && !persister.isOneToMany()) {
                    SQLQuery sqlQuery = sessionFactory.getCurrentSession().createSQLQuery("delete from " + persister.getTableName());
                    sqlQuery.executeUpdate();
                    continue;
                }
            }
            log.debug("Skipping relation " + relationEntityName);
        }
    }
}
