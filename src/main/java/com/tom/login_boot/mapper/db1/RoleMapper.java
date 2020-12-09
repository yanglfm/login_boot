package com.tom.login_boot.mapper.db1;

import com.tom.login_boot.model.Module;
import io.swagger.models.auth.In;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface RoleMapper {

    List<Module> getUserModule(@Param("roleIds") String roleIds);

    List<Module> getAllParentModule();

    List<Module> getAllChildModule(@Param("parentIds") String parentIds);

    List<Module> getParentModuleByRole(@Param("roleIds") String roleIds);

    List<Module> getChildModuleByRole(@Param("roleIds") String roleIds, @Param("parentIds") String parentIds);

}
