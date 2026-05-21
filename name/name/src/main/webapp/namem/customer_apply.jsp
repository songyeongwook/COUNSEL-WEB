<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.*" %>
<%
    String userId = (String) session.getAttribute("userId");
    if (userId == null) {
        response.sendRedirect("index.jsp"); // 로그인 안된 경우
        return;
    }

    List<String[]> counselorList = new ArrayList<>();
    try {
        Class.forName("org.h2.Driver");
        Connection conn = DriverManager.getConnection("jdbc:h2:tcp://localhost/~/namedb", "admin", "admin");
        String sql = "SELECT counsel_id, name FROM counsel";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
        while (rs.next()) {
            String[] counselor = {rs.getString("counsel_id"), rs.getString("name")};
            counselorList.add(counselor);
        }
        rs.close();
        pstmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상담 신청</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f2f2;
            padding: 20px;
        }
        .form-container {
            background: white;
            width: 500px;
            margin: 0 auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }
        input[type="text"], textarea, input[type="datetime-local"], select {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        button {
            margin-top: 20px;
            padding: 12px;
            width: 100%;
            background-color: #2c3e50;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background-color: #34495e;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>상담 신청</h2>
        <form action="/name/ApplyServlet" method="post">
            <input type="hidden" name="userId" value="<%= userId %>">

            <label for="title">제목</label>
            <input type="text" id="title" name="title" required>

            <label for="content">상담 내용</label>
            <textarea id="content" name="content" rows="6" required></textarea>

            <label for="datetime">상담 희망 시간</label>
            <input type="datetime-local" id="datetime" name="datetime" required>

            <label for="counselorId">상담사 선택</label>
            <select id="counselorId" name="counselorId" required>
                <option value="">-- 상담사를 선택하세요 --</option>
                <% for (String[] counselor : counselorList) { %>
                    <option value="<%= counselor[0] %>"><%= counselor[1] %> (<%= counselor[0] %>)</option>
                <% } %>
            </select>

            <button type="submit">신청하기</button>
        </form>
    </div>
</body>
</html>
