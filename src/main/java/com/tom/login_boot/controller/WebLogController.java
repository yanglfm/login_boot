package com.tom.login_boot.controller;

import com.tom.login_boot.common.ResultEntity;
import com.tom.login_boot.model.WebLog;
import com.tom.login_boot.service.WebLogService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@RestController
@RequestMapping("/log")
@Api(tags = "WebLogController", description = "用户操作日志")
public class WebLogController {


    @Resource
    private WebLogService webLogServiceImpl;

    @GetMapping("/getWebLogList")
    @ApiOperation(value = "获取日志列表")
    ResultEntity getWebLogList(@Param("username") String username) {
        return webLogServiceImpl.getWebLogList(username);
    }

    @PostMapping("/addWebLog")
    @ApiOperation(value = "添加日志")
    ResultEntity addWebLog(@RequestBody WebLog webLog) {
        return webLogServiceImpl.addWebLog(webLog);
    }
}
