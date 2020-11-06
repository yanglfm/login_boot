package com.tom.login_boot.mapper.db1;

import com.tom.login_boot.model.Module;
import com.tom.login_boot.model.Role;
import com.tom.login_boot.model.User;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;


public interface UserMapper extends Mapper<User> {

    User getOne(@Param("user") User user);

    User selectByUsername(@Param("username") String username);

    List<Role> getUserRoles(@Param("username") String username);

    List<Module> getParentModules(@Param("roleIds") String roleIds);

    List<Module> getSecondModules(@Param("parentIds") String parentIds,@Param("roleIds") String roleIds);

    void updateUser(@Param("user") User user);
}
