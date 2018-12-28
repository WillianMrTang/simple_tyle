package com.twgfs.ui.dao;

import com.twgfs.domain.entity.Article;
import com.twgfs.domain.entity.Collectionentitys;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PersonalCenterDao {

    /*
    *根据用户的id查询用户发表过的文章
    * 去个人中心展示
    * */
    List<Article> SelectById(Integer userid);
    /*
    * 点击收藏时将所点击文章进行收藏
    * */
    int AddCollection(Article article);
    /*
    * 查询收藏的文件
    * */
    List<Collectionentitys> SelectCollection(Integer userid);
    /*
    * 根据id将文件移出收藏夹
    * */
    int removeEssay(@Param("essayid") Integer essayid,@Param("userid") Integer userid);
}
