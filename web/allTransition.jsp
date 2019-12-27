<%--
  Created by IntelliJ IDEA.
  User: 24367
  Date: 2019/12/27
  Time: 16:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="static/scripts/jquery-3.4.1.min.js"></script>
</head>
<body>

</body>
<script>
    $(function () {
        var url = "${pageContext.request.contextPath}/checkAllMenu";
        $.ajax({
            url:url,
            type:"post",
            data:null,
            success:function () {
                window.location.href="all.jsp";
            }
        })
    })
</script>
</html>
