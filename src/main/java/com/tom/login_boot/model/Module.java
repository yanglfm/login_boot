package com.tom.login_boot.model;

import lombok.Data;
import lombok.ToString;

import java.util.List;

@Data
@ToString
public class Module {
    private Integer id;
    private String name;
    private String path;
    private String icon;
    private String component;
    private List<Module> children;
    private Integer parentId;
    //转发的地址
    private String redirect;
    private Meta meta;
}
