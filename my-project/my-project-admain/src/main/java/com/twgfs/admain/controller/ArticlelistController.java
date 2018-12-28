package com.twgfs.admain.controller;

import com.twgfs.admain.service.ArticlelistService;
import com.twgfs.commons.staticconst.StaticConst;
import com.twgfs.domain.entity.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/articles")
public class ArticlelistController {

    @Autowired
    private ArticlelistService articlelistService;

    /*
    * 查询所有文章
    * */
    @GetMapping("/toarticlelist")
    public String Toarticlelist(Model model){
        List<Article> articles = articlelistService.SelectAllArticle();
        model.addAttribute("articlelist",articles);
        return "articles/articlelist";
    }
    /*
    * 根据id查询单篇文章信息
    * */
    //selectbyid?id=${listarticle.id}
    @RequestMapping("/selectbyid")
    public String SelectArtById(String id,Model model){
        Article article = articlelistService.SelectById(id);
        model.addAttribute("article",article);
        return "/articles/articledetail";
    }

    /*
    * 根据id删除用户信息
    * */
    @RequestMapping("/delbyid")
    public String DeleteById(String did, RedirectAttributes redirectAttributes){
        int i = articlelistService.DeleteById(did);
        if (i == StaticConst.DELETE_USER_SUCCESS){
            redirectAttributes.addFlashAttribute("msg","删除文章成功");
        }else {
            redirectAttributes.addFlashAttribute("msg","删除文章失败");
        }
        return "redirect:/articles/toarticlelist";
    }
}
