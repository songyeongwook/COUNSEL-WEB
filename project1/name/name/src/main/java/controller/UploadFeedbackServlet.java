package controller;

import dao.FeedbackFileDAO;
import model.FeedbackFileDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.time.LocalDateTime;

@WebServlet("/UploadFeedbackServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1, // 1MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 15)   // 15MB
public class UploadFeedbackServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String counselId = request.getParameter("counselId");
        String userId = request.getParameter("userId");

        Part filePart = request.getPart("feedbackFile");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        // 파일 저장 경로 설정
        String uploadPath = getServletContext().getRealPath("/uploads");
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        // 파일 저장
        String filePath = uploadPath + File.separator + fileName;
        filePart.write(filePath);

        // DB 저장을 위한 파일 상대 경로
        String fileAccessPath = request.getContextPath() + "/uploads/" + fileName;

        FeedbackFileDTO dto = new FeedbackFileDTO();
        dto.setCounselId(counselId);
        dto.setUserId(userId);
        dto.setFileName(fileName);
        dto.setFilePath(fileAccessPath);
        dto.setUploadDate(Timestamp.valueOf(LocalDateTime.now()));

        FeedbackFileDAO dao = new FeedbackFileDAO();
        dao.insertFeedbackFile(dto);

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>");
        out.println("alert('예약 확인하셨습니다.');");
        out.println("opener.location.reload();");
        out.println("window.close();");
        out.println("</script>");
        response.sendRedirect("/name/namem/uploadFeedback.jsp");
    }
}