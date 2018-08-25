package com.lingnan.service.student;

import com.lingnan.bean.Student;
import com.lingnan.bean.Teacher;
import com.lingnan.dao.student.studentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created By HongJei Lee on 2018/8/24
 */

@Service
public class studentServiceImpl implements studentService {

    @Autowired
    private studentDao sd;


    @Override
    public List<Student> findAll() {
        return sd.findAll();
    }

    @Transactional
    @Override
    public String addStudent(Student student) {
        int i = sd.addStudent(student);
        if (i == 1)
            return "1";
        return "操作失败!";
    }

    @Transactional
    @Override
    public String delById(String id) {
        int i = sd.delById(id);
        if (i == 1)
            return "操作成功!";
        return "操作失败!";
    }

    @Transactional
    @Override
    public String delByIds(String[] array) {
        int i = sd.delByIds(array);
        if (i == 1)
            return "1";
        return "操作失败!";
    }

    @Transactional
    @Override
    public String updateStudent(Student student) {
        int i = sd.updateStudent(student);
        if (i == 1)
            return "1";
        return "操作失败!";
    }

    @Override
    public Student findById(String registered_no) {
        return sd.findById(registered_no);
    }

    @Override
    public String updateStatus(String register_no, int status) {
        Map<String,Object> map = new HashMap<>();
        map.put("register_no",register_no);
        map.put("status",status);
        int i = sd.updateStatus(map);
        if (i == 1)
            return register_no;
        return "操作失败!";
    }
}
