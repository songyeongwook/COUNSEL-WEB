<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="javax.servlet.http.*" %>
<%
    String counselId = (String) session.getAttribute("COUNSEL_ID");

    // USERS 테이블에서 사용자 목록 가져오기
    List<String> userIds = new ArrayList<>();
    try {
        Class.forName("org.h2.Driver");
        Connection conn = DriverManager.getConnection("jdbc:h2:tcp://localhost/~/namedb", "admin", "admin");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT USER_ID FROM USERS");
        while (rs.next()) {
            userIds.add(rs.getString("USER_ID"));
        }
        rs.close();
        stmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>피드백 업로드</title>
    <style>
        body { font-family: Arial; background: #f0f2f5; padding: 40px; }
        .container { background: #fff; padding: 30px; border-radius: 10px; max-width: 600px; margin: auto; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        h2 { text-align: center; color: #333; }
        select, input[type="file"], input[type="submit"] { display: block; margin: 20px auto; padding: 10px; width: 80%; border-radius: 5px; }
    </style>
</head>
<body>
<div class="container">
    <h2>피드백 파일 업로드</h2>
    <form action="<%=request.getContextPath()%>/UploadFeedbackServlet" method="post" enctype="multipart/form-data">
        <input type="hidden" name="counselId" value="<%= counselId %>" />

        <label for="userId" style="text-align:center; display:block;">고객 선택</label>
        <select name="userId" required>
            <option value="">고객을 선택하세요</option>
            <% for (String uid : userIds) { %>
                <option value="<%= uid %>"><%= uid %></option>
            <% } %>
        </select>

        <input type="file" name="feedbackFile" required />
        <input type="submit" value="업로드">
    </form>
    <%
        if ("true".equals(request.getParameter("success"))) {
    %>
        <p style="color:green; text-align:center;">업로드가 완료되었습니다.</p>
    <%
        }
    %>
</div>
</body>
</html>
