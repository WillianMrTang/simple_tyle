package com.twgfs.ui.dao;

import com.twgfs.domain.entity.Article;
import com.twgfs.domain.entity.Comment;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ArticleDao {
    /*
    * 查询所有文章的信息后展示在文章主页面
    * */
    List<Article> SelectArticle();
    /*
    * 查询右侧边栏文章显示效果
    * */
    List<Article> SelectArticleRightColoum();
    /*
    * 分页查询文章的总数量
    * */
    int SelectCount();
    /*
    *分页查询
    * */
    List<Article> SelectCurrenPage(@Param("start") int startIndex, @Param("current")int pagesize);
    /*
    * 保存上传文章的业务方法
    * */
    int SaveingArticle(Article article);
    /*
    * 查询单篇文章的信息
    * */
    Article SelectSingleArticleById(Integer id);
    /*
    * 存储评论
    * */
    int SaveComment(Comment comment);
    /*
    * 查询所有评论
    * */
    List<Comment> SelectAllContenet(Integer articleid);
    /*
    * 查询单个评论
    * */
    Comment SelectSingleContenet(@Param("format") String format, @Param("articleId") Integer articleId, @Param("username") String username);

    /*
    * 添加文章到数据库
    * */
    int addEssay(Article article);
}
