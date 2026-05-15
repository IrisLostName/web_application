<%--
  Created by IntelliJ IDEA.
  User: chenh
  Date: 2026/4/8
  Time: 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/reponseshow.jsp" method="POST">
    <select name="opt">
        <option value=sina>"新浪"</option>
        <option value=sohu>"搜狐"</option>
        <option value=163>"网易"</option>
    </select>
    <input type="submit" value="提交">
</form>
</body>
</html>
