package org.tian.tas;

import org.junit.jupiter.api.Test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

//@SpringBootTest
class TasApplicationTests {

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
}
