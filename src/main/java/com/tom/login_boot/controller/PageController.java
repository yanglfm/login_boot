package com.tom.login_boot.controller;

import com.tom.login_boot.common.ResultEntity;
import com.tom.login_boot.model.Path;
import com.tom.login_boot.service.PageService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;


@RestController
@Api(tags = "PageController", description = "页面")
@RequestMapping("/page")
public class PageController {


    @Resource
    private PageService pageServiceImpl;

    @PostMapping("/addPath")
    @ApiOperation(value = "动态添加路径路由")
    public ResultEntity addPath(@RequestBody Path path) {
//        Path(id=null, title=用户管理, region=null, parentId=6, path=/path/3zl7U, component=)
        System.out.println("path-------->" + path);
//        ResultEntity resultEntity = pageServiceImpl.addPath(path);
//        return resultEntity;
        return ResultEntity.success();
    }


    public ResultEntity showPageContent(@RequestParam String pageId) {
        System.out.println("pageId-------->" + pageId);
        return ResultEntity.success();
    }
}
