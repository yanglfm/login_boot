package com.tom.login_boot.proxy;

import com.tom.login_boot.model.User;

public class CglibMain {
    public static void main(String[] args) {
//        UserServiceImpl proxy = CglibDynamicProxy.getInstance().getProxy(UserServiceImpl.class);
//        User user = new User();
//        user.setUserId("123");
//        proxy.userInfo(user);

        WebServiceImplTwo implTwo = CglibDynamicProxy.getInstance().getProxy(WebServiceImplTwo.class);
        implTwo.web("-------uuufuuu -----");
        WebService proxy = CglibDynamicProxy.getInstance().getProxy(WebServiceImpl.class);
        proxy.web("----dfdf------");

        /**/
    }
}
