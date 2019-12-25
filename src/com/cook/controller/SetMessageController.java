package com.cook.controller;

import com.cook.model.User;
import com.cook.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "setMessage",urlPatterns = "/setMessage")
public class SetMessageController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        int id = ((User)request.getSession().getAttribute("user")).getId();
        String name = request.getParameter("name");
        String note = request.getParameter("note");
        String gender = request.getParameter("gender");
        String birthday = request.getParameter("birthday");
        UserService.setMessage(id,name,note,gender,birthday);
        User user = UserService.reUser(id);
        HttpSession session = request.getSession();
        session.setAttribute("user",user);
        //response.getWriter().println("{\"1\":\"1\"}");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
