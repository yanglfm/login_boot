package com.tom.login_boot.proxy;

import com.tom.login_boot.model.User;

public class Main {
    public static void main(String[] args) {
        User user=new User();
        user.setUserId("123");
        user.setUsername("tom");
        user.setPhone("12345678910");
        UserService userService=new UserServiceImpl();
        UserServiceProxy proxy=new UserServiceProxy(userService);
        proxy.userInfo(user);
    }

}
