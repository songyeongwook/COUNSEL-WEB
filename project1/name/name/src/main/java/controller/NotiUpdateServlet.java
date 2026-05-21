package controller;

import dao.listDAO;
import model.listDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/NotiUpdateServlet")
public class NotiUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        int notiNum = Integer.parseInt(request.getParameter("notiNum"));
        String title = request.getParameter("title");
        String context = request.getParameter("context");

        listDTO dto = new listDTO();
        dto.setNotiNum(notiNum);
        dto.setTitle(title);
        dto.setContext(context);

        listDAO dao = new listDAO();
        dao.updateNotice(dto);

        // 팝업 닫기 및 부모 창 새로고침
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>");
        out.println("alert('수정이 완료되었습니다.');");
        out.println("opener.location.reload();"); // 부모 창 새로고침
        out.println("window.close();"); // 현재 창 닫기
        out.println("</script>");
    }
}
