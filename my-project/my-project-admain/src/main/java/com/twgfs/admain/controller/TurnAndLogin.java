package com.twgfs.admain.controller;

import com.twgfs.admain.service.LoginService;
import com.twgfs.domain.entity.Admainuser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class TurnAndLogin {

    @Autowired
    private LoginService loginService;
    /*
    * 首页跳转
    * */
    @RequestMapping("/index")
    public String ToIndex(){
        return "index";
    }

    /*
    * 登录页跳转
    * */
    @RequestMapping("")
    public String ToLogin(){
        return "login";
    }

    /*
    * 登录校验两个参数用户名和密码
    * */
    @RequestMapping("/login")
    public String AdminLogin(String admin , String pwd, HttpServletRequest request, Model model){
        Admainuser admainuser = loginService.CheckAdmainLogin(admin, pwd);
        request.getSession().setAttribute("admain",admainuser);
        //System.out.println(admainuser);
        if (admainuser != null){
            return "redirect:/index";
        }
        model.addAttribute("msg","用户名或密码错误！");
        return "login";
    }
    /*
    * 注销用户账户
    * */
    @GetMapping("/logout")
    public String LogOut(HttpServletRequest request){
        request.getSession().invalidate();
        System.out.println("成功注销！");
        return "login";
    }
}
