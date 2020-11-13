package com.tom.login_boot.utils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.TreeNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.tom.login_boot.common.ResultEntity;

/**
 * json工具类
 */
public class JsonUtil {

    private static ObjectMapper objectMapper = new ObjectMapper();

    public static String objectToString(Object o) {
        try {
            String s = objectMapper.writeValueAsString(o);
            return s;
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        String msg = JsonUtil.objectToString(new ResultEntity("djakdjka", 401, ""));
        System.out.println(msg);
    }
}
