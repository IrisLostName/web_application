<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="my.bean.Register" %>
<%
    List<Register> registerList = (List<Register>) request.getAttribute("registerList");
    Register register = (Register) request.getAttribute("register");
    if (register == null) {
        register = new Register();
    }
    List<String> errors = (List<String>) request.getAttribute("errors");
    String successMsg = (String) request.getAttribute("successMsg");
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>用户网站注册</title>
    <style>
        * { box-sizing: border-box; }
        body {
            margin: 0;
            font-family: "Microsoft YaHei", Arial, sans-serif;
            background: linear-gradient(135deg, #ffd6e8 0%, #fceabb 100%);
            min-height: 100vh;
            padding: 40px 20px;
        }
        .layout {
            max-width: 1100px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: 1fr 1.3fr;
            gap: 24px;
        }
        @media (max-width: 860px) {
            .layout { grid-template-columns: 1fr; }
        }
        .card {
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.08);
            padding: 28px 32px;
        }
        .card h1 {
            margin: 0 0 8px;
            font-size: 22px;
            color: #d6336c;
            border-left: 4px solid #d6336c;
            padding-left: 10px;
        }
        .hint {
            color: #666;
            font-size: 13px;
            margin-bottom: 18px;
        }
        .form-row {
            margin-bottom: 14px;
            display: flex;
            flex-direction: column;
        }
        .form-row label {
            font-size: 14px;
            color: #333;
            margin-bottom: 6px;
        }
        .form-row label .required { color: #d6336c; margin-right: 2px; }
        .form-row input {
            padding: 9px 12px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 14px;
            transition: border-color .15s, box-shadow .15s;
        }
        .form-row input:focus {
            outline: none;
            border-color: #d6336c;
            box-shadow: 0 0 0 3px rgba(214,51,108,0.15);
        }
        .actions {
            display: flex;
            gap: 12px;
            margin-top: 8px;
        }
        .btn {
            padding: 10px 22px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
        }
        .btn-primary { background: #d6336c; color: #fff; }
        .btn-primary:hover { background: #b32958; }
        .btn-reset { background: #f1f3f5; color: #495057; }
        .btn-reset:hover { background: #e9ecef; }

        .alert {
            padding: 10px 14px;
            border-radius: 6px;
            font-size: 13px;
            margin-bottom: 16px;
        }
        .alert-error { background: #fff0f3; color: #c92a4a; border: 1px solid #ffd0d9; }
        .alert-success { background: #ecfdf3; color: #2b8a3e; border: 1px solid #b7eccb; }
        .alert ul { margin: 6px 0 0; padding-left: 20px; }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 13px;
        }
        thead th {
            background: #f8d7e3;
            color: #6a1638;
            text-align: left;
            padding: 10px;
            border-bottom: 2px solid #f0bccd;
        }
        tbody td {
            padding: 9px 10px;
            border-bottom: 1px solid #f1f1f1;
        }
        tbody tr:hover { background: #fff5f8; }
        .empty {
            text-align: center;
            color: #999;
            padding: 30px 0;
        }
        .badge {
            display: inline-block;
            min-width: 28px;
            padding: 2px 8px;
            background: #d6336c;
            color: #fff;
            border-radius: 12px;
            font-size: 12px;
            margin-left: 6px;
        }
    </style>
</head>
<body>
<div class="layout">
    <div class="card">
        <h1>用户网站注册</h1>
        <p class="hint">用户名由 3-20 位字母、数字、下划线构成，标记 <span style="color:#d6336c;">*</span> 的项必须填写。</p>

        <% if (errors != null && !errors.isEmpty()) { %>
            <div class="alert alert-error">
                请修正以下问题：
                <ul>
                    <% for (String err : errors) { %>
                        <li><%= err %></li>
                    <% } %>
                </ul>
            </div>
        <% } %>
        <% if (successMsg != null) { %>
            <div class="alert alert-success"><%= successMsg %></div>
        <% } %>

        <form action="${pageContext.request.contextPath}/register" method="post" name="form" onsubmit="return validateForm()">
            <div class="form-row">
                <label><span class="required">*</span>用户名称</label>
                <input type="text" name="logname" id="logname" maxlength="20"
                       value="<%= register.getLogname() == null ? "" : register.getLogname() %>" required>
            </div>
            <div class="form-row">
                <label><span class="required">*</span>用户密码</label>
                <input type="password" name="password" id="password" minlength="6" required>
            </div>
            <div class="form-row">
                <label><span class="required">*</span>重复密码</label>
                <input type="password" name="again_password" id="again_password" minlength="6" required>
            </div>
            <div class="form-row">
                <label>联系电话</label>
                <input type="text" name="phone" pattern="\d{7,15}"
                       value="<%= register.getPhone() == null ? "" : register.getPhone() %>">
            </div>
            <div class="form-row">
                <label>收件地址</label>
                <input type="text" name="address"
                       value="<%= register.getAddress() == null ? "" : register.getAddress() %>">
            </div>
            <div class="form-row">
                <label>真实姓名</label>
                <input type="text" name="realname"
                       value="<%= register.getRealname() == null ? "" : register.getRealname() %>">
            </div>
            <div class="actions">
                <button type="submit" class="btn btn-primary">提交注册</button>
                <button type="reset" class="btn btn-reset">重置</button>
            </div>
        </form>
    </div>

    <div class="card">
        <h1>已注册用户
            <span class="badge"><%= registerList == null ? 0 : registerList.size() %></span>
        </h1>
        <p class="hint">数据来自 PostgreSQL 中的 register 表，按注册时间倒序展示。</p>

        <% if (registerList == null || registerList.isEmpty()) { %>
            <div class="empty">暂无注册用户，快来抢注吧～</div>
        <% } else { %>
            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>用户名</th>
                    <th>真实姓名</th>
                    <th>电话</th>
                    <th>地址</th>
                    <th>注册时间</th>
                </tr>
                </thead>
                <tbody>
                <% for (Register r : registerList) { %>
                    <tr>
                        <td><%= r.getId() %></td>
                        <td><%= r.getLogname() %></td>
                        <td><%= r.getRealname() == null ? "" : r.getRealname() %></td>
                        <td><%= r.getPhone() == null ? "" : r.getPhone() %></td>
                        <td><%= r.getAddress() == null ? "" : r.getAddress() %></td>
                        <td><%= r.getCreateTime() == null ? "" : r.getCreateTime() %></td>
                    </tr>
                <% } %>
                </tbody>
            </table>
        <% } %>
    </div>
</div>

<script>
    function validateForm() {
        var logname = document.getElementById('logname').value.trim();
        var password = document.getElementById('password').value;
        var again = document.getElementById('again_password').value;
        if (!/^[A-Za-z0-9_]{3,20}$/.test(logname)) {
            alert('用户名必须由 3-20 位字母、数字或下划线组成。');
            return false;
        }
        if (password.length < 6) {
            alert('密码长度至少 6 位。');
            return false;
        }
        if (password !== again) {
            alert('两次输入的密码不一致。');
            return false;
        }
        return true;
    }
</script>
</body>
</html>
