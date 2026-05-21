package controller;

import dao.listDAO;
import model.listDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/NotiWriteServlet")

public class NotiWriteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        String counselorId = (String) session.getAttribute("USER_ID");
        String title = request.getParameter("title");
        String context = request.getParameter("context");

        listDTO dto = new listDTO();
        dto.setCounselorId(counselorId);
        dto.setTitle(title);
        dto.setContext(context);

        listDAO dao = new listDAO();
        dao.insertNotice(dto);

        request.getRequestDispatcher("/namem/popupClose.jsp").forward(request, response);
    }
}