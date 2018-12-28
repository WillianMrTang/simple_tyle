package com.twgfs.ui.service.impl;

import com.twgfs.commons.staticconst.StaticConst;
import com.twgfs.domain.entity.Article;
import com.twgfs.domain.entity.Comment;
import com.twgfs.ui.dao.ArticleDao;
import com.twgfs.ui.service.ArticleService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
@Service
public class ArticleServiceImpl implements ArticleService{

    @Autowired
    private ArticleDao articleDao;
    /*
    * 查询文章的相关信息后展示文章主页面
    * */
    @Override
    public List<Article> SelectArticle() {
        List<Article> articles = articleDao.SelectArticle();
        return articles;
    }

    @Override
    public List<Article> SelectArticleRight() {
        List<Article> articles = articleDao.SelectArticleRightColoum();
        return articles;
    }

    /*
    * 分页查询文章的总数量
    * */
    @Override
    public int GetCounts() {
        int i = articleDao.SelectCount();
        return i;
    }

    /*
    * 分页查询
    * */
    @Override
    public List<Article> SelectCurrenPage(String pagesize, String currentpage) {
        //查询的起始位置
        int curren = Integer.parseInt(currentpage);
        int startIndex = curren*Integer.parseInt(pagesize);
        List<Article> articles = articleDao.SelectCurrenPage(startIndex, Integer.parseInt(pagesize));
        return articles;
    }

    /*
    * 保存上传文章的业务方法
    * */
    @Override
    public int addEssay(Article article) {
        int i = 0;
        if (StringUtils.isBlank(article.getSmalltitle()) || StringUtils.isBlank(article.getFirstartic())){
            return 3;
        }
        if(StringUtils.isBlank(article.getArtieimg())){
            //如何没上传图片就设置为默认图片
            article.setArtieimg("../../static/atricleimgs/defaultimg.jpg");
        }
        article.setFabulous(0);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String datetime = formatter.format(new Date());
        article.setUoloadtime(datetime);
        i = articleDao.addEssay(article);
        return i;
    }

    /*
    * 查询单篇文章的内容
    * */
    @Override
    public Article SelectSingleArticle(String articleId) {
        Article article = articleDao.SelectSingleArticleById(Integer.parseInt(articleId));
        return article;
    }

    @Override
    public List<Comment> SelectAllEssay(String essayId) {
        List<Comment> comments = articleDao.SelectAllContenet(Integer.parseInt(essayId));
        return comments;
    }

    @Override
    public Comment SaveCommontmsg(Comment comment) {
        SimpleDateFormat simdate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String format = simdate.format(new Date());
        comment.setCommenttime(format);
//        System.out.println(comment.getArticleid()+"------------------------------");
//        System.out.println(comment.getCommention()+"------------------------------");
//        System.out.println(comment.getUsername()+"------------------------------");
        int tag = articleDao.SaveComment(comment);
        if (tag==1){
            Comment comments = articleDao.SelectSingleContenet(format,comment.getArticleid(),comment.getUsername());
            return comments;
        }
        return  null;
    }


}

