package org.tian.tas.config;

import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

/**
 * @author blue
 * @date 2021/10/14 13:17
 */
@Component
public class StartCommandRunner implements CommandLineRunner {

    @Override
    public void run(String... args) throws Exception {
        Runtime.getRuntime().exec("cmd /c start http://localhost/home");
    }

}
