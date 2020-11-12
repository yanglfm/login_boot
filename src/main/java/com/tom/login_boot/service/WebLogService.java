package com.tom.login_boot.service;

import com.tom.login_boot.common.ResultEntity;
import com.tom.login_boot.model.WebLog;

public interface WebLogService {

    ResultEntity getWebLogList(String username, Integer start, Integer end, String search);

    ResultEntity addWebLog(WebLog webLog);

}
