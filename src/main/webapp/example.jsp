<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/15
  Time: 21:14
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>

    <script>

        function tttt() {
            alert("哈哈");

        }

    </script>
</head>
<body>
<form action="${pageContext.request.contextPath}/util/getIp" method="post">
    <input type="submit" value="获取IP地址">
</form>
</body>
</html>
