package com.twgfs.ui.service;


import com.twgfs.domain.entity.Article;
import com.twgfs.domain.entity.Comment;

import java.util.List;

public interface ArticleService {
    /*
    * 查询所有的文章信息后进行展示
    * */
    List<Article> SelectArticle();

    /*
    * 查询右侧边栏文章显示效果
    * */
    List<Article> SelectArticleRight();

    /*
    * 分页查询文章的数量
    * */
    int GetCounts();
    /*
    * 分页查询
    * */
    List<Article> SelectCurrenPage(String pagesize,String currentpage);
    /*
    * 上传文章到数据库
    * */
    int addEssay(Article article);

    /*
    * 查询单篇文章的内容
    * */
    Article SelectSingleArticle(String articleId);
    /*
    * 查询单篇文章的所有评论
    * */
    List<Comment> SelectAllEssay(String essayId);

    /*
    * 存储评论并返回是否存储成功的结果
    * */
    Comment SaveCommontmsg(Comment comment);
}
