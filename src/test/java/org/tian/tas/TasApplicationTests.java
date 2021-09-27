package org.tian.tas;

import cn.hutool.core.io.file.FileReader;
import cn.hutool.core.io.file.FileWriter;
import org.junit.jupiter.api.Test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

//@SpringBootTest
class TasApplicationTests {

    @Test
    void contextLoads() throws ParseException {
        String filePath = "C:\\Users\\EDZ\\Documents\\WeChat Files\\wxid_6uftl0eubyyq22\\FileStorage\\File\\2021-09\\gz20210101-20210923(1).txt";
        FileReader reader = new FileReader(filePath,"gbk");
        FileWriter writer = new FileWriter("C:\\Users\\EDZ\\Desktop\\123.txt","gbk");
        List<String> lines = reader.readLines();
        //int i = 0;
        for (String line : lines) {
            //if(i == 0){
            System.out.println("开始行---------"+line);
                String[] split = line.split("\\|");
            String newLine = "";
                for (int i = 0;i < split.length;++i) {
                    //s.contains("上午") ||
                    if (split[i].contains("上午") || split[i].contains("下午")) {
                        //System.out.println(s);
                        SimpleDateFormat sim2 = new SimpleDateFormat("yyyy-MM-dd a hh:mm:ss", Locale.CHINA);
                        Date parse = sim2.parse(split[i]);
                        //System.out.println(parse);
                        SimpleDateFormat sim1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                        String format = sim1.format(parse);
                        //System.out.println(format);
                        split[i] = format;
                    }
                    newLine += split[i]+"|";
                }
                writer.append(newLine+"\r\n");
            System.out.println("结束行---------"+newLine);

                //i++;
            //}else{
            //    break;
            //}
        }
    }

}
