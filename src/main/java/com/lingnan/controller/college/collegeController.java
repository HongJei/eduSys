package com.lingnan.controller.college;

import com.lingnan.bean.College;
import com.lingnan.service.college.collegeService;
import com.sun.scenario.effect.impl.prism.PrImage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created By HongJei Lee on 2018/8/17
 */
@Controller
@RequestMapping("/college")
public class collegeController {

    @Autowired
    private collegeService cs;

    /*获取学院列表*/
    @RequestMapping("/toCollegeList")
    public String toCollegeList(ModelMap map){
        List<College> collegeList = cs.findAll();
        map.put("collegeList",collegeList);
        return "college/college-list";
    }

    /*跳转到添加页面*/
    @RequestMapping("/toAddCollege")
    public String toAddCollege(){
        return "college/college-add";
    }

    /*添加*/
    @RequestMapping("/addCollege")
    @ResponseBody
    public String addCollege(College college){
        cs.addCollege(college);
        return "success";
    }

    /*删除*/
    @RequestMapping("/delByColId")
    @ResponseBody
    public String delByColId(@RequestParam(value = "college_no")String college_no){
        int i = cs.delByColId(college_no);
        if (i==1)
            return String.valueOf(college_no);
        else return "error";
    }

    /*批量删除*/
    @RequestMapping("/delByIds")
    @ResponseBody
    public String delByColIds(@RequestParam(value = "colIds")int colIds[]){
        int i = cs.delByColIds(colIds);
        if (i==1)
            return "success";
        else return "error";
    }

    /*改变学院状态*/
    @RequestMapping("/updateStatus")
    @ResponseBody
    public String updateStatus(@RequestParam(value = "college_no")String college_no
    ,@RequestParam(value = "status")int status){
        int i = cs.updateStatus(college_no,status);
        if (i==1)
            return String.valueOf(college_no);
        else return "error";
    }

    /*获取当前学院信息*/
    @RequestMapping("/getOneCol")
    @ResponseBody
    public College getOneCol(@RequestParam(value = "college_no")String college_no){
        College oneCol = cs.getOneCol(college_no);
        return oneCol;
    }

    /*更新*/
    @RequestMapping("/doUpdate")
    @ResponseBody
    public String doUpdate(College college){
        int i = cs.updateCollege(college);
        if (i==1)
            return "success";
        else return "error";
    }

    @RequestMapping("/toUpdate")
    public String toUpdate(@RequestParam(value = "college_no")String college_no,ModelMap map){
        College oneCol = cs.getOneCol(college_no);
        map.put("college",oneCol);
        return "college/college-add";
    }


}
