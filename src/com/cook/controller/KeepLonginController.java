package com.cook.controller;

import com.cook.model.User;
import com.cook.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "keepLongin",urlPatterns = "/keepLogin")
public class KeepLonginController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie:cookies) {
            if (cookie.getName().equals("username")){
                String username = cookie.getValue();
                User user = UserService.checkUser(username);
                HttpSession session = request.getSession();
                session.setAttribute("user",user);
                response.sendRedirect(request.getContextPath()+"/index1.jsp");
                return;
            }
        }
        response.sendRedirect(request.getContextPath()+"/index1.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
