package com.study.course.client;

import com.study.course.bean.Course;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient(value = "cloud-classroom-course", fallback = CourseClientHystrix.class)
public interface CourseClient {

    @GetMapping(value = "/cloud/classroom/course/{id}")
    Course getCourse(@PathVariable("id") String id);

}


