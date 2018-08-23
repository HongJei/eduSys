package com.lingnan.bean;

import java.util.Date;

/**
 * Created By HongJei Lee on 2018/8/23
 */
public class Course {

    private String course_no;
    private String major_no;
    private String course_name;
    private Integer credit;
    private Integer planned_hour;
    private String course_type;
    private String exam_type;
    private String remarks;
    private Major major;

    public Course() {
    }

    public Course(String course_no, String major_no, String course_name, Integer credit, Integer planned_hour, String course_type, String exam_type, String remarks) {
        this.course_no = course_no;
        this.major_no = major_no;
        this.course_name = course_name;
        this.credit = credit;
        this.planned_hour = planned_hour;
        this.course_type = course_type;
        this.exam_type = exam_type;
        this.remarks = remarks;
    }

    public String getCourse_no() {
        return course_no;
    }

    public void setCourse_no(String course_no) {
        this.course_no = course_no;
    }

    public String getMajor_no() {
        return major_no;
    }

    public void setMajor_no(String major_no) {
        this.major_no = major_no;
    }

    public String getCourse_name() {
        return course_name;
    }

    public void setCourse_name(String course_name) {
        this.course_name = course_name;
    }

    public Integer getCredit() {
        return credit;
    }

    public void setCredit(Integer credit) {
        this.credit = credit;
    }

    public Integer getPlanned_hour() {
        return planned_hour;
    }

    public void setPlanned_hour(Integer planned_hour) {
        this.planned_hour = planned_hour;
    }

    public String getCourse_type() {
        return course_type;
    }

    public void setCourse_type(String course_type) {
        this.course_type = course_type;
    }

    public String getExam_type() {
        return exam_type;
    }

    public void setExam_type(String exam_type) {
        this.exam_type = exam_type;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public Major getMajor() {
        return major;
    }

    public void setMajor(Major major) {
        this.major = major;
    }

    @Override
    public String toString() {
        return "Course{" +
                "course_no='" + course_no + '\'' +
                ", major_no='" + major_no + '\'' +
                ", course_name='" + course_name + '\'' +
                ", credit=" + credit +
                ", planned_hour=" + planned_hour +
                ", course_type='" + course_type + '\'' +
                ", exam_type='" + exam_type + '\'' +
                ", remarks='" + remarks + '\'' +
                ", major='" + major + '\'' +
                '}';
    }
}
