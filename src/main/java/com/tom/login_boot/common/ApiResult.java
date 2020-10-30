package com.tom.login_boot.common;

import com.tom.login_boot.enums.ApiCode;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ApiResult<T> {
    private String msg;
    private T data;
    private Integer code;

    public static <T> ApiResult<T> success(Integer code, String msg, T data) {
        return new ApiResult<>(msg, data, code);
    }

    public static <T> ApiResult<T> success(ApiCode apiCode, T data) {
        return success(apiCode.getCode(), apiCode.getMsg(), data);
    }

    public static <T> ApiResult<T> success(String msg, T data) {
        return success(0, msg, data);
    }

    public static <T> ApiResult<T> success(String msg) {
        return success(0, msg, null);
    }

    public static <T> ApiResult<T> success() {
        return success(ApiCode.SUCCESS, null);
    }

    public static <T> ApiResult<T> success(T data) {
        return success(ApiCode.SUCCESS, data);
    }

    public static <T> ApiResult<T> fail(Integer code, String msg) {
        return new ApiResult<>(msg, null, code);
    }

    public static <T> ApiResult<T> fail(ApiCode apiCode) {
        return fail(apiCode.getCode(), apiCode.getMsg());
    }

    public static <T> ApiResult<T> fail(String msg) {
        return fail(-1, msg);
    }

    public static <T> ApiResult<T> fail() {
        return fail(ApiCode.FAIL);
    }


}
