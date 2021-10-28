package org.tian.tas;

import cn.hutool.crypto.SecureUtil;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.tian.tas.service.UserService;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@SpringBootTest
class TasApplicationTests {

    @Autowired
    private UserService userService;

    @Test
    void uuidTest(){
        System.out.println(UUID.randomUUID().toString().replace("-", "").toLowerCase());
    }

    @Test
    void formatDate() throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat();
        Date date = sdf.parse("2021-09-18T02:22:42.000+00:00");
        System.out.println(date);
    }

    @Test
    void test(){
        String md5 = SecureUtil.md5().digestHex("adminIsTmh1st625864");
        System.out.println(md5);

    }

    @Test
    void test2(){
        String s = SecureUtil.md5().digestHex("admin");
        String s1 = SecureUtil.md5().digestHex("root");
        String s2 = SecureUtil.md5().digestHex("123456");
        System.out.println(s);
        System.out.println(s1);
        System.out.println(s2);
    }

    @Test
    void test3(){
        Integer num = Integer.parseInt("09");
        System.out.println(num);
        int num1 = 9;
        System.out.println(num == num1);
    }
}
