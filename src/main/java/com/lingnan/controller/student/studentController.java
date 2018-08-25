package com.lingnan.controller.student;

import com.lingnan.bean.Major;
import com.lingnan.bean.Student;
import com.lingnan.bean.Teacher;
import com.lingnan.service.major.majorService;
import com.lingnan.service.student.studentService;
import com.sun.scenario.effect.impl.prism.PrImage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

/**
 * Created By HongJei Lee on 2018/8/24
 */
@Controller
@RequestMapping("/student")
public class studentController {

    @Autowired
    private studentService ss;
    @Autowired
    private majorService ms;

    @RequestMapping("/toList")
    public String toList(ModelMap map){
        List<Student> all = ss.findAll();
        map.put("studentList",all);
        return "student/student-list";
    }

    @RequestMapping("/updateStatus")
    @ResponseBody
    public String updateStatus(@RequestParam(value = "register_no")String register_no,
                               @RequestParam(value = "status")int status){
        return ss.updateStatus(register_no, status);
    }

    @RequestMapping("/toAdd")
    public String toAdd(ModelMap map){
        List<Major> all = ms.findAll();
        map.put("majorList",all);
        return "student/student-add";
    }

    @RequestMapping("/addStudent")
    @ResponseBody
    public String addStudent(Student student, MultipartFile pictureFile)throws IllegalStateException, IOException{
        String flag = null;
        String picName = null;
        String oriName = null;
        String extName = null;

        if(!pictureFile.isEmpty())
        {
            picName = UUID.randomUUID().toString();

            oriName = pictureFile.getOriginalFilename();

            extName = oriName.substring(oriName.lastIndexOf("."));

            student.setS_img(picName+extName);
            flag=ss.addStudent(student);
        }

        if(flag=="1")
        {
            pictureFile.transferTo(new File("I:/IdeaProjects/eduSys/src/main/webapp/images/student/"+picName+extName));
            return "success";
        }
        else
        {
            return "error";
        }
    }

    @RequestMapping("/doUpdate")
    @ResponseBody
    public String doUpdate(Student student, MultipartFile pictureFile) throws IllegalStateException, IOException {

        String flag = null;
        String picName = null;
        String oriName = null;
        String extName = null;

        if (pictureFile!=null) {
            picName = UUID.randomUUID().toString();

            oriName = pictureFile.getOriginalFilename();

            extName = oriName.substring(oriName.lastIndexOf("."));

            student.setS_img(picName + extName);
            flag = ss.updateStudent(student);
        }
        else {
            ss.updateStudent(student);
            return "success";
        }

        if (flag == "1") {
            pictureFile.transferTo(new File("I:/IdeaProjects/eduSys/src/main/webapp/images/student/" + picName + extName));
            return "success";
        }
        else {
            return "error";
        }
    }


    @RequestMapping(value = "/delById",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String delById(@RequestParam(value = "register_no")String register_no){
        return ss.delById(register_no);
    }

    @RequestMapping(value = "/delByIds",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String delByIds(@RequestParam(value = "register_nos")String register_nos[]){
        return ss.delByIds(register_nos);
    }

    @RequestMapping("/toUpdate")
    public String toUpdate(@RequestParam(value = "register_no")String register_no,ModelMap map){
        Student byId = ss.findById(register_no);
        List<Major> all = ms.findAll();
        map.put("majorList",all);
        map.put("student",byId);
        return "student/student-add";
    }
}
