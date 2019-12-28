package com.cook.dao;

import com.cook.model.Collect;
import com.cook.util.DBUtil;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * @author 24367
 * @date 2019/12/28,16:20
 */
public class CollectDao {
    public int getCount(int id) {
        JdbcTemplate jt = new JdbcTemplate(DBUtil.getDataSource());
        String sql = "select * from collect where menu_id=?";
        List<Collect> collects = jt.query(sql, new RowMapper<Collect>() {
            @Override
            public Collect mapRow(ResultSet resultSet, int i) throws SQLException {
                Collect collect = new Collect();
                collect.setMenuid(resultSet.getInt("menu_id"));
                collect.setUserid(resultSet.getInt("user_id"));
                return collect;
            }
        },id);
        return collects.size();
    }
}
