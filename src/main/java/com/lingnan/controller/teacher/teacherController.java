package com.lingnan.controller.teacher;

import com.lingnan.bean.Teacher;
import com.lingnan.service.teacher.teacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created By HongJei Lee on 2018/8/21
 */
@Controller
@RequestMapping("/teacher")
public class teacherController {

    @Autowired
    private teacherService ts;

    @RequestMapping("/getList")
    public String getList(ModelMap map){
        List<Teacher> all = ts.findAll();
        map.put("teacherList",all);
        return "teacher/teacher-list";
    }


}
