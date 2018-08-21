package com.lingnan.bean;

/**
 * Created By HongJei Lee on 2018/8/21
 */
public class Teacher {

    private String work_id;
    private String t_name;
    private String t_img;
    private String t_gender;
    private String major_no;
    private String college_no;
    private String t_address;
    private String t_telephone;
    private String t_status;
    private String t_email;

    public Teacher() {
    }

    public Teacher(String work_id, String t_name, String t_img, String t_gender, String major_no,
                   String college_no, String t_address, String t_telephone,
                   String t_status, String t_email) {
        this.work_id = work_id;
        this.t_name = t_name;
        this.t_img = t_img;
        this.t_gender = t_gender;
        this.major_no = major_no;
        this.college_no = college_no;
        this.t_address = t_address;
        this.t_telephone = t_telephone;
        this.t_status = t_status;
        this.t_email = t_email;
    }

    public String getWork_id() {
        return work_id;
    }

    public void setWork_id(String work_id) {
        this.work_id = work_id;
    }

    public String getT_name() {
        return t_name;
    }

    public void setT_name(String t_name) {
        this.t_name = t_name;
    }

    public String getT_gender() {
        return t_gender;
    }

    public void setT_gender(String t_gender) {
        this.t_gender = t_gender;
    }

    public String getMajor_no() {
        return major_no;
    }

    public void setMajor_no(String major_no) {
        this.major_no = major_no;
    }

    public String getCollege_no() {
        return college_no;
    }

    public void setCollege_no(String college_no) {
        this.college_no = college_no;
    }

    public String getT_address() {
        return t_address;
    }

    public void setT_address(String t_address) {
        this.t_address = t_address;
    }

    public String getT_telephone() {
        return t_telephone;
    }

    public void setT_telephone(String t_telephone) {
        this.t_telephone = t_telephone;
    }

    public String getT_status() {
        return t_status;
    }

    public void setT_status(String t_status) {
        this.t_status = t_status;
    }

    public String getT_email() {
        return t_email;
    }

    public void setT_email(String t_email) {
        this.t_email = t_email;
    }

    public String getT_img() {
        return t_img;
    }

    public void setT_img(String t_img) {
        this.t_img = t_img;
    }

    @Override
    public String toString() {
        return "Teacher{" +
                "work_id='" + work_id + '\'' +
                ", t_name='" + t_name + '\'' +
                ", t_img='" + t_img + '\'' +
                ", t_gender='" + t_gender + '\'' +
                ", major_no='" + major_no + '\'' +
                ", college_no='" + college_no + '\'' +
                ", t_address='" + t_address + '\'' +
                ", t_telephone='" + t_telephone + '\'' +
                ", t_status='" + t_status + '\'' +
                ", t_email='" + t_email + '\'' +
                '}';
    }
}
