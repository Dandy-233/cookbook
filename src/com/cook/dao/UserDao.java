package com.cook.dao;

import com.cook.model.User;
import com.cook.util.DBUtil;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * @author 24367
 * @date 2019/12/22,20:40
 */
public class UserDao {

    public User getUser(String username, String password) {
        JdbcTemplate jt = new JdbcTemplate(DBUtil.getDataSource());
        String sql = "select * from user where username=? and password=?";
        List<User> list = jt.query(sql, new RowMapper<User>() {
            @Override
            public User mapRow(ResultSet resultSet, int i) throws SQLException {
                User user = new User();
                user.setId(resultSet.getInt("user_id"));
                user.setUsername(resultSet.getString("username"));
                user.setPassword(resultSet.getString("password"));
                user.setName(resultSet.getString("name"));
                user.setGender(resultSet.getString("gender"));
                user.setBirthday(resultSet.getString("birthday"));
                user.setNote(resultSet.getString("note"));
                return user;
            }
        },username,password);
        if (list.size()>0){
            return list.get(0);
        }
        return null;
    }

    public User checkUser(String username) {
        JdbcTemplate jt = new JdbcTemplate(DBUtil.getDataSource());
        String sql = "select * from user where username=?";
        List<User> list = jt.query(sql, new RowMapper<User>() {
            @Override
            public User mapRow(ResultSet resultSet, int i) throws SQLException {
                User user = new User();
                user.setId(resultSet.getInt("user_id"));
                user.setUsername(resultSet.getString("username"));
                user.setPassword(resultSet.getString("password"));
                user.setName(resultSet.getString("name"));
                user.setGender(resultSet.getString("gender"));
                user.setBirthday(resultSet.getString("birthday"));
                user.setNote(resultSet.getString("note"));
                return user;
            }
        },username);
        if (list.size()>0){
            return list.get(0);
        }else {
            return null;
        }
    }

    public void addUser(String username, String password) {
        JdbcTemplate jt = new JdbcTemplate(DBUtil.getDataSource());
        String sql = "insert into user(username,password,name) values(?,?,?)";
        jt.update(sql,username,password,username);
    }

    public void setMessage(int id, String name, String note, String gender, String birthday) {
        JdbcTemplate jt = new JdbcTemplate(DBUtil.getDataSource());
        String sql = "update user set name=?,note=?,gender=?,birthday=? where user_id = ?";
        jt.update(sql,name,note,gender,birthday,id);
    }

    public User reUser(int id) {
        JdbcTemplate jt = new JdbcTemplate(DBUtil.getDataSource());
        String sql = "select * from user where user_id=?";
        List<User> list = jt.query(sql, new RowMapper<User>() {
            @Override
            public User mapRow(ResultSet resultSet, int i) throws SQLException {
                User user = new User();
                user.setId(resultSet.getInt("user_id"));
                user.setUsername(resultSet.getString("username"));
                user.setPassword(resultSet.getString("password"));
                user.setName(resultSet.getString("name"));
                user.setGender(resultSet.getString("gender"));
                user.setBirthday(resultSet.getString("birthday"));
                user.setNote(resultSet.getString("note"));
                return user;
            }
        },id);
        if (list.size()>0){
            return list.get(0);
        }else {
            return null;
        }
    }
}
