package com.lingnan.service.teacher;

import com.lingnan.bean.Teacher;

import java.util.List;
import java.util.Map;

/**
 * Created By HongJei Lee on 2018/8/21
 */
public interface teacherService {

    Teacher findByName(String t_name);

    List<Teacher> findAll();

    int addTeacher(Teacher teacher);

    int delById(String id);

    int delByIds(String array[]);

    int updateStatus(String work_id,String status);

    int updateTeacher(Teacher teacher);

    Teacher findById(String work_id);

}
