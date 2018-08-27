package com.lingnan.controller.admin.log;

import com.lingnan.bean.Admin;
import com.lingnan.service.adminService;
import com.lingnan.util.RandomValidateCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created By HongJei Lee on 2018/8/27
 */
@Controller
@RequestMapping("/log")
public class loginController {

    @Autowired
    private adminService as;

    @RequestMapping("/toLogin")
    public String toLogin(){
        return "admin/login/login";
    }


    @RequestMapping(value = "/doLogin",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String doLogin(Admin admin, String checkCode, HttpSession session, HttpServletRequest request){
        String passCode = (String) session.getAttribute("randomcode_key");
        if (!checkCode.equals(passCode)){
            return "验证码错误!!";
        }else {
            //保存登录信息
            session.setAttribute("adminName",admin.getAdminName());
            //保存IP信息
            return as.login(admin);
        }
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
