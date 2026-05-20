<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="my.bean.Photo" %>
<%
    Photo.ensureTable();
    List<Photo> photos = Photo.findAll();

    int index = 0;
    String idxParam = request.getParameter("index");
    if (idxParam != null) {
        try { index = Integer.parseInt(idxParam); } catch (NumberFormatException e) { index = 0; }
    }
    if (!photos.isEmpty()) {
        if (index < 0) index = photos.size() - 1;
        if (index >= photos.size()) index = 0;
    }

    int prev = photos.isEmpty() ? 0 : (index - 1 + photos.size()) % photos.size();
    int next = photos.isEmpty() ? 0 : (index + 1) % photos.size();

    String base64 = photos.isEmpty() ? null : photos.get(index).getData();
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>北培的守护神</title>
</head>
<body>
    <div>北培的守护神</div>
    <div>
        <form action="photo.jsp" method="get" style="display:inline">
            <input type="hidden" name="index" value="<%= prev %>">
            <input type="submit" value="上一张">
        </form>
        <form action="photo.jsp" method="get" style="display:inline">
            <input type="hidden" name="index" value="<%= next %>">
            <input type="submit" value="下一张">
        </form>
    </div>
    <div>
        <% if (base64 != null && !base64.isEmpty()) { %>
            <img src="data:image/jpeg;base64,<%= base64 %>" alt="photo">
        <% } else { %>
            暂无图片，请向 photo 表插入数据。
        <% } %>
    </div>
</body>
</html>