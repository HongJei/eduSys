package com.lingnan.dao.admin;

import com.lingnan.bean.Admin;

import java.util.List;
import java.util.Map;

public interface adminDao {
    //登录

    //根据名称查询
    Admin findByName(String adminName);
    //登录
    Admin login(Admin admin);

    List<Admin> findAll();

    int addAdmin(Admin admin);

    int delById(String id);

    int delByIds(int array[]);

    int updateStatus(Map<String,Object> map);

    int updateAdmin(Admin admin);

    Admin findById(String aId);


}
