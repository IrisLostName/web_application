<%--
  Created by IntelliJ IDEA.
  User: chenh
  Date: 2026/4/8
  Time: 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body bgcolor="f0fff0">
<% String str=request.getParameter("opt");
  if(str.equals("sina")){
      response.sendRedirect("http://www.sina.com.cn");
  }
  else if(str.equals("sohu")){
      response.sendRedirect("http://www.sohu.com");
  }
  else {
      response.sendRedirect("http://www.163.com");
  } %>

</body>
</html>
