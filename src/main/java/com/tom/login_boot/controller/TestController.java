package com.tom.login_boot.controller;

import com.tom.login_boot.common.ResultEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/test")
public class TestController {

    /**
     * 接下来，发布前端和后端
     * nginx
     * @return
     */
    @RequestMapping("/getMsg")
    public ResultEntity getMsg() {
        return ResultEntity.success("hello docker");
    }
}
