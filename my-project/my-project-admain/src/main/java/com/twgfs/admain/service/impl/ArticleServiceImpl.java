package com.twgfs.admain.service.impl;

import com.twgfs.admain.dao.ArticleDao;
import com.twgfs.admain.service.ArticlelistService;
import com.twgfs.commons.staticconst.StaticConst;
import com.twgfs.domain.entity.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ArticleServiceImpl implements ArticlelistService {

    @Autowired
    private ArticleDao articleDao;
    /*
    * 查询所有的文章
    * */
    @Override
    public List<Article> SelectAllArticle() {
        List<Article> articles = articleDao.SelectAllArticle();
        return articles;
    }

    /*
    * 根据文章的id查询相应的文章
    * */
    @Override
    public Article SelectById(String id) {
        Article article = articleDao.SelectById(id);
        return article;
    }

    /*
    * 根据文章的id进行删除
    * */
    @Override
    public int DeleteById(String id) {
        int i = articleDao.DeleteById(id);
        if ( i == StaticConst.DELETE_USER_SUCCESS){
            return StaticConst.DELETE_USER_SUCCESS;
        }
        return StaticConst.DELETE_USER_FAILED;
    }

}
