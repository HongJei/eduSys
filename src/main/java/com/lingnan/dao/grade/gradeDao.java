package com.lingnan.dao.grade;

import com.lingnan.bean.Course;
import com.lingnan.bean.Grade;

import java.util.List;
import java.util.Map;

/**
 * Created By HongJei Lee on 2018/8/19
 */
public interface gradeDao {

    List<Grade> findAll();

    int addGrade(Grade grade);

    int delById(String grade_no);

    int delByIds(String array[]);

    Grade findById(String grade_no);

    int updateGrade(Grade grade);

    int updateStatus(Map<String, Object> map);
}
