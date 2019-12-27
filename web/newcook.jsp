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
<c:import url="top.jsp">

</c:import>

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
                    <input accept="image/png,image/jpeg" required type="file" name="upimg" id="upimg" style="display: none">
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
                                window.location.href="mymenusTransition.jsp"
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
