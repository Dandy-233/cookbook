package com.cook.service;

import com.cook.dao.MenuDao;
import com.cook.model.Menu;

/**
 * @author 24367
 * @date 2019/12/26,16:25
 */
public class MenuService {
    private static MenuDao menuDao = new MenuDao();

    public static int addCook(String title, String material, String description, int uid) {
        return menuDao.addCook(title,material,description,uid);
    }

    public static void setImg(String img, int id) {
        menuDao.setImg(img,id);
    }

    public static Menu getMenu(int id) {
        return menuDao.getMenu(id);
    }
}
