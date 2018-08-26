package com.lingnan.controller.grade;

import com.lingnan.bean.Grade;
import com.lingnan.service.grade.gradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created By HongJei Lee on 2018/8/25
 */
@Controller
@RequestMapping("/grade")
public class gradeController {

    @Autowired
    private gradeService gs;

    @RequestMapping("/toList")
    public String toList(ModelMap map){

        List<Grade> all = gs.findAll();
        map.put("gradeList",all);
        return "grade/grade-list";

    }

    @RequestMapping("/toAdd")
    public String toAdd(){
        return "grade/grade-add";
    }

    @RequestMapping(value = "addGrade",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String addGrade(Grade grade){
        return gs.addGrade(grade);
    }

    @RequestMapping(value = "/doUpdate",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String doUpdate(Grade grade){
        return gs.updateGrade(grade);
    }

    @RequestMapping(value = "/delById",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String delById(@RequestParam(value = "grade_no")String grade_no){
        return gs.delById(grade_no);
    }

    @RequestMapping(value = "/delByIds",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String delByIds(@RequestParam(value = "grade_nos")String grade_nos[]){
        return gs.delByIds(grade_nos);
    }

    @RequestMapping("/updateStatus")
    @ResponseBody
    public String updateStatus(@RequestParam(value = "grade_no")String grade_no,
                               @RequestParam(value = "status")int status){
        return gs.updateStatus(grade_no,status);
    }

    @RequestMapping("/toUpdate")
    public String toUpdate(@RequestParam(value = "grade_no")String grade_no,ModelMap map){
        Grade byId = gs.findById(grade_no);
        map.put("grade",byId);
        return "grade/grade-add";
    }
}
