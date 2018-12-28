package com.twgfs.admain.service;

import com.twgfs.domain.entity.Article;

import java.util.List;

public interface ArticlelistService {
    /*
    * 查询所有的文章
    * */
    List<Article> SelectAllArticle();
    /*
    * 根据文章的id查询相应的文章
    * */
    Article SelectById(String id);
    /*
    * 根据文章的id进行删除
    * */
    int DeleteById(String id);
}
