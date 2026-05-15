<%--
  Created by IntelliJ IDEA.
  User: chenh
  Date: 2026/4/13
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
    <br> 输入姓名：<a href="buy1.jsp">输入用户名</a>
    <br>点餐:<a href="order.jsp">点餐</a>
    <br>结账：<a href="bill.jsp">结账</a>
</head>
<body bgcolor="f0fff0">
<br><br>请点餐：
<form action="order.jsp" method="post">
<input type ="checkbox" name="data" value="鸭肠15元">鸭肠15元<br> <!--输入框的类型是checkbox，name表示复选框的名字，value表示复选框的值-->
<input type ="checkbox" name="data" value="毛肚40.5元">毛肚40.5元<br>
<input type ="checkbox" name="data" value="牛肉48.3元">牛肉48.3元<br>
<input type ="checkbox" name="data" value="山药20元">山药20元<br>
<input type ="checkbox" name="data" value="小菜15.5元">小菜15.5元<br>
<input type="submit" value="提交">
<input type="reset" value="重设">
</form>
<%String order[]=request.getParameterValues("data");  //请求获取复选框data的value的值，也就是点餐的信息
    if(order!=null)
    {
        StringBuffer str=new StringBuffer();  //创建一个字符串变量
        for(int k=0;k<order.length;k++)
        {
            str.append(order[k]+"<br>");  //将点餐的信息一一放到str字符串中
        }
        session.setAttribute("order",str);  //将str的值存储到session的order关键字中
        response.sendRedirect("bill.jsp");
        return;
    }
%>
</body>

</html>
