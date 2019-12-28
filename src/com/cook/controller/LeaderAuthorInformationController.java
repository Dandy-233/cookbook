package com.cook.controller;

import com.cook.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "leaderAuthorInformation",urlPatterns = "/leaderAuthorInformation")
public class LeaderAuthorInformationController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();
        int index = Integer.parseInt(request.getParameter("index"));
        List<User> leaderauthors = (List<User>) session.getAttribute("leaderauthors");
        User author = leaderauthors.get(index);
        session.setAttribute("author",author);
        response.sendRedirect(request.getContextPath()+"/authorinformation.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
