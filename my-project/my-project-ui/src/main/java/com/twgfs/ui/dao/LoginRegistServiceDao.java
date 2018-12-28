package com.twgfs.ui.dao;

import com.twgfs.domain.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LoginRegistServiceDao {

    /*
    * 前端注册Dao
    * */
    int Registing(User user);
    /*
    * 异步检验用户名的唯一
    * */
    int ConfirmName(String username);
    /*
    * 用户的登录
    * */
    User ToLogin(@Param("uname") String username, @Param("pwd") String password);
}