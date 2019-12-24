package com.cook.controller;

import com.cook.model.User;
import com.cook.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

/**
 * 检验是否登录成功并且把登录状态保存到浏览器
 */
@WebServlet(name = "login",urlPatterns = "/login")
public class LoginController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = UserService.getUser(username,password);
        int count = 0;
        if (user!=null){
            count = 1;
            //登录成功，把用户信息传到前台并添加cookie
            HttpSession session = request.getSession();
            session.setAttribute("user",user);
            Cookie cookie = new Cookie("username",user.getUsername());
            cookie.setMaxAge(500000);
            response.addCookie(cookie);
        }
        String result = "{\"count\":\""+count+"\"}";
        response.getWriter().println(result);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
