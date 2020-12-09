package com.tom.login_boot.proxy;

import com.tom.login_boot.model.User;

public class UserServiceProxy implements UserService {
    private UserService userService;

    public UserServiceProxy(UserService userService) {
        this.userService = userService;
    }

    @Override
    public void userInfo(User user) {
        before();
        userService.userInfo(user);
        after();
    }

    public void before() {
        System.out.println("before method------");
    }

    public void after() {
        System.out.println("after method------");
    }
}
