package dao;

import model.CounselApplyDTO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CounselApplyDAO {
    private static final String JDBC_URL = "jdbc:h2:tcp://localhost/~/namedb";
    private static final String DB_USER = "admin";
    private static final String DB_PASS = "admin";

    public List<CounselApplyDTO> getAllApplies() {
        List<CounselApplyDTO> applyList = new ArrayList<>();

        // confirmed 컬럼 추가 조회
        String sql = "SELECT USER_ID, TITLE, CONTENT, COUNSEL_DATE, CONFIRMED FROM COUNSEL_HISTORY";

        try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS);
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                CounselApplyDTO apply = new CounselApplyDTO();
                apply.setUserId(rs.getString("USER_ID"));
                apply.setTitle(rs.getString("TITLE"));
                apply.setContent(rs.getString("CONTENT"));
                apply.setCounselDate(rs.getTimestamp("COUNSEL_DATE"));
                apply.setConfirmed(rs.getString("CONFIRMED"));  // 확인여부 세팅
                applyList.add(apply);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return applyList;
    }
    
    // 상담 신청 확인 상태 변경 메서드 추가 (예: confirmed='Y'로 업데이트)
    public void confirmApply(String userId, Timestamp counselDate) {
        String sql = "UPDATE COUNSEL_HISTORY SET CONFIRMED = 'Y' WHERE USER_ID = ? AND COUNSEL_DATE = ?";

        try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, userId);
            pstmt.setTimestamp(2, counselDate);

            int rowsUpdated = pstmt.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("상담 확인 처리 완료: " + rowsUpdated + "건.");
            } else {
                System.out.println("해당 조건에 일치하는 상담 기록이 없습니다.");
            }

        } catch (SQLException e) {
            System.err.println("confirmApply 예외 발생: " + e.getMessage());
            e.printStackTrace();
        }
    }

}
