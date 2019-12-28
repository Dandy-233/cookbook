package com.cook.controller;

import com.cook.model.Menu;
import com.cook.model.User;
import com.cook.service.CollectService;
import com.cook.service.MenuService;

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

@WebServlet(name = "checkMenu",urlPatterns = "/checkMenu")
public class CheckMenuController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();
        int authorid = ((User)session.getAttribute("user")).getId();
        List<Menu> menus = MenuService.listMenu(authorid);
        Collections.reverse(menus);
        List<Integer> counts = new ArrayList<>();
        for(Menu menu :menus){
            int count = CollectService.getCount(menu.getId());
            counts.add(count);
        }
        session.setAttribute("mycounts",counts);
        session.setAttribute("mymenus",menus);
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
