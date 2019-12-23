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
</body>
<script type="application/javascript" src="static/scripts/jquery-3.4.1.min.js"></script>
<script src="static/scripts/bootstrap.bundle.min.js"></script>
<script src="static/scripts/bootstrap.min.js"></script>
<script>
    $("#username").change(function(event){
        event.preventDefault();
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

    $("form").submit(function () {
        var form = $(this);
        $.ajax({
            type:form.attr("method"),
            data:form.serialize(),
            dataType:"json",
            success:function (data) {
            }
        })
    })
</script>
</html>
