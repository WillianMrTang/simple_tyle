package com.twgfs.domain.entity;

import lombok.Data;

@Data
public class Middlecategory {
  private Long id;
  private String middlename;
  private Long largecategoryid;
  private String middleimg;
  private java.sql.Timestamp uploaddate;
  private String uploader;
}
