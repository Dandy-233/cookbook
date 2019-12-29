package com.cook.service;

import com.cook.dao.MenuDao;
import com.cook.model.Menu;

import java.util.List;

/**
 * @author ¿Óµ©
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


    public static List<Menu> listMenu(int authorid) {
        return menuDao.listMenu(authorid);
    }

    public static void editMenu(int menuid, String title, String material, String description) {
        menuDao.editMenu(menuid,title,material,description);
    }

    public static void deleteMenu(int menuid) {
        menuDao.deleteMenu(menuid);
    }

    public static List<Menu> checkAllMenu() {
        return menuDao.checkAllMenu();
    }

    public static Menu checkMenu(int menuid) {
        return menuDao.checkMenu(menuid);
    }
}
