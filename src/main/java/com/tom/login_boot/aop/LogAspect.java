package com.tom.login_boot.aop;

import com.tom.login_boot.mapper.db1.WebLogMapper;
import com.tom.login_boot.model.WebLog;
import com.tom.login_boot.service.UserService;
import com.tom.login_boot.utils.JwtUtils;
import com.tom.login_boot.utils.RequestUtil;
import io.swagger.annotations.ApiOperation;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.lang.reflect.Parameter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Aspect
@Component
@Order(1)
public class LogAspect {

    @Resource
    private UserService userServiceImpl;
    //
    @Resource
    private JwtUtils jwtUtils;

    @Resource
    private WebLogMapper webLogMapper;

    private ThreadLocal<Long> startTime = new ThreadLocal<>();

    @Pointcut("execution(* com.tom.login_boot.controller.*.*(..))")
    public void aspectPointCut() {
        startTime.set(System.currentTimeMillis());
    }

    @Around("aspectPointCut()")
    public Object getLogAround(ProceedingJoinPoint joinPoint) throws Throwable {
        //springboot中获取request的方法
        ServletRequestAttributes servletRequestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = servletRequestAttributes.getRequest();
        String requestURI = request.getRequestURI();
        System.out.println("-----request----" + request);
        System.out.println("-----request---AUTHORIZATION-------" + request.getHeader(JwtUtils.AUTHORIZATION));
        System.out.println("-----begin-------" + joinPoint.getClass() + "------" + requestURI);
        WebLog webLog = new WebLog();
        String token = request.getHeader(JwtUtils.AUTHORIZATION);
        if (!StringUtils.isEmpty(token)) {
            String username = jwtUtils.getUserName(token);
            webLog.setUsername(username);
        }
        Object result = joinPoint.proceed();
        Signature signature = joinPoint.getSignature();
        MethodSignature methodSignature = (MethodSignature) signature;
        Method method = methodSignature.getMethod();
        if (method.isAnnotationPresent(ApiOperation.class)) {
            ApiOperation log = method.getAnnotation(ApiOperation.class);
            webLog.setDescription(log.value());
        }

        webLog.setContentPath(requestURI);
        long endTime = System.currentTimeMillis();
        webLog.setBasePath(RequestUtil.getBathPath(request));
        webLog.setIp(request.getRemoteUser());
        webLog.setMethod(request.getMethod());
        webLog.setParameter(getParameter(method, joinPoint.getArgs()));
        webLog.setResult(result);

//        try {
//            userServiceImpl.addLog(webLog);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        System.out.println("----webLog-----" + webLog);
        System.out.println("-----end-------");

        return result;
    }

    /*根据方法和传入参数获取请求参数*/
    private Object getParameter(Method method, Object[] args) {
        List<Object> argsList = new ArrayList<>();
        Parameter[] parameters = method.getParameters();
        for (int i = 0; i < parameters.length; i++) {
            RequestBody requestBody = parameters[i].getAnnotation(RequestBody.class);
            if (requestBody != null) {
                argsList.add(args[i]);
            }
            RequestParam requestParam = parameters[i].getAnnotation(RequestParam.class);
            if (requestParam != null) {
                Map<String, Object> map = new HashMap<>();
                String key = parameters[i].getName();//得到parameter[i]
                if (!StringUtils.isEmpty(requestParam.value())) {
                    key = requestParam.value();
                }
                map.put(key, args[i]);
                argsList.add(map);
            }
        }
        if (argsList.size() == 0) {
            return null;
        } else if (argsList.size() == 1) {
            return argsList.get(0);
        } else {
            return argsList;
        }
    }


}

