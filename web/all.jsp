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
    <title>所有菜谱</title>
    <link rel="stylesheet" href="static/stylesheets/list.css">
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
    <br><br>
    <h1 style="text-align: center;color: darkorange">所有菜谱</h1><br><br>
    <div class="container" align="center">
        <ul class="list-group list-group-flush">
            <c:forEach var="menu" items="${menus}" varStatus="status">
                <li class="list-group-item">
                    <div class="allmes container btn-outline-light">
                        <br>
                        <a title="查看菜谱信息" href="information.jsp?index=${status.index}" target="_blank" style="text-decoration: none">
                            <div>
                                <div class="img-cook" style="position: absolute">
                                    <img width="150px" height="120px" src="showCook?index=${status.index}" alt="封面">
                                </div>
                                <div class="text-cook">
                                    <span class="title">${menu.title}</span><br><br><br>
                                    <a href="authorinformation.jsp" target="_blank" style="text-decoration: none">
                                        <span class="author" title="查看个人资料">作者:${authors[status.index].name}</span>
                                    </a>
                                </div>
                            </div>
                        </a>
                        <br><br>
                    </div>
                </li>
            </c:forEach>
        </ul>
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
                }
            }
        });

        var url = "${pageContext.request.contextPath}/checkAllMenu";
        $.ajax({
            url:url,
            type:"post",
            data:null,
            success:function () {
                <c:if test="${empty menus}">
                location.reload();
                </c:if>
            }
        });
    })
</script>
</html>
