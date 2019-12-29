<%--
  Created by IntelliJ IDEA.
  User: 李旦
  Date: 2019/12/27
  Time: 22:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>${author.name}的个人资料</title>
    <link rel="stylesheet" href="static/stylesheets/authorinformation.css">
    <link rel="stylesheet" href="static/stylesheets/drophover.css">
    <link rel="stylesheet" href="static/stylesheets/bootstrap.min.css">
    <script src="static/scripts/jquery-3.4.1.min.js"></script>
    <script src="static/scripts/bootstrap.bundle.min.js"></script>
    <script src="static/scripts/bootstrap.min.js"></script>
</head>
<body style="background-color: #F3EBF6">
<c:import url="top.jsp">

</c:import>

<div class="container">
    <br><br>
    <div align="center">
        <c:if test="${empty author.facepath}">
            <img style="cursor: pointer" id="upimg" class="head" src="static/images/default.png" alt="user">
        </c:if>
        <c:if test="${not empty author.facepath}">
            <img style="cursor: pointer" id="upimg" class="head" src="showAuthorImg" alt="user">
        </c:if>
    </div>
    <div align="center">
        <br><span class="name">${author.name}</span><br>
        <c:if test="${empty author.note}">
            <br><span class="note"></span>
        </c:if>
        <c:if test="${not empty author.note}">
            <br><span class="note">签名：${author.note}</span>
        </c:if>
    </div>
    <br><br>
    <div class="top">${author.name}的菜谱:</div>
    <br>
    <div class="container" style="background-color: white;padding: 50px 200px">
        <c:if test="${empty menus}">
            <div align="center">
                <p style="color: chocolate;font-size: x-large">${author.name}还没有菜谱喔</p>
            </div>
        </c:if>
        <c:if test="${not empty menus}">
            <div align="center">
                <ul class="list-group list-group-flush">
                    <c:forEach var="menu" items="${menus}" varStatus="status">
                        <li class="list-group-item">
                            <div class="allmes container btn-outline-light">
                                <br>
                                <a href="information?index=${status.index}" target="_blank" style="color: black; text-decoration: none">
                                    <div class="img-cook" style="position: absolute">
                                        <img width="150px" height="120px" src="showMenuImg?index=${status.index}" alt="封面">
                                    </div>
                                    <div class="text-cook">
                                        <span class="title">${menu.title}</span><br><br><br><br>
                                        <a>
                                            <span style="color: black;font-size: smaller">收藏数：${counts[status.index]}</span>
                                        </a>
                                    </div>
                                </a>
                                <br>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>
    </div>
    <br><br><br>
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
</html>
