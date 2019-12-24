package com.cook.controller;

import com.cook.util.UpLoadUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

/**
 * 获取上传文件并保存到本地
 */
@WebServlet(name = "changFace",urlPatterns = "/changFace")
@MultipartConfig
public class ChangFaceController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Part part = request.getPart("img");
        String header = part.getHeader("content-disposition");
        String path = header.substring(header.indexOf("filename=")+10,header.length()-1);
        String name = UpLoadUtils.getRealName(path);
        String dir = UpLoadUtils.getDir(name);
        //获取文件的真实路径
        String realPath = this.getServletContext().getRealPath("/upload"+dir);
        File file = new File(realPath);
        if (!file.exists()){
            file.mkdirs();
        }
        //获取输入流
        InputStream inputStream = part.getInputStream();
        //定义输出流
        FileOutputStream outputStream = new FileOutputStream(new File(file,name));
        //从输入流中读入数据并写道输出字节流中
        int len = -1;
        byte[] bytes = new byte[1024];
        while ((len = inputStream.read(bytes)) != -1){
            outputStream.write(bytes,0,len);
        }
        //关闭资源
        outputStream.close();
        inputStream.close();
        //删除临时文本
        part.delete();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
