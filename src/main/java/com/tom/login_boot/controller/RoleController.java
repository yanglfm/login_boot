package com.tom.login_boot.controller;

import com.tom.login_boot.common.ResultEntity;
import com.tom.login_boot.service.RoleService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@Api(tags = "RoleController", description = "权限控制")
@RequestMapping("/role")
public class RoleController {

    @Resource
    private RoleService roleServiceImpl;

    @GetMapping("/getUnauthorized")
    public ResultEntity getUnauthorized(@RequestParam("roleIds") String[] roleIds, @RequestParam("roles") String roles) {
        for (String roleId : roleIds) {
            System.out.println("roleId----" + roleId);
        }
        System.out.println("roles-----"+roles);
        ResultEntity unauthorized = roleServiceImpl.getUnauthorized(roles);
//        System.out.println("--unauthorized---" + unauthorized);
//        return unauthorized;


        return unauthorized;
    }
}
