package ua.com.bitlab.springsecuritydemo.dao;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import ua.com.bitlab.springsecuritydemo.dao.entities.UserEntity;

import java.util.List;

/**
 * User: anna
 * Date: 10/12/12
 */
@Repository
public class UsersHibernateDao implements UsersDao {

    private static final Logger log = LoggerFactory.getLogger(UsersHibernateDao.class);

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public long save(UserEntity userEntity) {
        log.debug("Insert user to DB");
        return (Long) sessionFactory.getCurrentSession().save(userEntity);
    }

    @Override
    @Nullable
    public UserEntity getUserByUserName(String username) {
        return (UserEntity) sessionFactory.getCurrentSession().createCriteria(UserEntity.class)
                .add(Restrictions.eq("username", username))
                .uniqueResult();
    }

    @Override
    @Nullable
    public UserEntity getUserByUserEmail(String email) {
        return (UserEntity) sessionFactory.getCurrentSession().createCriteria(UserEntity.class)
                .add(Restrictions.eq("email", email))
                .uniqueResult();
    }
    
    
    @Nullable
    @Override
    public UserEntity getUserById(long id) {
        return (UserEntity) sessionFactory.getCurrentSession().get(UserEntity.class, id);
    }

    @NotNull
    @Override
    public List<UserEntity> list() {
        List list = sessionFactory.getCurrentSession().createCriteria(UserEntity.class).list();
        return ((List<UserEntity>) list);
    }
}
