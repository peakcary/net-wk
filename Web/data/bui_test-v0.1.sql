/*
Navicat MySQL Data Transfer

Source Server         : 47.88.0.200
Source Server Version : 50717
Source Host           : 47.88.0.200:3306
Source Database       : bui_test

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-04-10 21:46:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bus_area`
-- ----------------------------
DROP TABLE IF EXISTS `bus_area`;
CREATE TABLE `bus_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '-1',
  `name` varchar(100) NOT NULL,
  `area_type` int(11) NOT NULL DEFAULT '0',
  `lon` decimal(10,7) DEFAULT NULL,
  `lat` decimal(10,7) DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_area
-- ----------------------------

-- ----------------------------
-- Table structure for `bus_deadline`
-- ----------------------------
DROP TABLE IF EXISTS `bus_deadline`;
CREATE TABLE `bus_deadline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deadline_time_type` int(11) NOT NULL,
  `eat_type` int(11) NOT NULL,
  `deadline_days` int(11) NOT NULL DEFAULT '0',
  `deadline_times` datetime DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_deadline
-- ----------------------------

-- ----------------------------
-- Table structure for `bus_discount`
-- ----------------------------
DROP TABLE IF EXISTS `bus_discount`;
CREATE TABLE `bus_discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `min_amount` decimal(10,2) NOT NULL,
  `max_amount` decimal(10,2) NOT NULL,
  `status` int(11) NOT NULL,
  `discount_amount` decimal(10,2) DEFAULT '0.00',
  `description` varchar(1000) NOT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_discount
-- ----------------------------
INSERT INTO `bus_discount` VALUES ('1', '周年优惠', '2017-04-03 19:07:59', '2017-05-03 19:08:07', '50.00', '-1.00', '0', '0.00', '满50送大可乐一瓶', '0', null, null, '2017-04-03 19:11:42', null, '2017-04-03 19:11:42');

-- ----------------------------
-- Table structure for `bus_dish`
-- ----------------------------
DROP TABLE IF EXISTS `bus_dish`;
CREATE TABLE `bus_dish` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `market_id` int(11) NOT NULL,
  `dish_time` int(11) NOT NULL,
  `eat_type` int(11) NOT NULL DEFAULT '0',
  `dish_tag` varchar(500) DEFAULT NULL,
  `name_en` varchar(100) NOT NULL,
  `name_cn` varchar(100) NOT NULL,
  `description_en` varchar(1000) DEFAULT NULL,
  `description_cn` varchar(1000) DEFAULT NULL,
  `original_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `discount_price` decimal(10,2) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `sales_total` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) DEFAULT '0',
  `is_delete` int(11) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_dish
-- ----------------------------

-- ----------------------------
-- Table structure for `bus_dish_size`
-- ----------------------------
DROP TABLE IF EXISTS `bus_dish_size`;
CREATE TABLE `bus_dish_size` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `dish_id` int(11) NOT NULL,
  `affect_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_dish_size
-- ----------------------------

-- ----------------------------
-- Table structure for `bus_feedback`
-- ----------------------------
DROP TABLE IF EXISTS `bus_feedback`;
CREATE TABLE `bus_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(2000) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for `bus_image`
-- ----------------------------
DROP TABLE IF EXISTS `bus_image`;
CREATE TABLE `bus_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `correlation_id` int(11) NOT NULL,
  `bus_type` int(11) NOT NULL DEFAULT '0',
  `img_type` int(11) NOT NULL DEFAULT '0',
  `url` varchar(2000) NOT NULL,
  `sort` int(11) DEFAULT '0',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_image
-- ----------------------------

-- ----------------------------
-- Table structure for `bus_market`
-- ----------------------------
DROP TABLE IF EXISTS `bus_market`;
CREATE TABLE `bus_market` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `markket_code` varchar(100) DEFAULT NULL,
  `name_en` varchar(100) NOT NULL,
  `name_cn` varchar(100) NOT NULL,
  `market_type` varchar(500) DEFAULT '0',
  `area_id` int(11) DEFAULT '0',
  `lon` decimal(10,7) DEFAULT NULL,
  `lat` decimal(10,7) DEFAULT NULL,
  `address` varchar(200) NOT NULL,
  `description_en` varchar(1000) DEFAULT NULL,
  `description_cn` varchar(10000) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) DEFAULT '0',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `craete_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_market
-- ----------------------------

-- ----------------------------
-- Table structure for `bus_order`
-- ----------------------------
DROP TABLE IF EXISTS `bus_order`;
CREATE TABLE `bus_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_status` int(11) NOT NULL,
  `pay_status` int(11) NOT NULL,
  `pay_type` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `dilivery_user_id` int(11) NOT NULL,
  `pickup_address_id` int(11) NOT NULL,
  `consignee_name` varchar(100) NOT NULL,
  `consignee_phone` varchar(50) NOT NULL,
  `total_plan_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_real_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `meal_num` int(11) NOT NULL DEFAULT '1',
  `pickup_start_time` time NOT NULL,
  `pickup_end_time` char(10) NOT NULL,
  `pickup_date` datetime NOT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_order
-- ----------------------------

-- ----------------------------
-- Table structure for `bus_order_discount`
-- ----------------------------
DROP TABLE IF EXISTS `bus_order_discount`;
CREATE TABLE `bus_order_discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `discount_id` int(11) NOT NULL,
  `discount_desc` char(10) DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` char(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_order_discount
-- ----------------------------

-- ----------------------------
-- Table structure for `bus_order_dish`
-- ----------------------------
DROP TABLE IF EXISTS `bus_order_dish`;
CREATE TABLE `bus_order_dish` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `dish_id` int(11) NOT NULL,
  `total_original_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_discount_price` decimal(10,2) DEFAULT NULL,
  `unit_original_price` decimal(10,2) DEFAULT NULL,
  `unit_discount_price` decimal(10,2) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `size_list` text,
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_order_dish
-- ----------------------------

-- ----------------------------
-- Table structure for `bus_payment`
-- ----------------------------
DROP TABLE IF EXISTS `bus_payment`;
CREATE TABLE `bus_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_channel` int(11) NOT NULL DEFAULT '0',
  `pay_type` int(11) NOT NULL DEFAULT '0',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `correlation_code` varchar(1000) DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_payment
-- ----------------------------

-- ----------------------------
-- Table structure for `bus_pickup_address`
-- ----------------------------
DROP TABLE IF EXISTS `bus_pickup_address`;
CREATE TABLE `bus_pickup_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pickup_code` varchar(100) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `area_id` int(11) DEFAULT '0',
  `lon` decimal(10,7) DEFAULT NULL,
  `lat` decimal(10,7) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `dilivery_user_id` int(11) NOT NULL,
  `sort` int(11) DEFAULT '0',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_pickup_address
-- ----------------------------

-- ----------------------------
-- Table structure for `bus_pickup_market`
-- ----------------------------
DROP TABLE IF EXISTS `bus_pickup_market`;
CREATE TABLE `bus_pickup_market` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pickup_address_id` int(11) NOT NULL,
  `market_id` int(11) NOT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) DEFAULT '0',
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_pickup_market
-- ----------------------------

-- ----------------------------
-- Table structure for `bus_pickup_times`
-- ----------------------------
DROP TABLE IF EXISTS `bus_pickup_times`;
CREATE TABLE `bus_pickup_times` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pickup_address_id` int(11) NOT NULL,
  `pickup_time` int(11) NOT NULL,
  `eat_type` int(11) NOT NULL DEFAULT '0',
  `pickup_start_time` time DEFAULT NULL,
  `pickup_end_time` time DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_pickup_times
-- ----------------------------

-- ----------------------------
-- Table structure for `bus_share`
-- ----------------------------
DROP TABLE IF EXISTS `bus_share`;
CREATE TABLE `bus_share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_type` int(11) NOT NULL DEFAULT '0',
  `title` varchar(200) DEFAULT NULL,
  `content` varchar(2000) NOT NULL,
  `link_url` varchar(2000) DEFAULT NULL,
  `pic_url` varchar(2000) DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_share
-- ----------------------------

-- ----------------------------
-- Table structure for `bus_user`
-- ----------------------------
DROP TABLE IF EXISTS `bus_user`;
CREATE TABLE `bus_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type` int(11) NOT NULL DEFAULT '0',
  `pwd` varchar(100) NOT NULL,
  `nickname` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `phone_num` varchar(50) DEFAULT NULL,
  `pic_url` varchar(1000) DEFAULT NULL,
  `sex` int(11) NOT NULL DEFAULT '1',
  `generate_time` datetime DEFAULT NULL,
  `cur_deviceId` varchar(100) DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_user
-- ----------------------------

-- ----------------------------
-- Table structure for `bus_user_black_list`
-- ----------------------------
DROP TABLE IF EXISTS `bus_user_black_list`;
CREATE TABLE `bus_user_black_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type` int(11) NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_user_black_list
-- ----------------------------

-- ----------------------------
-- Table structure for `bus_user_device`
-- ----------------------------
DROP TABLE IF EXISTS `bus_user_device`;
CREATE TABLE `bus_user_device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `device_id` varchar(100) NOT NULL,
  `device_type` int(11) DEFAULT '0',
  `pushToken` varchar(100) NOT NULL,
  `app_version` varchar(100) DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_user_device
-- ----------------------------

-- ----------------------------
-- Table structure for `bus_verify_code`
-- ----------------------------
DROP TABLE IF EXISTS `bus_verify_code`;
CREATE TABLE `bus_verify_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_num` varchar(50) NOT NULL DEFAULT '-1',
  `code` varchar(100) NOT NULL,
  `verify_type` int(11) NOT NULL DEFAULT '0',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_verify_code
-- ----------------------------
INSERT INTO `bus_verify_code` VALUES ('1', '11111111111', '123456', '1', '2', null, null, '2017-04-10 17:23:11', null, null);
INSERT INTO `bus_verify_code` VALUES ('2', '11111111111', '123456', '1', '2', null, null, '2017-04-10 17:23:25', null, null);

-- ----------------------------
-- Table structure for `bus_wx_user`
-- ----------------------------
DROP TABLE IF EXISTS `bus_wx_user`;
CREATE TABLE `bus_wx_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `access_token` varchar(1000) DEFAULT NULL,
  `expires_in` int(11) NOT NULL DEFAULT '0',
  `refresh_token` varchar(1000) DEFAULT NULL,
  `open_id` varchar(1000) DEFAULT NULL,
  `scope` varchar(1000) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_wx_user
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_constant`
-- ----------------------------
DROP TABLE IF EXISTS `sys_constant`;
CREATE TABLE `sys_constant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_constant
-- ----------------------------
INSERT INTO `sys_constant` VALUES ('1', '性别', '用户性别', null, '2017-04-03 19:00:23', null, '2017-04-03 19:00:23');
INSERT INTO `sys_constant` VALUES ('2', '用户类型', '用户类型', null, null, null, null);
INSERT INTO `sys_constant` VALUES ('3', '区域类型', '区域类型', null, null, null, null);
INSERT INTO `sys_constant` VALUES ('4', '业务类型', '业务类型', null, null, null, null);
INSERT INTO `sys_constant` VALUES ('5', '图片类型', '图片类型', null, null, null, null);
INSERT INTO `sys_constant` VALUES ('6', '验证码类型', '验证码类型', null, null, null, null);
INSERT INTO `sys_constant` VALUES ('7', '用餐种类', '用餐种类', null, null, null, null);
INSERT INTO `sys_constant` VALUES ('8', '用餐日期类型', '用餐日期类型', null, null, null, null);
INSERT INTO `sys_constant` VALUES ('9', '业务状态', '业务状态', null, null, null, null);
INSERT INTO `sys_constant` VALUES ('10', '是否删除', '是否删除', null, null, null, null);
INSERT INTO `sys_constant` VALUES ('11', '订单状态', '订单状态', null, null, null, null);
INSERT INTO `sys_constant` VALUES ('12', '支付状态', '支付状态', null, null, null, null);
INSERT INTO `sys_constant` VALUES ('13', '支付类型', '支付类型', null, null, null, null);
INSERT INTO `sys_constant` VALUES ('14', '最多展示天数', '最多展示天数', null, null, null, null);
INSERT INTO `sys_constant` VALUES ('15', '最多发送短信条数', '同一手机一天内最多发送短信条数', null, null, null, null);

-- ----------------------------
-- Table structure for `sys_constant_detail`
-- ----------------------------
DROP TABLE IF EXISTS `sys_constant_detail`;
CREATE TABLE `sys_constant_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `constant_id` int(11) NOT NULL,
  `constant_key` varchar(100) NOT NULL,
  `constant_value` varchar(100) NOT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_constant_detail
-- ----------------------------
INSERT INTO `sys_constant_detail` VALUES ('1', '1', '男', '1', null, null, '2017-04-03 19:02:11', null, '2017-04-03 19:02:11');
INSERT INTO `sys_constant_detail` VALUES ('2', '1', '女', '2', null, null, '2017-04-03 19:02:11', null, '2017-04-03 19:02:11');
INSERT INTO `sys_constant_detail` VALUES ('3', '2', '客户', '1', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('4', '2', '配送员', '2', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('5', '3', '州', '1', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('6', '4', '商户', '1', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('7', '4', '菜品', '2', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('8', '5', '详情图', '1', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('9', '5', '缩略图', '2', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('10', '6', '注册验证', '1', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('11', '6', '修改密码验证', '2', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('12', '7', '午餐', '1', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('13', '7', '晚餐', '2', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('14', '7', '全部', '3', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('15', '8', '工作日', '1', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('16', '8', '周末', '2', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('17', '8', '全部', '3', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('18', '9', '启用', '1', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('19', '9', '停用', '2', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('20', '10', '是', '1', '已删除', null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('21', '10', '否', '2', '未删除', null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('22', '11', '已预订', '1', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('23', '11', '待取餐', '2', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('24', '11', '待送达', '3', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('25', '11', '已完成', '4', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('26', '11', '已退单', '5', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('27', '11', '申请退单', '6', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('28', '12', '未支付', '1', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('29', '12', '已支付', '2', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('30', '13', '线上支付', '1', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('31', '13', '线下支付', '2', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('32', '14', '最多展示天数', '5', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('33', '15', '最多发送短信数', '10', null, null, null, null, null);

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) DEFAULT NULL,
  `pwd` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `sex` int(11) NOT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------

-- ----------------------------
-- Function structure for `currseq`
-- ----------------------------
DROP FUNCTION IF EXISTS `currseq`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `currseq`(sequence_name VARCHAR(200)) RETURNS int(11)
BEGIN
    DECLARE curseq INT;
    SET curseq = 0;
    SELECT t.value INTO curseq FROM sys_sequence t WHERE t.sequence_name = sequence_name;
    RETURN curseq;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `nextseq`
-- ----------------------------
DROP FUNCTION IF EXISTS `nextseq`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `nextseq`(sequence_name VARCHAR(200)) RETURNS int(11)
BEGIN
    DECLARE current INTEGER;
    SET current = 0;
    SELECT t.value INTO current FROM sys_sequence t WHERE t.sequence_name = sequence_name FOR UPDATE;
    IF(current=0) THEN
	INSERT INTO sys_sequence VALUES(sequence_name,current+1);
    ELSE
	UPDATE sys_sequence t SET t.value = t.value + 1 WHERE t.sequence_name = sequence_name;
    END IF;
    SET current = current + 1;
    RETURN current;
END
;;
DELIMITER ;
