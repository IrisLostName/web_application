<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="my.bean.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Insert title here</title>
</head>
<body>
<%!
  static ArrayList goodslist=new ArrayList();
  static{
    String[] names={"水龙果","芒果","西瓜","哈密瓜"};
    float[] prices={4.5f,6.7f,2.4f,3.5f};

    for(int i=0;i<4;i++){
      Goods list1=new Goods();
      list1.setName(names[i]);
      list1.setPrice(prices[i]);
      list1.setNum(1);
      goodslist.add(i,list1);
    }
  }
%>
<%
  session.setAttribute("goodslist",goodslist);
  response.sendRedirect("show.jsp");
%>
</body>

</body>
</html>
