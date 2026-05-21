package model;

public class listDTO {
    private int notiNum;
    private String counselorId;
    private String title;
    private String context;
     

    // Getters and Setters
    public int getNotiNum() {
        return notiNum;
    }
    public void setNotiNum(int notiNum) {
        this.notiNum = notiNum;
    }

    public String getCounselorId() {
        return counselorId;
    }
    public void setCounselorId(String counselorId) {
        this.counselorId = counselorId;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }

    public String getContext() {
        return context;
    }
    public void setContext(String context) {
        this.context = context;
    }


}
