package com.tom.login_boot.mapper.db1;

import com.tom.login_boot.model.WebLog;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface WebLogMapper extends Mapper<WebLog> {
    void addWebLog(@Param("webLog") WebLog webLog);

    List<WebLog> selectByUsername(@Param("username") String username,
                                  @Param("start")Integer start,
                                  @Param("end")Integer end,
                                  @Param("search")String search
                                  );

    Long getWebLogCount(@Param("username") String username,
                        @Param("search")String search);
}
