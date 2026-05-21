<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="dao.listDAO" %>
<%@ page import="model.listDTO" %>
<%
    int notiNum = Integer.parseInt(request.getParameter("notiNum"));
    listDAO dao = new listDAO();
    listDTO dto = dao.getNoticeById(notiNum);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 수정</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 30px;
            background: #f7f7f7;
        }
        .form-container {
            background: white;
            padding: 25px;
            max-width: 500px;
            margin: auto;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        input[type="text"], textarea {
            width: 100%;
            padding: 12px;
            margin-top: 8px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        button {
            padding: 10px 20px;
            background: #3498db;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }
        button:hover {
            background: #2980b9;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>공지사항 수정</h2>
    <form action="/name/NotiUpdateServlet" method="post">
        <input type="hidden" name="notiNum" value="<%= dto.getNotiNum() %>">
        <label for="title">제목</label>
        <input type="text" name="title" value="<%= dto.getTitle() %>" required>

        <label for="context">내용</label>
        <textarea name="context" rows="6" required><%= dto.getContext() %></textarea>

        <button type="submit">수정 완료</button>
    </form>
</div>
</body>
</html>
