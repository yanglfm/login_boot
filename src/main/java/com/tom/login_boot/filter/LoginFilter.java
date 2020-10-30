package com.tom.login_boot.filter;

import com.auth0.jwt.exceptions.TokenExpiredException;
import com.tom.login_boot.common.ResultEntity;
import com.tom.login_boot.utils.JsonUtil;
import com.tom.login_boot.utils.JwtUtils;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.PathMatcher;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.annotation.Resource;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Component
@Order(1)
public class LoginFilter extends OncePerRequestFilter {

    @Resource
    private JwtUtils jwtUtils;
    private static List<String> ALLOW_LIST = new ArrayList<>(Arrays.asList(
            "/user/login",
            "/user/getPhoneCode",
            "/user/register"

    ));

    private static final PathMatcher pathMatcher = new AntPathMatcher();
    private static final String AUTHORIZATION = "Authorization";

    @Override

    protected void doFilterInternal(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, FilterChain filterChain) throws ServletException, IOException {
        System.out.println("----------------------LoginFilter-----------------------");
        System.out.println("request===" + httpServletRequest);
        System.out.println("getServerName---" + httpServletRequest.getServerName());
        System.out.println("getScheme---" + httpServletRequest.getScheme());
        System.out.println("getServerPort---" + httpServletRequest.getServerPort());
        httpServletResponse.setHeader("Access-Control-Allow-Origin", "*"); //  这里最好明确的写允许的域名
        httpServletResponse.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE, PUT");
        httpServletResponse.setHeader("Access-Control-Max-Age", "3600");
        httpServletResponse.setHeader("Access-Control-Allow-Headers", "Content-Type,Access-Token,Authorization,ybg");

        String token = httpServletRequest.getHeader(AUTHORIZATION);
        String errMsg = "";
        if (!isPassUrl(httpServletRequest)) {
            if (StringUtils.isEmpty(token)) {
                errMsg = "jwt为空";
            } else {
                try {
                    jwtUtils.verify(token);
                } catch (TokenExpiredException e) {
                    errMsg = "jwt过期";
                    e.printStackTrace();
                } catch (Exception e) {
                    errMsg = "jwt格式错误";
                    e.printStackTrace();
                }
            }
            if (!StringUtils.isEmpty(errMsg)) {
                PrintWriter pw = httpServletResponse.getWriter();
                String s = JsonUtil.objectToString(new ResultEntity(errMsg, 401, ""));
                pw.write(s);
                pw.flush();
                pw.close();
            }
        }


        filterChain.doFilter(httpServletRequest, httpServletResponse);
    }

    private boolean isPassUrl(HttpServletRequest request) {
        if (request.getMethod().equalsIgnoreCase("OPTIONS")) {
            return true;
        }
        String servletPath = request.getServletPath();
        for (String url : ALLOW_LIST) {
            if (pathMatcher.match(url, servletPath)) {
                return true;
            }
        }

        return false;
    }
}
