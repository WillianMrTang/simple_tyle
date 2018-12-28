package com.twgfs.ui.service.impl;

import com.twgfs.domain.entity.User;
import com.twgfs.ui.dao.LoginRegistServiceDao;
import com.twgfs.ui.service.LoginRegistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginRegistServiceImpl implements LoginRegistService {

    @Autowired
    private LoginRegistServiceDao loginRegistServiceDao;
    /*
    * 注册srvice返回一个标示看是否注册成功
    * */
    @Override
    public int ToRegist(User user) {
       int flag = loginRegistServiceDao.Registing(user);
       if (flag==1){
        return flag;
       }
       return flag;
    }
    /*
    * 登录service返回一个用户名在界面显示
    * */
    @Override
    public User ToLogin(String username, String password) {
        User user = loginRegistServiceDao.ToLogin(username, password);
        if(user != null){
            return user;
        }
        return null;
    }

    /*
    * 检查用户名的唯一
    * */
    @Override
    public String ConfirmName(String username) {
        int i = loginRegistServiceDao.ConfirmName(username);
        if (i==0){
            return "用户名可以使用!";
        }
        return "用户名已被使用！";
    }
}
