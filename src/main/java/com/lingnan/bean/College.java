package com.lingnan.bean;

import org.apache.ibatis.annotations.Param;

/**
 * Created By HongJei Lee on 2018/8/17
 */
public class College {

    private String college_no;
    private String college_name;
    private Integer setting_quota;
    private Integer current_quota;
    private Integer major_int;
    private Integer college_status;

    public College() {
    }

    public College(String college_no, String college_name, Integer setting_quota, Integer current_quota, Integer major_int, Integer college_status) {
        this.college_no = college_no;
        this.college_name = college_name;
        this.setting_quota = setting_quota;
        this.current_quota = current_quota;
        this.major_int = major_int;
        this.college_status = college_status;
    }

    public String getCollege_no() {
        return college_no;
    }

    public void setCollege_no(String college_no) {
        this.college_no = college_no;
    }

    public String getCollege_name() {
        return college_name;
    }

    public void setCollege_name(String college_name) {
        this.college_name = college_name;
    }

    public Integer getSetting_quota() {
        return setting_quota;
    }

    public void setSetting_quota(Integer setting_quota) {
        this.setting_quota = setting_quota;
    }

    public Integer getCurrent_quota() {
        return current_quota;
    }

    public void setCurrent_quota(Integer current_quota) {
        this.current_quota = current_quota;
    }

    public Integer getMajor_int() {
        return major_int;
    }

    public void setMajor_int(Integer major_int) {
        this.major_int = major_int;
    }

    public Integer getCollege_status() {
        return college_status;
    }

    public void setCollege_status(Integer college_status) {
        this.college_status = college_status;
    }

    @Override
    public String toString() {
        return "College{" +
                "college_no=" + college_no +
                ", college_name='" + college_name + '\'' +
                ", setting_quota=" + setting_quota +
                ", current_quota=" + current_quota +
                ", major_int=" + major_int +
                ", college_status=" + college_status +
                '}';
    }
}
