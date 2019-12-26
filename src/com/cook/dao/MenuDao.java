package com.cook.dao;

import com.cook.model.Menu;
import com.cook.util.DBUtil;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * @author 24367
 * @date 2019/12/26,16:26
 */
public class MenuDao {
    public int addCook(String title, String material, String description, int uid) {
        JdbcTemplate jt = new JdbcTemplate(DBUtil.getDataSource());
        String sql = "insert into menu(menu_id,title,material,description,author_id) values(null,?,?,?,?)";
        jt.update(sql,title,material,description,uid);
        return getID(jt);
    }

    public int getID(JdbcTemplate jt){
        String sql = "select last_insert_id() as id";
        List<Map<String, Object>> maps = jt.queryForList(sql);
        return Integer.parseInt(maps.get(0).get("id").toString());
    }

    public void setImg(String img, int id) {
        JdbcTemplate jt = new JdbcTemplate(DBUtil.getDataSource());
        String sql = "update menu set img=? where menu_id=?";
        jt.update(sql,img,id);
    }

    public Menu getMenu(int id) {
        JdbcTemplate jt = new JdbcTemplate(DBUtil.getDataSource());
        String sql = "select * from menu where menu_id=?";
        List<Menu> list = jt.query(sql, new RowMapper<Menu>() {
            @Override
            public Menu mapRow(ResultSet resultSet, int i) throws SQLException {
                Menu menu = new Menu();
                menu.setId(resultSet.getInt("menu_id"));
                menu.setTitle(resultSet.getString("title"));
                menu.setMaterial(resultSet.getString("material"));
                menu.setDescription(resultSet.getString("description"));
                menu.setImg(resultSet.getString("img"));
                menu.setAuthor(resultSet.getInt("author_id"));
                return menu;
            }
        }, id);
        if (list.size()>0){
            return list.get(0);
        }else {
            return null;
        }
    }
}
