package com.twgfs.admain.dao;

import com.twgfs.domain.entity.Comment;
import com.twgfs.domain.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentDao {

    /*
    * 查询所有的评论信息返回第一页
    * */
    List<Comment> GetComments();

    int getTotalCount();

    List<Comment> getAllInfo(@Param("start") Integer start, @Param("pagesize") Integer pagesize);

    /*
    * 根据评论的id来删除指定的评论
    * */
    int DelCommentInfo(Integer delid);
}
