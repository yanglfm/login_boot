package com.tom.login_boot.common;

import com.tom.login_boot.enums.ApiCode;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ResultEntity {
    private String msg;
    private Integer code;
    private Object data;

    public static ResultEntity success(String msg, Integer code, Object data) {
        return new ResultEntity(msg, code, data);
    }

    public static ResultEntity success(Object data) {
        return success(ApiCode.SUCCESS.getMsg(), ApiCode.SUCCESS.getCode(), data);
    }

    public static ResultEntity success(String msg, Object data) {
        return success(msg, 0, data);
    }

    public static ResultEntity fail(String msg, Integer code, Object data) {
        return new ResultEntity(msg, code, data);
    }

    public static ResultEntity fail(ApiCode apiCode) {
        return fail(apiCode.getMsg(), apiCode.getCode(), null);
    }

    public static ResultEntity fail() {
        return fail(ApiCode.FAIL);
    }

}
