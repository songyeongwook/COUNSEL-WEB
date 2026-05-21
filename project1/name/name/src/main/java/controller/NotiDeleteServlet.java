package controller;

import dao.listDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/NotiDeleteServlet")
public class NotiDeleteServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        int notiNum = Integer.parseInt(request.getParameter("notiNum"));

        listDAO dao = new listDAO();
        dao.deleteNotice(notiNum);

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>");
        out.println("alert('공지사항이 삭제되었습니다.');");
        out.println("opener.location.reload();");
        out.println("window.close();");
        out.println("</script>");
    }
}
