<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>고객 정보</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #ffffff;
            padding: 20px;
        }
        h2 {
            color: #2c3e50;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f0f2f5;
        }
    </style>
</head>
<body>
<%
    String userId = (String) session.getAttribute("userId");
    if (userId != null) {
        try {
            Class.forName("org.h2.Driver");
            Connection conn = DriverManager.getConnection("jdbc:h2:tcp://localhost/~/namedb", "admin", "admin");

            String sql = "SELECT * FROM USERS WHERE USER_ID = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
%>
                <h2>고객 정보</h2>
                <table>
                    <tr><th>아이디</th><td><%= rs.getString("USER_ID") %></td></tr>
                    <tr><th>이름</th><td><%= rs.getString("NAME") %></td></tr>
                    <tr><th>이메일</th><td><%= rs.getString("EMAIL") %></td></tr>
                    <tr><th>나이</th><td><%= rs.getString("AGE") %></td></tr>
                </table>
<%
            }
            rs.close();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    } else {
%>
        <p>로그인이 필요합니다.</p>
<%
    }
%>
</body>
</html>
