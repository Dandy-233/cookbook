<%--
  Created by IntelliJ IDEA.
  User: 李旦
  Date: 2019/12/24
  Time: 14:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${user.username}的个人中心</title>
    <link rel="stylesheet" href="static/stylesheets/ucenter.css">
    <link rel="stylesheet" href="static/stylesheets/bootstrap.min.css">
    <script src="static/scripts/jquery-3.4.1.min.js"></script>
    <script src="static/scripts/bootstrap.bundle.min.js"></script>
    <script src="static/scripts/bootstrap.min.js"></script>
</head>
<body style="background-color: #F3EBF6;">
<div class="container">
    <div class="container" align="center">
        <input type="file" name="img" id="getimg" accept="image/*" style="display: none">
        <a href="">
            <img title="点击更换头像" id="upimg" class="head" src="static/images/user.jfif" alt="user">
        </a>
    </div>
    <div class="btn-group" role="group" aria-label="Basic example">
        <button type="button" class="btn btn-secondary">个人资料</button>
        <button type="button" class="btn btn-secondary">我的收藏</button>
        <button type="button" class="btn btn-secondary">我的菜谱</button>
    </div>
</div>
</body>
<script>
    $("#upimg").click(function () {
        $("#getimg").click();
        alert("上传成功")
    });
</script>
</html>
