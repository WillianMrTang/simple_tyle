package com.twgfs.admain.dao;

import com.twgfs.domain.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao {

    /*
    * 查询所有的用户信息进行列表展示
    * */
    List<User> SelectAllUser(Integer startIndex);

    /*
    * 异步检验用户名的唯一
    * */
    int ConfirmName(String username);

    /*
    * 查询需要修改的单个用户信息
    * */
    User SelectNeedChageUser(String id);
    /*
    * 正式修改用户的个人信息
    * */
    int UpdateUserInfo(User user);
    /*
    * 根据id或者用户名删除用户信息
    * */
    int DeluserUserInfoByIdOrName(String idorname);
    /*
    * 后台添加新用户
    * */
    int AddNewUserAtBack(User user);
    /*
    * 根据输入的字段模糊查询含有字段的相关用户信息
    * */
    List<User> SearchUserInfoByFild(String searchfild);
    /*
    * 分页所需查询总条数
    * */
    int TotalCount();
}
