<%--
  Created by IntelliJ IDEA.
  User: 李旦
  Date: 2019/12/22
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>注册\(^o^)/~</title>
    <link rel="stylesheet" href="static/stylesheets/ucenter.css">
    <link rel="stylesheet" href="static/stylesheets/bootstrap.min.css">
    <script src="static/scripts/jquery-3.4.1.min.js"></script>
    <script src="static/scripts/bootstrap.bundle.min.js"></script>
    <script src="static/scripts/bootstrap.min.js"></script>
    <link rel="stylesheet" href="static/stylesheets/drophover.css">
    <link rel="stylesheet" href="static/stylesheets/regist.css">
</head>
<body style="background-color: #F3EBF6">
<c:import url="top.jsp">

</c:import>

<div class="main">
    <p class="sign" align="center">注册</p>
    <form class="form1" action="${pageContext.request.contextPath}/regist" method="post" autocomplete="off">
        <input class="un " required type="text" align="center" placeholder="用户名" name="username" id="username">
        <span id="error-username"></span>
        <input class="pass" required type="password" align="center" placeholder="密码" name="password" id="password">
        <span id="error-password"></span>
        <input class="pass" required type="password" align="center" placeholder="确认密码" name="repassword" id="repassword" onkeyup="validate()">
        <span id="error-repassword"></span>
        <input type="submit" value="注册" class="submit">
        <p class="regi" align="center">已有账号？点击<a href="login.jsp">登录</a></p>
    </form>
</div>
<c:import url="bottom.jsp">

</c:import>
</body>
<script type="application/javascript" src="static/scripts/jquery-3.4.1.min.js"></script>
<script src="static/scripts/bootstrap.bundle.min.js"></script>
<script src="static/scripts/bootstrap.min.js"></script>
<script>
    //判断用户名是否已被占用
    $("#username").change(function(){
        var url = "${pageContext.request.contextPath}/checkUser";
        var param = {"username":$("#username").val()};
        $.ajax({
            url:url,
            type:"post",
            data:param,
            dataType:"json",
            success:function (d) {
                if (d.code == 1){
                    $("#error-username").html("<font title='该用户名已被使用' color='red'>&times;</font>");
                    $(".submit").attr("disabled","disabled");
                }else{
                    $("#error-username").html("<font title='可以使用' color='green'>&radic;</font>");
                    $(".submit").removeAttr("disabled");
                }
            }
        });
    });

    //判断密码和确认密码是否一样
    function validate() {
        if ($("#repassword").val() == $("#password").val()){
            $("#error-password").html("<font color='green'>&radic;</font>");
            $("#error-repassword").html("<font color='green'>&radic;</font>");
            $(".submit").removeAttr("disabled");
        }else {
            $("#error-repassword").html("<font title='两次密码不一致' color='red'>&times;</font>");
            $(".submit").attr("disabled","disabled");
        }
    }

    //提交注册信息
    $("form").submit(function (event) {
        event.preventDefault();
        var form = $(this);
        $.ajax({
            url:form.attr("action"),
            type:form.attr("method"),
            data:form.serialize(),
            dataType:"json",
            success:function () {
                alert("注册成功，请登录");
                window.location.href="login.jsp";
            }
        })
    })
</script>
</html>
