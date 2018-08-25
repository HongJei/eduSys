package com.lingnan.dao.teacher;

import com.lingnan.bean.Admin;
import com.lingnan.bean.Teacher;

import java.util.List;
import java.util.Map;

public interface teacherDao {

    //根据名称查询
    Teacher findByName(String t_name);

    List<Teacher> findAll();

    int addTeacher(Teacher teacher);

    int delById(String id);

    int delByIds(String array[]);

    int updateStatus(Map<String, Object> map);

    int updateTeacher(Teacher teacher);

    Teacher findById(String work_id);


}
