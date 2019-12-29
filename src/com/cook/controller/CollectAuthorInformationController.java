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
import java.util.List;

/**
 * 通过收藏夹获取菜谱作者信息
 */
@WebServlet(name = "collectAuthorInformation",urlPatterns = "/collectAuthorInformation")
public class CollectAuthorInformationController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();
        int index = Integer.parseInt(request.getParameter("index"));
        List<User> collectauthors = (List<User>) session.getAttribute("collectauthors");
        User author = collectauthors.get(index);
        List<Menu> menus = MenuService.listMenu(author.getId());
        List<Integer> counts = new ArrayList<>();
        for (Menu menu:menus){
            counts.add(CollectService.getCount(menu.getId()));
        }
        session.setAttribute("counts",counts);
        session.setAttribute("author",author);
        session.setAttribute("menus",menus);
        response.sendRedirect(request.getContextPath()+"/authorinformation.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
