package org.tian.tas.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

/**
 * @author blue
 * @date 2021/10/14 13:17
 */
@Component
public class StartCommandRunner implements CommandLineRunner {

    @Value("${switchToStart}")
    Boolean switchToStart;

    @Override
    public void run(String... args) throws Exception {
        if(switchToStart){
            Runtime.getRuntime().exec("cmd /c start http://localhost/tas/home");
        }
    }

}
