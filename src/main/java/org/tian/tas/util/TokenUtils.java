package org.tian.tas.util;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.exceptions.ValidateException;
import cn.hutool.jwt.JWT;
import cn.hutool.jwt.JWTValidator;
import cn.hutool.jwt.signers.JWTSigner;
import cn.hutool.jwt.signers.JWTSignerUtil;
import org.springframework.stereotype.Component;
import org.tian.tas.entity.User;
import org.tian.tas.entity.UserStatus;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 * @author tianmh
 * @date create by 2021/10/22 17:20
 */
@Component
public class TokenUtils implements Serializable {
    private static final long serialVersionUID = -2607143841764340315L;
    private static final String KEY = "2019121218";
    private static final long EXPIRATION = 60000 * 30;

    public String generateToken(User user){
        long currentTimeMillis = System.currentTimeMillis();
        long endTimeMillis = currentTimeMillis + EXPIRATION;
        Map<String,Object> header = new HashMap<>();
        header.put("TianMengHao",KEY);
        Map<String,Object> payload = new HashMap<>();
        payload.put("name",user.getName());
        payload.put("password",user.getPassword());
        payload.put("userRole",user.getRole());
        JWTSigner signer = JWTSignerUtil.hs256(user.getId().getBytes());
        return JWT.create().addHeaders(header)
                .addPayloads(payload)
                .setSigner(signer)
                .setNotBefore(DateUtil.date(currentTimeMillis))
                .setExpiresAt(DateUtil.date(endTimeMillis))
                .sign();
    }

    public Boolean validationToken(String token, User user, UserStatus userStatus){
        Boolean ans;
        try{
            JWTValidator.of(token)
                    .validateAlgorithm(JWTSignerUtil.hs256(user.getId().getBytes()))
                    .validateDate(userStatus.getLoginTime(),EXPIRATION);
            ans = true;
        }catch (ValidateException e){
            ans = false;
            System.out.println(e);
        }
        return ans;
    }
}
