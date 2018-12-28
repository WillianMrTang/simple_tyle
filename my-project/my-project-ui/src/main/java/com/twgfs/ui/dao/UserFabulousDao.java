package com.twgfs.ui.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserFabulousDao {

    /*
    * 异步实现点赞的功能
    * */
    int AddUserFabulous(@Param("articleId") Integer articleId,@Param("newFabulous") Integer newFabulous);
    /*
    * 增加完成点赞功能后就进行一次查询得到新的点赞数量
    * */
    int SelectFabulousByArticle(Integer newArticleid);
    /*
    * 查询总的评论数量
    * */
    int GetTotalCommetn(Integer articleId);
}
