package com.tom.login_boot.service.impl;

import com.tom.login_boot.common.ResultEntity;
import com.tom.login_boot.mapper.db1.RoleMapper;
import com.tom.login_boot.mapper.db1.UserMapper;
import com.tom.login_boot.model.Module;
import com.tom.login_boot.model.User;
import com.tom.login_boot.service.RoleService;
import io.swagger.models.auth.In;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.*;

@Service
public class RoleServiceImpl implements RoleService {


    @Resource
    private RoleMapper roleMapper;

    @Resource
    private UserMapper userMapper;

    @Override
    public ResultEntity getUnauthorized(String roleIds) {
        Map<String, Object> map = new HashMap<>();
        List<User> userList = userMapper.getUserList();
        map.put("userList", userList);
        List<Module> allParentModule = roleMapper.getAllParentModule();
        String parentIds = getParentIds(allParentModule);
        if (!StringUtils.isEmpty(parentIds)) {
            List<Module> allChildModule = roleMapper.getAllChildModule(parentIds);
            List<Module> moduleList = UserServiceImpl.getModules(allParentModule, allChildModule);
            map.put("allModuleList", moduleList);
        }
        List<Module> parentModuleByRole = roleMapper.getParentModuleByRole(roleIds);
        String parentIdsByRole = getParentIds(parentModuleByRole);
        if (!StringUtils.isEmpty(parentIdsByRole)) {
            List<Module> childModuleByRole = roleMapper.getChildModuleByRole(roleIds, parentIdsByRole);
            List<Module> modules = UserServiceImpl.getModules(parentModuleByRole, childModuleByRole);
            map.put("moduleListByRole", modules);
        }
        System.out.println("map------>" + map);
        return ResultEntity.success(map);
    }

    private String getParentIds(List<Module> allParentModule) {
        StringBuilder sb = new StringBuilder();
        for (Module module : allParentModule) {
            Integer id = module.getId();
            sb.append(id).append(",");
        }
        if (sb.toString().length() > 0) {
            String s = sb.toString();
            return s.substring(0, s.length() - 1);
        }
        return null;
    }


    public ResultEntity getAllModule(Integer userId) {
        Map<String, Object> map = new HashMap<>();
        List<User> userList = userMapper.getUserList();


        List<Module> allParentModule = roleMapper.getAllParentModule();
//        List<Integer> parentIds = new ArrayList<>();
        StringBuilder sb = new StringBuilder();
        for (Module module : allParentModule) {
            Integer id = module.getId();
//            parentIds.add(id);
            sb.append(id).append(",");
        }
//        if () {
//            String parentIds = sb.toString().substring(0, sb.toString().length() - 1);
//            roleMapper.getAllChildModule();
//        }
//        List<Module> parentModuleByRole = roleMapper.getParentModuleByRole(userId);
//        List<Module> childModuleByRole = roleMapper.getChildModuleByRole(userId, parentIds);
        return ResultEntity.success(map);
    }

}
