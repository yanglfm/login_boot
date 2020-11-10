package com.tom.login_boot.service.impl;

import com.sun.org.apache.xpath.internal.operations.Mod;
import com.tom.login_boot.common.ResultEntity;
//import com.tom.login_boot.mapper.db2.UserMapper;
import com.tom.login_boot.enums.ApiCode;
import com.tom.login_boot.mapper.db1.UserMapper;
import com.tom.login_boot.mapper.db1.WebLogMapper;
import com.tom.login_boot.model.Module;
import com.tom.login_boot.model.Role;
import com.tom.login_boot.model.User;
import com.tom.login_boot.model.WebLog;
import com.tom.login_boot.service.UserService;
import com.tom.login_boot.utils.JwtUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;
    @Resource
    private WebLogMapper webLogMapper;

    @Resource
    private JwtUtils jwtUtils;

    @Override
    public ResultEntity login(User user) {

        try {
            log.info("测试log是否可以使用");
            User one = userMapper.selectByUsername(user.getUsername());

            if (one != null) {//存在该用户
                //判断密码是否正确
                User us = userMapper.getOne(user);
                if (us != null) {
                    //密码正确,登录成功，授权Authorization
                    HashMap<String, Object> hashMap = new HashMap<>();

                    hashMap.put("Authorization", "1234566");
                    return ResultEntity.success("登录成功", hashMap);
                }

            }

            if (user == null || "".equals(user.getUsername())) {
                return ResultEntity.success("");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public ResultEntity userInfo(String token) {
        String username = jwtUtils.getUserName(token);
        if (StringUtils.isEmpty(username)) return ResultEntity.success("无该数据");
        User user = userMapper.selectByUsername(username);
        List<Role> userRoles = userMapper.getUserRoles(username);
        List<Module> parentModules = new ArrayList<>();
        List<Module> childModules = new ArrayList<>();
        String roleIds = "";
        for (Role userRole : userRoles) {
            roleIds += "'" + userRole.getId() + "',";
        }
        if (!StringUtils.isEmpty(roleIds)) {
            roleIds = roleIds.substring(0, roleIds.length() - 1);
            parentModules = userMapper.getParentModules(roleIds);
            String parentIds = "";
            for (Module parentModule : parentModules) {
                parentIds += "'" + parentModule.getId() + "',";
            }
            parentIds = parentIds.substring(0, parentIds.length() - 1);
            List<Module> secondModules = userMapper.getSecondModules(parentIds, roleIds);
            System.out.println("secondModules---->" + secondModules);
            childModules = getModules(parentModules, secondModules);
        }
        HashMap<String, Object> map = new HashMap<>();
        map.put("roles", userRoles);
        map.put("menus", childModules);
        map.put("user", user);
        for (Module childModule : childModules) {
            System.out.println("childModule---" + childModule);
        }
        return new ResultEntity("查询成功", 200, map);
    }

    @Override
    public ResultEntity addLog(WebLog webLog) {
        System.out.println("webLog------->" + webLog);
        System.out.println("webLogMapper------->" + webLogMapper);
        try {
            webLogMapper.addWebLog(webLog);
            return ResultEntity.success();
        } catch (Exception e) {
            e.printStackTrace();
            return ResultEntity.fail();
        }
    }

    @Override
    public ResultEntity checkUsername(String username, String currentUsername) {
        System.out.println("currentUsername---" + currentUsername);
        User user = userMapper.selectByUsername(username);
        Map<String, Object> map = new HashMap<>();
        if (!StringUtils.isEmpty(user)) {
            if (user.getUsername().equals(currentUsername)) {
                map.put("code", 2000);
                map.put("msg", ApiCode.USERNAME_HAS_NO_CHANGE.getMsg());
                return ResultEntity.success(map);
            } else {
                map.put("code", 2001);
                map.put("msg", ApiCode.USERNAME_EXISTED.getMsg());
                return ResultEntity.success(map);
            }
        } else {
            map.put("code", 200);
            map.put("msg", ApiCode.USERNAME_CAN_USE.getMsg());
            return ResultEntity.success(map);
        }


    }

    @Override
    public ResultEntity editUserInfo(User user) {
        try {
            userMapper.updateByPrimaryKey(user);
            return ResultEntity.success();
        } catch (Exception e) {
            e.printStackTrace();
            return ResultEntity.fail();
        }
    }

    private List<Module> getModules(List<Module> parentModules, List<Module> secondModules) {
        for (Module parentModule : parentModules) {
            List<Module> childModules = new ArrayList<>();
            for (Module secondModule : secondModules) {
                if (parentModule.getId().equals(secondModule.getParentId())) {
                    childModules.add(secondModule);
                }
            }
            parentModule.setChildren(childModules);
        }
        return parentModules;
    }

    public static void main(String[] args) {
        String str = "";
        for (int i = 0; i < 3; i++) {
            str += "'" + i + "',";
        }
        System.out.println(str);
        str = str.substring(0, str.length() - 1);
        System.out.println("str===" + str);
    }
}
