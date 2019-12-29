<%--
  Created by IntelliJ IDEA.
  User: 李旦
  Date: 2019/12/27
  Time: 0:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>我的收藏</title>
    <link rel="stylesheet" href="static/stylesheets/list.css">
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
    <c:if test="${empty collectmenus}">
        <div align="center">
            <img src="static/images/nocollect.jpeg" alt="nocollect">
        </div>
        <br>
        <h2 style="text-align: center;color: purple">你还没有收藏菜谱呢</h2><br><br>
    </c:if>
    <c:if test="${not empty collectmenus}">
        <h1 style="text-align: center;color: darkorange">我的收藏</h1><br><br>
        <div class="container" align="center">
            <ul class="list-group list-group-flush">
                <c:forEach var="collectmenu" items="${collectmenus}" varStatus="status">
                    <li class="list-group-item">
                        <div class="allmes container btn-outline-light">
                            <br>
                            <a title="查看菜谱信息" href="collectInformation?index=${status.index}" target="_blank" style="text-decoration: none">
                                <div class="img-cook" style="position: absolute">
                                    <img width="150px" height="120px" src="showCollectImg?index=${status.index}" alt="封面">
                                </div>
                                <div class="text-cook">
                                    <span class="title">${collectmenu.title}</span><br><br><br>
                                    <a href="collectAuthorInformation?index=${status.index}" target="_blank" style="text-decoration: none">
                                        <span class="author" title="查看美食家资料">${collectauthors[status.index].name}</span>
                                    </a>
                                    <a>
                                        <span style="color: black;font-size: smaller;margin-left: 50px">收藏数：${collectcounts[status.index]}</span>
                                    </a>
                                </div>
                            </a>
                            <br><br>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </c:if>
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

                var url = "${pageContext.request.contextPath}/checkCollectMenu";
                $.ajax({
                    url:url,
                    type:"post",
                    data:null,
                    dataType:"json",
                    success:function (d) {
                        if (d.code==1){
                            <c:if test="${empty collectmenus}">
                            location.reload();
                            </c:if>
                            <c:if test="${empty collectcounts}">
                            location.reload();
                            </c:if>
                            <c:if test="${empty collectauthors}">
                            location.reload();
                            </c:if>
                        }
                    }
                });
            }else {
                window.location.href="index1.jsp"
            }
        }
    });
</script>
</html>
