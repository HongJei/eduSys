package com.lingnan.service;

import com.lingnan.bean.Admin;
import com.lingnan.dao.admin.adminDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class adminServiceImpl implements adminService {

    @Autowired
    private adminDao adminDao;

    @Override
    public boolean login(Admin admin) {
        Admin ad = adminDao.login(admin);
        if (!ad.getAdminName().equals(admin.getAdminName())){
            return false;
        }
        if (!ad.getAdminPwd().equals(admin.getAdminPwd())){
            return false;
        }
        return true;
    }

    @Override
    public List<Admin> findAll() {
        return adminDao.findAll();
    }

    @Transactional
    @Override
    public int addAdmin(Admin admin) {
        return adminDao.addAdmin(admin);
    }

    @Transactional
    @Override
    public int delById(String id) {
        return adminDao.delById(id);
    }

    @Transactional
    @Override
    public int delByIds(int[] ids) {
        return adminDao.delByIds(ids);
    }

    @Transactional
    @Override
    public int updateStatus(String id, int status) {
        Map<String,Object> map = new HashMap<>();
        map.put("aId",id);
        map.put("status",status);
        return adminDao.updateStatus(map);
    }

    @Transactional
    @Override
    public int updateAdmin(Admin admin) {
        return adminDao.updateAdmin(admin);
    }

    @Override
    public Admin findById(String id) {
        return adminDao.findById(id);
    }
}
