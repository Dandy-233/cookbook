package com.cook.controller;

import com.cook.model.User;
import com.cook.service.MenuService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Ìí¼Ó²ËÆ×
 */
@WebServlet(name = "addCook",urlPatterns = "/addCook")
public class AddCookController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();
        int uid = ((User)session.getAttribute("user")).getId();
        String title = request.getParameter("title");
        String material = request.getParameter("material");
        String description = request.getParameter("description");
        int id = MenuService.addCook(title,material,description,uid);
        session.setAttribute("menuid",id);
        response.getWriter().println("{\"code\":\"1\"}");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
