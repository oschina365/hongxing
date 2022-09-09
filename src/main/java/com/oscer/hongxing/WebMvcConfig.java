package com.oscer.hongxing;

import cn.dev33.satoken.interceptor.SaRouteInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.ArrayList;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    /**
     * 开启跨域
     */
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        // 设置允许跨域的路由
        registry.addMapping("/**")
                // 设置允许跨域请求的域名
                .allowedOriginPatterns("*")
                // 是否允许证书（cookies）
                .allowCredentials(true)
                // 设置允许的方法
                .allowedMethods("*")
                // 跨域允许时间
                .maxAge(360000);
    }

    // 注册拦截器
    @Override
    public void addInterceptors(InterceptorRegistry registry) {

       /* // 注册 Sa-Token 的路由拦截器
        registry.addInterceptor(new SaRouteInterceptor())
                .addPathPatterns("/admin/**")
                .excludePathPatterns(new ArrayList<String>() {{
                    add("/admin");
                }});*/
    }

}
