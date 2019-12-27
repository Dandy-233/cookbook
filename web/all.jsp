<%--
  Created by IntelliJ IDEA.
  User: 李旦
  Date: 2019/12/27
  Time: 14:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>所有</title>
    <link rel="stylesheet" href="static/stylesheets/drophover.css">
    <link rel="stylesheet" href="static/stylesheets/bootstrap.min.css">
    <script src="static/scripts/jquery-3.4.1.min.js"></script>
    <script src="static/scripts/bootstrap.bundle.min.js"></script>
    <script src="static/scripts/bootstrap.min.js"></script>
</head>
<body>
<c:import url="top.jsp">

</c:import>
<div>
    <h1 style="text-align: center;color: darkorange">所有菜谱</h1><br><br>
    <div align="center">
        <ul class="list-group list-group-flush">
            <c:forEach var="menu" items="${menus}" varStatus="status">
                <hr>
                <li class="list-group-item" title="点击查看详情">
                    <a href="editMenu.jsp?index=${status.index}" target="_blank" style="text-decoration: none">
                        <div style="background-color:#e5e9ef ">
                            <img width="100px" height="100px" src="showCookImg?index=${status.index}" alt="封面">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <span style="font-size: large;color: #5FB878">${menu.title}</span>
                        </div>
                    </a>
                </li>
                <hr>
            </c:forEach>
        </ul>
    </div>
</div>

<c:import url="bottom.jsp">

</c:import>
</body>
</html>
