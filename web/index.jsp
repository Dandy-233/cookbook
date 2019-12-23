<%--
  Created by IntelliJ IDEA.
  User: 李旦
  Date: 2019/12/22
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="index.jsp" title="╰(￣▽￣)╭">(๑•̀ㅂ•́)و✧</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="index.jsp">首页 <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">排行</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                <a class="nav-link hover-btn" href="" tabindex="-1" aria-disabled="true">
                    <img src="static/images/phone.png" alt="phone" height="20">
                    下载app
                </a>
                <div class="drop-content">
                    <img src="static/images/22.png" alt="二维码" width="150" height="150">
                </div>
            </li>
            <li class="nav-item drop-menu">
                <a class="nav-link hover-btn" href="" tabindex="-1" aria-disabled="true">
                    <img src="static/images/user.jfif" alt="user" height="30" style="position: relative;border-radius: 50%">
                </a>
                <div class="drop-content bg-dark" style="width: 100px">
                    <a class="nav-link" href="login.jsp" >登录</a>
                    <a class="nav-link" href="regist.jsp">注册</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="login.jsp" >登录</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="regist.jsp">注册</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="你想要的都在这里..." aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">搜索</button>
        </form>
    </div>
</nav>

<div class="container" style="margin-top:30px">
    <div class="row">
        <div class="col-sm-4">
            <h2 style="font-family: 楷体">美食の物语</h2>
            <img src="static/images/logo.png" alt="美食の物语" width="200">
<%--            <div class="fakeimg">这边插入图像</div>--%>
            <p style="font-family: 楷体">专为打造最好的美食</p>
            <h3>一些链接</h3>
            <p>说明文本</p>
            <ul class="nav nav-pills flex-column">
                <li class="nav-item">
                    <a class="nav-link active" href="#">激活状态</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">链接</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">链接</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled" href="#">禁用</a>
                </li>
            </ul>
            <hr class="d-sm-none">
        </div>
        <div class="col-sm-8">
            <h2>标题</h2>
            <h5>副标题</h5>
            <div class="fakeimg">图像</div>
            <p>一些文本..</p>
            <p>内容</p>
            <br>
            <h2>标题</h2>
            <h5>副标题</h5>
            <div class="fakeimg">图像</div>
            <p>一些文本..</p>
            <p>内容</p>
        </div>
    </div>
</div>

<div class="jumbotron text-center" style="margin-bottom:0">
    <p>底部内容</p>
</div>
</body>
</html>