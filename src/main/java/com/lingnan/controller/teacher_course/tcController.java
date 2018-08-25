package com.lingnan.controller.teacher_course;

import com.lingnan.bean.Course;
import com.lingnan.bean.Teacher;
import com.lingnan.bean.Teacher_Course;
import com.lingnan.service.course.courseService;
import com.lingnan.service.teacher.teacherService;
import com.lingnan.service.teacher_course.tcService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created By HongJei Lee on 2018/8/23
 */
@Controller
@RequestMapping("/tc")
public class tcController {

    @Autowired
    private tcService tcs;
    @Autowired
    private courseService cs;
    @Autowired
    private teacherService ts;

    @RequestMapping("/toList")
    public String toList(ModelMap map) {
        List<Teacher_Course> all = tcs.findAll();
        map.put("tcList", all);
        return "teacher_course/tc-list";
    }

    @RequestMapping("/findById")
    public String findById(@RequestParam(value = "tc_no")int tc_no,ModelMap map){
        Teacher_Course byId = tcs.findById(tc_no);
        List<Course> all1 = cs.findAll();
        List<Teacher> all2 = ts.findAll();
        map.put("courseList",all1);
        map.put("teacherList",all2);
        map.put("tc",byId);
        return "teacher_course/tc-add";
    }

    @RequestMapping("/delById")
    @ResponseBody
    public String delById(@RequestParam(value = "tc_no")int tc_no){
        return tcs.delById(tc_no);
    }

    @RequestMapping(value = "/delByIds")
    @ResponseBody
    public String delByIds(@RequestParam(value = "tc_nos")String tc_nos[]){
        return tcs.delByIds(tc_nos);
    }

    @RequestMapping("/toAdd")
    public String toAdd(ModelMap map){
        List<Course> all = cs.findAll();
        List<Teacher> all1 = ts.findAll();
        map.put("courseList",all);
        map.put("teacherList",all1);
        return "teacher_course/tc-add";
    }

    @RequestMapping("/addTC")
    @ResponseBody
    public String addTC(Teacher_Course teacher_course){
        return tcs.addTC(teacher_course);
    }

    @RequestMapping("/updateStatus")
    @ResponseBody
    public String updateStatus(@RequestParam(value = "tc_no")int tc_no,
                               @RequestParam(value = "status")int status){
        return tcs.updateStatus(tc_no,status);
    }

    @RequestMapping("/updateTC")
    @ResponseBody
    public String updateTC(Teacher_Course teacher_course){
        return tcs.updateTC(teacher_course);
    }

}
