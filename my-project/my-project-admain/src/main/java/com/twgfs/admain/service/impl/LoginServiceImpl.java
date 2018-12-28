package com.twgfs.admain.service.impl;

import com.twgfs.admain.dao.LoginDao;
import com.twgfs.admain.service.LoginService;
import com.twgfs.domain.entity.Admainuser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService{

    @Autowired
    private LoginDao loginDao;
    /*
    * 登录校验
    * */
    @Override
    public Admainuser CheckAdmainLogin(String admin, String pwd) {
        Admainuser admainuser = loginDao.CheckAdmainLogin(admin, pwd);
        if (admainuser != null)
        {
            return admainuser;
        }
        return null;
    }
}
