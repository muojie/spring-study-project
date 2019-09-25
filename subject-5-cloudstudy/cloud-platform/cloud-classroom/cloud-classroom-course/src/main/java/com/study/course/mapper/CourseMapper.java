package com.study.course.mapper;

import com.study.course.entity.Course;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface CourseMapper {

    int deleteByPrimaryKey(String id);

    int insert(Course record);

    int insertSelective(Course record);

    Course selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Course record);

    int updateByPrimaryKey(Course record);

    List<Course> getAllCourseOfTeacher(String userId);

    List<Course> getCoursesByPage(@Param("start") int start, @Param("size") Integer size, @Param("key") String key);

    Long getCountByKey(@Param("key") String key);
}