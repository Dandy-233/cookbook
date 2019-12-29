package com.cook.controller;

import com.cook.model.Menu;
import com.cook.model.User;
import com.cook.service.CollectService;
import com.cook.service.MenuService;
import com.cook.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * 获取所有菜谱列表
 */
@WebServlet(name = "checkAllMenu",urlPatterns = "/checkAllMenu")
public class CheckAllMenuController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();
        List<Menu> menus = MenuService.checkAllMenu();
        Collections.reverse(menus);
        List<User> authors = new ArrayList<>();
        List<Integer> counts = new ArrayList<>();
        for(Menu menu :menus){
            User author = UserService.reUser(menu.getAuthor());
            int count = CollectService.getCount(menu.getId());
            counts.add(count);
            authors.add(author);
        }
        session.setAttribute("allcounts",counts);
        session.setAttribute("allauthors",authors);
        session.setAttribute("allmenus",menus);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
