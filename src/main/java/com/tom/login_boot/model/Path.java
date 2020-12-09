package com.tom.login_boot.model;

import lombok.Data;

@Data
public class Path {
    private Integer id;
    private String title;
    private String region;
    private Integer parentId;
    private String path;
    private String component;
}
