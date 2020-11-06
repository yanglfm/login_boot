package com.tom.login_boot.model;

import lombok.Data;
import lombok.ToString;

import javax.persistence.Table;
import java.sql.Date;

@Table(name = "web_log")
@Data
@ToString
public class WebLog {

    private String id;

    private String description;
    private String username;
    private Long startTime;
    private Integer spendTime;
    /**
     * 访问的controller的path
     */
    private String contentPath;
    private String basePath;
    private String uri;
    private String url;
    private String method;
    private String ip;
    private Object parameter;
    private Object result;
    private Date insertTime;


}