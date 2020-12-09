package com.tom.login_boot.proxy;

import com.tom.login_boot.model.User;

public class DynamicMain {
    public static void main(String[] args) {
        User user = new User();
        user.setUserId("123");
        user.setUsername("tom");
        user.setPhone("12345678910");
        UserService userService = new DynamicProxy(new UserServiceImpl()).getProxy();
        userService.userInfo(user);

        WebServiceImplTwo   proxy = new DynamicProxy(new WebServiceImplTwo()).getProxy();
        proxy.web("uuuuuu");
//        System.out.println("userService-----"+userService);
    }
}
