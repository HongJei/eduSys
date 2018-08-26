package com.lingnan.bean;

import java.util.Date;

public class Server {

    private Integer s_id;
    private String s_ip;
    private String s_ntime;
    private String s_otime;
    private Integer s_num;

    public Server() {
    }

    public Server(Integer s_id, String s_ip, String s_ntime, String s_otime, Integer s_num) {
        this.s_id = s_id;
        this.s_ip = s_ip;
        this.s_ntime = s_ntime;
        this.s_otime = s_otime;
        this.s_num = s_num;
    }

    public Integer getS_id() {
        return s_id;
    }

    public void setS_id(Integer s_id) {
        this.s_id = s_id;
    }

    public String getS_ip() {
        return s_ip;
    }

    public void setS_ip(String s_ip) {
        this.s_ip = s_ip;
    }

    public String getS_ntime() {
        return s_ntime;
    }

    public void setS_ntime(String s_ntime) {
        this.s_ntime = s_ntime;
    }

    public String getS_otime() {
        return s_otime;
    }

    public void setS_otime(String s_otime) {
        this.s_otime = s_otime;
    }

    public Integer getS_num() {
        return s_num;
    }

    public void setS_num(Integer s_num) {
        this.s_num = s_num;
    }

    @Override
    public String toString() {
        return "Server{" +
                "s_id=" + s_id +
                ", s_ip='" + s_ip + '\'' +
                ", s_ntime='" + s_ntime + '\'' +
                ", s_otime='" + s_otime + '\'' +
                ", s_num=" + s_num +
                '}';
    }
}
