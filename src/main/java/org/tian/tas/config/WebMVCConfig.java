package org.tian.tas.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @author blue
 * @date 2021/9/15 10:24
 */
@Configuration
public class WebMVCConfig implements WebMvcConfigurer{
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        WebMvcConfigurer.super.addCorsMappings(registry);
        registry.addMapping("/**")
                .allowedMethods("POST","GET","PUT","DELETE","PATCH","HEAD","OPTIONS")
                .allowedOrigins("http://localhost:8080","http://www.likeblue.cn:80")
                .maxAge(3600)
                .allowCredentials(true);
    }
}
