package com.cook.service;

import com.cook.dao.CollectDao;
import com.cook.model.Collect;

import java.util.List;

/**
 * @author ¿Óµ©
 * @date 2019/12/28,16:19
 */
public class CollectService {
    private static CollectDao collectDao = new CollectDao();

    public static int getCount(int id) {
        return collectDao.getCount(id);
    }

    public static void addCollect(int userid, int menuid) {
        collectDao.addCollect(userid,menuid);
    }

    public static Collect getCollect(int userid, int menuid) {
        return collectDao.getCollect(userid,menuid);
    }

    public static void unCollect(int userid, int menuid) {
        collectDao.unCollect(userid,menuid);
    }

    public static List<Collect> getMyCollects(int userid) {
        return collectDao.getMyCollects(userid);
    }
}
