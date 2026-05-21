<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userId = (String) session.getAttribute("userId");
    if (userId == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상담 이력 조회</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f9f9f9;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #2c3e50;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #2c3e50;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>
    <h2><%= userId %>님의 상담 이력</h2>

<%
    try {
        Class.forName("org.h2.Driver");
        conn = DriverManager.getConnection("jdbc:h2:tcp://localhost/~/namedb", "admin", "admin");

        String sql = "SELECT COUNSEL_NUM, USER_ID, COUNSEL_ID, TITLE, CONTENT,COUNSEL_DATE FROM counsel_history WHERE USER_ID = ? ORDER BY COUNSEL_NUM DESC";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userId);
        rs = pstmt.executeQuery();
%>
        <table>
            <tr>
                <th>상담번호</th>
                <th>고객 ID</th>
                <th>상담사 ID</th>
                <th>제목</th>
                <th>내용</th>
                <th>예약시간</th>
            </tr>
<%
        boolean hasData = false;
        while (rs.next()) {
            hasData = true;
%>
            <tr>
                <td><%= rs.getInt("COUNSEL_NUM") %></td>
                <td><%= rs.getString("USER_ID") %></td>
                <td><%= rs.getString("COUNSEL_ID") %></td>
                <td><%= rs.getString("TITLE") %></td>
                <td><%= rs.getString("CONTENT") %></td>
                <td><%= rs.getTimestamp("COUNSEL_DATE") %></td>
            </tr>
<%
        }
        if (!hasData) {
%>
            <tr>
                <td colspan="5" style="color:gray;">상담 이력이 없습니다.</td>
            </tr>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
%>
        <p style="color:red; text-align:center;">데이터베이스 오류가 발생했습니다.</p>
<%
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (pstmt != null) pstmt.close(); } catch (Exception e) {}
        try { if (conn != null) conn.close(); } catch (Exception e) {}
    }
%>
</body>
</html>
