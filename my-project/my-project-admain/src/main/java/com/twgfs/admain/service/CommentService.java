package com.twgfs.admain.service;

import com.twgfs.domain.entity.Comment;
import com.twgfs.domain.entity.User;

import java.util.List;

public interface CommentService {
    /*
    * 查询所有评论返回为第一页
    * */
    List<Comment> getCommet();

    int getTotalCount();

    List<Comment> SelectAllByPage(String currentPage, String pageSize);
    /*
    * 根据评论id删除指定的评论
    * */
    int DelCommetiion(String delid);
}
