package com.lingnan.bean;

public class Admin {
    private Integer aId;
    private String adminName;
    private String adminPwd;
    private String adminPhone;
    private String adminEmail;
    private Integer adminStatus;
    private String permissions;

    public Admin() {
    }

    public Admin(int aId, Integer adminStatus, String adminName, String adminPwd, String permissions, String adminPhone, String adminEmail) {
        this.aId = aId;
        this.adminName = adminName;
        this.adminPwd = adminPwd;
        this.permissions = permissions;
        this.adminPhone = adminPhone;
        this.adminEmail = adminEmail;
        this.adminStatus = adminStatus;
    }

    public Integer getaId() {
        return aId;
    }

    public void setaId(Integer aId) {
        this.aId = aId;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public String getAdminPwd() {
        return adminPwd;
    }

    public void setAdminPwd(String adminPwd) {
        this.adminPwd = adminPwd;
    }

    public String getPermissions() {
        return permissions;
    }

    public void setPermissions(String permissions) {
        this.permissions = permissions;
    }

    public String getaPhone() {
        return adminPhone;
    }

    public String getAdminPhone() {
        return adminPhone;
    }

    public void setAdminPhone(String adminPhone) {
        this.adminPhone = adminPhone;
    }

    public String getAdminEmail() {
        return adminEmail;
    }

    public void setAdminEmail(String adminEmail) {
        this.adminEmail = adminEmail;
    }

    public Integer getAdminStatus() {
        return adminStatus;
    }

    public void setAdminStatus(Integer adminStatus) {
        this.adminStatus = adminStatus;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "aId=" + aId +
                ", adminName='" + adminName + '\'' +
                ", adminPwd='" + adminPwd + '\'' +
                ", permissions='" + permissions + '\'' +
                ", aPhone='" + adminPhone + '\'' +
                ", aEmail='" + adminEmail + '\'' +
                ", adminStatus='" + adminStatus + '\'' +
                '}';
    }


}
