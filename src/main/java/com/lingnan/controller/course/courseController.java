package com.lingnan.controller.course;

import com.lingnan.bean.Course;
import com.lingnan.bean.Major;
import com.lingnan.service.course.courseService;
import com.lingnan.service.major.majorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created By HongJei Lee on 2018/8/23
 */
@Controller
@RequestMapping("/course")
public class courseController {

    @Autowired
    private courseService cs;
    @Autowired
    private majorService ms;

    @RequestMapping("/toList")
    public String toList(ModelMap map){
        List<Course> all = cs.findAll();
        map.put("courseList",all);
        return "course/course-list";
    }

    @RequestMapping("/toAdd")
    public String toAdd(ModelMap modelMap){
        List<Major> all = ms.findAll();
        modelMap.put("majorList",all);
        return "course/course-add";
    }

    @RequestMapping("/delById")
    @ResponseBody
    public String delById(@RequestParam(value = "course_no")String course_no){
        int i = cs.delById(course_no);
        if (i ==1 )
            return "success";
        return "error";
    }


    @RequestMapping("/delByIds")
    @ResponseBody
    public String delByIds(@RequestParam(value = "course_nos")int course_nos[]){
        int i = cs.delByIds(course_nos);
        if (i ==1 )
            return "success";
        return "error";
    }

    @RequestMapping("/doAdd")
    @ResponseBody
    public String doAdd(Course course){
        int i = cs.addCourse(course);
        if (i == 1)
            return "success";
        return "error";
    }

    @RequestMapping("/toUpdate")
    public String tpUpdate(@RequestParam(value = "course_no")String course_no,ModelMap map){
        Course byId = cs.findById(course_no);
        List<Major> all = ms.findAll();
        map.put("majorList",all);
        map.put("course",byId);
        return "course/course-add";
    }

    @RequestMapping("/doUpdate")
    @ResponseBody
    public String doUpdate(Course course){
        int i = cs.updateCourse(course);
        if (i == 1)
            return "success";
        return "error";
    }



}
