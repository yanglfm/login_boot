package com.tom.login_boot.mapper.db2;

import com.tom.login_boot.model.User;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

public interface UserMapper2 extends Mapper<User> {
    User selectByUsername(@Param("user") User user);

    User getOne(@Param("user") User user);
}
