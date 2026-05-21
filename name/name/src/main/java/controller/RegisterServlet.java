package controller;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String userId = request.getParameter("userId");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String email = request.getParameter("email");

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("org.h2.Driver");
            conn = DriverManager.getConnection("jdbc:h2:tcp://localhost/~/namedb", "admin", "admin");

            // ✅ 중복 체크
            String checkSql = "SELECT COUNT(*) FROM USERS WHERE user_id = ?";
            pstmt = conn.prepareStatement(checkSql);
            pstmt.setString(1, userId);
            rs = pstmt.executeQuery();
            rs.next();
            int count = rs.getInt(1);
            pstmt.close(); // 기존 pstmt 닫고 새로 prepare 해야 함

            if (count > 0) {
                response.getWriter().println("<script>alert('이미 사용 중인 아이디입니다.'); history.back();</script>");
                return;
            }

            // ✅ 회원가입 실행
            String sql = "INSERT INTO USERS (user_id, password, name, age, email) VALUES (?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);
            pstmt.setString(2, password);
            pstmt.setString(3, name);
            pstmt.setInt(4, age);
            pstmt.setString(5, email);

            int result = pstmt.executeUpdate();

            if (result > 0) {
                response.sendRedirect("/name/namem/index.jsp");  // 로그인 페이지로 이동
            } else {
                response.getWriter().println("<script>alert('회원가입 실패'); history.back();</script>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<p>DB 오류: " + e.getMessage() + "</p>");
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (pstmt != null) pstmt.close(); } catch (Exception e) {}
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
    }
}
