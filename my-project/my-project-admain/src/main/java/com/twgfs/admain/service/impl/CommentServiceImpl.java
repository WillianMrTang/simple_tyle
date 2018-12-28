package com.twgfs.admain.service.impl;

import com.twgfs.admain.dao.CommentDao;
import com.twgfs.admain.service.CommentService;
import com.twgfs.domain.entity.Comment;
import com.twgfs.domain.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    private CommentDao commentDao;
    /*
    * 查询所有评论返回为第一页
    * */
    @Override
    public List<Comment> getCommet() {
        List<Comment> comments = commentDao.GetComments();
        return comments;
    }
    @Override
    public int getTotalCount() {
        int totalCount = commentDao.getTotalCount();
        return totalCount;
    }

    @Override
    public List<Comment> SelectAllByPage(String currentPage, String pageSize) {
        int pagesize = Integer.parseInt(pageSize);
        int start = Integer.parseInt(currentPage)*pagesize;
        System.out.println("起始页数-----------=------------=------------------"+start);
        System.out.println("查询长度-----------=------------=------------------"+pagesize);
        List<Comment> allInfo = commentDao.getAllInfo(start, pagesize);
        return allInfo;
    }

    @Override
    public int DelCommetiion(String delid) {
        int i = commentDao.DelCommentInfo(Integer.parseInt(delid));
        return i;
    }
}
