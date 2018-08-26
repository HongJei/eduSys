package com.lingnan.service.grade;

import com.lingnan.bean.Grade;
import com.lingnan.dao.grade.gradeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created By HongJei Lee on 2018/8/25
 */
@Service
public class gradeServiceImpl implements gradeService{

    @Autowired
    private gradeDao gd;

    @Override
    public List<Grade> findAll() {
        return gd.findAll();
    }

    @Transactional
    @Override
    public String addGrade(Grade grade) {
        int i = gd.addGrade(grade);
        if (i == 1)
            return "添加成功";
        return "添加失败";
    }

    @Transactional
    @Override
    public String delById(String grade_no) {
        int i = gd.delById(grade_no);
        if (i == 1)
            return "删除成功";
        return "删除失败";
    }

    @Transactional
    @Override
    public String delByIds(String[] array) {
        int i = gd.delByIds(array);
        if (i == 1)
            return "删除成功";
        return "删除失败";
    }

    @Override
    public Grade findById(String grade_no) {
        return gd.findById(grade_no);
    }

    @Transactional
    @Override
    public String updateGrade(Grade grade) {
        int i = gd.updateGrade(grade);
        if (i == 1)
            return "更新成功";
        return "更新失败";
    }

    @Transactional
    @Override
    public String updateStatus(String grade_no, int status) {
        Map<String,Object> map = new HashMap<>();
        map.put("grade_no",grade_no);
        map.put("status",status);
        int i = gd.updateStatus(map);
        if (i == 1)
            return grade_no;
        return "更新失败";
    }
}
