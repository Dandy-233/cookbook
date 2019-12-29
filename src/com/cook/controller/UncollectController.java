package com.cook.controller;

import com.cook.model.Collect;
import com.cook.model.Menu;
import com.cook.model.User;
import com.cook.service.CollectService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * »°œ˚ ’≤ÿ
 */
@WebServlet(name = "uncollect",urlPatterns = "/uncollect")
public class UncollectController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();
        Menu menu = (Menu) session.getAttribute("menu");
        User user = (User) session.getAttribute("user");
        CollectService.unCollect(user.getId(),menu.getId());
        Collect collect = null;
        session.setAttribute("collect",collect);
        response.getWriter().println("{\"code\":\"1\"}");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
