package com.twgfs.ui.service.impl;

import com.twgfs.domain.entity.Middlecategory;
import com.twgfs.ui.dao.SelectPhotoByTargeDao;
import com.twgfs.ui.service.SelectPhotoByTargeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SelectPhotoByTargeServiceImpl implements SelectPhotoByTargeService {
    @Autowired
    private SelectPhotoByTargeDao sd;
    /*
        * 查询分页第二页分类后的图片sevice方法
        * */
    @Override
    public List<Middlecategory> selectSecondCategory(String largeid) {
        List<Middlecategory> middlecategoriesList = sd.selectSecondCategorydao(Integer.parseInt(largeid));
        return middlecategoriesList;
    }
}
