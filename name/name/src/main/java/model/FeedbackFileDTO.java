package model;

import java.sql.Timestamp;

public class FeedbackFileDTO {
    private int fileId;
    private int counselNum;
    private String counselId;
    private String userId;
    private String fileName;
    private String filePath;
    private Timestamp uploadDate;

    // Getters and Setters
    public int getFileId() { return fileId; }
    public void setFileId(int fileId) { this.fileId = fileId; }

    public int getCounselNum() { return counselNum; }
    public void setCounselNum(int counselNum) { this.counselNum = counselNum; }

    public String getCounselId() { return counselId; }
    public void setCounselId(String counselId) { this.counselId = counselId; }

    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }

    public String getFileName() { return fileName; }
    public void setFileName(String fileName) { this.fileName = fileName; }

    public String getFilePath() { return filePath; }
    public void setFilePath(String filePath) { this.filePath = filePath; }

    public Timestamp getUploadDate() { return uploadDate; }
    public void setUploadDate(Timestamp uploadDate) { this.uploadDate = uploadDate; }
}
