package com.twgfs.ui.dao;

import com.twgfs.domain.entity.Middlecategory;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SelectPhotoByTargeDao {

    /*
        * 查询分页第二页分类后的图片dao方法
        * */
    List<Middlecategory> selectSecondCategorydao(@Param("sid") Integer id);
}
