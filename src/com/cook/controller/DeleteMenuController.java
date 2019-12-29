package com.cook.controller;

import com.cook.model.Menu;
import com.cook.model.User;
import com.cook.service.MenuService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * É¾³ý²ËÆ×
 */
@WebServlet(name = "deleteMenu",urlPatterns = "/deleteMenu")
public class DeleteMenuController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();
        int authorid = ((User)session.getAttribute("user")).getId();
        int menuid = Integer.parseInt(request.getParameter("menuid"));
        MenuService.deleteMenu(menuid);
        List<Menu> menus = MenuService.listMenu(authorid);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
