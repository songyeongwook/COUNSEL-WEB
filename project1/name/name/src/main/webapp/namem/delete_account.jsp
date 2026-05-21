<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 세션에서 userId 확인
    String userId = (String) session.getAttribute("userId");
    if (userId == null) {
        response.sendRedirect("index.jsp"); // 비로그인 상태면 로그인 페이지로 이동
        return;
    }

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("org.h2.Driver");
        conn = DriverManager.getConnection("jdbc:h2:tcp://localhost/~/namedb", "admin", "admin");

        // 자동 커밋 해제
        conn.setAutoCommit(false);

        // 1. 외래키로 연결된 데이터 먼저 삭제 (예: 상담 기록 등)
        String deleteHistorySql = "DELETE FROM COUNSEL_HISTORY WHERE USER_ID = ?";
        pstmt = conn.prepareStatement(deleteHistorySql);
        pstmt.setString(1, userId);
        pstmt.executeUpdate();
        pstmt.close();

        // 2. 회원 정보 삭제
        String deleteUserSql = "DELETE FROM USERS WHERE USER_ID = ?";
        pstmt = conn.prepareStatement(deleteUserSql);
        pstmt.setString(1, userId);
        int result = pstmt.executeUpdate();

        if (result > 0) {
            conn.commit(); // 모든 삭제 성공 시 커밋
            session.invalidate(); // 세션 종료
            response.sendRedirect("index.jsp");
        } else {
            conn.rollback(); // 실패 시 롤백
%>
            <p style="color:red; text-align:center;">회원 탈퇴에 실패했습니다. 관리자에게 문의하세요.</p>
<%
        }
    } catch (Exception e) {
        if (conn != null) try { conn.rollback(); } catch (Exception ex) {}
%>
        <p style="color:red; text-align:center;">오류 발생: <%= e.getMessage() %></p>
<%
    } finally {
        try { if (pstmt != null) pstmt.close(); } catch (Exception e) {}
        try { if (conn != null) conn.close(); } catch (Exception e) {}
    }
%>
