package com.tom.login_boot.enums;

public enum ApiCode {
    SUCCESS("操作成功",200),
    FAIL("服务器内部错误",500),
    ;
    private String msg;
    private Integer code;

    ApiCode(String msg, Integer code) {
        this.msg = msg;
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public Integer getCode() {
        return code;
    }
}

