package com.twgfs.ui.service;

public interface UserFabulousService {

    /*
    * 异步实现点赞的实现
    * */
    int AddFabulous(String articleid,String fabulous);
    /*
    * 查询总的评论数量
    * */
    int GetTotalComment(String articleId);
}
