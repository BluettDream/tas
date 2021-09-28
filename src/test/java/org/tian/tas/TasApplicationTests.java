package org.tian.tas;

import cn.hutool.core.io.file.FileReader;
import cn.hutool.core.io.file.FileWriter;
import org.junit.jupiter.api.Test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

//@SpringBootTest
class TasApplicationTests {

    @Test
    void contextLoads() throws ParseException {
        String filePath = "C:\\Users\\EDZ\\Documents\\WeChat Files\\wxid_6uftl0eubyyq22\\FileStorage\\File\\2021-09\\gz20210101-20210923(1).txt";
        FileReader reader = new FileReader(filePath, "gbk");
        FileWriter writer = new FileWriter("C:\\Users\\EDZ\\Desktop\\123.txt", "gbk");
        List<String> lines = reader.readLines();
        for (String line : lines) {
            System.out.println("开始行---------" + line);
            String[] split = line.split("\\|");
            StringBuilder newLine = new StringBuilder();
            for (int i = 0; i < split.length; ++i) {
                if (split[i].contains("上午") || split[i].contains("下午")) {
                    SimpleDateFormat sim2 = new SimpleDateFormat("yyyy-MM-dd a hh:mm:ss", Locale.CHINA);
                    Date parse = sim2.parse(split[i]);
                    SimpleDateFormat sim1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    String format = sim1.format(parse);
                    split[i] = format;
                }
                newLine.append(split[i]).append("|");
            }
            writer.append(newLine + "\r\n");
            System.out.println("结束行---------" + newLine);
        }
    }

    @Test
    void uuidt(){
        System.out.println(UUID.randomUUID().toString().replace("-", "").toLowerCase());
    }
}
