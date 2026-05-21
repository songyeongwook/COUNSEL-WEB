<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 찾기 결과</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .result-container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            text-align: center;
        }
        .result-container h2 {
            color: #333;
        }
        .back-link {
            margin-top: 20px;
            display: block;
            color: #007BFF;
            text-decoration: none;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<%
    String userId = request.getParameter("userId");
    String email = request.getParameter("email");
    String password = null;

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("org.h2.Driver");
        conn = DriverManager.getConnection("jdbc:h2:tcp://localhost/~/namedb", "admin", "admin");

        String sql = "SELECT PASSWORD FROM USERS WHERE USER_ID = ? AND EMAIL = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userId);
        pstmt.setString(2, email);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            password = rs.getString("PASSWORD");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (pstmt != null) pstmt.close(); } catch (Exception e) {}
        try { if (conn != null) conn.close(); } catch (Exception e) {}
    }
%>

<div class="result-container">
    <h2>
        <% if (password != null) { %>
            회원님의 비밀번호는 <strong><%= password %></strong> 입니다.
        <% } else { %>
            입력하신 정보와 일치하는 계정이 없습니다.
        <% } %>
    </h2>
    <a class="back-link" href="index.jsp">← 로그인 화면으로 돌아가기</a>
</div>
</body>
</html>
