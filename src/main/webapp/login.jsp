<%--
  Created by IntelliJ IDEA.
  User: chenh
  Date: 2026/4/8
  Time: 11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Title</title>
</head>

<%@ include file="head.jsp" %>

<body background="image/back1.jpg">
<center>
    <form action="login2.jsp" method="post">
        <br><br>
        <table border="2">
            <tr>
                <th colspan=2>请您登录</th>
            </tr>
            <tr>
                <td>登录名称</td>
                <td><input type="text" name="logname"></td>
            </tr>
            <tr>
                <td>输入密码</td>
                <td><input type="password" name="password"></td>
            </tr>
        </table>
        <td><input type="submit" value="提交"></td>
    </form>
</center>
</body>

</html>
