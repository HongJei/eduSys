package com.lingnan.controller.major;

import com.lingnan.bean.Major;
import com.lingnan.service.major.majorService;
import org.springframework.beans.factory.annotation.Autowired;
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
@RequestMapping("/major")
public class MajorController {

    @Autowired
    private majorService ms;

    /*获取专业列表*/
    @RequestMapping("/toMajorList")
    public String toMajorList(ModelMap map){
        List<Major> majorList = ms.findAll();
        map.put("majorList",majorList);
        return "major/major-list";
    }

    /*获取专业列表
    * 返回json数据
    * */
    @RequestMapping("/getToJson")
    @ResponseBody
    public List<Major> getToJson(@RequestParam(value = "parentId")int parentId){
        List<Major> majorList = ms.findByCollegeId(parentId);
        return majorList;
    }

    /*跳转到添加页面*/
    @RequestMapping("/toAddMajor")
    public String toAddMajor(){
        return "major/major-add";
    }

    /*添加*/
    @RequestMapping("/addMajor")
    @ResponseBody
    public String addMajor(Major major){
        ms.addMajor(major);
        return "success";
    }

    /*删除*/
    @RequestMapping("/delById")
    @ResponseBody
    public String delById(@RequestParam(value = "major_no")String major_no){
        int i = ms.delById(major_no);
        if (i==1)
            return String.valueOf(major_no);
        else return "error";
    }

    /*批量删除*/
    @RequestMapping("/delByIds")
    @ResponseBody
    public String delByIds(@RequestParam(value = "Ids")int Ids[]){
        int i = ms.delByIds(Ids);
        if (i==1)
            return "success";
        else return "error";
    }

    /*改变专业状态*/
    @RequestMapping("/updateStatus")
    @ResponseBody
    public String updateStatus(@RequestParam(value = "major_no")String major_no
    ,@RequestParam(value = "status",defaultValue = "1")int status){
        int i = ms.updateStatus(major_no,status);
        if (i==1)
            return String.valueOf(major_no);
        else return "error";
    }

    /*获取当前专业信息*/
    @RequestMapping("/getOneMajor")
    @ResponseBody
    public Major getOneMajor(@RequestParam(value = "major_no")String major_no){
        return ms.getOneMajor(major_no);
    }

    /*更新*/
    @RequestMapping("/doUpdate")
    @ResponseBody
    public String doUpdate(Major major){
        int i = ms.updateMajor(major);
        if (i==1)
            return "success";
        else return "error";
    }


}
