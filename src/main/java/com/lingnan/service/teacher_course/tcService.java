package com.lingnan.service.teacher_course;

import com.lingnan.bean.Course;
import com.lingnan.bean.Teacher_Course;

import java.util.List;

/**
 * Created By HongJei Lee on 2018/8/23
 */
public interface tcService {

    List<Teacher_Course> findAll();

    String addTC(Teacher_Course teacher_course);

    String delById(Integer tc_no);

    String delByIds(String array[]);

    Teacher_Course findById(Integer tc_no);

    String updateTC(Teacher_Course teacher_course);

    String updateStatus(int tc_no,int status);

}
