package com.twgfs.ui.service;

import com.twgfs.domain.entity.Article;
import com.twgfs.domain.entity.Middlecategory;

import java.util.List;


public interface SelectPhotoByTargeService {
    /*
    * 查询分页第二页分类后的图片service方法用集合装载所有的查询的数据
    * */
    List<Middlecategory> selectSecondCategory(String largeid);
}
