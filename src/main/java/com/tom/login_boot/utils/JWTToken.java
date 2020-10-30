//package com.tom.login_boot.utils;
//
//import com.auth0.jwt.JWT;
//import com.auth0.jwt.JWTVerifier;
//import com.auth0.jwt.algorithms.Algorithm;
//import com.auth0.jwt.interfaces.Claim;
//import com.auth0.jwt.interfaces.DecodedJWT;
//import com.chitic.bank.model.Userinfo;
//import com.chitic.bank.web.exception.UnauthorizeException;
//
//import java.util.Calendar;
//import java.util.Date;
//import java.util.HashMap;
//import java.util.Map;
//
///**
// * @author GX
// * @version 1.0*/
//public class JWTToken {
//
//    /**
//     * 生成token
//     * @return
//     * @throws Exception
//     */
//    public static String createToken(Userinfo user) throws Exception{
//
////        签发时间
//        Date iatDate=new Date();
//
////        过期时间-outTime分钟过期
//        Calendar nowTime=Calendar.getInstance();
//        nowTime.add(Calendar.MINUTE, ValuesUtil.OutTime);
//        Date expiresDate=nowTime.getTime();
//
//        Map<String,Object> map=new HashMap<String,Object>();
//        map.put(ParamsUtil.Alg_Key, ValuesUtil.Alg_RS256);
//        map.put(ParamsUtil.Typ_Key, ValuesUtil.Typ_JWT);
//        String token="";
//        token=JWT.create()
//                .withHeader(map)
//                .withClaim(ParamsUtil.User_Key, user.getUsername())
//                .withClaim(ParamsUtil.Id_Key, user.getId())
//                .withClaim(ParamsUtil.Role_Key, user.getRole())
//                .withClaim(ParamsUtil.Rights_Key,user.getRights())
//                .withExpiresAt(expiresDate)//设置过期时间-过期时间要大于签发时间
//                .withIssuedAt(iatDate)//设置签发时间
//                .sign(Algorithm.HMAC256(ValuesUtil.SECRET));//加密
//        return token;
//    }
//
//    /**
//     * 解密token
//     * @param token
//     * @return
//     * @throws Exception
//     */
//    public static Map<String,Claim> verifyToken(String token) throws Exception {
//        JWTVerifier verifier=JWT.require(Algorithm.HMAC256(ValuesUtil.SECRET)).build();
//        DecodedJWT jwt=null;
//        try {
//            jwt=verifier.verify(token);
//        } catch (Exception e) {
////            throw new RuntimeException("登录已失效,请重新登录");
//            throw new UnauthorizeException(1006, "登录已失效,请重新登录");
//        }
//        return jwt.getClaims();
//    }
//
//
//}