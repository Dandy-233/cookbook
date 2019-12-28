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

@WebServlet(name = "allInformation",urlPatterns = "/allInformation")
public class AllInformationController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();
        int index = Integer.parseInt(request.getParameter("index"));
        List<Menu> allmenus = (List<Menu>) session.getAttribute("allmenus");
        Menu menu = allmenus.get(index);
        session.setAttribute("menu",menu);
        response.sendRedirect(request.getContextPath()+"/information.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
