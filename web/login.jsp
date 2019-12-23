<%--
  Created by IntelliJ IDEA.
  User: 李旦
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
        <input class="un " required type="email" align="center" placeholder="用户名" name="username" id="username">
        <input class="pass" required type="password" align="center" placeholder="密码" name="password" id="password">
        <input type="submit" value="登录" class="submit" id="submit">
        <p class="regi" align="center">没有账号？点击<a href="regist.jsp">注册</a></p>
    </form>
</div>
</body>
<script type="application/javascript" src="static/scripts/jquery-3.4.1.min.js"></script>
<script type="application/javascript">
    $("form").submit(function (event) {
        event.preventDefault();
        var form = $(this);
        $.ajax({
            type:form.attr("method"),
            url:form.attr("action"),
            data:form.serialize(),
            dataType:"json",
            success:function (data) {
                if (data.count == 0){
                    alert("用户名或密码错误");
                    window.location.href="login.jsp"
                }else {
                    window.location.href="index.jsp"
                }
            }
        })
    })
</script>
</html>
