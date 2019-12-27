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
    <link rel="stylesheet" href="static/stylesheets/style.css">
    <link rel="stylesheet" href="static/stylesheets/drophover.css">
    <link rel="stylesheet" href="static/stylesheets/bootstrap.min.css">
    <script src="static/scripts/jquery-3.4.1.min.js"></script>
    <script src="static/scripts/bootstrap.bundle.min.js"></script>
    <script src="static/scripts/bootstrap.min.js"></script>
</head>
<body style="background-color: #F3EBF6">
<div align="center">
    <div class="container"><img width="800" src="static/images/loading.jpg" alt="loading"></div>
    <br><br><br>
    <div style="font-size: xx-large;margin-left: 400px">
        <div class="loader font4">
            <span>H</span>
            <span class="span2">E</span>
            <span class="span3">L</span>
            <span class="span4">L</span>
            <span class="span5">O</span>
            <span class="span6">,</span>
            <span class="span7">E</span>
            <span class="span2">N</span>
            <span class="span3">J</span>
            <span class="span4">O</span>
            <span class="span5">Y</span>
            <span>&nbsp;</span>
            <span class="span6">Y</span>
            <span class="span7">O</span>
            <span class="span2">S</span>
            <span class="span3">E</span>
            <span class="span4">L</span>
            <span class="span5">F</span>
        </div>
    </div>
</div>

</body>
<script type="application/javascript">
    //检验登录状态
    $(function () {
        setTimeout("window.location.href='keepLogin'",1000);
    })
</script>
</html>