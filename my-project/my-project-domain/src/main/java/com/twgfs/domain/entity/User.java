package com.twgfs.domain.entity;
import com.twgfs.commons.utils.RegexpUtils;
import lombok.Data;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

@Data
public class User {
  private Integer id;
 @NotEmpty(message = "用户名不能为空")
  private String username;
  @NotEmpty(message = "密码不能为空")
  private String password;
  @NotEmpty(message = "电话号码不能为空")
  @Pattern(regexp = RegexpUtils.PHONE, message = "手机格式不正确")
  private String phone;
  @NotEmpty(message = "邮箱不能为空")
  @Pattern(regexp = RegexpUtils.EMAIL, message = "邮箱格式不正确")
  private String email;
  //数据库ORM会忽略该字段
//  @Transient
//  public int totalPage;

}
