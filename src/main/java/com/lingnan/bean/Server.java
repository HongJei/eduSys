package com.lingnan.bean;

import java.util.Date;

public class Server {
    private Integer sId;
    private String sIp;
    private Date snTime;
    private Date soTime;
    private Integer sNum;

    public Integer getsId() {
        return sId;
    }

    public void setsId(Integer sId) {
        this.sId = sId;
    }

    public String getsIp() {
        return sIp;
    }

    public void setsIp(String sIp) {
        this.sIp = sIp;
    }

    public Date getSnTime() {
        return snTime;
    }

    public void setSnTime(Date snTime) {
        this.snTime = snTime;
    }

    public Date getSoTime() {
        return soTime;
    }

    public void setSoTime(Date soTime) {
        this.soTime = soTime;
    }

    public Integer getsNum() {
        return sNum;
    }

    public void setsNum(Integer sNum) {
        this.sNum = sNum;
    }

    @Override
    public String toString() {
        return "Server{" +
                "sId=" + sId +
                ", sIp='" + sIp + '\'' +
                ", snTime=" + snTime +
                ", soTime=" + soTime +
                ", sNum=" + sNum +
                '}';
    }


}
