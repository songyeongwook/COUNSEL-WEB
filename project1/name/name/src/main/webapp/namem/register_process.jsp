<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>회원가입</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .register-container {
            background: white;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            width: 400px;
        }
        h2 {
            margin-bottom: 20px;
            color: #2c3e50;
            text-align: center;
        }
        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
            color: #555;
        }
        input[type="text"], input[type="password"], input[type="email"], input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
        }
        button {
            width: 100%;
            margin-top: 25px;
            padding: 12px;
            background-color: #2c3e50;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #34495e;
        }
        .login-link {
            margin-top: 15px;
            text-align: center;
            font-size: 14px;
        }
        .login-link a {
            color: #2c3e50;
            text-decoration: none;
        }
        .login-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <h2>회원가입</h2>
        <form action="/name/RegisterServlet" method="post">
            <label for="userId">아이디</label>
            <input type="text" id="userId" name="userId" required />

            <label for="password">비밀번호</label>
            <input type="password" id="password" name="password" required />

            <label for="name">이름</label>
            <input type="text" id="name" name="name" required />

            <label for="age">나이</label>
            <input type="number" id="age" name="age" required />

            <label for="email">이메일</label>
            <input type="email" id="email" name="email" required />

            <button type="submit">가입하기</button>
        </form>
        <div class="login-link">
            이미 회원이신가요? <a href="index.jsp">로그인 하러 가기</a>
        </div>
    </div>
</body>
</html>
