package com.study.course.client;

import org.dromara.hmily.annotation.Hmily;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * 优惠卷 rpc
 */
@FeignClient(value = "cloud-coupon-server")
public interface CouponClient {

    @GetMapping(value = "/coupon/detail/op/lockCoupon")
    @Hmily
    public Object lockCoupon(Long couponDetailId, Long orderId, String orderUserId);

}


