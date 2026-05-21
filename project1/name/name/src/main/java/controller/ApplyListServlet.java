package controller;

import dao.CounselApplyDAO;
import model.CounselApplyDTO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class ApplyListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        CounselApplyDAO dao = new CounselApplyDAO();
        List<CounselApplyDTO> applyList = dao.getAllApplies();

        request.setAttribute("applyList", applyList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("applylist.jsp");
        dispatcher.forward(request, response);
    }
}
