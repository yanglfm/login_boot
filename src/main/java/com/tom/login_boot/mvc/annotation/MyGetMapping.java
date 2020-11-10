package com.tom.login_boot.mvc.annotation;

import javax.annotation.Resource;
import java.lang.annotation.*;

@Documented
@Retention(RetentionPolicy.RUNTIME)
@Target(value = ElementType.METHOD)
public @interface MyGetMapping {
    public String value();
}
