package com.lingnan.dao.student;

import com.lingnan.bean.Student;
import com.lingnan.bean.Teacher;

import java.util.List;
import java.util.Map;

public interface studentDao {

    List<Student> findAll();

    int addStudent(Student student);

    int delById(String id);

    int delByIds(String array[]);

    int updateStudent(Student student);

    Student findById(String register_no);

    int updateStatus(Map<String,Object> map);
}
