<%--
  Created by IntelliJ IDEA.
  User: 李旦
  Date: 2019/12/27
  Time: 14:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>top</title>
    <link rel="stylesheet" href="static/stylesheets/drophover.css">
    <link rel="stylesheet" href="static/stylesheets/bootstrap.min.css">
    <script src="static/scripts/jquery-3.4.1.min.js"></script>
    <script src="static/scripts/bootstrap.bundle.min.js"></script>
    <script src="static/scripts/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="index1.jsp" title="╰(￣▽￣)╭">(๑•̀ㅂ•́)و✧</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="index1.jsp">首页 <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="checkLeaderMenu">排行</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" style="cursor: pointer" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    分类
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="material.jsp">食材</a>
                    <a class="dropdown-item" href="taste.jsp">口味</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="all.jsp">所有</a>
                </div>
            </li>
            <li class="nav-item drop-menu">
                <a class="nav-link hover-btn" tabindex="-1" aria-disabled="true">
                    <img src="static/images/phone.png" alt="phone" height="20">
                    下载app
                </a>
                <div class="drop-content">
                    <img src="static/images/22.png" alt="二维码" width="150" height="150">
                </div>
            </li>
            <c:if test="${not empty user}">
                <li class="nav-item drop-menu">
                    <a class="nav-link hover-btn" tabindex="-1" aria-disabled="true">
                        <c:if test="${empty user.facepath}">
                            <img src="static/images/default.png" alt="user" height="30" style="position: relative;border-radius: 50%">
                        </c:if>
                        <c:if test="${not empty user.facepath}">
                            <img src="showImg" alt="user" height="30" style="position: relative;border-radius: 50%">
                        </c:if>
                    </a>
                    <div class="drop-content bg-light" style="width: 100px">
                        <a class="nav-link" target="_blank" href="ucenter.jsp" style="color: #533f03;text-align: center">个人中心</a>
                        <a class="nav-link" target="_blank" href="mymenus.jsp" style="color: #533f03;text-align: center">我的菜谱</a>
                        <a class="nav-link" target="_blank" href="mycollect.jsp" style="color: #533f03;text-align: center">我的收藏</a>
                        <div style="height: 1px"><hr color="orange"></div>
                        <a class="nav-link" href="exit" style="color: gray;text-align: center">退出登录</a>
                    </div>
                </li>
            </c:if>
            <c:if test="${empty user}">
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">登录</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="regist.jsp">注册</a>
                </li>
            </c:if>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="你想要的都在这里..." aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">搜索</button>
        </form>
    </div>
</nav>
</body>
<script>
    $(function () {
        $("#navbarDropdown").click();
    })
</script>
</html>
