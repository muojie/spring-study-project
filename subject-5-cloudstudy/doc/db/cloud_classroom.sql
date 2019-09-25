/*
Navicat MySQL Data Transfer

Source Server         : ESXI-mysql-master
Source Server Version : 50722
Source Host           : 192.168.100.240:3306
Source Database       : cloud_classroom

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2019-09-25 17:26:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `name` varchar(50) DEFAULT NULL COMMENT '课程名',
  `image` varchar(100) DEFAULT NULL COMMENT '课程图片',
  `price` double(10,2) DEFAULT NULL COMMENT '价格',
  `synopsis` varchar(100) DEFAULT NULL COMMENT '简介',
  `description` varchar(200) DEFAULT NULL COMMENT '详细介绍',
  `classification` varchar(100) DEFAULT NULL COMMENT '分类',
  `teacher_id` varchar(100) DEFAULT NULL COMMENT '教师ID',
  `status` int(11) DEFAULT NULL COMMENT '课程状态',
  `start_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '开课时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程表';

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', 'java-设计模设AAA', 'http://dong-nao-andy-bucket.oss-cn-shenzhen.aliyuncs.com/images/2019/06/14/15605196626321660.jpg', '23.46', 'java-设计模设323', 'java-设计模设234', 'java-设计模设344', '5', null, '2019-09-24 14:26:45', '2019-09-24 14:45:29');
INSERT INTO `course` VALUES ('2', 'java-设计模设BBB', 'http://dong-nao-andy-bucket.oss-cn-shenzhen.aliyuncs.com/images/2019/06/16/15606715578186159.jpg', '66.00', 'java-设计模设', 'java-设计模设', 'java-设计模设', '5', null, '2019-09-24 14:26:46', '2019-09-24 14:26:46');
INSERT INTO `course` VALUES ('3', '课程123', 'http://dong-nao-andy-bucket.oss-cn-shenzhen.aliyuncs.com/images/2019/06/14/15605189199339056.jpg', '2346.00', '55', '88', '', '1', null, '2019-09-24 14:26:48', '2019-09-24 14:26:48');
INSERT INTO `course` VALUES ('4', '测试课程test', 'http://dong-nao-andy-bucket.oss-cn-shenzhen.aliyuncs.com/images/2019/06/14/15605243999622835.jpg', '999.00', '33', '', '', '5', null, '2019-09-24 14:26:50', '2019-09-24 14:26:50');
INSERT INTO `course` VALUES ('5', 'rabbitmqEEEE', null, '1400.00', 'RabbitMQ是实现了高级消息队列协议（AMQP）的开源消息代理软件', 'RabbitMQ是实现了高级消息队列协议（AMQP）的开源消息代理软件（亦称面向消息的中间件）。RabbitMQ服务器是用Erlang语言编写的，而集群和故障转移是构建在开放电信平台框架上的。所有主要的编程语言均有与代理接口通讯的客户端库', null, '1', null, '2019-09-25 07:36:58', '2019-09-25 07:36:58');
INSERT INTO `course` VALUES ('6', 'java架构师课程CCC', 'http://dong-nao-andy-bucket.oss-cn-shenzhen.aliyuncs.com/images/2019/06/16/15606885328014220.jpg', '120.00', 'java架构师课程', 'java架构师课程', 'java架构师课程', '5', null, '2019-09-24 14:26:56', '2019-09-24 14:26:56');
INSERT INTO `course` VALUES ('7', 'java架构师课程EEEE', null, '120.00', 'java架构师课程', 'java架构师课程', 'java架构师课程', '5', null, '2019-09-24 14:26:58', '2019-09-24 14:26:58');
INSERT INTO `course` VALUES ('8', 'java架构师课程DDD', 'http://dong-nao-andy-bucket.oss-cn-shenzhen.aliyuncs.com/images/2019/06/16/15606719174308328.jpg', '120.00', 'java架构师课程', 'java架构师课程', 'java架构师课程', '5', null, '2019-09-24 14:27:00', '2019-09-24 14:27:00');
INSERT INTO `course` VALUES ('9', 'rabbitmqBBB', null, '1300.00', 'RabbitMQ是实现了高级消息队列协议（AMQP）的开源消息代理软件', 'RabbitMQ是实现了高级消息队列协议（AMQP）的开源消息代理软件（亦称面向消息的中间件）。RabbitMQ服务器是用Erlang语言编写的，而集群和故障转移是构建在开放电信平台框架上的。所有主要的编程语言均有与代理接口通讯的客户端库', null, '1', null, '2019-09-25 07:37:01', '2019-09-25 07:37:01');
INSERT INTO `course` VALUES ('10', 'rabbitmqCCCC', null, '1400.00', 'RabbitMQ是实现了高级消息队列协议（AMQP）的开源消息代理软件', 'RabbitMQ是实现了高级消息队列协议（AMQP）的开源消息代理软件（亦称面向消息的中间件）。RabbitMQ服务器是用Erlang语言编写的，而集群和故障转移是构建在开放电信平台框架上的。所有主要的编程语言均有与代理接口通讯的客户端库', null, '1', null, '2019-09-25 07:36:52', '2019-09-25 07:36:52');
INSERT INTO `course` VALUES ('11', 'rabbitmqFFFF', null, '1400.00', 'RabbitMQ是实现了高级消息队列协议（AMQP）的开源消息代理软件', 'RabbitMQ是实现了高级消息队列协议（AMQP）的开源消息代理软件（亦称面向消息的中间件）。RabbitMQ服务器是用Erlang语言编写的，而集群和故障转移是构建在开放电信平台框架上的。所有主要的编程语言均有与代理接口通讯的客户端库', null, '5', null, '2019-09-24 14:27:09', '2019-09-24 14:27:09');
INSERT INTO `course` VALUES ('12', 'rabbitmq', null, '1200.00', 'RabbitMQ是实现了高级消息队列协议（AMQP）的开源消息代理软件', 'RabbitMQ是实现了高级消息队列协议（AMQP）的开源消息代理软件（亦称面向消息的中间件）。RabbitMQ服务器是用Erlang语言编写的，而集群和故障转移是构建在开放电信平台框架上的。所有主要的编程语言均有与代理接口通讯的客户端库', null, '1', null, '2019-09-25 07:36:54', '2019-09-25 07:36:54');
INSERT INTO `course` VALUES ('13', 'rabbitmqBBB', null, '1300.00', 'RabbitMQ是实现了高级消息队列协议（AMQP）的开源消息代理软件', 'RabbitMQ是实现了高级消息队列协议（AMQP）的开源消息代理软件（亦称面向消息的中间件）。RabbitMQ服务器是用Erlang语言编写的，而集群和故障转移是构建在开放电信平台框架上的。所有主要的编程语言均有与代理接口通讯的客户端库', null, '1', null, '2019-09-25 07:36:55', '2019-09-25 07:36:55');
INSERT INTO `course` VALUES ('14', 'rabbitmqDDDD', null, '1402.00', 'RabbitMQ是实现了高级消息队列协议（AMQP）的开源消息代理软件', 'RabbitMQ是实现了高级消息队列协议（AMQP）的开源消息代理软件（亦称面向消息的中间件）。RabbitMQ服务器是用Erlang语言编写的，而集群和故障转移是构建在开放电信平台框架上的。所有主要的编程语言均有与代理接口通讯的客户端库', null, '1', null, '2019-09-25 07:36:56', '2019-09-25 07:36:56');
INSERT INTO `course` VALUES ('123456', '云课堂java微专业', 'htttp://study.163.com', '8099.00', '云课堂java微专业', '云课堂java微专业', '云课堂java微专业', '1', null, '2019-09-24 21:21:49', '2019-09-24 21:21:52');

-- ----------------------------
-- Table structure for course_order
-- ----------------------------
DROP TABLE IF EXISTS `course_order`;
CREATE TABLE `course_order` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `course_id` int(11) DEFAULT NULL COMMENT '课程id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `phone` char(11) DEFAULT NULL COMMENT '手机号',
  `state` int(11) DEFAULT NULL COMMENT '状态',
  `total` double DEFAULT NULL COMMENT '共计',
  `order_time` datetime DEFAULT NULL COMMENT '订购时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程订单';

-- ----------------------------
-- Records of course_order
-- ----------------------------
INSERT INTO `course_order` VALUES ('1', '1', '5', '18688888888', '1', '1400', '2019-05-28 09:44:19');
INSERT INTO `course_order` VALUES ('2', '2', '5', '18688888888', '1', '1400', '2019-05-24 22:27:35');
INSERT INTO `course_order` VALUES ('3', '3', '5', '18688888888', '0', '1300', '2019-05-21 22:17:00');
INSERT INTO `course_order` VALUES ('4', '4', '5', '18688888888', '1', '66', '2019-05-21 20:08:29');
INSERT INTO `course_order` VALUES ('5', '5', '5', '18688888888', '1', '66', '2019-05-20 19:37:46');
INSERT INTO `course_order` VALUES ('6', '6', '5', '18688888888', '0', '66', '2019-05-20 19:45:15');
INSERT INTO `course_order` VALUES ('7', '7', '5', '18688888888', '0', '66', '2019-05-20 19:46:03');
INSERT INTO `course_order` VALUES ('8', '8', '5', '18688888888', '0', '66', '2019-05-20 19:52:54');
INSERT INTO `course_order` VALUES ('9', '1', '5', '18688888888', '1', '66', '2019-05-20 17:51:55');
INSERT INTO `course_order` VALUES ('10', '2', '5', '18688888888', '0', '66', '2019-05-20 20:21:44');
INSERT INTO `course_order` VALUES ('11', '3', '5', '18688888888', '1', '66', '2019-06-03 09:35:48');
INSERT INTO `course_order` VALUES ('12', '4', '5', '18688888888', '0', '66', '2019-05-20 22:02:24');

-- ----------------------------
-- Table structure for user_study
-- ----------------------------
DROP TABLE IF EXISTS `user_study`;
CREATE TABLE `user_study` (
  `id` varchar(50) NOT NULL COMMENT '用户学习ID',
  `course_id` varchar(50) DEFAULT NULL COMMENT '课程id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `start_time` datetime DEFAULT NULL COMMENT '学员正式开始时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_study
-- ----------------------------
INSERT INTO `user_study` VALUES ('3c0fe04e-7bdc-11e9-9379-0242ac110003', '1122323c0-7717-11e9-9379-0242ac110003', '6', '2019-05-21 23:22:24');
INSERT INTO `user_study` VALUES ('65e96ff8-8157-11e9-8f13-0242ac110002', '722262d4-8156-11e9-8f13-0242ac110002', '6', '2019-05-28 09:46:38');
INSERT INTO `user_study` VALUES ('6c7c9f3b-7baf-11e9-9379-0242ac110003', '73b780cb-755d-2344-9279-0242ac110003', '6', '2019-05-21 18:02:26');
INSERT INTO `user_study` VALUES ('8821ad55-7e30-11e9-8f13-0242ac110002', 'b3df8d20-7e2f-11e9-8f13-0242ac110002', '27', '2019-05-24 22:30:52');
INSERT INTO `user_study` VALUES ('8d917727-860e-11e9-8f13-0242ac110002', '1122323c0-7717-11e9-9379-0242ac110003', '5', '2019-06-03 09:47:46');
INSERT INTO `user_study` VALUES ('a4ce07f0-7aff-11e9-9379-0242ac110003', '73b780cb-755d-2344-9279-0242ac110003', '6', '2019-05-20 21:03:16');
INSERT INTO `user_study` VALUES ('ddb30610-7bbd-11e9-9379-0242ac110003', '73b780cb-755d-2344-9279-0242ac110003', '6', '2019-05-21 19:45:48');
