package com.lingnan.service.teacher_course;

import com.lingnan.bean.Course;
import com.lingnan.bean.Teacher_Course;
import com.lingnan.dao.teacher_course.tcDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created By HongJei Lee on 2018/8/23
 */
@Service
public class tcServiceImpl implements tcService{

    @Autowired
    private tcDao tcd;

    @Override
    public List<Teacher_Course> findAll() {
        return tcd.findAll();
    }

    @Transactional
    @Override
    public String addTC(Teacher_Course teacher_course) {
        int i = tcd.addTC(teacher_course);
        if (i == 1)
            return "添加成功";
        return "主键冲突或其他错误";
    }

    @Override
    public String delById(Integer tc_no) {
        int i = tcd.delById(tc_no);
        if (i == 1)
            return "删除成功";
        return "删除失败";
    }

    @Override
    public String delByIds(String[] array) {
        int i = tcd.delByIds(array);
        if (i == 1)
            return "删除成功";
        return "删除失败";
    }

    @Override
    public Teacher_Course findById(Integer tc_no) {
        return tcd.findById(tc_no);
    }

    @Transactional
    @Override
    public String updateTC(Teacher_Course teacher_course) {
        int i = tcd.updateTC(teacher_course);
        if (i == 1)
            return "更新成功";
        return "更新失败";
    }

    @Transactional
    @Override
    public String updateStatus(int tc_no, int status) {
        Map<String,Object> map = new HashMap<>();
        map.put("tc_no",tc_no);
        map.put("status",status);
        int i = tcd.updateStatus(map);
        if (i == 1)
            return String.valueOf(tc_no);
        return "更新失败";
    }
}
