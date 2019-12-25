<%--
  Created by IntelliJ IDEA.
  User: 李旦
  Date: 2019/12/24
  Time: 14:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>${user.name}的个人中心</title>
    <link rel="stylesheet" href="static/stylesheets/ucenter.css">
    <link rel="stylesheet" href="static/stylesheets/bootstrap.min.css">
    <script src="static/scripts/jquery-3.4.1.min.js"></script>
    <script src="static/scripts/bootstrap.bundle.min.js"></script>
    <script src="static/scripts/bootstrap.min.js"></script>
</head>
<body style="background-color: #F3EBF6;">
<div class="container">
    <form id="form2" action="${pageContext.request.contextPath}/upload" method="post" enctype="multipart/form-data">
        <div class="container" align="center">
            <input name="img" id="setface" type="file" accept="image/png,image/jpg" style="display: none">
            <c:if test="${empty user}">
                <img title="点击修改头像" id="upimg" class="head" src="static/images/user.jfif" alt="user">
            </c:if>
            <c:if test="${not empty user}">
                <img title="点击修改头像" id="upimg" class="head" src="showImg" alt="user">
            </c:if>

            <img class="head" id="demo"><span id="show"></span>
        </div>
        <br>
        <div id="confirm" style="text-align: center">
            <input id="save-btn" class="btn btn-primary" type="submit" value="保存">
            <input id="cancel-btn" class="btn btn-light" type="button" value="取消">
        </div>
    </form>
    <br><br>
    <nav>
        <div class="nav nav-tabs" id="nav-tab" role="tablist">
            <a style="color: #533f03" class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">个人资料</a>
            <a style="color: #533f03" class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">我的收藏</a>
            <a style="color: #533f03" class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">我的菜谱</a>
        </div>
    </nav>
    <div class="tab-content" id="nav-tabContent">
        <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
            <div class="user-setting-warp" style="background-color: white">
                <div>
                    <form id="form1" method="post" action="${pageContext.request.contextPath}/setMessage" class="el-form clearfix" mode="[object Object]">
                    <div class="el-form-item user-nick-name">
                        <label class="el-form-item__label">昵称:</label>
                        <div class="el-form-item__content">
                            <div class="el-input">
                                <input name="name" autocomplete="off" value="${user.name}" placeholder="你的昵称" type="text" rows="2" maxlength="16" validateevent="true" class="el-input__inner">
                            </div>
                            <span class="nick-name-not"></span>
                        </div>
                    </div>
                    <div class="el-form-item user-nick-rel-name">
                        <label class="el-form-item__label">用户名:</label>
                        <div class="el-form-item__content">
                            <span class="userinfo-username">${user.username}</span>
                        </div>
                    </div> <div class="el-form-item user-my-sign">
                    <label class="el-form-item__label">我的签名:</label>
                    <div class="el-form-item__content">
                        <div class="el-textarea">
                            <textarea name="note" placeholder="写点什么吧- ( ゜- ゜)つロ" type="textarea" rows="2" autocomplete="off" validateevent="true" class="el-textarea__inner">${user.note}</textarea>
                        </div>
                    </div>
                    </div>
                    <div class="el-form-item user-my-sex">
                        <label class="el-form-item__label">性别:</label>
                        <div class="el-form-item__content nav ">
                            <div class="el-radio-group">
                                <label class="el-radio-button active">
                                    <input name="gender" type="radio" class="el-radio-button__orig-radio" value="男">
                                    <span id="male" class="el-radio-button__inner">男</span>
                                </label>
                                <label class="el-radio-button">
                                    <input name="gender" type="radio" class="el-radio-button__orig-radio" value="女">
                                    <span id="female" class="el-radio-button__inner">女</span>
                                </label>
                                <label class="el-radio-button">
                                    <input name="gender" type="radio" class="el-radio-button__orig-radio" value="保密">
                                    <span id="secret" class="el-radio-button__inner">保密</span>
                                </label>
                            </div>
                        </div>
                    </div> <div class="el-form-item user-my-date">
                    <label class="el-form-item__label">出生日期:</label>
                    <div class="el-form-item__content">
                        <div class="el-date-editor el-input el-date-editor--date" id="el-date-pick">
                            <input name="birthday" id="test1" value="${user.birthday}" autocomplete="off" placeholder="选择日期" type="text" rows="2" class="el-input__inner">
                        </div>
                    </div>
                    </div>
                    <div class="el-form-item user-my-btn">
                        <div class="el-form-item__content">
                            <div class="padding-dom"></div>
                            <div class="user-my-btn-warp">
                                <button id="submit" type="submit" class="el-button el-button--primary">
                                    <span>保存</span>
                                </button>
                            </div>
                        </div>
                    </div>
                    </form>
                </div>
            </div>
            <br><br><br><br><br>
        </div>

        <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">...</div>
        <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">...</div>
    </div>
</div>
</body>
<script src="static/laydate/laydate.js"></script>
<script type="application/javascript">
    $(".head").click(function () {
        $("#setface").click();
    });

    laydate.render({
        elem:'#test1',
        calendar:true,
        theme:'molv',
        trigger:'click'
    });

    //判断默认性别选中
    $(function () {
        if (("${user.gender}") === "男"){
            $("#male").click();
        }
        if (("${user.gender}") === "女"){
            $("#female").click();
        }
        if (("${user.gender}") === "保密"){
            $("#secret").click();
        }
    });

    //单选框选中效果
    $("#male").click(function () {
        $("#male").css({"background-color":"#22a1d6","color":"#f4f4f4","border-color": "#22a1d6"});
        $("#female").css({"background-color":"#f4f4f4","color":"#717171","border-color": "#f4f4f4"});
        $("#secret").css({"background-color":"#f4f4f4","color":"#717171","border-color": "#f4f4f4"});
    });
    $("#female").click(function () {
        $("#female").css({"background-color":"#22a1d6","color":"#f4f4f4","border-color": "#22a1d6"});
        $("#secret").css({"background-color":"#f4f4f4","color":"#717171","border-color": "#f4f4f4"});
        $("#male").css({"background-color":"#f4f4f4","color":"#717171","border-color": "#f4f4f4"});
    });
    $("#secret").click(function () {
        $("#secret").css({"background-color":"#22a1d6","color":"#f4f4f4","border-color": "#22a1d6"});
        $("#male").css({"background-color":"#f4f4f4","color":"#717171","border-color": "#f4f4f4"});
        $("#female").css({"background-color":"#f4f4f4","color":"#717171","border-color": "#f4f4f4"});
    });
</script>
<script>
    $("#form1").submit(function (event) {
        event.preventDefault();
        var form = $(this);
        $.ajax({
            type:form.attr("method"),
            url:form.attr("action"),
            data:form.serialize(),
            success:function () {
                alert("修改成功");
                window.location.href="ucenter.jsp"
            },
            error:function () {
              window.location.href="index.jsp";
            }
        })
    })
</script>
<script>
    $(function () {
        $("#demo").css({"display":"none"});
        $("#confirm").css({"display":"none"});

        $("#cancel-btn").click(function () {
            $("#confirm").css({"display":"none"});
        });
    });
</script>
<script>
    $("#setface").on('change',function () {
        var reader = new FileReader();
        reader.onload = function (e) {
            $("#demo").attr('src',e.target.result).css({"display":"block"});
            $("#upimg").css({"display":"none"});
            $("#confirm").css({"display":"block"})
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
