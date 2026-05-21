<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.*, model.FeedbackFileDTO" %>

<%
    String userId = (String) session.getAttribute("userId");  // 로그인된 사용자 ID
    List<FeedbackFileDTO> files = new ArrayList<>();

    // DB 연결 정보
    String JDBC_URL = "jdbc:h2:tcp://localhost/~/namedb";
    String DB_USER = "admin";
    String DB_PASS = "admin";

    try {
        Class.forName("org.h2.Driver");
        Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS);
        String sql = "SELECT * FROM COUNSEL_FILES WHERE USER_ID = ? ORDER BY UPLOAD_DATE DESC";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userId);
        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {
            FeedbackFileDTO dto = new FeedbackFileDTO();
            dto.setFileId(rs.getInt("FILE_ID"));
            dto.setCounselId(rs.getString("COUNSEL_ID"));
            dto.setUserId(rs.getString("USER_ID"));
            dto.setFileName(rs.getString("FILE_NAME"));
            dto.setFilePath(rs.getString("FILE_PATH"));
            dto.setUploadDate(rs.getTimestamp("UPLOAD_DATE"));
            files.add(dto);
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
    <title>피드백 파일 확인</title>
    <style>
        body { font-family: Arial; background: #f1f1f1; padding: 30px; }
        .container { max-width: 800px; margin: auto; background: white; padding: 20px; border-radius: 10px; box-shadow: 0 0 8px rgba(0,0,0,0.1); }
        h2 { text-align: center; color: #333; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 10px; border-bottom: 1px solid #ccc; text-align: left; }
        th { background: #555; color: white; }
        .no-files { text-align: center; color: gray; margin-top: 20px; }
        a.download-link { color: blue; text-decoration: underline; }
    </style>
</head>
<body>
<div class="container">
    <h2>상담 피드백 파일</h2>
    <% if (files != null && !files.isEmpty()) { %>
        <table>
            <tr>
                <th>상담 ID</th>
                <th>파일명</th>
                <th>다운로드</th>
            </tr>
            <% for (FeedbackFileDTO file : files) { %>
                <tr>
                    <td><%= file.getCounselId() %></td>
                    <td><%= file.getFileName() %></td>
                    <td><a class="download-link" href="<%= file.getFilePath() %>" download>다운로드</a></td>
                </tr>
            <% } %>
        </table>
    <% } else { %>
        <p class="no-files">등록된 피드백 파일이 없습니다.</p>
    <% } %>
</div>
</body>
</html>
