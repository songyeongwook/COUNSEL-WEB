package dao;

import model.listDTO;
import java.sql.*;
import java.util.*;

public class listDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    private void connect() throws Exception {
        Class.forName("org.h2.Driver");
        conn = DriverManager.getConnection("jdbc:h2:tcp://localhost/~/namedb", "admin", "admin");
    }

    // 공지 전체 목록 가져오기
    public List<listDTO> getAllNotices() {
        List<listDTO> list = new ArrayList<>();
        try {
            connect();
            String sql = "SELECT NOTI_NUM, COUNSEL_ID, TITLE, CONTEXT FROM COUNSEL_NOTI ORDER BY NOTI_NUM DESC";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                listDTO dto = new listDTO();
                dto.setNotiNum(rs.getInt("NOTI_NUM"));
                dto.setCounselorId(rs.getString("COUNSEL_ID"));
                dto.setTitle(rs.getString("TITLE"));
                dto.setContext(rs.getString("CONTEXT"));
                list.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if(rs != null) rs.close(); } catch (Exception e) {}
            try { if(pstmt != null) pstmt.close(); } catch (Exception e) {}
            try { if(conn != null) conn.close(); } catch (Exception e) {}
        }
        return list;
    }

    public List<listDTO> getNotificationList() {
        return getAllNotices();
    }

    // 공지사항 작성
    public void insertNotice(listDTO dto) {
        try {
            connect();
            String sql = "INSERT INTO COUNSEL_NOTI (COUNSEL_ID, TITLE, CONTEXT) VALUES (?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getCounselorId());
            pstmt.setString(2, dto.getTitle());
            pstmt.setString(3, dto.getContext());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if(rs != null) rs.close(); } catch (Exception e) {}
            try { if(pstmt != null) pstmt.close(); } catch (Exception e) {}
            try { if(conn != null) conn.close(); } catch (Exception e) {}
        }
    }

    // 공지사항 수정
    public void updateNotice(listDTO dto) {
        try {
            connect();
            String sql = "UPDATE COUNSEL_NOTI SET TITLE = ?, CONTEXT = ? WHERE NOTI_NUM = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getTitle());
            pstmt.setString(2, dto.getContext());
            pstmt.setInt(3, dto.getNotiNum());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if(rs != null) rs.close(); } catch (Exception e) {}
            try { if(pstmt != null) pstmt.close(); } catch (Exception e) {}
            try { if(conn != null) conn.close(); } catch (Exception e) {}
        }
    }

    // 공지사항 삭제
    public void deleteNotice(int notiNum) {
        try {
            connect();
            String sql = "DELETE FROM COUNSEL_NOTI WHERE NOTI_NUM = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, notiNum);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if(rs != null) rs.close(); } catch (Exception e) {}
            try { if(pstmt != null) pstmt.close(); } catch (Exception e) {}
            try { if(conn != null) conn.close(); } catch (Exception e) {}
        }
    }
    public listDTO getNoticeById(int notiNum) {
        listDTO dto = null;
        try {
            connect();
            String sql = "SELECT NOTI_NUM, COUNSEL_ID, TITLE, CONTEXT FROM COUNSEL_NOTI WHERE NOTI_NUM = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, notiNum);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                dto = new listDTO();
                dto.setNotiNum(rs.getInt("NOTI_NUM"));
                dto.setCounselorId(rs.getString("COUNSEL_ID"));
                dto.setTitle(rs.getString("TITLE"));
                dto.setContext(rs.getString("CONTEXT"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) try { rs.close(); } catch(Exception e) {}
            if(pstmt != null) try { pstmt.close(); } catch(Exception e) {}
            if(conn != null) try { conn.close(); } catch(Exception e) {}
        }
        return dto;
    }

}
