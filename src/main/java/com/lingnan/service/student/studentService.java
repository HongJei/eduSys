package com.lingnan.service.student;

import com.lingnan.bean.Student;
import com.lingnan.bean.Teacher;

import java.util.List;
import java.util.Map;

/**
 * Created By HongJei Lee on 2018/8/24
 */
public interface studentService {

    List<Student> findAll();

    String addStudent(Student student);

    String delById(String id);

    String delByIds(String array[]);

    String updateStudent(Student student);

    Student findById(String register_no);

    String updateStatus(String register_no,int status);
}
