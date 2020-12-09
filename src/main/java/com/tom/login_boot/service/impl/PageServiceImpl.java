package com.tom.login_boot.service.impl;

import com.tom.login_boot.common.ResultEntity;
import com.tom.login_boot.mapper.db1.PageMapper;
import com.tom.login_boot.model.Module;
import com.tom.login_boot.model.Path;
import com.tom.login_boot.service.PageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class PageServiceImpl implements PageService {

    @Resource
    private PageMapper pageMapper;



    /**
     * 先单纯添加子页面
     *
     * @param path 子页面对象
     * @return
     */
    @Override
    public ResultEntity addPath(Path path) {

        try {
            if (path.getComponent().equals("Layout")) {
                System.out.println("kkkk");
            } else {
                Module m = Module.builder().name(path.getTitle()).parentId(path.getParentId()).path(path.getPath()).component(path.getComponent()).build();
                pageMapper.addPath(m);
            }
            return ResultEntity.success();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResultEntity.fail();
    }




}
