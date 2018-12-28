package com.twgfs.ui.service;

import com.twgfs.domain.entity.User;

public interface LoginRegistService {

    /*
    * 注册srvice返回一个标示看是否注册成功
    * */
    int ToRegist(User user);

    /*
    * 登录service返回一个用户名在界面显示
    * */
    User ToLogin(String username, String password);
    /*
    * 异步校验用户名的唯一性
    * */
    String ConfirmName(String username);
}
