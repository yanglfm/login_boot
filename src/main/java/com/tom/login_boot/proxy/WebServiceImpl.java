package com.tom.login_boot.proxy;

public class WebServiceImpl implements WebService {
    @Override
    public void web(String url) {
        System.out.println("url-----" + url);
    }
}
