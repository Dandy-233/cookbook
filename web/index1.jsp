<%@ page import="com.cook.model.User" %><%--
  Created by IntelliJ IDEA.
  User: 李旦
  Date: 2019/12/22
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>~ o(*￣▽￣*)ブ鲜香美味~菜谱大全(＾Ｕ＾)ノ~ＹＯ</title>
    <link rel="stylesheet" href="static/stylesheets/drophover.css">
    <link rel="stylesheet" href="static/stylesheets/bootstrap.min.css">
    <script src="static/scripts/jquery-3.4.1.min.js"></script>
    <script src="static/scripts/bootstrap.bundle.min.js"></script>
    <script src="static/scripts/bootstrap.min.js"></script>
</head>
<body style="background-color: #F3EBF6">
<c:import url="top.jsp">

</c:import>

<div class="container" style="margin-top:30px">
    <div class="row">
        <div class="col-sm-4" style="position: fixed">
            <h2 style="font-family: 楷体">美食の物语</h2>
            <img src="static/images/logo.png" alt="美食の物语" width="200">
            <p style="font-family: 楷体">大家最爱的美食社区</p>
            <hr class="d-sm-none">
        </div>
        <div align="center" style="margin-left: 450px; background-color: #e5e9ef;width: 60%">
            <a href="" style="text-decoration: none;color: chocolate">
                <br>
                <h4>阿姨最爱的卡布奇洛</h4><br>
                <div class="col-sm-8">
                    <div>
                        <img width="450" height="300" src="static/images/kbql.png" alt="卡布奇洛">
                    </div>
                </div>
                <p>非~~~~~~~~~常好喝</p>
                <br>
            </a>
            <hr style="color: black;height: 2px">
        </div>
        <div align="center" style="margin-left:450px;background-color: #e5e9ef;width: 60%">
            <a href="" style="text-decoration: none;color: chocolate">
                <h4>超好吃的饭</h4><br>
                <div class="col-sm-8">
                    <div>
                        <img width="450" height="300" src="static/images/cook1.jfif" alt="cook">
                    </div>
                    <br>
                </div>
                <p>非~~~~~~~~~常好吃</p>
            </a>
        </div>
    </div>
</div>

<c:import url="bottom.jsp">

</c:import>
</body>
</html>
