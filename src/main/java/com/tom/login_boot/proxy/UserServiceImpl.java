package com.tom.login_boot.proxy;

import com.tom.login_boot.model.User;

public class UserServiceImpl implements UserService {
    @Override
    public void userInfo(User user) {
        System.out.println("实现类方法 " + user);
    }
}
