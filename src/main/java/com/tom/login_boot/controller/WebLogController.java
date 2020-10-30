package com.tom.login_boot.controller;

import com.tom.login_boot.common.ResultEntity;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.models.auth.In;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/webLog")
@Api(tags = "WebLogController", description = "用户操作日志")
public class WebLogController {


    @GetMapping("/getWebLogList")
    @ApiOperation(value = "获取日志列表")
    ResultEntity getWebLogList(@Param("userId") Integer userId) {

        return null;
    }
}
