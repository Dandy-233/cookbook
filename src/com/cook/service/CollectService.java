package com.cook.service;

import com.cook.dao.CollectDao;

/**
 * @author 24367
 * @date 2019/12/28,16:19
 */
public class CollectService {
    private static CollectDao collectDao = new CollectDao();

    public static int getCount(int id) {
        return collectDao.getCount(id);
    }
}
