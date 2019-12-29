package com.cook.controller;

import com.cook.service.MenuService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * ±à¼­²ËÆ×ÐÅÏ¢
 */
@WebServlet(name = "editCook",urlPatterns = "/editCook")
public class EditCookController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        int menuid = Integer.parseInt(request.getParameter("menuid"));
        String title = request.getParameter("title");
        String material = request.getParameter("material");
        String description = request.getParameter("description");
        MenuService.editMenu(menuid,title,material,description);
        HttpSession session = request.getSession();
        session.setAttribute("menuid",menuid);
        response.getWriter().println("{\"code\":\"1\"}");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
