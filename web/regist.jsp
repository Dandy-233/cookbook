<%--
  Created by IntelliJ IDEA.
  User: 李旦
  Date: 2019/12/22
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册\(^o^)/~</title>
    <link rel="stylesheet" href="static/stylesheets/regist.css">
</head>
<body>
<div class="main">
    <p class="sign" align="center">注册</p>
    <form class="form1" action="${pageContext.request.contextPath}/regist" method="post">
        <input class="un " required type="email" align="center" placeholder="用户名" name="username" id="username">
        <span id="error-username"></span>
        <input class="pass" required type="password" align="center" placeholder="密码" name="password" id="password">
        <span id="error-password"></span>
        <input class="pass" required type="password" align="center" placeholder="确认密码" name="repassword" id="repassword">
        <br><span id="error-repassword"></span>
        <input class="un" style="width:30% " type="text" placeholder="验证码">
        <input type="submit" value="注册" class="submit">
        <p class="regi" align="center">已有账号？点击<a href="login.jsp">登录</a></p>
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
