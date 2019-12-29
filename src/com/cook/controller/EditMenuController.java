package com.cook.controller;

import com.cook.model.Menu;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * 编辑菜谱页面获取菜谱信息
 */
@WebServlet(name = "editMenu",urlPatterns = "/editMenu")
public class EditMenuController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();
        List<Menu> list = (List<Menu>) session.getAttribute("mymenus");
        int index = Integer.parseInt(request.getParameter("index"));
        Menu menu = list.get(index);
        session.setAttribute("mymenu",menu);
        response.sendRedirect(request.getContextPath()+"/editMenu.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
