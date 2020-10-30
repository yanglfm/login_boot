package com.tom.login_boot.utils;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.Map;

/**
 * ConfigurationProperties注解：在 Spring Boot 项目中大量的参数配置，在 application.properties
 * 或 application.yml 文件中，通过 @ConfigurationProperties 注解，我们可以方便的获取
 * 这些参数值，application.yml 文件本身支持list类型所以在application.yml 文件中可以这样配置：
 * jwt:
 * config:
 * key: 自定义私钥key值
 * timeOut: 有效时间(毫秒单位)
 */
//@ConfigurationProperties(prefix = "jwt.config")
//@Component
public class JwtUtil {
    //签名私钥
    private String key;
    //签名有效时间
    private Long timeOut;

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public Long getTimeOut() {
        return timeOut;
    }

    public void setTimeOut(Long timeOut) {
        this.timeOut = timeOut;
    }

    /**
     * 设置认证token
     * id:用户id
     * subject:用户名
     */
    public String createJwt(String id, String name, Map<String, Object> map) {
        //1.设置失效时间
        long nowTime = System.currentTimeMillis();//当前毫秒
        long expirationTime = nowTime + timeOut;
        //2.创建jwtBuilder
        JwtBuilder jwtBuilder = Jwts.builder();
        //3.根据map设置claims
        //当设置的是整个map时，就需放在最前面，下面的setId等参数才会有效，否则会把前面set的值置空
        jwtBuilder.setClaims(map);
        jwtBuilder.setId(id);
        jwtBuilder.setSubject(name);
        jwtBuilder.setIssuedAt(new Date());//设置当前时间
        jwtBuilder.signWith(SignatureAlgorithm.HS256, key);//设置加密方式
        jwtBuilder.setExpiration(new Date(expirationTime));//设置过期时间
        //4.创建token
        String token = jwtBuilder.compact();
        return token;
    }

    /**
     * 解析token字符串获取clamis
     */
    public Claims parseJwt(String token) {
        Claims claims = Jwts.parser().setSigningKey(key).parseClaimsJws(token).getBody();
        return claims;
    }

}