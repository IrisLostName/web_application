<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<body bgcolor="f0fff0">
<%
    request.setCharacterEncoding("utf-8");
    int n=0;
    String strName=request.getParameter("name");
    String strClass=request.getParameter("class");
    String strTemp=strClass+"的"+strName+"Java Web考试的成绩是：";
    String s1=request.getParameter("t1");
    String s2=request.getParameter("t2");
    String s3=request.getParameter("t3");
    if(s1==null)
    {
        s1="";
    }
    if(s2==null)
    {
        s2="";
    }
    if(s3==null)
    {
        s3="";
    }
    if(s1.equals("b"))
    {
        n=n+30;
    }
    if(s2.equals("a"))
    {
        n=n+30;
    }
    if(s3.equals("b"))
    {
        n=n+40;
    }
%>
<%=strTemp %>
<p>您的得分为:<%=n %>分</p>
</body>

