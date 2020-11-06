package com.tom.login_boot.service;

import com.tom.login_boot.common.ResultEntity;
import com.tom.login_boot.model.User;
import com.tom.login_boot.model.WebLog;

public interface UserService {
    ResultEntity login(User user);

    ResultEntity userInfo(String token);

    ResultEntity addLog(WebLog webLog);

    ResultEntity checkUsername(String username);

    ResultEntity changeUserInfo(User user);
}
