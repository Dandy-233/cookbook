<%--
  Created by IntelliJ IDEA.
  User: 李旦
  Date: 2019/12/27
  Time: 10:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>transition</title>
    <script src="static/scripts/jquery-3.4.1.min.js"></script>
</head>
<body>

</body>
<script>
    $(function () {
        $.ajax({
            url:"${pageContext.request.contextPath}/checkMenu",
            type:"post",
            success:function () {
                window.location.href="mymenus.jsp";
            }
        })
    })
</script>
</html>
