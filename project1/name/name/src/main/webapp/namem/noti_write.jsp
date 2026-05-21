<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%
    String counselorId = (String) session.getAttribute("USER_ID");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>알림 작성</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f7f9fc;
            margin: 0;
            padding: 40px;
        }
        .form-container {
            width: 400px;
            margin: 0 auto;
            background: #fff;
            padding: 30px 40px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            border-radius: 10px;
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #2c3e50;
        }
        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            color: #333;
        }
        input[type="text"],
        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            margin-bottom: 20px;
            box-sizing: border-box;
            font-size: 14px;
        }
        textarea {
            resize: vertical;
            height: 100px;
        }
        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>알림 작성</h2>
    <form action="/name/NotiWriteServlet" method="post">
        <label for="counselorId">상담사 ID</label>
        <input type="text" name="counselorId" id="counselorId" value="<%= counselorId %>" readonly>

        <label for="title">제목</label>
        <input type="text" name="title" id="title" required>

        <label for="context">내용</label>
        <textarea name="context" id="context" required></textarea>

        <input type="submit" value="작성 완료">
    </form>
</div>
</body>
</html>
