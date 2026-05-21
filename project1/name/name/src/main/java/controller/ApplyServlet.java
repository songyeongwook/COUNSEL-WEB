package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/ApplyServlet")
public class ApplyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String userId = request.getParameter("userId");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String counselorId = request.getParameter("counselorId");
        String datetime = request.getParameter("datetime"); // 'yyyy-MM-dd'T'HH:mm' 형식

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("org.h2.Driver");
            conn = DriverManager.getConnection("jdbc:h2:tcp://localhost/~/namedb", "admin", "admin");

            String sql = "INSERT INTO counsel_history (user_id, counsel_id, title, content, counsel_date) VALUES (?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);
            pstmt.setString(2, counselorId);
            pstmt.setString(3, title);
            pstmt.setString(4, content);
            pstmt.setTimestamp(5, Timestamp.valueOf(datetime.replace("T", " ").substring(0, 16) + ":00"));


            int result = pstmt.executeUpdate();

            if (result > 0) {
                response.sendRedirect("/name/namem/customer_apply.jsp");
            } else {
                response.getWriter().println("<script>alert('상담 신청 실패'); history.back();</script>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("DB 오류: " + e.getMessage());
        } finally {
            try { if (pstmt != null) pstmt.close(); } catch (Exception e) {}
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
    }
}
