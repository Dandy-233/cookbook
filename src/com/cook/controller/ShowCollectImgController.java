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
import java.util.List;

/**
 * 获取收藏夹菜谱的图片
 */
@WebServlet(name = "showCollectImg",urlPatterns = "/showCollectImg")
public class ShowCollectImgController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();
        List<Menu> list = (List<Menu>) session.getAttribute("collectmenus");
        int index = Integer.parseInt(request.getParameter("index"));
        Menu menu = list.get(index);
        String imgPath = menu.getImg();
        if(null != imgPath && !"".equals(imgPath.trim())) {
            ImgUtil.showImage(response, imgPath, true);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
