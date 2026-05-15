<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="my.bean.*" %>
<jsp:useBean id="myCar" class="my.bean.ShopCar" scope="session"></jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Insert title here</title>
</head>
<body>
<%
  String action=request.getParameter("action");
  if(action==null)
    action="";
  if(action.equals("buy"))
  {
    ArrayList goodslist=(ArrayList)session.getAttribute("goodslist");
    int id=MyTools.strToint(request.getParameter("id"));
    Goods list=(Goods)goodslist.get(id);
    myCar.addItem(list);
    response.sendRedirect("show.jsp");
  }
  else if(action.equals("remove"))
  {
    String name=request.getParameter("name");
    myCar.removeItem(name);
    response.sendRedirect("ShopCar.jsp");
  }else if(action.equals("clear"))
  {
    myCar.clearCar();
    response.sendRedirect("ShopCar.jsp");
  }
  else
  {
    response.sendRedirect("show.jsp");
  }
%>
</body>
</html>
