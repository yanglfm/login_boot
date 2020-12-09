package com.tom.login_boot.model;

import lombok.Data;

/**
 * 请求参数、返回参数列表
 */
@Data
public class Params {
    private Integer id;
    /**
     * 参数名
     */
    private String paramName;
    /**
     * 是否必选
     */
    private boolean isRequired;
    /**
     * 类型
     */
    private String type;
    /**
     * 备注
     */
    private String note;
    /**
     * 页面id
     */
    private String pageId;
    /**
     * 是否是请求参数或返回参数
     * 0：请求参数
     * 1：返回参数
     */
    private String returnType;
}
