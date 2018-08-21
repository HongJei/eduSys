package com.lingnan.service;

import com.lingnan.bean.Admin;

import java.util.List;

public interface adminService {
    boolean login(Admin admin);

    List<Admin> findAll();

    int addAdmin(Admin admin);

    int delById(String id);

    int delByIds(int ids[]);

    int updateStatus(String id,int status);

    int updateAdmin(Admin admin);

    Admin findById(String id);
}
