package com.twgfs.admain.dao;

import com.twgfs.domain.entity.Article;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ArticleDao {

    /*查询所有的文章
     */
    List<Article> SelectAllArticle();
    /*
    * 根据文章的id查询相应的
    * */
    Article SelectById(String id);
    /*
    * 根据文章的id进行删除
    * */
    int DeleteById(String id);
}
