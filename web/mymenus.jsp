<%--
  Created by IntelliJ IDEA.
  User: 李旦
  Date: 2019/12/26
  Time: 21:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>我的菜谱(￣▽￣)／</title>
    <link rel="stylesheet" href="static/stylesheets/drophover.css">
    <link rel="stylesheet" href="static/stylesheets/bootstrap.min.css">
    <script src="static/scripts/jquery-3.4.1.min.js"></script>
    <script src="static/scripts/bootstrap.bundle.min.js"></script>
    <script src="static/scripts/bootstrap.min.js"></script>
</head>
<body style="background-color: #F3EBF6">
<c:import url="top.jsp">

</c:import>

<br><br>
<h1 style="text-align: center;color: darkorange">我的菜谱</h1><br><br>
<div class="container" style="background-color: white;padding: 50px 200px">
    <c:if test="${empty menus}">
        <div align="center">
            <img src="static/images/empty.jpg" width="200" height="200" alt="empty">
            <p style="color: chocolate;font-size: x-large">什么都没有</p>
            <a href="newcook.jsp">
                <input type="button" class="btn btn-success" value="试着上传一个菜谱吧">
            </a>
        </div>
    </c:if>
    <c:if test="${not empty menus}">
        <div align="center">
            <ul class="list-group list-group-flush">
                <c:forEach var="menu" items="${menus}" varStatus="status">
                    <li class="list-group-item" title="点击查看详情">
                        <div style="text-align: left;padding-left: 200px;background-color:#e5e9ef">
                            <a href="editMenu?index=${status.index}" target="_blank" style="text-decoration: none">
                                <div>
                                    <br>
                                    <img width="150px" height="120px" src="showCook?index=${status.index}" alt="封面">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <span style="font-size: large;color: #5FB878">${menu.title}</span>
                                    <br><br>
                                </div>
                            </a>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </c:if>
    <div style="text-align: center">
        <a href="newcook.jsp">
            <input type="button" class="btn btn-success" value="上传菜谱">
        </a>
    </div>
</div>
<c:import url="bottom.jsp">

</c:import>
</body>
<script>
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

                    $.ajax({
                        url:"${pageContext.request.contextPath}/checkMenu",
                        type:"post",
                        success:function () {
                            <c:if test="${empty menus}">
                            location.reload();
                            </c:if>
                        }
                    })
                }else {
                    window.location.href="index1.jsp"
                }
            }
        });
    });
</script>
</html>
