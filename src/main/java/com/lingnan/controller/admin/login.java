package com.lingnan.controller.admin;

import com.lingnan.bean.Admin;
import com.lingnan.service.adminService;
import com.lingnan.util.RandomValidateCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.Enumeration;
import java.util.List;

@Controller
@RequestMapping("admin")
public class login {

    @Autowired
    private adminService adminService;

    @RequestMapping("/toLogin")
    public String toLogin(){
        return "admin/log&reg/login";
    }


    @RequestMapping("/toMain")
    public String toMain(){
        return "admin/main";
    }

    @RequestMapping("/doLogin")
    @ResponseBody
    public String doLogin(Admin admin, String checkCode, HttpSession session){
        String passCode = (String) session.getAttribute("randomcode_key");
        boolean flag = adminService.login(admin);
        if (flag!=false){
            if (!checkCode.equals(passCode)){
                session.setAttribute("msg","验证码错误!!");
                return null;
            }
            //保存登录信息
            session.setAttribute("adminName",admin.getAdminName());
            return "admin/toMain";
        }else{
            session.setAttribute("msg","账户或者密码错误!!");
            return null;
        }
    }

    /*注销*/
    @RequestMapping("/logOut")
    public String logOut(HttpSession session){
        session.removeAttribute("adminName");
        return "admin/log&reg/login";
    }

    /*获取所有管理员*/
    @RequestMapping("/findAll")
    public String findAll(ModelMap map){
        List<Admin> all = adminService.findAll();
        map.put("adminList",all);
        return "admin/admin-list";
    }

    /*新增页面*/
    @RequestMapping("/toAdd")
    public String toAdd(){
        return "admin/admin-add";
    }

    /*新增管理员*/
    @RequestMapping("/addAdmin")
    @ResponseBody
    public Object addAdmin(Admin admin){
        int i = adminService.addAdmin(admin);
        if (i == 1)
            return admin;
        return null;
    }

    /*修改管理员状态*/
    @RequestMapping("/updateStatus")
    @ResponseBody
    public String updateStatus(@RequestParam(value = "status")int status,
                               @RequestParam(value = "aId")String aId){
        int i = adminService.updateStatus(aId, status);
        if (i == 1)
            return aId;
        return "error";
    }

    /*根据ID删除*/
    @RequestMapping("/delById")
    @ResponseBody
    public String delById(@RequestParam(value = "aId")String aId){
        int i = adminService.delById(aId);
        if (i == 1)
            return aId;
        return "200";
    }

    /*批量删除*/
    @RequestMapping("/delByIds")
    @ResponseBody
    public String delByIds(@RequestParam(value = "Ids")int Ids[]){
        int i = adminService.delByIds(Ids);
        if (i==1)
            return "success";
        return "error";
    }

    /*获取一条数据*/
    @RequestMapping("/toUpdate")
    public String toUpdate(@RequestParam(value = "id")String id,ModelMap map){
        Admin byId = adminService.findById(id);
        map.put("admin",byId);
        return "admin/admin-add";
    }

    @RequestMapping("/doUpdate")
    @ResponseBody
    public Object doUpdate(Admin admin){
        System.out.println("admin = " + admin);
        int i = adminService.updateAdmin(admin);
        if (i==1)
            return "success";
        else return "200";
    }


    /**
     * 获取生成验证码显示到 UI 界面
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @RequestMapping(value="/checkCode")
    public void checkCode(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //设置相应类型,告诉浏览器输出的内容为图片
        response.setContentType("image/jpeg");

        //设置响应头信息，告诉浏览器不要缓存此内容
        response.setHeader("pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expire", 0);

        RandomValidateCode randomValidateCode = new RandomValidateCode();
        try {
            randomValidateCode.getRandcode(request, response);//输出图片方法
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
