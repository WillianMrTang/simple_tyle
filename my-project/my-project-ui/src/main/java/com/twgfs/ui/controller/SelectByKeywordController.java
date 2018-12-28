package com.twgfs.ui.controller;

import com.twgfs.domain.entity.Article;
import com.twgfs.ui.service.SelectByKeywordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/search")
public class SelectByKeywordController {

    @Autowired
    private SelectByKeywordService selectByKeywordService;
    /*
    * 根据关键字查询文章
    */
    @RequestMapping("/search")
    public String searchArticle(String keyword, Model model){
        List<Article> articles = selectByKeywordService.SearchArticle(keyword);
        if (articles == null){
            model.addAttribute("msg","暂无搜索结果");
        }else {
            model.addAttribute("articlinfo", articles);
        }
            return "maincontext/maincontext_index";
    }
}
