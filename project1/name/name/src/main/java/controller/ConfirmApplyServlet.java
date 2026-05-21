package controller;

import dao.CounselApplyDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

@WebServlet("/ConfirmApplyServlet")
public class ConfirmApplyServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String userId = request.getParameter("userId");
        String counselDateStr = request.getParameter("counselDate"); // 예: "2025-06-02 14:30:00"

        try {
            // 문자열을 Timestamp로 파싱
            Timestamp counselDate = Timestamp.valueOf(counselDateStr);

            // DAO 호출하여 상담 확인 처리
            CounselApplyDAO dao = new CounselApplyDAO();
            dao.confirmApply(userId, counselDate);

            // 처리 완료 후 상담 신청 목록 페이지로 리다이렉트
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('예약 확인하셨습니다.');");
            out.println("opener.location.reload();");
            out.println("window.close();");
            out.println("</script>");
            response.sendRedirect("/name/namem/applylist.jsp");
            

        } catch (IllegalArgumentException e) {
            e.printStackTrace();

            // 파싱 오류 발생 시 오류 메시지 출력
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<script>alert('상담일 포맷 오류가 발생했습니다.'); history.back();</script>");
        } catch (Exception e) {
            e.printStackTrace();

            // 일반 예외 발생 시 처리
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<script>alert('상담 확인 처리 중 오류가 발생했습니다.'); history.back();</script>");
        }
    }
}
