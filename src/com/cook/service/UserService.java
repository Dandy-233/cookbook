package com.cook.service;

import com.cook.dao.UserDao;
import com.cook.model.User;

/**
 * @author ¿Óµ©
 * @date 2019/12/22,17:14
 */
public class UserService {
    private static UserDao userDao = new UserDao();

    public static User getUser(String username, String password) {
        return userDao.getUser(username,password);
    }

    public static User checkUser(String username) {
        return userDao.checkUser(username);
    }

    public static void addUser(String username, String password) {
        userDao.addUser(username,password);
    }

    public static void setMessage(int id, String name, String note, String gender, String birthday) {
        userDao.setMessage(id,name,note,gender,birthday);
    }

    public static User reUser(int id) {
        return userDao.reUser(id);
    }

    public static void setFace(int id, String facepath) {
        userDao.setFace(id,facepath);
    }
}
