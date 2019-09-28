/*
Navicat MySQL Data Transfer

Source Server         : ESXI-mysql-master
Source Server Version : 50722
Source Host           : 192.168.100.240:3306
Source Database       : course_coupon

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2019-09-28 22:14:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_coupon
-- ----------------------------
DROP TABLE IF EXISTS `tb_coupon`;
CREATE TABLE `tb_coupon` (
  `id` int(11) NOT NULL COMMENT '优惠券编号',
  `coupon_type` int(11) DEFAULT NULL COMMENT '1-无门槛优惠券 2-满减优惠券 3-新人优惠 4-...',
  `coupon_content` varchar(255) DEFAULT NULL COMMENT '优惠券的内容（无门槛立减，满多少减多少...）',
  `start_time` datetime DEFAULT NULL COMMENT '适用时限开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '适用时限结束时间',
  `coupon_sum` int(11) DEFAULT NULL COMMENT '发放数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='优惠券表';

-- ----------------------------
-- Records of tb_coupon
-- ----------------------------
INSERT INTO `tb_coupon` VALUES ('1', '1', '{\"price\": -800}', '2019-06-24 08:45:34', '2019-10-30 08:45:34', '2');
INSERT INTO `tb_coupon` VALUES ('2', '1', '{\"price\": -500}', '2019-07-26 11:18:07', '2019-10-17 11:18:07', '9');

-- ----------------------------
-- Table structure for tb_coupon_detail
-- ----------------------------
DROP TABLE IF EXISTS `tb_coupon_detail`;
CREATE TABLE `tb_coupon_detail` (
  `id` int(11) NOT NULL COMMENT '优惠券明细ID',
  `coupon_id` int(11) DEFAULT NULL,
  `coupon_detail_status` int(11) DEFAULT NULL COMMENT '1-未使用 2-已使用 3-已过期 4-锁定  99-异常',
  `user_id` int(11) DEFAULT NULL COMMENT '领用人ID',
  `order_id` int(11) DEFAULT NULL COMMENT '订单ID',
  `start_time` datetime DEFAULT NULL COMMENT '记录创建时间',
  `end_time` datetime DEFAULT NULL COMMENT '使用时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_coupon_detail
-- ----------------------------
INSERT INTO `tb_coupon_detail` VALUES ('1', '1', '1', '99999', '10000002', '2019-07-24 11:25:31', '2019-07-24 11:25:31');
INSERT INTO `tb_coupon_detail` VALUES ('2', '2', '1', '1', null, '2019-07-26 22:32:54', '2019-07-31 22:50:53');
INSERT INTO `tb_coupon_detail` VALUES ('3', '1', '1', '99999', null, '2019-07-24 11:18:32', '2019-07-24 11:18:32');
INSERT INTO `tb_coupon_detail` VALUES ('4', '1', '1', '99999', null, '2019-07-24 11:18:35', '2019-07-24 11:18:35');
INSERT INTO `tb_coupon_detail` VALUES ('5', '2', '1', '99999', null, null, null);
