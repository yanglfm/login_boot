package com.tom.login_boot.proxy;

import org.springframework.cglib.proxy.Enhancer;
import org.springframework.cglib.proxy.MethodInterceptor;
import org.springframework.cglib.proxy.MethodProxy;

import java.lang.reflect.Method;

/**
 * cglib动态代理：可以代理没有接口的类
 */
public class CglibDynamicProxy implements MethodInterceptor {

    private static CglibDynamicProxy instance = new CglibDynamicProxy();

    private CglibDynamicProxy() {
    }

    public static CglibDynamicProxy getInstance() {
        return instance;
    }


    @SuppressWarnings("unchecked")
    public <T> T getProxy(Class<T> cls) {
        return (T) Enhancer.create(cls, this);
    }


    @Override
    public Object intercept(Object o, Method method, Object[] objects, MethodProxy methodProxy) throws Throwable {

        before();
        Object result = methodProxy.invokeSuper(o, objects);
        after();
        return result;
    }

    private void before() {
        System.out.println("before");
    }

    private void after() {
        System.out.println("after");
    }
}
