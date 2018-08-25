package com.lingnan.service.course;

import com.lingnan.bean.Course;
import com.lingnan.bean.Major;
import com.lingnan.dao.course.courseDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * Created By HongJei Lee on 2018/8/23
 */
@Service
public class courseServiceImpl implements courseService {

    @Autowired
    private courseDao cd;

    @Override
    public List<Course> findAll() {
        return cd.findAll();
    }

    @Transactional
    @Override
    public int addCourse(Course course) {
        return cd.addCourse(course);
    }

    @Transactional
    @Override
    public int delById(String course_no) {
        return cd.delById(course_no);
    }


    @Transactional
    @Override
    public int delByIds(String[] array) {
        return cd.delByIds(array);
    }

    @Override
    public Course findById(String course_no) {
        return cd.findById(course_no);
    }

    @Transactional
    @Override
    public int updateCourse(Course course) {
        return cd.updateCourse(course);
    }
}
