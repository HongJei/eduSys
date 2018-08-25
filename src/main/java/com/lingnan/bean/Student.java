package com.lingnan.bean;

import java.util.Date;

/**
 * Created By HongJei Lee on 2018/8/24
 */
public class Student {

    private String register_no;
    private String major_no;
    private String s_name;
    private String s_gender;
    private String s_img;
    private String s_dateofbirth;
    private Integer s_class;
    private String s_address;
    private String s_tele;
    private String s_email;
    private String graduation;

    private Major major;

    public Student() {
    }

    public Student(String register_no, String major_no, String s_name,
                   String s_gender, String s_img, String s_dateofbirth, Integer s_class,
                   String s_address, String graduation, String s_tele, String s_email
                   ) {
        this.register_no = register_no;
        this.major_no = major_no;
        this.s_name = s_name;
        this.s_gender = s_gender;
        this.s_img = s_img;
        this.s_dateofbirth = s_dateofbirth;
        this.s_class = s_class;
        this.s_address = s_address;
        this.graduation = graduation;
        this.s_tele = s_tele;
        this.s_email = s_email;
    }

    public String getRegister_no() {
        return register_no;
    }

    public void setRegister_no(String register_no) {
        this.register_no = register_no;
    }

    public String getMajor_no() {
        return major_no;
    }

    public void setMajor_no(String major_no) {
        this.major_no = major_no;
    }

    public String getS_name() {
        return s_name;
    }

    public void setS_name(String s_name) {
        this.s_name = s_name;
    }

    public String getS_gender() {
        return s_gender;
    }

    public void setS_gender(String s_gender) {
        this.s_gender = s_gender;
    }

    public String getS_dateofbirth() {
        return s_dateofbirth;
    }

    public void setS_dateofbirth(String s_dateofbirth) {
        this.s_dateofbirth = s_dateofbirth;
    }

    public Integer getS_class() {
        return s_class;
    }

    public void setS_class(Integer s_class) {
        this.s_class = s_class;
    }

    public String getS_address() {
        return s_address;
    }

    public void setS_address(String s_address) {
        this.s_address = s_address;
    }

    public String getS_tele() {
        return s_tele;
    }

    public void setS_tele(String s_tele) {
        this.s_tele = s_tele;
    }

    public String getS_email() {
        return s_email;
    }

    public void setS_email(String s_email) {
        this.s_email = s_email;
    }

    public Major getMajor() {
        return major;
    }

    public void setMajor(Major major) {
        this.major = major;
    }

    public String getS_img() {
        return s_img;
    }

    public void setS_img(String s_img) {
        this.s_img = s_img;
    }

    public String getGraduation() {
        return graduation;
    }

    public void setGraduation(String graduation) {
        this.graduation = graduation;
    }

    @Override
    public String toString() {
        return "Student{" +
                "register_no='" + register_no + '\'' +
                ", major_no='" + major_no + '\'' +
                ", s_name='" + s_name + '\'' +
                ", s_gender='" + s_gender + '\'' +
                ", s_img='" + s_img + '\'' +
                ", s_dateofbirth=" + s_dateofbirth +
                ", s_class=" + s_class +
                ", s_address='" + s_address + '\'' +
                ", s_tele='" + s_tele + '\'' +
                ", s_email='" + s_email + '\'' +
                ", major=" + major +
                ", graduation=" + graduation +
                '}';
    }
}
