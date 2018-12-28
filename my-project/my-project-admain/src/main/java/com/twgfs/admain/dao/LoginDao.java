package com.twgfs.admain.dao;

import com.twgfs.domain.entity.Admainuser;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LoginDao {

    /*
    * 登录校验
    * */
    Admainuser CheckAdmainLogin(@Param("admain") String admain, @Param("pwd") String pwd);
}
