<%@ page import="com.cook.model.Menu" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.TreeSet" %>
<%@ page import="java.util.Collections" %><%--
  Created by IntelliJ IDEA.
  User: 李旦
  Date: 2019/12/27
  Time: 10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>菜谱详情</title>
    <link rel="stylesheet" href="static/stylesheets/drophover.css">
    <link rel="stylesheet" href="static/stylesheets/newcook.css">
    <link rel="stylesheet" href="static/stylesheets/bootstrap.min.css">
    <script src="static/scripts/jquery-3.4.1.min.js"></script>
    <script src="static/scripts/bootstrap.bundle.min.js"></script>
    <script src="static/scripts/bootstrap.min.js"></script>
</head>
<body style="background-color: #F3EBF6">
<c:import url="top.jsp">

</c:import>
<div class="container">
    <form id="form-cook" action="${pageContext.request.contextPath}/editCook" method="post" enctype="multipart/form-data">
        <input accept="imageimage/jpeg,image/png" type="text" value="${menu.id}" name="menuid" id="menuid" style="display: none">
        <div class="form-group content-area">
            <hr style="color: chocolate">
            <div class="form-group" align="center">
                <input accept="image/png,image/jpeg" type="file" name="upimg" id="upimg" style="display: none">
                <img id="img-btn" title="点击更改图片" class="form-img" src="showCookImg?" alt="edit">
                <img class="form-img" id="demo">
            </div>
            <div class="form-group">
                <input value="${menu.title}" required id="title" name="title" type="text" class="form-control" placeholder="描述一下你的美食吧(o゜▽゜)o☆">
            </div>
            <br>
            <div class="form-group">
                <textarea id="material" name="material" type="text" class="form-control" placeholder="用了哪些食材の很重要喔">${menu.material}</textarea>
            </div>
            <br>
            <div class="form-group">
                <textarea required id="description" name="description" type="text" rows="8" class="form-control" placeholder="告诉我它的做法吧~~\(^o^)/~">${menu.description}</textarea>
            </div>
            <br>
            <hr style="color: chocolate">
            <div align="center">
                <button id="btn-up" type="submit" class="btn btn-info btn-lg">保存</button>
                <button id="menu-delete" type="button" class="btn btn-danger btn-lg">删除</button>
            </div>
        </div>
    </form>
</div>
<c:import url="bottom.jsp">

</c:import>
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
            var fileinput = $("#upimg")[0].files[0];
            data.append("upimg",fileinput);
            var form = $(this);
            $.ajax({
                url:"${pageContext.request.contextPath}/setImg",
                type:"post",
                data:data,
                contentType:false,
                processData: false,
                success:function () {
                    $.ajax({
                        url:form.attr("action"),
                        type:form.attr("method"),
                        data:form.serialize(),
                        dataType:"json",
                        success:function (d) {
                            if (d.code == 1){
                                alert("保存成功");
                                window.location.href="mymenus.jsp";
                            }
                        },
                        error:function () {
                            alert("错误")
                        }
                    });
                },
                error:function () {
                    $.ajax({
                        url:form.attr("action"),
                        type:form.attr("method"),
                        data:form.serialize(),
                        dataType:"json",
                        success:function (d) {
                            if (d.code == 1){
                                alert("保存成功");
                                window.location.href="mymenus.jsp";
                            }
                        },
                        error:function () {
                            alert("错误")
                        }
                    });
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
    $("#menu-delete").click(function () {
        if (confirm("确认要删除吗")){
            var url = "${pageContext.request.contextPath}/deleteMenu";
            var param = {"menuid":$("#menuid").val()};
            $.ajax({
                url:url,
                data:param,
                success:function () {
                    window.location.href="mymenus.jsp";
                }
            });
        }
    });
</script>
</html>
