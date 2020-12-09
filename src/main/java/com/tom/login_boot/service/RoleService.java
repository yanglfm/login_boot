package com.tom.login_boot.service;

import com.tom.login_boot.common.ResultEntity;

public interface RoleService {

    ResultEntity getUnauthorized(String roleIds);
    ResultEntity getAllModule(Integer userId);
}
