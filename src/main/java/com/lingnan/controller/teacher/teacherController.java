package com.lingnan.controller.teacher;

import com.lingnan.bean.College;
import com.lingnan.bean.Teacher;
import com.lingnan.service.college.collegeService;
import com.lingnan.service.teacher.teacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

/**
 * Created By HongJei Lee on 2018/8/21
 */
@Controller
@RequestMapping("/teacher")
public class teacherController {

    @Autowired
    private teacherService ts;
    @Autowired
    private collegeService cs;

    @RequestMapping("/getList")
    public String getList(ModelMap map){
        List<Teacher> all = ts.findAll();
        map.put("teacherList",all);
        return "teacher/teacher-list";
    }

    /*添加教师页面*/
    @RequestMapping("/toAddTeacher")
    public String toAddTeacher(ModelMap map){
        List<College> all = cs.findAll();
        map.put("collegeList",all);
        return "teacher/teacher-add";
    }

    /*添加教师*/
    @RequestMapping("/addTeacher")
    @ResponseBody
    public String addTeacher(Teacher teacher,  MultipartFile pictureFile) throws IllegalStateException, IOException {

        int flag = 0;
        String picName = null;
        String oriName = null;
        String extName = null;

        if(!pictureFile.isEmpty())
        {
            picName = UUID.randomUUID().toString();

            oriName = pictureFile.getOriginalFilename();

            extName = oriName.substring(oriName.lastIndexOf("."));

            teacher.setT_img(picName+extName);
            flag=ts.addTeacher(teacher);
        }

        if(flag==1)
        {
            pictureFile.transferTo(new File("I:/IdeaProjects/eduSys/src/main/webapp/images/teacher/"+picName+extName));
            return "success";
        }
        else
        {
            return "error";
        }
    }


}
