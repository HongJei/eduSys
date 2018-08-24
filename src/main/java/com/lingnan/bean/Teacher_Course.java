package com.lingnan.bean;

/**
 * Created By HongJei Lee on 2018/8/23
 */
public class Teacher_Course {

    private Integer tc_no;
    private String course_no;
    private String work_id;
    private String launch_year;
    private Integer launch_term;
    private String executed_plan;
    private Integer audit;

    private Course course;
    private Teacher teacher;

    public Teacher_Course() {
    }

    public Teacher_Course(String course_no, String work_id, String launch_year, Integer launch_term, String executed_plan, Integer audit) {
        this.course_no = course_no;
        this.work_id = work_id;
        this.launch_year = launch_year;
        this.launch_term = launch_term;
        this.executed_plan = executed_plan;
        this.audit = audit;
    }

    public Integer getTc_no() {
        return tc_no;
    }

    public void setTc_no(Integer tc_no) {
        this.tc_no = tc_no;
    }

    public String getCourse_no() {
        return course_no;
    }

    public void setCourse_no(String course_no) {
        this.course_no = course_no;
    }

    public String getWork_id() {
        return work_id;
    }

    public void setWork_id(String work_id) {
        this.work_id = work_id;
    }


    public String getLaunch_year() {
        return launch_year;
    }

    public void setLaunch_year(String launch_year) {
        this.launch_year = launch_year;
    }

    public Integer getLaunch_term() {
        return launch_term;
    }

    public void setLaunch_term(Integer launch_term) {
        this.launch_term = launch_term;
    }

    public String getExecuted_plan() {
        return executed_plan;
    }

    public void setExecuted_plan(String executed_plan) {
        this.executed_plan = executed_plan;
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

    public Integer getAudit() {
        return audit;
    }

    public void setAudit(Integer audit) {
        this.audit = audit;
    }

    @Override
    public String toString() {
        return "Teacher_Course{" +
                "tc_no='" + tc_no + '\'' +
                "course_no='" + course_no + '\'' +
                ", work_id='" + work_id + '\'' +
                ", launch_year=" + launch_year +
                ", launch_term=" + launch_term +
                ", executed_plan='" + executed_plan + '\'' +
                ", course='" + course + '\'' +
                ", teacher='" + teacher + '\'' +
                ", audit='" + audit + '\'' +
                '}';
    }
}
