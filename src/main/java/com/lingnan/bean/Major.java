package com.lingnan.bean;

/**
 * Created By HongJei Lee on 2018/8/19
 */
public class Major {

    private String major_no;
    private String major_name;
    private String college_no;
    private Integer major_status;
    private College college;

    public Major(String major_no, String major_name,String college_no,Integer major_status) {
        this.major_no = major_no;
        this.major_name = major_name;
        this.major_status = major_status;
        this.college_no = college_no;
    }

    public Major() {
    }

    public String getMajor_no() {
        return major_no;
    }

    public void setMajor_no(String major_no) {
        this.major_no = major_no;
    }

    public String getMajor_name() {
        return major_name;
    }

    public void setMajor_name(String major_name) {
        this.major_name = major_name;
    }

    public Integer getMajor_status() {
        return major_status;
    }

    public void setMajor_status(Integer major_status) {
        this.major_status = major_status;
    }

    public String getCollege_no() {
        return college_no;
    }

    public void setCollege_no(String college_no) {
        this.college_no = college_no;
    }

    public College getCollege() {
        return college;
    }

    public void setCollege(College college) {
        this.college = college;
    }

    @Override
    public String toString() {
        return "Major{" +
                "major_no='" + major_no + '\'' +
                ", major_name='" + major_name + '\'' +
                ", college_no='" + college_no + '\'' +
                ", major_status='" + major_status + '\'' +
                ", college='" + college + '\'' +
                '}';
    }
}
