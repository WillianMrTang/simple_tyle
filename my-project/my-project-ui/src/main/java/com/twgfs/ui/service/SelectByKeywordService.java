package com.twgfs.ui.service;

import com.twgfs.domain.entity.Article;

import java.util.List;

public interface SelectByKeywordService {
    /*
    * 根据关键字查询文章
    * */
    List<Article> SearchArticle(String keyword);
}
