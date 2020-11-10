package com.tom.login_boot.mvc.controller;


import com.tom.login_boot.mvc.annotation.MyController;
import com.tom.login_boot.mvc.annotation.MyGetMapping;
import com.tom.login_boot.mvc.annotation.MyRequestParam;

@MyController(value = "/user")
public class UserController {

    @MyGetMapping("/getUserInfo")
    public String getUserInfo(@MyRequestParam("userId") String userId){
        return userId+"-----";
    }
}
