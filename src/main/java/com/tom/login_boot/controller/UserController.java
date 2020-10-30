package com.tom.login_boot.controller;

import com.tom.login_boot.common.ApiResult;
import com.tom.login_boot.common.ResultEntity;
import com.tom.login_boot.enums.ApiCode;
import com.tom.login_boot.model.User;
import com.tom.login_boot.service.UserService;
import com.tom.login_boot.utils.JwtUtil;
import com.tom.login_boot.utils.JwtUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/user")
@Api(tags = "UserController", description = "用户模块")
public class UserController {


    @Resource
    private UserService userServiceImpl;

    @Resource
    private JwtUtils jwtUtils;

    @PostMapping("/login")
    @ApiOperation(value = "用户登陆")
    public ResultEntity login2(@RequestBody User user) {
        ResultEntity resultEntity = new ResultEntity();
        System.out.println("user==" + user);
        String token = jwtUtils.createToken(user.getUsername());
        resultEntity.setData(token);
        resultEntity.setCode(200);
        return resultEntity;
    }

    @PostMapping("/loginOut")
    @ApiOperation(value = "退出登录")
    public ResultEntity login(HttpServletRequest request) {
        //删除token
        ResultEntity resultEntity = new ResultEntity();
        resultEntity.setMsg("成功退出");
        resultEntity.setCode(200);
        return resultEntity;
    }

    @GetMapping(value = "/userInfo")
    @ApiOperation(value = "用户信息")
    public ResultEntity getUserInfo(HttpServletRequest request) {
        String authorization = request.getHeader("Authorization");
        return userServiceImpl.userInfo(authorization);
    }



}
