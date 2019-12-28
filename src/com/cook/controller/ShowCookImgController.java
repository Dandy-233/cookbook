package com.cook.controller;

import com.cook.model.Menu;
import com.cook.util.ImgUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "showCookImg",urlPatterns = "/showCookImg")
public class ShowCookImgController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Menu menu = (Menu) session.getAttribute("mymenu");
        String imgPath = menu.getImg();
        if(null != imgPath && !"".equals(imgPath.trim())) {
            ImgUtil.showImage(response, imgPath, true);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
