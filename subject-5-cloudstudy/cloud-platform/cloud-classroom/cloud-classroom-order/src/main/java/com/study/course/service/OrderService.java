package com.study.course.service;

import com.study.course.bean.Course;
import com.study.course.bean.Order;
import com.study.course.client.CouponClient;
import com.study.course.client.CouponDetailClinet;
import com.study.course.client.CourseClient;
import com.study.course.common.OrderStatusEnum;
import com.study.course.mapper.OrderMapper;
import com.study.security.common.msg.TableResultResponse;
import com.study.security.id.IGenerateIdService;
import lombok.extern.slf4j.Slf4j;
import org.dromara.hmily.annotation.Hmily;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by andy on 2019/1/24.
 */
@Service
@Slf4j
public class OrderService {
    @Autowired
    OrderMapper orderMapper;
    @Autowired
    CourseClient courseService;
    // 优惠券client
    @Autowired
    CouponClient couponClient;
    @Autowired
    CouponDetailClinet couponDetailClinet;
    @Autowired
    IGenerateIdService redisGenerateIdService;

    @Autowired
    private MsgSender sender;

    /**
     * 生成订单，需要调用订单服务和优惠券服务
     *
     * @param order
     * @return
     */
    @Hmily(confirmMethod = "confirmAddOrder", cancelMethod = "cancelAddOrder")
    public int addOrder(Order order) {
        final Long orderId = redisGenerateIdService.getId();
        order.setId(orderId);

        //
        TableResultResponse result = couponDetailClinet.getCouponDetailByUserId();
        // 选择使用那张优惠券，就是得到优惠券id

        // 使用优惠券
        couponClient.lockCoupon(1L, orderId, "1");

        return orderMapper.insert(order);
    }

    public void confirmAddOrder(Order order) {
        // 课后作业
        log.info("=========进行订单confirm操作完成================");
    }

    public void cancelAddOrder(Order order) {
        // 课后作业
        log.info("=========进行订单cancel操作完成================");
    }

    public List<Order> getAllOrder() {
        return orderMapper.getAllOrder();
    }

    public List<Order> getOrdersByPage(Integer page, Integer size, String name) {
        int start = (page - 1) * size;
        return orderMapper.getOrdersByPage(start, size, name);
    }

    public Long getCountByKey(String name) {
        return orderMapper.getCountByKey(name);
    }

    public Order getOrder(String id) {
        return orderMapper.selectByPrimaryKey(id);
    }

    public int updateOrder(Order Order) {
        return orderMapper.updateByPrimaryKeySelective(Order);
    }

    public int deleteOrder(String id) {
        return orderMapper.deleteByPrimaryKey(id);
    }

    public int orderCourse(int userId, String courseId) {
        Order order = new Order();
        order.setUserId(userId);
        order.setOrderTime(new Date(System.currentTimeMillis()));
        Course course = courseService.getCourse(courseId);
        order.setState(OrderStatusEnum.NOT_PAY.getCode());
        order.setTotal(course.getPrice());
        order.setCourseId(courseId);
        return this.addOrder(order);
    }

    public List<Order> getOrderByUserId(int userId) {
        List<Order> orders = orderMapper.getOrderByUserId(userId);
        orders.stream().forEach(item -> {
            Course course = courseService.getCourse(item.getCourseId());
            if (course != null) {
                item.setCourseName(course.getName());
            }
        });
        return orders;
    }

}
