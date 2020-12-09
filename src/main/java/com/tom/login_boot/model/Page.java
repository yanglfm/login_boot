package com.tom.login_boot.model;

import lombok.Data;

import java.util.List;

/**
 * 用一个公共页面来写这些内容？？？
 * 先试试吧
 * <p>
 * 页面内容
 */
@Data
public class Page {
    /**
     * 页面id
     */
    private Integer id;
    /**
     * 页面标题
     */
    private String title;
    /**
     * 页面目录
     */
    private String region;
    /**
     * 简要描述
     */
    private String desc;
    /**
     * 请求url
     */
    private String url;
    /**
     * 请求方式
     */
    private String requestMethod;
    /**
     * 请求参数
     */
    private List<Params> paramList;
    /**
     * 返回示例
     */
    private String returnRes;
    /**
     * 返回参数说明
     */
    private List<Params> returnParamList;
    /**
     * 备注
     */
    private String note;


}
