<%--
  Created by IntelliJ IDEA.
  User: chenh
  Date: 2026/4/13
  Time: 11:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <br> 输入姓名：<a href="buy1.jsp">输入用户名</a>
    <br>点餐:<a href="order.jsp">点餐</a>
    <br>结账：<a href="bill.jsp">结账</a>
</head>

<body bgcolor="f0fff0">    <br><br>输入用户名
 <form action="" method="post" name="form">
   <input type="text" name="name">
   <input type="submit" value="确定" name=submit>
 </form>

<% request.setCharacterEncoding("UTF-8");
   String name=request.getParameter("name");
    if(name==null)
        name="";
    else
        session.setAttribute("name", name); %>
</body>

</html>
