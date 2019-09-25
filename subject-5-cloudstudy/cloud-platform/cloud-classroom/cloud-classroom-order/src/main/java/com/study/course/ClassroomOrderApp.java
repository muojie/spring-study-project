package com.study.course;

import com.study.security.auth.client.EnableClientAuthClient;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.data.mongo.MongoDataAutoConfiguration;
import org.springframework.boot.autoconfigure.mongo.MongoAutoConfiguration;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ImportResource;

@SpringBootApplication(exclude = {MongoAutoConfiguration.class, MongoDataAutoConfiguration.class})
@RefreshScope
@EnableDiscoveryClient
@EnableFeignClients({"com.study.security.auth.client.feign", "com.study.course.client"})
@ImportResource({"classpath:applicationContext.xml"})
@EnableClientAuthClient
@MapperScan("com.study.course.mapper")
public class ClassroomOrderApp {

	public static void main(String[] args) {
		SpringApplication.run(ClassroomOrderApp.class, args);
	}
}
