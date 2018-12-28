package com.twgfs.domain.entity;

import lombok.Data;

import java.util.Date;

@Data
public class Comment {
  private Integer id;
  private String commention;
  private Integer articleid;
  private String username;
  private String commenttime;
  }
