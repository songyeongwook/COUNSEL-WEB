<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이디 찾기</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: #f0f2f5;
            font-family: Arial, sans-serif;
        }
        .find-container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            text-align: center;
            width: 300px;
        }
        input {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        button {
            padding: 10px 20px;
            background: #4CAF50;
            border: none;
            color: white;
            border-radius: 5px;
            cursor: pointer;
        }
        .back-link {
            margin-top: 15px;
            display: block;
            color: #007BFF;
            text-decoration: none;
            font-size: 0.9em;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="find-container">
        <h2>아이디 찾기</h2>
        <form action="findid_process.jsp" method="post">
            <input type="text" name="email" placeholder="이메일을 입력하세요" required>
            <button type="submit">아이디 찾기</button>
        </form>
        <a class="back-link" href="findid_process.jsp">← 로그인 화면으로 돌아가기</a>
    </div>
</body>
</html>
