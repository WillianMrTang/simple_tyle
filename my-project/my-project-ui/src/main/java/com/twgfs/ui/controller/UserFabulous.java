package com.twgfs.ui.controller;

import com.alibaba.fastjson.JSON;
import com.twgfs.ui.service.UserFabulousService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@Controller
@RequestMapping("/other")
public class UserFabulous {
    @Autowired
    private UserFabulousService userFabulousService;
    /*
    * 异步点赞的实现增加点击量
    * */
    @ResponseBody
    @RequestMapping("/dianzan")
    public void fabulous(String articleid, String fabulous, HttpServletResponse response){
        int fabulousCount = userFabulousService.AddFabulous(articleid,fabulous);
        try {
            response.getWriter().write(JSON.toJSONString(fabulousCount));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    /*
    * 查询总的评论量
    * */
    @ResponseBody
    @RequestMapping("/selectbyarticleid")
    public void selectByArticleid(String articleid,HttpServletResponse response){
        int i = userFabulousService.GetTotalComment(articleid);
        try {
            response.getWriter().write(i+"");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
