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
 * ��ȡ�ϴ��ļ������浽����
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
        //��ȡ�ļ�����ʵ·��
        String realPath = this.getServletContext().getRealPath("/upload"+dir);
        File file = new File(realPath);
        if (!file.exists()){
            file.mkdirs();
        }
        //��ȡ������
        InputStream inputStream = part.getInputStream();
        //���������
        FileOutputStream outputStream = new FileOutputStream(new File(file,name));
        //���������ж������ݲ�д������ֽ�����
        int len = -1;
        byte[] bytes = new byte[1024];
        while ((len = inputStream.read(bytes)) != -1){
            outputStream.write(bytes,0,len);
        }
        //�ر���Դ
        outputStream.close();
        inputStream.close();
        //ɾ����ʱ�ı�
        part.delete();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
