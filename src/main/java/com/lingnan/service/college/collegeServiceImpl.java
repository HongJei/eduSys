package com.lingnan.service.college;

import com.lingnan.bean.College;
import com.lingnan.dao.college.collegeDao;
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
public class collegeServiceImpl implements collegeService {
    
    @Autowired
    private collegeDao cd;
    
    
    @Override
    public List<College> findAll() {
        List<College> collegeList = cd.findAll();
        return collegeList;
    }

    @Transactional
    @Override
    public int addCollege(College college) {
        return cd.addCollege(college);
    }

    @Override
    public int delByColId(String college_no) {
        return cd.delByColId(college_no);
    }

    @Transactional
    @Override
    public int updateStatus(String college_no, int status) {
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("college_no",college_no);
        map.put("status",status);
        return cd.updateStatus(map);
    }

    @Transactional
    @Override
    public int delByColIds(int[] colIds) {
        return cd.delByColIds(colIds);
    }

    @Override
    public College getOneCol(String college_no) {
        return cd.getOneCol(college_no);
    }

    @Override
    public int updateCollege(College college) {
        return cd.updateCollege(college);
    }


}
