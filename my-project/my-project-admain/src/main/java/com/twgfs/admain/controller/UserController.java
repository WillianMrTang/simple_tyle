package com.twgfs.admain.controller;

import com.twgfs.admain.service.UsersServic;
import com.twgfs.commons.staticconst.StaticConst;
import com.twgfs.domain.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UsersServic usersServic;

    /*
    * 查询所有用户信息展示
    * */
    @GetMapping("/userlist")
    public String UserList(String currentPages,Model model){
        if (currentPages == null){
            currentPages = 1+"";
        }
        List<User> users = usersServic.SelectAllUser(currentPages);
        String totalPage = usersServic.getTotalPage();
        int currentPage=Integer.parseInt(currentPages);
        model.addAttribute("page",currentPage);
        model.addAttribute("totalpage",totalPage);
        model.addAttribute("userlist",users);
        return "user/userlist";

    }
    /*
    * 编辑用户信息
    * */
    @RequestMapping("/addnewuser")
    public String EditUser(){
        return "user/adduser";
    }

    /*
   * 异步校验功能
   * */
    @RequestMapping("/chekname")
    public void ChekName(String username, HttpServletResponse response){
        String s = usersServic.ConfirmName(username);
        try {
            response.getWriter().write(s);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /*
    * 添加新用户
    * */
    @RequestMapping("/user/adduser")
    public String AddUser(User user,Model model,RedirectAttributes redirectAttributes){
//        System.out.println(user.getEmail()+user.getPhone()+user.getPassword()+user.getUsername()+"+++++++");
        int i = usersServic.AddNewUserAtBack(user);
        if (i == StaticConst.ADD_USER_SUCCESS){
            redirectAttributes.addFlashAttribute("msg","成功添加用户名为"+user.getUsername()+"的用户");
            return "redirect:/user/userlist";
        }else {
            model.addAttribute("msg","添加用户失败，请重试");
        return "";
        }
    }
    /*
    * 编辑用户信息
    * */
    @RequestMapping("/edituser")
    public String EidtUser(String editId,Model model){
        //根据id查询要修改的用户信息
        User user = usersServic.SelectSingChangeUser(editId);
        if (user != null){
            model.addAttribute("singleuser",user);
            return "user/editolduser";
        }else{
            model.addAttribute("msg","该用户不存在！请确认用户是否存在后在做修改！");
            return "user/editolduser";
        }
    }
    /*
    * 正式更新用户信息
    * */
    @RequestMapping("/updateuser")
    public String UpdateUser(User user, RedirectAttributes redirectAttributes){
//        System.out.println(user.getEmail()+user.getPhone()+user.getPassword()+user.getUsername()+"++++++"+user.getId()+"+++++++");
        String s = usersServic.UpdateUserInfomation(user);
        redirectAttributes.addFlashAttribute("msg",s);
        return "redirect:/user/userlist";
    }
    /*
    * 删除和编辑用户信息
    * */
    @RequestMapping("/delandchange")
    public String DelAndChangeUser(){
        return "/user/delandedit";
    };

    /*
    * 删除根据传入的id或者用户名的用户信息
    * */
    @RequestMapping("/deluser")
    public String DelUserInfo(String idorname,Model model,RedirectAttributes redirectAttributes){
        int i = usersServic.DelUserInformation(idorname);
        if (i == StaticConst.DELETE_USER_SUCCESS){
            redirectAttributes.addFlashAttribute("msg","删除用户为"+idorname+"的成功^v^");
            return "redirect:/user/userlist";
        }
        model.addAttribute("msg","用户走丢了，该用户好像不存在,请重试<=_=>。。。");
        return "/user/delandedit";
    }

    /*
    * 关键字搜索相关用户
    * */
    @RequestMapping("/searchsuser")
    public String SearchUserByFild(String searchfild,Model model){
        List<User> users = usersServic.SearchUserInformationByFild(searchfild);
        if (users != null){
//        System.out.println(users+"===============================");
            model.addAttribute("userlist",users);
            return "user/userlist";
        }else {
            model.addAttribute("msg","没有该用户的相关数据。。。。@v@?");
        }
        return "user/userlist";
    }
}
