<%--
  Created by IntelliJ IDEA.
  User: chenh
  Date: 2026/4/13
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <br> 输入姓名：<a href="buy1.jsp">输入用户名</a>
  <br>点餐:<a href="order.jsp">点餐</a>
  <br>结账：<a href="bill.jsp">结账</a>
</head>
<body bgcolor="f0fff0">
<%
  request.setCharacterEncoding("UTF-8");
  String username=(String)session.getAttribute("name");
  Object orderObj=session.getAttribute("order");
  String order1=(orderObj==null)?"":orderObj.toString();

  if(username==null||username.length()==0){
%>
请先输入姓名：<a href="buy1.jsp">输入用户名</a>
<%
  } else if(order1.length()==0){
%>
<%=username %>，你还没有点餐：<a href="order.jsp">去点餐</a>
<%
  } else {
    double sum=0;
    String[] price=order1.split("[^0123456789.]");
    for(String item:price){
      try{
        if(item!=null&&item.length()>0){
          sum=sum+Double.parseDouble(item);
        }
      }catch(NumberFormatException e2){
      }
    }
%>
<br><br><%=username %>点的餐:<br>
<%=order1 %><br>
总付款:<%=sum %>
<%
  }
%>

</body>

</html>
