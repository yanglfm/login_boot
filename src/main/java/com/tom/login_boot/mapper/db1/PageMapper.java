package com.tom.login_boot.mapper.db1;

import com.tom.login_boot.model.Module;
import com.tom.login_boot.model.Page;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

public interface PageMapper extends Mapper<Module> {
    void addPath(@Param("module") Module module);




}
