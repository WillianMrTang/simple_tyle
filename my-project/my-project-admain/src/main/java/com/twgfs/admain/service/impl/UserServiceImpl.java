package com.twgfs.admain.service.impl;

import com.twgfs.admain.dao.UserDao;
import com.twgfs.admain.service.UsersServic;
import com.twgfs.commons.staticconst.StaticConst;
import com.twgfs.domain.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UsersServic{

    @Autowired
    private UserDao userDao;


    /*
    * 查询所有用户信息展示
    * */
    @Override
    public List<User> SelectAllUser(String currentPages) {
//        System.out.println(totalCount+"总的条数");
        //每一页的显示数
        int pageSize = 9;
        //查询的起始位置数
        int currentPage = Integer.parseInt(currentPages);
        int startIndex=(currentPage-1)*pageSize;

        List<User> users = userDao.SelectAllUser(startIndex);
        return users;
    }

    /*
    * 检查用户名的唯一
    * */
    @Override
    public String ConfirmName(String username) {
        int i = userDao.ConfirmName(username);
        if (i==0){
            return "用户名可以使用!";
        }
        return "用户名已被使用！";
    }
    /*
    * 查询需要修改的用户信息
    * */
    @Override
    public User SelectSingChangeUser(String id) {
        User user = userDao.SelectNeedChageUser(id);
        return user;
    }

    /*
    * 正式修改需要修改的用户信息
    * */
    @Override
    public String UpdateUserInfomation(User user) {
        int i = userDao.UpdateUserInfo(user);
        if (i==1){
            return "修改用户成功^v^";
        }
        return "修改用户失败=_=";
    }

    /*
    * 根据id或者用户名删除用户信息
    * */
    @Override
    public int DelUserInformation(String idorname) {
        int i = userDao.DeluserUserInfoByIdOrName(idorname);
        if (i == StaticConst.DELETE_USER_SUCCESS){
            return i;
        }
        return StaticConst.DELETE_USER_FAILED;
    }
    /*
    * 后台添加新用户
    * */
    @Override
    public int AddNewUserAtBack(User user) {
        int i = userDao.AddNewUserAtBack(user);
        if(i == StaticConst.ADD_USER_SUCCESS){
            return i;
        }else{
            return StaticConst.ADD_USER_FAILED;
        }
    }

    /*
    * 模糊查询，根据传入的字段进行模糊查询相关的用户信息
    * */
    @Override
    public List<User> SearchUserInformationByFild(String searchfild) {
        List<User> users = userDao.SearchUserInfoByFild(searchfild);
        if (users.size() != 0){
            return users;
        }
        return null;

    }
    /*
    * 计算总页数的方法
    * */
    public String getTotalPage(){
        //总的条数
        int totalCount = userDao.TotalCount();
        //每一页的显示数
        int pageSize = 9;
        //总的页数
        int totalPage = totalCount%pageSize==0?totalCount/pageSize:totalCount/pageSize+1;
        return totalPage+"";
    }
}
