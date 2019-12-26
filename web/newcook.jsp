<%--
  Created by IntelliJ IDEA.
  User: 李旦
  Date: 2019/12/26
  Time: 14:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>添加美食</title>
    <link rel="stylesheet" href="static/stylesheets/drophover.css">
    <link rel="stylesheet" href="static/stylesheets/newcook.css">
    <link rel="stylesheet" href="static/stylesheets/bootstrap.min.css">
    <script src="static/scripts/jquery-3.4.1.min.js"></script>
    <script src="static/scripts/bootstrap.bundle.min.js"></script>
    <script src="static/scripts/bootstrap.min.js"></script>
</head>
<body style="background-color: #F3EBF6">
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
                <a class="nav-link" href="#">排行</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    分类
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">食材</a>
                    <a class="dropdown-item" href="#">口味</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">菜品</a>
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
                            <img src="static/images/user.jfif" alt="user" height="30" style="position: relative;border-radius: 50%">
                        </c:if>
                        <c:if test="${not empty user.facepath}">
                            <img src="showImg" alt="user" height="30" style="position: relative;border-radius: 50%">
                        </c:if>
                    </a>
                    <div class="drop-content bg-light" style="width: 100px">
                        <a class="nav-link" target="_blank" href="ucenter.jsp" style="color: #533f03">个人中心</a>
                        <a class="nav-link" target="_blank" href="mymenus.jsp" style="color: #533f03">我的菜谱</a>
                        <a class="nav-link" target="_blank" href="mycollect.jsp" style="color: #533f03">我的收藏</a>
                        <div style="height: 1px"><hr color="orange"></div>
                        <a class="nav-link" href="exit" style="color: gray">退出登录</a>
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

<div class="container">
    <div>
        <img src="static/images/newcook-banner.jpg" width="100%" alt="">
    </div>
    <div class="container">
        <form id="form-cook" action="${pageContext.request.contextPath}/addCook" method="post" enctype="multipart/form-data">
            <div class="form-group content-area">
                <p class="content-title">上传你的美食</p><br>
                <div class="form-group">
                    <input required id="title" name="title" type="text" class="form-control" placeholder="描述一下你的美食吧(o゜▽゜)o☆">
                </div>
                <br>
                <div class="form-group">
                    <textarea id="material" name="material" type="text" class="form-control" placeholder="用了哪些食材の很重要喔"></textarea>
                </div>
                <br>
                <div class="form-group">
                    <textarea required id="description" name="description" type="text" rows="8" class="form-control" placeholder="告诉我它的做法吧~~\(^o^)/~"></textarea>
                </div>
                <br>
                <div class="form-group" align="center">
                    <input required type="file" name="upimg" id="upimg" style="display: none">
                    <p style="color: #533f03">点击以下区域上传图片作为封面</p>
                    <img id="img-btn" title="点击上传图片"  class="form-img" src="static/images/add.png" alt="add">
                    <img class="form-img" id="demo">
                </div>
                <hr style="color: chocolate">
                <div align="center">
                    <button id="btn-up" type="submit" class="btn btn-info btn-lg">上传</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<script>
    $(function () {
        $("#demo").css({"display":"none"});
        $("#img-btn").click(function () {
            $("#upimg").click();
        });

        $("#form-cook").submit(function (e) {
            e.preventDefault();
            var data = new FormData();
            data.append("upimg",$("#upimg")[0].files[0]);
            var form = $(this);
            $.ajax({
                url:form.attr("action"),
                type:form.attr("method"),
                data:form.serialize(),
                dataType:"json",
                success:function (d) {
                    if (d.code == 1){
                        $.ajax({
                            url:"${pageContext.request.contextPath}/setImg",
                            type:"post",
                            data:data,
                            contentType:false,
                            processData: false,
                            success:function () {
                                alert("上传成功");
                                window.location.href="mymenus.jsp"
                            }
                        })
                    }
                },
                error:function () {
                    alert("错误")
                }
            });
        })
    })
</script>
<script>
    $(function () {
        $("#demo").click(function () {
            $("#upimg").click();
        });
    });

    //预览图片
    $("#upimg").on('change',function () {
        var reader = new FileReader();
        reader.onload = function (e) {
            $("#demo").attr('src',e.target.result).css({"display":"block"});
            $("#img-btn").css({"display":"none"});
        };
        reader.readAsDataURL($(this).get(0).files[0]);
    });
</script>
<script>
    //判断是否处于登录状态
    $(function () {
        <c:if test="${empty user}">
        window.location.href="index.jsp";
        </c:if>
    });
</script>
</html>
