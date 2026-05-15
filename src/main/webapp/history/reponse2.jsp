<%--
  Created by IntelliJ IDEA.
  User: chenh
  Date: 2026/4/8
  Time: 10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.util.*" %>

<html>
<head>
    <title>Title</title>
</head>
<body bgcolor="f0fff0">
<p>当前时间是：<br>
<% out.print(""+new Date().toLocaleString());
response.setHeader("refresh","2"); %>
</p>

</body>
</html>
