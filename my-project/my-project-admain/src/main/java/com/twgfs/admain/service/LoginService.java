package com.twgfs.admain.service;

import com.twgfs.domain.entity.Admainuser;

public interface LoginService {

    Admainuser CheckAdmainLogin(String admin,String pwd);
}
