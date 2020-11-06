package com.tom.login_boot.utils;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTDecodeException;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.google.common.base.Function;
import io.jsonwebtoken.*;
import io.jsonwebtoken.impl.DefaultClock;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 生成jwt，验证jwt的正确性
 */
@Component
public class JwtUtils {

    //签名私钥
    @Value("${jwt.secretKey}")
    private String secretKey;
    //签名有效时间
    @Value("${jwt.expiredTime}")
    private Long expiredTime;

    private Clock clock = DefaultClock.INSTANCE;

    private static final String TOKEN_SECRET = "DD5654D654DSD5S1D65S4D65S1D";

    public static String AUTHORIZATION = "Authorization";

    /**
     * @param username
     * @return
     */
    public String createToken(String username) {
        //过期时间
        //毫秒级
        Date date = new Date(System.currentTimeMillis() + expiredTime*1000);
        //私钥及加密算法
        Algorithm algorithm = Algorithm.HMAC256(TOKEN_SECRET);
        //设置头部信息
        Map<String, Object> header = new HashMap<>();
        header.put("typ", "JWT");
        header.put("alg", "hs256");
        //附带username信息，生成签名
        return JWT.create()
                .withHeader(header)
                .withClaim("username", username)
                .withExpiresAt(date)
                .sign(algorithm);
    }

    /**
     * 验证token是否过期
     *
     * @param token
     * @return
     */

    public boolean verify(String token) {
        try {
            Algorithm algorithm = Algorithm.HMAC256(TOKEN_SECRET);
            JWTVerifier verifier = JWT.require(algorithm).build();
            try {
                DecodedJWT jwt = verifier.verify(token);
                return true;
            } catch (JWTVerificationException e) {
                e.printStackTrace();
                return false;
            }

        } catch (IllegalArgumentException | JWTVerificationException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 获取token 中的信息无需secret解密也能获取
     *
     * @param token 密钥
     * @return token中包含的用户名
     */
    public String getUserName(String token) {
        try {
            DecodedJWT jwt = JWT.decode(token);
            return jwt.getClaim("username").asString();
        } catch (JWTDecodeException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static void main(String[] args) {
//        String token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MDQzMDU2OTgsInVzZXJuYW1lIjoidG9tIn0.PfaZ7NuxkIpQG8v4UPByIW6l6JrXxECaAMPsY2MTI1U";
        JwtUtils jwtUtils = new JwtUtils();
        String token = jwtUtils.createToken("测试");

        boolean verify = jwtUtils.verify(token);
        System.out.println("verify--->" + verify);
    }

}
