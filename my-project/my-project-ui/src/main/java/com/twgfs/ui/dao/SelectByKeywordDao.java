package com.twgfs.ui.dao;

import com.twgfs.domain.entity.Article;
import org.springframework.stereotype.Controller;

import java.util.List;

@Controller
public interface SelectByKeywordDao {

    /*
    * 根据关键字查询相关的信息
    * */
    List<Article> SearchArticle(String keyword);
}
