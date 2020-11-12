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

    /**
     * @param username 当前用户的用户名
     * @param pageNo   页数
     * @param pageNum  每页多少条数据
     * @param search   搜索的内容
     * @return
     */
    @GetMapping("/getWebLogList")
    @ApiOperation(value = "获取日志列表")
    ResultEntity getWebLogList(@Param("username") String username, @Param("pageNo") Integer pageNo,
                               @Param("pageNum") Integer pageNum, @Param("search") String search) {
        return webLogServiceImpl.getWebLogList(username, (pageNo - 1) * pageNum, pageNo * pageNum, search);
    }

    @PostMapping("/addWebLog")
    @ApiOperation(value = "添加日志")
    ResultEntity addWebLog(@RequestBody WebLog webLog) {
        return webLogServiceImpl.addWebLog(webLog);
    }
}
