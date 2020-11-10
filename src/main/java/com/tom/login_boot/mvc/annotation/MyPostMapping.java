package com.tom.login_boot.mvc.annotation;

import java.lang.annotation.*;

@Documented
@Retention(RetentionPolicy.RUNTIME)
@Target(value = ElementType.TYPE)
public @interface MyPostMapping {
    public String value();
}
