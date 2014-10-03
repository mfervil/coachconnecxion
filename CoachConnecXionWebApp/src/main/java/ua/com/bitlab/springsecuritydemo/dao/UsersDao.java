package ua.com.bitlab.springsecuritydemo.dao;

import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import ua.com.bitlab.springsecuritydemo.dao.entities.UserEntity;

import java.util.List;

/**
 * Users DAO
 */
public interface UsersDao {

    /**
     * Saves new user
     *
     * @param userEntity user entity
     * @return saved user ID
     */
    long save(UserEntity userEntity);

    /**
     * Finds user by username
     *
     * @param username username to search
     * @return found user or NULL
     */
    @Nullable
    UserEntity getUserByUserName(String username);

    /**
     * Finds user by email
     *
     * @param username username to search
     * @return found user or NULL
     */
    public UserEntity getUserByUserEmail(String email);    
    
    /**
     * Gets user by ID
     *
     * @param id user ID to search
     * @return found user or NULL
     */
    @Nullable
    UserEntity getUserById(long id);

    /**
     * Lists all users
     *
     * @return list of users
     */
    @NotNull
    List<UserEntity> list();
}
