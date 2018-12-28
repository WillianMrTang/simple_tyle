package com.twgfs.admain.service;

import com.twgfs.domain.entity.User;

import java.util.List;

public interface UsersServic {
    /*
    * 查询所有用户信息展示
    * */
    List<User> SelectAllUser(String currentPages);

    /*
    * 异步校验用户名的唯一性
    * */
    String ConfirmName(String username);
    /*
    * 查询需要修改的用户信息
    * */
    User SelectSingChangeUser(String id);
    /*
    * 正式修改需要修改的用户信息
    * */
    String UpdateUserInfomation(User user);
    /*
    * 根据用户名或id删除用户信息
    * */
    int DelUserInformation(String idorname);
    /*
    * 添加新用户
    * */
    int AddNewUserAtBack(User user);
    /*
    * 模糊查询，根据传入的字段进行模糊查询相关的用户信息
    * */
    List<User> SearchUserInformationByFild(String searchfild);
    /*
    * 计算获得总的页数
    * */
    String getTotalPage();
}
