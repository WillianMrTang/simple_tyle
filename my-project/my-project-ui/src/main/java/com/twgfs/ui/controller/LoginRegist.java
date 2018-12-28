package com.twgfs.ui.controller;

import com.twgfs.commons.utils.BeanValidator;
import com.twgfs.domain.entity.User;
import com.twgfs.ui.service.LoginRegistService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping("/logregist")
public class LoginRegist {

    @Autowired
    private LoginRegistService loginRegistService;
    /*
    * 首页跳转
    * */
    @RequestMapping("/")
    public String toindex(){
       return "index";
    }

    /*
    * 注册功能
    * */
    @RequestMapping("/regist")
    public String regist(User user, Model model){
        String result = BeanValidator.validator(user);
        int flag = loginRegistService.ToRegist(user);
        model.addAttribute("validatemsg",result);
        System.out.println(result+"=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-");
        return "index";
    }

    /*
    * 登录功能
    * */
    @RequestMapping("/login")
    public String regist(String username,String password,Model model,HttpServletRequest request){
        User user = loginRegistService.ToLogin(username, password);
        /*
        * 将用户的相关信息存放到session中方便获取使用
        * */
        if (user != null){
        request.getSession().setAttribute("userinfo",user);
        model.addAttribute("loginmsg",user);
        return "index";
        }else {
            model.addAttribute("loginmsg",null);
            return "index";
        }
    }
    /*
    * 异步校验功能
    * */
    @RequestMapping("/chekname")
    public void chekName(String username, HttpServletResponse response){
        String s = loginRegistService.ConfirmName(username);
        try {
            response.getWriter().write(s);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    /*
    * 注销用户
    * */
    @RequestMapping("/logout")
    public String logOut(HttpServletRequest request){
        request.getSession().removeAttribute("loginmsg");
        request.getSession().invalidate();
        System.out.println("已经注销");
        return "redirect:/logregist/";
    }
}
