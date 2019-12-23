package com.cook.service;

import com.cook.dao.UserDao;

/**
 * @author ¿Óµ©
 * @date 2019/12/22,17:14
 */
public class UserService {
    private static UserDao userDao = new UserDao();

    public static int getUser(String username, String password) {
        return userDao.getUser(username,password);
    }
}
