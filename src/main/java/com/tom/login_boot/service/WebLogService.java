package com.tom.login_boot.service;

import com.tom.login_boot.common.ResultEntity;

public interface WebLogService {
    ResultEntity getWebLogList(Integer userId);
}
