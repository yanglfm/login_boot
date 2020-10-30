package com.tom.login_boot.service;

import com.tom.login_boot.common.ResultEntity;
import com.tom.login_boot.model.User;

public interface UserService {
    ResultEntity login(User user);

    ResultEntity userInfo(String token);
}
