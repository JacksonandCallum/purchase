package com.example.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .cors().and()  // 启用CORS
                .csrf().disable()
                .authorizeRequests()
                .antMatchers(
                        "/login",
                        "/register",
                        "/auth/**",
                        "/invite/**",
                        "/invite-application/**",
                        "/invite-code/**",
                        "/admin/**",
                        "/files/**",
                        "/notice/**",
                        "/data-match/**",
                        "/procurement-needs/**",
                        "/purchase-order/**"
                ).permitAll()
                .anyRequest().authenticated();
    }
}
