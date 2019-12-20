package com.cook.util;

import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.io.FileReader;
import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class DBUtil {
    private static DataSource dataSource;

    static {
        Properties pro = new Properties();
        ClassLoader cl = DBUtil.class.getClassLoader();
        URL res = cl.getResource("druid.properties");
        assert res != null;
        String path = res.getPath();
        try {
            pro.load(new FileReader(path));
            dataSource = DruidDataSourceFactory.createDataSource(pro);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void close(Connection con, Statement stat) {
        if (stat != null) {
            try {
                stat.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void close(Connection con, Statement stat, ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            close(con, stat);
        }
    }

    public static DataSource getDataSource() {
        return dataSource;
    }
}
