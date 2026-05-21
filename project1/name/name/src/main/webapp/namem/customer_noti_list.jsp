<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, dao.listDAO, model.listDTO" %>
<%
    listDAO dao = new listDAO();
    List<listDTO> notiList = dao.getNotificationList();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 30px; background-color: #f8f8f8; }
        h2 { text-align: center; color: #333; }
        .notice-box {
            background: #fff;
            border: 1px solid #ddd;
            padding: 15px;
            margin-bottom: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        }
        .notice-title {
            font-weight: bold;
            font-size: 18px;
            margin-bottom: 8px;
            color: #0066cc;
        }
        .notice-content {
            font-size: 15px;
            color: #555;
        }
    </style>
</head>
<body>
    <h2>📢 공지사항</h2>

    <%
        if (notiList != null && !notiList.isEmpty()) {
            for (listDTO dto : notiList) {
    %>
        <div class="notice-box">
            <div class="notice-title"><%= dto.getTitle() %></div>
            <div class="notice-content"><%= dto.getContext() %></div>
        </div>
    <%
            }
        } else {
    %>
        <p style="text-align: center; color: #999;">현재 등록된 공지사항이 없습니다.</p>
    <%
        }
    %>
</body>
</html>
