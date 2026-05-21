<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page session="true" %>

<%
    String userId = request.getParameter("userId");
    String password = request.getParameter("password");

    String jdbcURL = "jdbc:h2:tcp://localhost/~/namedb";
    String dbUser = "admin";
    String dbPassword = "admin";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    boolean loginSuccess = false;

    try {
        Class.forName("org.h2.Driver");
        conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        // 1. 상담사 로그인 시도
        String counselSql = "SELECT * FROM counsel WHERE counsel_id = ? AND password = ?";
        pstmt = conn.prepareStatement(counselSql);
        pstmt.setString(1, userId);
        pstmt.setString(2, password);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            // 상담사 로그인 성공
            session.setAttribute("counselId", userId);
            session.setAttribute("USER_ID", userId); // <-- 공지사항 작성용 ID 저장
            response.sendRedirect("counselorDashboard.jsp");
            loginSuccess = true;
        }

        if (!loginSuccess) {
            // pstmt, rs 닫고 다시 생성 (중복 사용 방지)
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();

            // 2. 일반 사용자 로그인 시도
            String userSql = "SELECT * FROM users WHERE user_id = ? AND password = ?";
            pstmt = conn.prepareStatement(userSql);
            pstmt.setString(1, userId);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                // 사용자 로그인 성공
                session.setAttribute("userId", userId);
                response.sendRedirect("customerDashboard.jsp");
                loginSuccess = true;
            }
        }

        if (!loginSuccess) {
%>
            <script>
                alert("아이디 또는 비밀번호가 올바르지 않습니다.");
                history.back();
            </script>
<%
        }

    } catch (Exception e) {
        e.printStackTrace();
%>
        <p>오류 발생: <%= e.getMessage() %></p>
<%
    } finally {
        if (rs != null) try { rs.close(); } catch (Exception ignore) {}
        if (pstmt != null) try { pstmt.close(); } catch (Exception ignore) {}
        if (conn != null) try { conn.close(); } catch (Exception ignore) {}
    }
%>
