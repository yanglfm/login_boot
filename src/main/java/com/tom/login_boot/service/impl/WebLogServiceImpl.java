package com.tom.login_boot.service.impl;

import com.tom.login_boot.common.ResultEntity;
import com.tom.login_boot.mapper.db1.WebLogMapper;
import com.tom.login_boot.model.WebLog;
import com.tom.login_boot.service.WebLogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class WebLogServiceImpl implements WebLogService {

    @Resource
    private WebLogMapper webLogMapper;

    @Override
    public ResultEntity getWebLogList(String username, Integer start, Integer end, String search) {
        List<WebLog> webLogs = webLogMapper.selectByUsername(username, start, end, search);

        Map<String, Object> map = new HashMap<>();
        map.put("tableData", webLogs);
        map.put("totalNum", webLogMapper.getWebLogCount(username, search));
        return ResultEntity.success(map);
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
