package com.lingnan.bean;

import java.util.Date;

/**
 * Created By HongJei Lee on 2018/8/24
 */
public class Grade {

    private Integer grade_no;
    private String register_no;
    private String work_id;
    private String course_no;
    private Integer final_grade;
    private Integer makeup_flag;

    private Student student;
    private Course course;
    private Teacher teacher;

    public Grade() {
    }

    public Grade(Integer grade_no, String register_no, String work_id, String course_no, Integer final_grade, Integer makeup_flag) {
        this.grade_no = grade_no;
        this.register_no = register_no;
        this.work_id = work_id;
        this.course_no = course_no;
        this.final_grade = final_grade;
        this.makeup_flag = makeup_flag;
    }

    public Integer getGrade_no() {
        return grade_no;
    }

    public void setGrade_no(Integer grade_no) {
        this.grade_no = grade_no;
    }

    public String getRegister_no() {
        return register_no;
    }

    public void setRegister_no(String register_no) {
        this.register_no = register_no;
    }


    public String getWork_id() {
        return work_id;
    }

    public void setWork_id(String work_id) {
        this.work_id = work_id;
    }

    public String getCourse_no() {
        return course_no;
    }

    public void setCourse_no(String course_no) {
        this.course_no = course_no;
    }

    public Integer getFinal_grade() {
        return final_grade;
    }

    public void setFinal_grade(Integer final_grade) {
        this.final_grade = final_grade;
    }

    public Integer getMakeup_flag() {
        return makeup_flag;
    }

    public void setMakeup_flag(Integer makeup_flag) {
        this.makeup_flag = makeup_flag;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    @Override
    public String toString() {
        return "Grade{" +
                "grade_no=" + grade_no +
                ", register_no='" + register_no + '\'' +
                ", work_id='" + work_id + '\'' +
                ", course_no='" + course_no + '\'' +
                ", final_grade=" + final_grade +
                ", makeup_flag=" + makeup_flag +
                ", student=" + student +
                ", course=" + course +
                ", teacher=" + teacher +
                '}';
    }
}
