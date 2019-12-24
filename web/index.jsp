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
    <title>~ o(*￣▽￣*)ブ美味又好看~菜谱大全(＾Ｕ＾)ノ~ＹＯ</title>
    <link rel="stylesheet" href="static/stylesheets/drophover.css">
    <link rel="stylesheet" href="static/stylesheets/bootstrap.min.css">
    <script src="static/scripts/jquery-3.4.1.min.js"></script>
    <script src="static/scripts/bootstrap.bundle.min.js"></script>
    <script src="static/scripts/bootstrap.min.js"></script>
</head>
<body style="background-color: #F3EBF6">
<div class="container"><img src="static/images/loading.jpg" alt="loading"></div>
</body>
<script type="application/javascript">
    //检验登录状态
    $(function () {
        setTimeout("window.location.href='keepLogin'",1000);
    })
</script>
</html>