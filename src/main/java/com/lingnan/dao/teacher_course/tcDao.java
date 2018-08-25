package com.lingnan.dao.teacher_course;

import com.lingnan.bean.Course;
import com.lingnan.bean.Teacher_Course;

import java.util.List;
import java.util.Map;

/**
 * Created By HongJei Lee on 2018/8/19
 */
public interface tcDao {

    List<Teacher_Course> findAll();

    int addTC(Teacher_Course teacher_course);

    int delById(Integer tc_no);

    int delByIds(String array[]);

    Teacher_Course findById(Integer tc_no);

    int updateTC(Teacher_Course teacher_course);

    int updateStatus(Map<String,Object> map);
}
