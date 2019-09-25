package com.study.coupon.bean;

import lombok.Data;

import java.util.Date;

@Data
public class TbCoupon {

    private Long couponId;

    private String couponType;

    private String couponContent;

    private Date startTime;

    private Date endTime;

    private Integer couponSum;

 }