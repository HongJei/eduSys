package com.lingnan.service.major;

import com.lingnan.bean.College;
import com.lingnan.bean.Major;
import com.lingnan.dao.college.collegeDao;
import com.lingnan.dao.major.majorDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created By HongJei Lee on 2018/8/17
 */
@Service
public class MajorServiceImpl implements majorService {
    
    @Autowired
    private majorDao md;
    
    
    @Override
    public List<Major> findAll() {
        return md.findAll();
    }

    @Transactional
    @Override
    public int addMajor(Major major) {
        return md.addMajor(major);
    }

    @Override
    public int delById(String major_no) {
        return md.delById(major_no);
    }

    @Transactional
    @Override
    public int updateStatus(String major_no, int status) {
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("major_no",major_no);
        map.put("status",status);
        return md.updateStatus(map);
    }

    @Transactional
    @Override
    public int delByIds(int[] majIds) {
        return md.delByIds(majIds);
    }

    @Override
    public Major getOneMajor(String major_no) {
        return md.getOneMajor(major_no);
    }

    @Transactional
    @Override
    public int updateMajor(Major major) {
        return md.updateMajor(major);
    }

    @Override
    public List<Major> findByCollegeId(int parentId) {
        return md.findByCollegeId(parentId);
    }


}
