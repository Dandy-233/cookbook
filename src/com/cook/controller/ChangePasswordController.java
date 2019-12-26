package com.cook.controller;

import com.cook.model.User;
import com.cook.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "changePassword",urlPatterns = "/changePassword")
public class ChangePasswordController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();
        String username = ((User)session.getAttribute("user")).getUsername();
        String oldPassword = request.getParameter("oldpassword");
        String newPassword = request.getParameter("newpassword");
        User user = UserService.getUser(username,oldPassword);
        if (user == null){
            response.getWriter().println("{\"code\":\"0\"}");
        }else if (oldPassword.equals(newPassword)){
            response.getWriter().println("{\"code\":\"1\"}");
        }else {
            UserService.setPassword(user.getId(),newPassword);
            user = null;
            session.setAttribute("user",user);
            Cookie[] cookies = request.getCookies();
            for (Cookie cookie:
                 cookies) {
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
            }
            response.getWriter().println("{\"code\":\"2\"}");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
