package com.tom.login_boot.enums;

public enum ApiCode {
    SUCCESS("操作成功",200),
    FAIL("服务器内部错误",500),
    USERNAME_EXISTED("用户名已存在",500),
    USERNAME_HAS_NO_CHANGE("用户名没有改变",200),
    USERNAME_CAN_USE("可以使用该用户名",200),
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

