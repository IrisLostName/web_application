<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--
  Created by IntelliJ IDEA.
  User: chenh
  Date: 2026/4/8
  Time: 11:16
  To change this template use File | Settings | File Templates.
--%>
<style type="text/css">
    #bd{background:url("image/back1.jpg");
        background-size:100% ;
    }
</style>

<div align="center" id="bd">
    <table cellSpacing="1" cellPadding="1" width="660" align="center" border="0">
        <tr valign="bottom">
            <td><a href="${pageContext.request.contextPath}/login.jsp">登录</a></td>
            <td><a href="#">注册</a></td>
            <td><a href="#">浏览化妆品</a></td>
            <td><a href="#">查找化妆品</a></td>
            <td><a href="#">查看购物车</a></td>
            <td><a href="#">查看订单</a></td>
            <td><a href="${pageContext.request.contextPath}/index.jsp">退出</a></td>
            <td><a href="${pageContext.request.contextPath}/index.jsp">主页</a></td>
        </tr>
    </table>
</div>

