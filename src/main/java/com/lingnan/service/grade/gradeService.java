package com.lingnan.service.grade;

import com.lingnan.bean.Course;
import com.lingnan.bean.Grade;

import java.util.List;

/**
 * Created By HongJei Lee on 2018/8/25
 */
public interface gradeService {

    List<Grade> findAll();

    String addGrade(Grade grade);

    String delById(String grade_no);

    String delByIds(String array[]);

    Grade findById(String grade_no);

    String updateGrade(Grade grade);

    String updateStatus(String grade_no, int status);
}
