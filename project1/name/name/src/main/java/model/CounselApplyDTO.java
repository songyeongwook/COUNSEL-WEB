package model;

import java.sql.Timestamp;

public class CounselApplyDTO {
    private String userId;
    private String title;
    private String content;
    private Timestamp counselDate;
    private String confirmed;  // ✅ 확인 여부 필드 추가

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getCounselDate() {
        return counselDate;
    }

    public void setCounselDate(Timestamp counselDate) {
        this.counselDate = counselDate;
    }

    public String getConfirmed() {
        return confirmed;
    }

    public void setConfirmed(String confirmed) {
        this.confirmed = confirmed;
    }
}
