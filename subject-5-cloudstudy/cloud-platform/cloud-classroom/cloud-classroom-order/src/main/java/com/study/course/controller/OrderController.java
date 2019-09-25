package com.study.course.controller;

import com.study.course.bean.Order;
import com.study.course.bean.RespBean;
import com.study.course.common.JwtUtil;
import com.study.course.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/cloud/classroom/order")
public class OrderController<add> {

    @Autowired
    private OrderService orderService;

    /**
     * 生成订单 - 分布式事务 tcc、
     * 1、生成订单，把订单号传给优惠券service
     * 2、选择优惠券，锁定优惠券，需要订单id和优惠卷id
     * 3、下单成功调用支付
     * 4、未支付（取消订单或者超时），释放优惠券
     *
     * @param order
     * @return
     */
    @RequestMapping(method = RequestMethod.POST)
    public RespBean addOrder(@RequestBody Order order) {
        /* 1. 查看课程，从课程详情页面点击加入课程；传递课程id到订单生成页面
           2. 在订单生成页面选择使用优惠券来减扣课程价格（总价-优惠=实价）
           3. 生成订单（下单），同时要调用订单服务生成订单和优惠券服务锁定优惠券；该处需要使用tcc分布式事务
           4. 下单成功，调用支付接口支付。支付成功回调（修改订单状态，扣减库存；同样也需要分布式事务）
           5. 查看个人订单/订单详情
        */

        if (orderService.addOrder(order) == 1) {
            return RespBean.ok("添加成功!");
        }
        return RespBean.error("添加失败!");
    }

    /**
     * 根据id获取订单
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public Order getOrder(@PathVariable String id) {
        return orderService.getOrder(id);
    }

    /**
     * 订单列表，所有订单
     *
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public List<Order> getAllOrders() {
        List<Order> Orders = orderService.getAllOrder();
        return Orders;
    }

    /**
     * 订单列表，分页显示
     *
     * @param page
     * @param size
     * @param key
     * @return
     */
    @RequestMapping(value = "/page/list", method = RequestMethod.GET)
    public Map<String, Object> getOrdersByPage(@RequestParam(defaultValue = "1") Integer page,
                                               @RequestParam(defaultValue = "10") Integer limit, String key) {
        key = Optional.ofNullable(key).orElse("");
        Long count = orderService.getCountByKey(key);
        List<Order> Orders = null;
        Orders = orderService.getOrdersByPage(page, limit, key);
        Map<String, Object> map = new HashMap<>();
        map.put("Orders", Orders);
        map.put("count", count);
        return map;
    }

    /**
     * 更新订单信息
     *
     * @param Order
     * @return
     */
    @RequestMapping(method = RequestMethod.PUT)
    public RespBean updateOrder(Order Order) {
        if (orderService.updateOrder(Order) == 1) {
            return RespBean.ok("更新成功!");
        }
        return RespBean.error("更新失败!");
    }

    /**
     * 根据id删除订单
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public RespBean deleteOrder(@PathVariable String id) {
        if (orderService.deleteOrder(id) == 1) {
            return RespBean.ok("删除成功!");
        }
        return RespBean.error("删除失败!");
    }

    /**
     * 订购课程
     *
     * @param courseId
     * @return
     */
    @GetMapping(value = "/order/course")
    public RespBean orderCourse(String courseId) {
        int userId = Integer.valueOf(JwtUtil.getUserId());
        if (orderService.orderCourse(userId, courseId) == 1) {
            return RespBean.ok("订购成功!");
        }
        return RespBean.error("订购失败!");
    }

    /**
     * 获取当前用户订单
     *
     * @return
     */
    @GetMapping(value = "/mine/order")
    public List<Order> getMyOrders() {
        int userId = Integer.valueOf(JwtUtil.getUserId());
        List<Order> orders = orderService.getOrderByUserId(userId);
        return orders;
    }

}
