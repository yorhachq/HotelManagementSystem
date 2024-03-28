package com.chq.hms.util;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;

import java.util.Date;
import java.util.Map;


public class JwtUtil {

    private static final String KEY = "@C@H@QdeJWT718";

	//接收业务数据,生成token并返回
    public static String genToken(Map<String, Object> claims) {
        return JWT.create()
                .withClaim("claims", claims) //添加载荷
                .withExpiresAt(new Date(System.currentTimeMillis() + 1000 * 60 * 60 * 12)) //添加过期时间12小时
                .sign(Algorithm.HMAC256(KEY)); //指定算法并配置密钥
    }

    /**
     * 接收token,验证token,并返回JSON格式的业务数据
     * 可能抛出的异常:
     * 1.令牌过期:TokenExpiredException
     * 2.篡改token(未引发base64或JSON格式错误时):SignatureVerificationException
     * 3.若篡改导致base64或JSON格式错误，则会抛出对应异常，即只要解析令牌抛出异常，就认为令牌被篡改或过期了
     */
    public static Map<String, Object> parseToken(String token) {
        return JWT.require(Algorithm.HMAC256(KEY))
                .build()
                .verify(token)
                .getClaim("claims")
                .asMap();
    }

}
