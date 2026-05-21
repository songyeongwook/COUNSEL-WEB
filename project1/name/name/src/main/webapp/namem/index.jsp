<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상담관리 시스템</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: #f0f2f5;
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .login-container {
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 300px;
        }
        input {
            display: block;
            margin: 10px auto;
            padding: 10px;
            width: 80%;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background: #4CAF50;
            color: white;
            cursor: pointer;
            width: 85%;
        }
        button:hover {
            background-color: #45a049;
        }
        .links a {
            margin: 5px;
            display: inline-block;
            color: #007BFF;
            text-decoration: none;
            font-size: 0.9em;
        }
        .links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>로그인</h2>
        <form action="login_process.jsp" method="post">
            <input type="text" name="userId" placeholder="아이디" required>
            <input type="password" name="password" placeholder="비밀번호" required>
            <button type="submit">로그인</button>
        </form>
        <div class="links">
            <a href="register_process.jsp">회원가입</a>
            <a href="findid.jsp">아이디 찾기</a>
            <a href="findpw.jsp">비밀번호 찾기</a>
        </div>
    </div>
</body>
</html>