<%@page import="my.bean.Goods"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="my.bean.Goods" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Insert title here</title>
</head>
<body>
<% ArrayList goodslist=(ArrayList)session.getAttribute("goodslist");%>
<table border="1" width="450" rules="none" cellpadding="0" cellspacing="0">
  <tr height="50">
    <td colspan="3" align="center">水果列表</td>
  </tr>

  <tr align="center" height="30" bgcolor="lightgrey">
    <td>名称</td>
    <td>价格</td>
    <td>购买</td>
  </tr>
  <% if(goodslist==null||goodslist.size()==0){ %>
  <tr><td>没有水果了!</td></tr>
  <%} else {
    for(int i=0;i<goodslist.size();i++){
      Goods list=(Goods)goodslist.get(i);
  %>
  <tr height="50" align="center">
    <td><%=list.getName() %></td>
    <td><%=list.getPrice() %></td>
    <td><a href="docar.jsp?action=buy&id=<%=i%>">购买</a></td>
  </tr>
  <%}} %>
  <tr height="50">
    <td align="center" colspan="3"><a href="ShopCar.jsp">查看购物车</a></td>
  </tr>
</table>
</body>

</html>
