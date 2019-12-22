<%--
  Created by IntelliJ IDEA.
  User: 24367
  Date: 2019/12/22
  Time: 14:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录(＾－＾)V</title>
    <link rel="stylesheet" href="static/stylesheets/login.css">
</head>
<body>
<div class="main">
    <p class="sign" align="center">登录</p>
    <form class="form1" action="${pageContext.request.contextPath}/login" method="post">
        <input class="un " type="text" align="center" placeholder="用户名" name="username">
        <input class="pass" type="password" align="center" placeholder="密码" name="password">
        <input type="submit" value="登录" class="submit">
        <p class="regi" align="center">没有账号？点击<a href="regist.jsp">注册</a></p>
    </form>
</div>
</body>
</html>
