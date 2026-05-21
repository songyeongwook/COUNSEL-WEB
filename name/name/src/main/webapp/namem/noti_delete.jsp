<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 삭제</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f7f7f7;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .delete-container {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            text-align: center;
        }
        button {
            padding: 10px 20px;
            margin: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .delete-btn {
            background: #e74c3c;
            color: white;
        }
        .cancel-btn {
            background: #95a5a6;
            color: white;
        }
    </style>
</head>
<body>
<div class="delete-container">
    <h2>정말 삭제하시겠습니까?</h2>
    <form action="/name/NotiDeleteServlet" method="post">
        <input type="hidden" name="notiNum" value="<%= request.getParameter("notiNum") %>">
        <button type="submit" class="delete-btn">삭제</button>
        <button type="button" class="cancel-btn" onclick="window.close();">취소</button>
    </form>
</div>
</body>
</html>
