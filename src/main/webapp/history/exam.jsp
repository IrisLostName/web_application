<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<body bgcolor="f0fff0">
<h1>Java Web程序设计网上考试系统</h1>
<form action="requestexam.jsp" method="post">
  请输入姓名:
  <input type="text" name="name">
  请选择班级：
  <select name="class" size=1>
    <option selected value="21大数据0031">21大数据0031
    <option value="21大数据00312">21大数据0032
    <option  value="21大数据0033">21大数据0033
    <option  value="21大数据0034">21大数据0034
  </select>
  <br/><p>在Java Web中，可以获得用户表单提交的信息的内置对象是:(    )<br/>
  <input type="radio" name="t1" value="a"> response对象
  <input type="radio" name="t1" value="b">request对象 <br/>
  <input type="radio" name="t1" value="c"> session对象
  <input type="radio" name="t1" value="d">application对象 <br/>
  <p>Tomcat的默认端口是什么?（     ）</p>
  <input type="radio" name="t2" value="a"> 8080
  <input type="radio" name="t2" value="b">80 <br/>
  <input type="radio" name="t2" value="c">8009
  <input type="radio" name="t2" value="d">8005 <br/>
  <p>下面选项中,表示服务器错误的状态码是(   )</p>
  <input type="radio" name="t3" value="a">404
  <input type="radio" name="t3" value="b">500 <br/>
  <input type="radio" name="t3" value="c">302
  <input type="radio" name="t3" value="d">100<br/>
  <input type="submit" value="提交答案" name="submit">
</form>
</body>
