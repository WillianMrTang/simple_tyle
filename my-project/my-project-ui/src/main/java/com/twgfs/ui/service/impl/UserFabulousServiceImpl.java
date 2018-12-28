package com.twgfs.ui.service.impl;

import com.twgfs.ui.dao.UserFabulousDao;
import com.twgfs.ui.service.UserFabulousService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserFabulousServiceImpl implements UserFabulousService {

    @Autowired
    private UserFabulousDao userFabulousDao;
    @Override
    public int AddFabulous(String articleid,String fabulous) {
        /*
        * 异步实现点赞的实现
        * */
        int newFabulous = Integer.parseInt(fabulous)+1;
        int newArticleid = Integer.parseInt(articleid);
        int i = userFabulousDao.AddUserFabulous(newArticleid, newFabulous);
        if (i == 1){
            //为了防止脚本运行的问题，这里执行一次查询
            int fabulous2 = userFabulousDao.SelectFabulousByArticle(newArticleid);
        return fabulous2;
        }
        return 0;
    }

    /*
    * 查询总的评论数量
    * */
    @Override
    public int GetTotalComment(String articleId) {
        int i = userFabulousDao.GetTotalCommetn(Integer.parseInt(articleId));
        return i;
    }
}
