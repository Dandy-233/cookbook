package com.cook.controller;

import com.cook.model.User;
import com.cook.util.ImgUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * 显示菜谱作者的头像
 */
@WebServlet(name = "showAuthorImg",urlPatterns = "/showAuthorImg")
public class ShowAuthorImgController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();
        User author = (User) session.getAttribute("author");
        String imgPath = author.getFacepath();
        if(null != imgPath && !"".equals(imgPath.trim())) {
            ImgUtil.showImage(response, imgPath, true);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
