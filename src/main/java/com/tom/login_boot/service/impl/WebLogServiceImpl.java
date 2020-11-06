package com.tom.login_boot.service.impl;

import com.tom.login_boot.common.ResultEntity;
import com.tom.login_boot.mapper.db1.WebLogMapper;
import com.tom.login_boot.model.WebLog;
import com.tom.login_boot.service.WebLogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class WebLogServiceImpl implements WebLogService {

    @Resource
    private WebLogMapper webLogMapper;

    @Override
    public ResultEntity getWebLogList(String username) {
        List<WebLog> webLogs = webLogMapper.selectByUsername(username);
        return ResultEntity.success(webLogs);
    }

    @Override
    public ResultEntity addWebLog(WebLog webLog) {
        try {
            webLogMapper.addWebLog(webLog);
            return ResultEntity.success();
        } catch (Exception e) {
            e.printStackTrace();
            return ResultEntity.fail();
        }
    }
}
