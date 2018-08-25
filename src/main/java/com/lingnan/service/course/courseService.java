package com.lingnan.service.course;

import com.lingnan.bean.Course;
import com.lingnan.bean.Major;

import java.util.List;
import java.util.Map;

/**
 * Created By HongJei Lee on 2018/8/23
 */
public interface courseService {

    List<Course> findAll();

    int addCourse(Course course);

    int delById(String course_no);

    int delByIds(String array[]);

    Course findById(String course_no);

    int updateCourse(Course course);

}
