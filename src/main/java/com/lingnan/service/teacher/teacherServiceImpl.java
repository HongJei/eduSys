package com.lingnan.service.teacher;

import com.lingnan.bean.Teacher;
import com.lingnan.dao.teacher.teacherDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created By HongJei Lee on 2018/8/21
 */
@Service
public class teacherServiceImpl implements teacherService {

    @Autowired
    private teacherDao td;

    @Override
    public Teacher findByName(String t_name) {
        return td.findByName(t_name);
    }

    @Override
    public List<Teacher> findAll() {
        return td.findAll();
    }

    @Transactional
    @Override
    public int addTeacher(Teacher teacher) {
        return td.addTeacher(teacher);
    }

    @Transactional
    @Override
    public int delById(String id) {
        return td.delById(id);
    }

    @Transactional
    @Override
    public int delByIds(int[] array) {
        return td.delByIds(array);
    }
    @Transactional
    @Override
    public int updateStatus(String work_id, String status) {
        Map<String,Object> map = new HashMap<>();
        map.put("work_id",work_id);
        map.put("t_status",status);
        return td.updateStatus(map);
    }


    @Transactional
    @Override
    public int updateTeacher(Teacher teacher) {
        return td.updateTeacher(teacher);
    }

    @Override
    public Teacher findById(String work_id) {
        return td.findById(work_id);
    }
}
