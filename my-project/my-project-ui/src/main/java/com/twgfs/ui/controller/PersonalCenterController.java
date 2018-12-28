package com.twgfs.ui.controller;

import com.twgfs.domain.entity.Article;
import com.twgfs.domain.entity.Collectionentitys;
import com.twgfs.domain.entity.User;
import com.twgfs.ui.service.PersonalCenterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/percenter")
public class PersonalCenterController {

    @Autowired
    private PersonalCenterService personalCenterService;
    /*
    * 查询后去往个人中心展示个人的数据
    * */
    @GetMapping("/topersonal")
    public String personal(Model model,String userid){
        List<Article> articles = personalCenterService.SelectById(userid);
        model.addAttribute("articleslist",articles);
        List<Collectionentitys> collections = personalCenterService.SelectConllection(userid);
        model.addAttribute("collections",collections);
        return "maincontext/maincontext_personal";
    }
    /*
    * 点击收藏是收藏点击的文章
    * */
    @RequestMapping("/collection")
    public String collection(String aid, String uid, HttpServletRequest request,Model model){
        if ("kong".equals(uid)){
            User userinfo = (User) request.getSession().getAttribute("userinfo");
            uid = userinfo.getId()+"";
        }
        int i = personalCenterService.AddCollection(aid, uid);
        if (i == 1){
            model.addAttribute("message","已收藏，请前往个人中心查看");
            return "maincontext/maincontext_index";
        }else {
        return "errorandbulding/404";
        }
    }
    @GetMapping("/remvoe")
    public String removeEssay(String essayid, String userid,Model model){
        int i = personalCenterService.removEssayById(essayid, userid);
       if (i == 1){
           model.addAttribute("message","移出收藏夹成功");
       }else {
           model.addAttribute("message","未能移出收藏夹，请检查你的网络状态！");
       }
       return "/maincontext/maincontext_personal";
    }
}
