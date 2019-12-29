<%--
  Created by IntelliJ IDEA.
  User: 24367
  Date: 2019/12/27
  Time: 19:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>${menu.title}</title>
    <link rel="stylesheet" href="static/stylesheets/information.css">
    <link rel="stylesheet" href="static/stylesheets/drophover.css">
    <link rel="stylesheet" href="static/stylesheets/bootstrap.min.css">
    <script src="static/scripts/jquery-3.4.1.min.js"></script>
    <script src="static/scripts/bootstrap.bundle.min.js"></script>
    <script src="static/scripts/bootstrap.min.js"></script>
</head>
<body style="background-color: #F3EBF6">
<c:import url="top.jsp">

</c:import>

<div class="container" align="center">
    <br><br>
    <img class="image" src="img" alt="菜谱图片">
    <br><br>
    <div class="title">${menu.title}</div>
    <br><br>
    <div class="material">材料:<br>${menu.material}</div>
    <br><br>
    <div class="description">做法:<br>${menu.description}</div>
    <br><br>
    <c:if test="${empty collect}">
        <input type="button" id="collect" class="btn btn-primary" value="收藏">
    </c:if>
    <c:if test="${not empty collect}">
        <input type="button" id="uncollect" class="btn btn-light" value="已收藏">
    </c:if>
    <br><br>
</div>

<c:import url="bottom.jsp">

</c:import>
</body>
<script>
    $.ajax({
        url:"${pageContext.request.contextPath}/keepLogin",
        data:null,
        dataType:"json",
        success:function (d) {
            if (d.code == 1){
                <c:if test="${empty user}">
                location.reload();
                </c:if>
            }
        }
    });
</script>
<script>
    $("#collect").click(function () {
        $.ajax({
            url:"collect",
            dataType:"json",
            success:function (d) {
                if (d.code==0){
                    alert("请先登录");
                }else {
                    location.reload();
                }
            }
        });
    });

    $("#uncollect").click(function () {
        if (confirm("确认要取消收藏吗？")){
            $.ajax({
                url:"uncollect",
                dataType:"json",
                success:function (d) {
                    if (d.code==1){
                        location.reload();
                    }
                }
            });
        }
    });
</script>
</html>
