package com.twgfs.ui.service.impl;

import com.twgfs.domain.entity.Article;
import com.twgfs.domain.entity.Collectionentitys;
import com.twgfs.ui.dao.ArticleDao;
import com.twgfs.ui.dao.PersonalCenterDao;
import com.twgfs.ui.service.PersonalCenterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PersonalCenterServiceImpl implements PersonalCenterService{

    @Autowired
    private PersonalCenterDao personalCenterDao;
    @Autowired
    private ArticleDao articleDao;
    /*
    * 根据id查询相关数据在去个人中心展示
    * */
    @Override
    public List<Article> SelectById(String userid) {
        return personalCenterDao.SelectById(Integer.parseInt(userid));
    }
    /*
    * 点击收藏时收藏该文章
    * */
    @Override
    public int AddCollection(String aid, String uid) {
        //查询要收藏的文章
        Article article = articleDao.SelectSingleArticleById(Integer.parseInt(aid));
        //取巧将article的id更换为当前用户的id
        article.setUserid(Integer.parseInt(uid));
        //将要收藏的对象存到数据库表中
        int i = personalCenterDao.AddCollection(article);
        return i;
    }

    /*
    * 查询收藏的文件
    * */
    @Override
    public List<Collectionentitys> SelectConllection(String userid) {
        List<Collectionentitys> collections = personalCenterDao.SelectCollection(Integer.parseInt(userid));
        return collections;
    }

    @Override
    public int removEssayById(String essayid, String userid) {
        int i = personalCenterDao.removeEssay(Integer.parseInt(essayid), Integer.parseInt(userid));
        return i;
    }


}
