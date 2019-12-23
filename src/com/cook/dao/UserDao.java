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

    public int getUser(String username, String password) {
        int count = 0;
        JdbcTemplate jt = new JdbcTemplate(DBUtil.getDataSource());
        String sql = "select * from user where username=? and password=?";
        List<User> list = jt.query(sql, new RowMapper<User>() {
            @Override
            public User mapRow(ResultSet resultSet, int i) throws SQLException {
                return new User(resultSet.getInt("user_id"),
                        resultSet.getString("username"),
                        resultSet.getString("password"));
            }
        },username,password);
        if (list.size()>0){
            count = 1;
        }
        return count;
    }
}
