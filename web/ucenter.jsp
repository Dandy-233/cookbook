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
    <link rel="stylesheet" href="static/stylesheets/drophover.css">
    <link rel="stylesheet" href="static/stylesheets/ucenter.css">
    <link rel="stylesheet" href="static/stylesheets/bootstrap.min.css">
    <script src="static/scripts/jquery-3.4.1.min.js"></script>
    <script src="static/scripts/bootstrap.bundle.min.js"></script>
    <script src="static/scripts/bootstrap.min.js"></script>
</head>
<body style="background-color: #F3EBF6;">
<c:import url="top.jsp">

</c:import>

<div class="container">
    <br>
    <form id="form2" action="${pageContext.request.contextPath}/upload" method="post" enctype="multipart/form-data">
        <div class="container" align="center">
            <input name="img" id="setface" type="file" accept="image/png,image/jpeg" style="display: none">
            <c:if test="${empty user.facepath}">
                <img title="点击修改头像" style="cursor: pointer" id="upimg" class="head" src="static/images/default.png" alt="user">
            </c:if>
            <c:if test="${not empty user.facepath}">
                <img title="点击修改头像" style="cursor: pointer" id="upimg" class="head" src="showImg" alt="user">
            </c:if>
            <img class="head" style="cursor: pointer" id="demo">
        </div>
        <br>
        <div id="confirm" style="text-align: center">
            <input id="save-btn" class="btn btn-primary" type="submit" value="保存">
            <input id="cancel-btn" class="btn btn-light" type="button" value="取消">
        </div>
    </form>
    <br>
    <nav>
        <div class="nav nav-tabs" id="nav-tab" role="tablist">
            <a style="color: #533f03" class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">个人资料</a>
            <a style="color: #533f03" class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">修改密码</a>
            <a style="color: #533f03" class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">美食家中心</a>
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

        <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
            <div style="background-color: white;padding: 50px 200px;">
                <form id="form3" action="changePassword" method="post">
                    <div class="form-group">
                        <label for="exampleInputPassword1">请输入旧密码</label>
                        <input required type="password" name="oldpassword" class="form-control" id="exampleInputPassword1">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword2">请输入新密码</label>
                        <input required type="password" name="newpassword" class="form-control" id="exampleInputPassword2">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword3">请再次输入新密码</label>
                        <input required type="password" name="re-newpassword" class="form-control" id="exampleInputPassword3">
                    </div>
                    <br>
                    <button type="submit" class="btn btn-primary">提交</button>
                </form>
            </div>
            <br><br><br><br><br>
        </div>

        <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
            <div style="background-color: white;padding: 50px 200px">
                <div align="center">
                    <img src="static/images/jojo.jfif" alt="jojo" width="70%">
                </div>
                <br><br>
                <div align="center">
                    <span style="font-family: 黑体;color: #007bff">还在犹豫什么，快加入我们</span><br><br>
                    <a href="newcook.jsp" target="_blank">
                        <input type="button" class="btn btn-success" value="成为美食巨星吧">
                    </a>
                </div>
            </div>
            <br><br><br><br><br>
        </div>
    </div>
</div>
<c:import url="bottom.jsp">

</c:import>
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
    $(function () {
        $("#form1").submit(function (event) {
            event.preventDefault();
            var form = $(this);
            $.ajax({
                type:form.attr("method"),
                url:form.attr("action"),
                data:form.serialize(),
                success:function () {
                    alert("更新资料成功");
                    location.reload();
                },
                error:function () {
                    window.location.href="index1.jsp";
                }
            })
        })
    })

</script>
<script>
    $(function () {
        $("#demo").css({"display":"none"});
        $("#confirm").css({"display":"none"});

        $("#cancel-btn").click(function () {
            $("#confirm").css({"display":"none"});
            location.reload();
        });
    });
</script>
<script>
    //预览图片
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
        $.ajax({
            url:"${pageContext.request.contextPath}/keepLogin",
            data:null,
            dataType:"json",
            success:function (d) {
                if (d.code == 1){
                    <c:if test="${empty user}">
                    location.reload();
                    </c:if>
                }else {
                    window.location.href="index1.jsp"
                }
            }
        });
    });
</script>
<script>
    $(function () {
        $("#form3").submit(function (e) {
            e.preventDefault();
            if (!($("#exampleInputPassword2").val() == ($("#exampleInputPassword3").val()))){
                alert("两次输入密码不一致");
            }else {
                var form = $(this);
                $.ajax({
                    type:form.attr("method"),
                    url:form.attr("action"),
                    data:form.serialize(),
                    dataType:"json",
                    success:function (d) {
                        if (d.code == 0){
                            alert("旧密码输入有误");
                        }
                        if (d.code == 1){
                            alert("请不要输入相同的密码");
                        }
                        if (d.code == 2){
                            alert("修改密码成功,请重新登录");
                            window.location.href="index1.jsp";
                        }
                    },
                    error:function () {
                        alert("错误")
                    }
                })
            }
        })
    })
</script>
</html>
