package com.cook.controller;

import com.cook.model.User;
import com.cook.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;

/**
 * 上传头像
 */
@WebServlet(name = "upload",urlPatterns = "/upload")
public class UploadController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();
        int id = ((User)session.getAttribute("user")).getId();
        InputStream stream = request.getInputStream();//文件读入
        String savefilepath = this.getServletContext().getRealPath("/img");//文件存入文件夹路径
        savefilepath += "\\"+id+".jpg";
        //建立文件输出流
        OutputStream outputStream = new FileOutputStream(savefilepath);
        int len = -1;
        byte[] bytes = new byte[10*1024];
        while ((len = stream.read(bytes)) != -1){
            outputStream.write(bytes,0,len);//写入服务器
        }
        outputStream.close();
        stream.close();

        Byte n;
        RandomAccessFile random = new RandomAccessFile(savefilepath,"r");
        int second = 1;
        String secondLine = null;
        while (second <= 2){
            secondLine = random.readLine();
            second++;
        }
        int position = secondLine.lastIndexOf("\\");
        String fileName = secondLine.substring(position+1,secondLine.length()-1);
        random.seek(0);
        long forthEndPosition = 0;
        int forth = 1;
        while ((n = random.readByte()) != -1&&(forth <= 4)){
            if (n == '\n'){
                forthEndPosition = random.getFilePointer();
                forth++;
            }
        }

        RandomAccessFile random2 = new RandomAccessFile(savefilepath,"rw");
        random.seek(random.length());
        long endPosition = random.getFilePointer();
        long mark = endPosition;
        int j = 1;
        while ((mark >= 0)&&(j <= 6)){
            mark--;
            random.seek(mark);
            n = random.readByte();
            if (n == '\n'){
                endPosition = random.getFilePointer();
                j++;
            }
        }

        random.seek(forthEndPosition);
        long startPoint = random.getFilePointer();
        while (startPoint < endPosition-1){
            n = random.readByte();
            random2.write(n);
            startPoint = random.getFilePointer();
        }
        random2.close();
        random.close();

        String facepath = savefilepath.replaceAll("\\\\", "/");
        UserService.setFace(id,facepath);
        User user = UserService.reUser(id);
        session.setAttribute("user",user);
        response.sendRedirect(request.getContextPath()+"/ucenter.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
