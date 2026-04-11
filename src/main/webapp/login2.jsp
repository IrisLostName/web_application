<%--
  Created by IntelliJ IDEA.
  User: chenh
  Date: 2026/4/8
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%request.setCharacterEncoding("utf-8");%>
<html>
<head>
    <title>Title</title>
</head>
<body bgcolor="f0fff0">
    <%request.setCharacterEncoding("utf-8");
    String username=request.getParameter("logname");
    String pwd=request.getParameter("password");
    if (username.equals("liaoli")&&pwd.equals("123"))
        response.sendRedirect("success.jsp");
    else
        response.sendRedirect("fail.jsp");
%>


</html>
