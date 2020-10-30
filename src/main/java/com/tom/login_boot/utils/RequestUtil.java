package com.tom.login_boot.utils;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;

/**
 * 工具类
 */
public class RequestUtil {

    /**
     * 移除request指定参数
     */
    public String removeParam(HttpServletRequest request, String paramName) {
        String queryString = "";
        Enumeration keys = request.getParameterNames();
        while (keys.hasMoreElements()) {
            String key = (String) keys.nextElement();
            if (key.equals(paramName)) {
                continue;
            }
            if ("".equals(queryString)) {
                queryString = key + "=" + request.getParameter(key);
            } else {
                queryString += "&" + key + "=" + request.getParameter(key);
            }
        }
        return queryString;
    }

    public static String getBathPath(HttpServletRequest request) {
        String servletPath = request.getServerName();//localhost
        int serverPort = request.getServerPort();//8087
        String scheme = request.getScheme();//http
        StringBuilder sb = new StringBuilder("");
        sb.append(scheme).append("://")
                .append(servletPath);
        if ("http".equalsIgnoreCase(scheme) && 80 != serverPort) {
            sb.append(":").append(serverPort);
        } else if ("https".equalsIgnoreCase(scheme) && 443 != serverPort) {
            sb.append(":").append(serverPort);
        }
        return sb.toString();
    }

}
