package com.cook.controller;

import com.cook.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

/**
 * 通过清除cookie退出登录
 */
@WebServlet(name = "exit",urlPatterns = "/exit")
public class ExitController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie:cookies){
            cookie.setMaxAge(0);
            response.addCookie(cookie);
            User user = null;
            session.setAttribute("user",user);
        }
        response.sendRedirect(request.getContextPath()+"/index.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
