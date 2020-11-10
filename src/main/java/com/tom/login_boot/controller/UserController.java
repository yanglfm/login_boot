package com.tom.login_boot.controller;

import com.tom.login_boot.common.ResultEntity;
import com.tom.login_boot.model.User;
import com.tom.login_boot.service.UserService;
import com.tom.login_boot.utils.JwtUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
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

    @GetMapping("/checkUsername")
    @ApiOperation("校验用户名")
    public ResultEntity checkUsername(String username,HttpServletRequest request) {
        String authorization = request.getHeader(JwtUtils.AUTHORIZATION);
        String currentUsername = jwtUtils.getUserName(authorization);
        ResultEntity resultEntity = userServiceImpl.checkUsername(username, currentUsername);
        System.out.println("resultEntity---------->"+resultEntity);
        return resultEntity;
    }


    @PostMapping("/editUserInfo")
    @ApiOperation("修改用户信息")
    public ResultEntity editUserInfo(@RequestBody User user) {
        return userServiceImpl.editUserInfo(user);
    }


}
