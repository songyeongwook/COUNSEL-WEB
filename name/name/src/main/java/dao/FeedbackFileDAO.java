package dao;

import model.FeedbackFileDTO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FeedbackFileDAO {
    private final String JDBC_URL = "jdbc:h2:tcp://localhost/~/namedb";
    private final String DB_USER = "admin";
    private final String DB_PASS = "admin";

    public void insertFeedbackFile(FeedbackFileDTO dto) {
        String sql = "INSERT INTO COUNSEL_FILES (COUNSEL_ID, USER_ID, FILE_NAME, FILE_PATH, UPLOAD_DATE) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, dto.getCounselId());
            pstmt.setString(2, dto.getUserId());
            pstmt.setString(3, dto.getFileName());
            pstmt.setString(4, dto.getFilePath());
            pstmt.setTimestamp(5, dto.getUploadDate());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
}
