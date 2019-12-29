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
import java.util.*;

/**
 * 获取菜谱排行列表（根据收藏数）
 */
@WebServlet(name = "checkLeaderMenu",urlPatterns = "/checkLeaderMenu")
public class CheckLeaderMenuController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();
        List<Menu> menus = MenuService.checkAllMenu();
        Map<Menu,Integer> map = new HashMap<>();
        for (Menu menu:menus){
            map.put(menu,CollectService.getCount(menu.getId()));
        }
        List<Map.Entry<Menu,Integer>> list = new ArrayList<>(map.entrySet());
        Collections.sort(list, new Comparator<Map.Entry<Menu, Integer>>() {
            @Override
            public int compare(Map.Entry<Menu, Integer> o1, Map.Entry<Menu, Integer> o2) {
                return o2.getValue().compareTo(o1.getValue());
            }
        });
        List<Menu> leadermenus = new ArrayList<>();
        for (Map.Entry<Menu,Integer> m:list){
            leadermenus.add(m.getKey());
        }
        List<User> authors = new ArrayList<>();
        List<Integer> counts = new ArrayList<>();
        for(Menu menu :leadermenus){
            User author = UserService.reUser(menu.getAuthor());
            int count = CollectService.getCount(menu.getId());
            counts.add(count);
            authors.add(author);
        }
        session.setAttribute("leadercounts",counts);
        session.setAttribute("leaderauthors",authors);
        session.setAttribute("leadermenus",leadermenus);
        response.sendRedirect(request.getContextPath()+"/leaderboard.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
