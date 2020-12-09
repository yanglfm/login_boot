package com.tom.login_boot.model;

import lombok.*;

import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
@ToString
@Builder
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
    private Integer orderNo;



}
