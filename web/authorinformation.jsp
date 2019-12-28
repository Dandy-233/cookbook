<%--
  Created by IntelliJ IDEA.
  User: 李旦
  Date: 2019/12/27
  Time: 22:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${author.name}的个人资料</title>
    <link rel="stylesheet" href="static/stylesheets/drophover.css">
    <link rel="stylesheet" href="static/stylesheets/bootstrap.min.css">
    <script src="static/scripts/jquery-3.4.1.min.js"></script>
    <script src="static/scripts/bootstrap.bundle.min.js"></script>
    <script src="static/scripts/bootstrap.min.js"></script>
</head>
<body>
<c:import url="top.jsp">

</c:import>



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
