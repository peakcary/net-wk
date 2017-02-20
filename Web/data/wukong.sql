/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : wukong

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2017-02-20 21:00:27
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_area
-- ----------------------------

-- ----------------------------
-- Table structure for `bus_dish`
-- ----------------------------
DROP TABLE IF EXISTS `bus_dish`;
CREATE TABLE `bus_dish` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `market_id` int(11) NOT NULL,
  `dish_type` int(11) NOT NULL DEFAULT '0',
  `name_en` varchar(100) NOT NULL,
  `name_cn` varchar(100) NOT NULL,
  `description_en` varchar(1000) DEFAULT NULL,
  `description_cn` varchar(1000) DEFAULT NULL,
  `original_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `discount_price` decimal(10,2) DEFAULT NULL,
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
-- Table structure for `bus_dish_plan`
-- ----------------------------
DROP TABLE IF EXISTS `bus_dish_plan`;
CREATE TABLE `bus_dish_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dish_id` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `dish_type` int(11) NOT NULL DEFAULT '0',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` char(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_dish_plan
-- ----------------------------

-- ----------------------------
-- Table structure for `bus_image`
-- ----------------------------
DROP TABLE IF EXISTS `bus_image`;
CREATE TABLE `bus_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `markket_code` varchar(100) NOT NULL,
  `name_en` varchar(100) NOT NULL,
  `name_cn` varchar(100) NOT NULL,
  `market_type` int(11) NOT NULL DEFAULT '0',
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
  `payment_status` int(11) NOT NULL,
  `market_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `dilivery_user_id` int(11) NOT NULL,
  `pickup_address_id` int(11) NOT NULL,
  `consignee_name` varchar(100) NOT NULL,
  `consignee_phone` varchar(50) NOT NULL,
  `total_plan_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_real_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `meal_num` int(11) NOT NULL DEFAULT '1',
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
  `payment_channel` int(11) NOT NULL DEFAULT '0',
  `payment_type` int(11) NOT NULL DEFAULT '0',
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
  `times_id` int(11) NOT NULL,
  `dish_type` int(11) NOT NULL DEFAULT '0',
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
-- Table structure for `bus_pickup_user`
-- ----------------------------
DROP TABLE IF EXISTS `bus_pickup_user`;
CREATE TABLE `bus_pickup_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pickup_address_id` int(11) NOT NULL,
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
-- Records of bus_pickup_user
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
-- Table structure for `bus_times`
-- ----------------------------
DROP TABLE IF EXISTS `bus_times`;
CREATE TABLE `bus_times` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_times
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
  `phone_num` varchar(50) DEFAULT NULL,
  `pic_url` varchar(1000) DEFAULT NULL,
  `sex` int(11) NOT NULL DEFAULT '1',
  `code` varchar(100) DEFAULT NULL,
  `generate_time` datetime DEFAULT NULL,
  `cur_deviceId` varchar(100) DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_constant
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_constant_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_sequence`
-- ----------------------------
DROP TABLE IF EXISTS `sys_sequence`;
CREATE TABLE `sys_sequence` (
  `sequence_name` varchar(200) NOT NULL COMMENT '序列名称',
  `value` int(11) DEFAULT NULL COMMENT '当前值',
  PRIMARY KEY (`sequence_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_sequence
-- ----------------------------

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
-- Table structure for `tuser`
-- ----------------------------
DROP TABLE IF EXISTS `tuser`;
CREATE TABLE `tuser` (
  `userId` int(4) NOT NULL DEFAULT '0',
  `username` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tuser
-- ----------------------------
INSERT INTO `tuser` VALUES ('1', '2', '3', '4');
INSERT INTO `tuser` VALUES ('2', '2', '2', '2');
INSERT INTO `tuser` VALUES ('3', '3', '3', '3');
INSERT INTO `tuser` VALUES ('4', '4', '4', '4');

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
