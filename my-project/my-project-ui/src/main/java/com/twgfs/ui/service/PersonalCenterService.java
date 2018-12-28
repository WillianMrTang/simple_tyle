package com.twgfs.ui.service;

import com.twgfs.domain.entity.Article;
import com.twgfs.domain.entity.Collectionentitys;

import java.util.List;

public interface PersonalCenterService {
    /*
    * 根据id查询相关信息然后在个人中心展示
    * */
    List<Article> SelectById(String userid);
    /*
    * 点击收藏时收藏该文章
    * */
    int AddCollection(String uid,String aid);
    /*
    * 查询收藏的文件
    * */
    List<Collectionentitys> SelectConllection(String userid);
    /*
    * 根据id将文件移出收藏夹
    * */
    int removEssayById(String essayid,String userid);
}
