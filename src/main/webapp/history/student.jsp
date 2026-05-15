<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="test.web_application.Student" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>学生信息详情</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .container { max-width: 600px; margin: 0 auto; }
        .info { background-color: #f0f0f0; padding: 20px; border-radius: 5px; }
        .label { font-weight: bold; color: #333; }
        p { margin: 10px 0; }
        a { display: inline-block; margin-top: 20px; padding: 10px 20px; background-color: #4CAF50; color: white; text-decoration: none; border-radius: 3px; }
        a:hover { background-color: #45a049; }
    </style>
</head>
<body>
    <div class="container">
        <h1>📋 学生信息详情</h1>
        <div class="info">
            <%
                // 创建学生对象示例
                Student student = new Student();
                student.setId(1);
                student.setName("张三");
                student.setAge(20);
                student.setMajor("计算机科学与技术");
            %>
            <p><span class="label">ID:</span> <%= student.getId() %></p>
            <p><span class="label">姓名:</span> <%= student.getName() %></p>
            <p><span class="label">年龄:</span> <%= student.getAge() %></p>
            <p><span class="label">专业:</span> <%= student.getMajor() %></p>
        </div>
        <a href="students">查看所有学生</a>
    </div>
</body>
</html>
