package com.lingnan.dao.course;

import com.lingnan.bean.Course;
import com.lingnan.bean.Major;

import java.util.List;
import java.util.Map;

/**
 * Created By HongJei Lee on 2018/8/19
 */
public interface courseDao {

    List<Course> findAll();

    int addCourse(Course course);

    int delById(String course_no);

    int updateStatus(Map<String, Object> map);

    int delByIds(int array[]);

    Course findById(String course_no);

    int updateCourse(Course course);
}
