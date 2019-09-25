package com.study.course.client;


import com.study.course.bean.Course;
import org.springframework.stereotype.Component;

/**
 * Created by zhongxin on 2017/9/17.
 */
@Component
public class CourseClientHystrix implements CourseClient {
    @Override
    public Course getCourse(String courseId) {
        return null;
    }

}
