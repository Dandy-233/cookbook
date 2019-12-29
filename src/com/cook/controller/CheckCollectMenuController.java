package com.cook.controller;

import com.cook.model.Collect;
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
import java.util.List;

/**
 * 获取收藏列表
 */
@WebServlet(name = "checkCollectMenu",urlPatterns = "/checkCollectMenu")
public class CheckCollectMenuController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        List<Collect> collects = CollectService.getMyCollects(user.getId());
        List<User> authors = new ArrayList<>();
        List<Menu> menus = new ArrayList<>();
        List<Integer> counts = new ArrayList<>();
        if (collects.size()>0){
            for (Collect collect:collects){
                Menu menu = MenuService.checkMenu(collect.getMenuid());
                menus.add(menu);
            }
        }
        for(Menu menu :menus){
            User author = UserService.reUser(menu.getAuthor());
            int count = CollectService.getCount(menu.getId());
            counts.add(count);
            authors.add(author);
        }
        session.setAttribute("collectcounts",counts);
        session.setAttribute("collectauthors",authors);
        session.setAttribute("collectmenus",menus);
        if (menus.size()>0){
            response.getWriter().println("{\"code\":\"1\"}");
        }else {
            response.getWriter().println("{\"code\":\"0\"}");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
