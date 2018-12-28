package com.twgfs.admain.controller;

import com.alibaba.fastjson.JSON;
import com.twgfs.admain.service.CommentService;
import com.twgfs.domain.entity.Comment;
import com.twgfs.domain.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;
    /*
    * 查询所有评论，跳转到评论页面
    * */
    @RequestMapping("/tocomment")
    public String ToComment(Model model){
        List<Comment> commet = commentService.getCommet();
        if (commet == null){
            model.addAttribute("msg","<->_<->~~暂无任何评论");
        }else {
            model.addAttribute("commentlist",commet);
        }
        return "/comment/commentlist";
    }

    @RequestMapping("/toTest")
    public String toTest(){
        return "test";
    }

    @ResponseBody
    @RequestMapping("/gettotal")
    public String  Gettotal(){
        int totalCount = commentService.getTotalCount();
        String s = totalCount+"";
        return s;
    }

    @ResponseBody
    @RequestMapping("/getTotal")
//    /getTotal",{"currentPage":currentPage
    public void  GetTotal(String currentpage,String pagesize ,HttpServletResponse response){
//        System.out.println(currentpage+"======================="+pagesize);
        //设置响应头改变响应编码格式
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        List<Comment> users = commentService.SelectAllByPage(currentpage, pagesize);
        String userstring = JSON.toJSONString(users);
        try {
            response.getWriter().write(userstring);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    /*
    * 根据评论id删除评论信息
    * */
    @RequestMapping("/delcomment")
    public String DelCommentById(String delid, RedirectAttributes redirectAttributes){
        int i = commentService.DelCommetiion(delid);
        if (i == 1){
            redirectAttributes.addFlashAttribute("msg","删除评论成功！！");
        }else {
            redirectAttributes.addFlashAttribute("msg","该评论太顽强了根本无法删除！");
        }
        return "redirect:/comment/tocomment";
    }
}
