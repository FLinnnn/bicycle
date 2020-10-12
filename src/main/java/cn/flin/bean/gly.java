package cn.flin.bean;

public class gly {
    private Integer adminid;

    private String adminusername;

    private String adminpassword;

    public gly() {
    }

    public gly(Integer adminid, String adminusername, String adminpassword) {
        this.adminid = adminid;
        this.adminusername = adminusername;
        this.adminpassword = adminpassword;
    }

    public Integer getAdminid() {
        return adminid;
    }

    public void setAdminid(Integer adminid) {
        this.adminid = adminid;
    }

    public String getAdminusername() {
        return adminusername;
    }

    public void setAdminusername(String adminusername) {
        this.adminusername = adminusername == null ? null : adminusername.trim();
    }

    public String getAdminpassword() {
        return adminpassword;
    }

    public void setAdminpassword(String adminpassword) {
        this.adminpassword = adminpassword == null ? null : adminpassword.trim();
    }
}