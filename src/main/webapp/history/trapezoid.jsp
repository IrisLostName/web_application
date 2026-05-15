<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="my.bean.AreaBean" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>梯形面积计算器</title>
    <style>
        body {
            font-family: 'Microsoft YaHei', Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #555;
        }
        input[type="number"] {
            width: 100%;
            padding: 12px;
            border: 2px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
        }
        input[type="number"]:focus {
            border-color: #4CAF50;
            outline: none;
        }
        button {
            width: 100%;
            padding: 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #45a049;
        }
        .result {
            margin-top: 30px;
            padding: 20px;
            background-color: #e8f5e8;
            border: 1px solid #4CAF50;
            border-radius: 5px;
        }
        .result h3 {
            margin-top: 0;
            color: #2e7d32;
        }
        .result p {
            margin: 8px 0;
            font-size: 16px;
        }
        .result .area {
            font-size: 20px;
            font-weight: bold;
            color: #1b5e20;
        }
        .error {
            margin-top: 30px;
            padding: 20px;
            background-color: #ffebee;
            border: 1px solid #f44336;
            border-radius: 5px;
            color: #c62828;
        }
        .formula {
            text-align: center;
            margin-bottom: 20px;
            color: #666;
            font-style: italic;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>📐 梯形面积计算器</h1>
    <p class="formula">面积 = (上底 + 下底) × 高 ÷ 2</p>

    <form method="post">
        <div class="form-group">
            <label for="upperBase">上底长度 (cm)：</label>
            <input type="number" id="upperBase" name="upperBase" step="0.01" min="0" required placeholder="请输入上底长度">
        </div>

        <div class="form-group">
            <label for="lowerBase">下底长度 (cm)：</label>
            <input type="number" id="lowerBase" name="lowerBase" step="0.01" min="0" required placeholder="请输入下底长度">
        </div>

        <div class="form-group">
            <label for="height">高度 (cm)：</label>
            <input type="number" id="height" name="height" step="0.01" min="0" required placeholder="请输入高度">
        </div>

        <button type="submit">🚀 计算面积</button>
    </form>

    <%
        if (request.getMethod().equals("POST")) {
            try {
                double upperBase = Double.parseDouble(request.getParameter("upperBase"));
                double lowerBase = Double.parseDouble(request.getParameter("lowerBase"));
                double height = Double.parseDouble(request.getParameter("height"));

                // 验证输入值
                if (upperBase <= 0 || lowerBase <= 0 || height <= 0) {
                    throw new IllegalArgumentException("所有数值必须大于0");
                }

                AreaBean trapezoid = new AreaBean();
                trapezoid.setUpperBase(upperBase);
                trapezoid.setLowerBase(lowerBase);
                trapezoid.setHeight(height);
                trapezoid.calculateArea();
    %>

    <div class="result">
        <h3>✅ 计算结果</h3>
        <p>上底：<%= String.format("%.2f", trapezoid.getUpperBase()) %> cm</p>
        <p>下底：<%= String.format("%.2f", trapezoid.getLowerBase()) %> cm</p>
        <p>高度：<%= String.format("%.2f", trapezoid.getHeight()) %> cm</p>
        <p class="area">面积：<%= String.format("%.2f", trapezoid.getArea()) %> cm²</p>
    </div>

    <%
    } catch (NumberFormatException e) {
    %>

    <div class="error">
        <h3>❌ 输入错误</h3>
        <p>请输入有效的数字！</p>
    </div>

    <%
    } catch (IllegalArgumentException e) {
    %>

    <div class="error">
        <h3>❌ 参数错误</h3>
        <p><%= e.getMessage() %></p>
    </div>

    <%
            }
        }
    %>
</div>
</body>
</html>
