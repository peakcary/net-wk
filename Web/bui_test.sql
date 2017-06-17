/*
Navicat MySQL Data Transfer

Source Server         : 47.88.0.200
Source Server Version : 50717
Source Host           : 47.88.0.200:3306
Source Database       : bui_test

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-06-17 14:56:33
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
  `is_delete` int(11) NOT NULL DEFAULT '2',
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_area
-- ----------------------------
INSERT INTO `bus_area` VALUES ('6', '0', '上海市', '1', '121.4700000', '31.2300000', '2', null, null, null, null, null);
INSERT INTO `bus_area` VALUES ('7', '6', '黄浦区', '1', '121.4800000', '31.2300000', '1', '', null, null, null, null);
INSERT INTO `bus_area` VALUES ('8', '6', '卢湾区', '1', '121.4700000', '31.2200000', '1', '', null, null, null, null);
INSERT INTO `bus_area` VALUES ('9', '6', '徐汇区', '1', '121.4300000', '31.1800000', '2', null, null, null, null, null);
INSERT INTO `bus_area` VALUES ('10', '6', '长宁区', '1', '121.4200000', '31.2200000', '1', '', null, null, null, null);
INSERT INTO `bus_area` VALUES ('11', '6', '静安区', '1', '121.4500000', '31.2300000', '1', '', null, null, null, null);
INSERT INTO `bus_area` VALUES ('12', '6', '宝山区', '1', '121.4800000', '31.4000000', '1', '', null, null, null, null);
INSERT INTO `bus_area` VALUES ('13', '0', '对的', '1', '121.3300000', '30.7500000', '1', '', null, null, null, null);
INSERT INTO `bus_area` VALUES ('14', '0', '测试父级别', '1', '1.0000000', '1.0000000', '1', '', null, null, null, null);
INSERT INTO `bus_area` VALUES ('15', '14', '测试子级别', '1', '1.0000000', '1.0000000', '1', null, null, null, null, null);
INSERT INTO `bus_area` VALUES ('16', '0', '测试区域3', '1', '1.0000000', '1.0000000', '1', '', null, null, null, null);
INSERT INTO `bus_area` VALUES ('17', '0', '附级别', '1', '2.0000000', '2.0000000', '1', '', null, null, null, null);
INSERT INTO `bus_area` VALUES ('18', '0', '法拉盛', '1', '110.0000000', '110.0000000', '1', '', null, null, null, null);
INSERT INTO `bus_area` VALUES ('19', '0', '法拉盛', '1', null, null, '0', null, null, null, null, null);
INSERT INTO `bus_area` VALUES ('20', '0', '北京市', '1', null, null, '1', '', null, null, null, null);
INSERT INTO `bus_area` VALUES ('21', '6', '长宁区', '1', null, null, '0', null, null, null, null, null);

-- ----------------------------
-- Table structure for `bus_deadline`
-- ----------------------------
DROP TABLE IF EXISTS `bus_deadline`;
CREATE TABLE `bus_deadline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deadline_time_type` int(11) NOT NULL,
  `eat_type` int(11) NOT NULL,
  `deadline_days` int(11) NOT NULL DEFAULT '0',
  `deadline_times` time DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '2',
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_deadline
-- ----------------------------
INSERT INTO `bus_deadline` VALUES ('6', '1', '1', '0', '23:55:00', '0', null, null, null, null, null);
INSERT INTO `bus_deadline` VALUES ('7', '1', '2', '0', '23:55:00', '0', null, null, null, null, null);
INSERT INTO `bus_deadline` VALUES ('8', '2', '1', '0', '23:55:00', '0', null, null, null, null, null);
INSERT INTO `bus_deadline` VALUES ('9', '2', '2', '0', '23:55:00', '0', null, null, null, null, null);

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
  `is_delete` int(11) NOT NULL DEFAULT '2',
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_discount
-- ----------------------------
INSERT INTO `bus_discount` VALUES ('2', '满100减5', '2017-05-16 00:00:00', '2017-05-31 00:00:00', '100.00', '10000.00', '1', '5.00', '满100减5\n                    ', '0', '\n                    ', null, null, null, null);
INSERT INTO `bus_discount` VALUES ('3', '满250送美女', '2017-05-16 00:00:00', '2017-06-01 00:00:00', '250.00', '400.00', '1', '0.00', '满250送美女\n                    ', '0', '\n                    ', null, null, null, null);

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
  `is_delete` int(11) NOT NULL DEFAULT '2',
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_dish
-- ----------------------------
INSERT INTO `bus_dish` VALUES ('3', '3', '1', '1', '凉菜', '一块吮指原味鸡', '一块吮指原味鸡', '一块吮指原味鸡\n                    ', '一块吮指原味鸡\n                    ', '10.00', '8.00', '1', '1', '1', '0', '一块吮指原味鸡\n                    ', null, null, null, null);
INSERT INTO `bus_dish` VALUES ('4', '3', '1', '1', '热菜', '老北京鸡肉卷', '老北京鸡肉卷', '老北京鸡肉卷\n                    ', '老北京鸡肉卷\n                    ', '19.00', '17.00', '1', '1', '1', '0', '老北京鸡肉卷\n                    ', null, null, null, null);
INSERT INTO `bus_dish` VALUES ('5', '3', '1', '1', '香辣鸡腿堡', '香辣鸡腿堡', '香辣鸡腿堡', '香辣鸡腿堡\n                    ', '香辣鸡腿堡\n                    ', '11.00', '11.00', '1', '1', '1', '1', '香辣鸡腿堡\n                    ', null, null, null, null);
INSERT INTO `bus_dish` VALUES ('6', '3', '1', '1', '香辣鸡腿堡', '香辣鸡腿堡', '香辣鸡腿堡', '香辣鸡腿堡\n                    ', '香辣鸡腿堡\n                    ', '1.00', '1.00', '1', '1', '1', '1', '香辣鸡腿堡\n                    ', null, null, null, null);
INSERT INTO `bus_dish` VALUES ('7', '3', '1', '1', '香辣鸡腿堡', '香辣鸡腿堡', '香辣鸡腿堡', '香辣鸡腿堡\n                    ', '香辣鸡腿堡\n                    ', '11.00', '11.00', '1', '1', '1', '1', '香辣鸡腿堡\n                    ', null, null, null, null);
INSERT INTO `bus_dish` VALUES ('8', '3', '1', '1', '香辣鸡腿堡', '香辣鸡腿堡', '香辣鸡腿堡', '香辣鸡腿堡\n                    ', '香辣鸡腿堡\n                    ', '11.00', '1.00', '1', '1', '1', '1', '香辣鸡腿堡\n                    ', null, null, null, null);
INSERT INTO `bus_dish` VALUES ('9', '3', '1', '1', '香辣鸡腿堡', '香辣鸡腿堡', '香辣鸡腿堡', '香辣鸡腿堡\n                    ', '香辣鸡腿堡\n                    ', '11.00', '1.00', '1', '1', '1', '1', '香辣鸡腿堡\n                    ', null, null, null, null);
INSERT INTO `bus_dish` VALUES ('10', '3', '1', '1', '黄金鸡块5块装', '黄金鸡块5块装', '黄金鸡块5块装', '黄金鸡块5块装\n                    ', '黄金鸡块5块装\n                    ', '11.00', '1.00', '1', '1', '1', '1', '黄金鸡块5块装\n                    ', null, null, null, null);
INSERT INTO `bus_dish` VALUES ('11', '3', '1', '1', '黄金鸡块5块装', '黄金鸡块5块装', '黄金鸡块5块装', '黄金鸡块5块装\n                    ', '黄金鸡块5块装\n                    ', '11.00', '1.00', '1', '1', '1', '0', '黄金鸡块5块装\n                    ', null, null, null, null);
INSERT INTO `bus_dish` VALUES ('12', '3', '1', '1', '黄金鸡块5块装', '黄金鸡块5块装', '黄金鸡块5块装', '黄金鸡块5块装\n                    ', '黄金鸡块5块装\n                    ', '11.00', '1.00', '1', '1', '1', '1', '黄金鸡块5块装\n                    ', null, null, null, null);
INSERT INTO `bus_dish` VALUES ('13', '3', '1', '1', '黄金鸡块5块装', '黄金鸡块5块装', '黄金鸡块5块装', '黄金鸡块5块装\n                    ', '黄金鸡块5块装\n                    ', '11.00', '1.00', '1', '1', '1', '1', '黄金鸡块5块装\n                    ', null, null, null, null);
INSERT INTO `bus_dish` VALUES ('14', '3', '1', '1', '拿铁(大)', '拿铁(大)', '拿铁(大)', '拿铁(大)\n                    ', '1拿铁(大)\n                    ', '11.00', '11.00', '1', '0', '0', '0', '1拿铁(大)\n                    ', null, null, null, null);
INSERT INTO `bus_dish` VALUES ('15', '4', '1', '3', '小食', '薯条', '薯条', '薯条', '薯条', '8.00', '8.00', '1', '0', '1', '0', '薯条', null, null, null, null);
INSERT INTO `bus_dish` VALUES ('16', '4', '1', '3', '正餐', '牛肉煲', '牛肉煲', '牛肉煲', '牛肉煲', '12.00', '12.00', '1', '0', '1', '0', '12', null, null, null, null);
INSERT INTO `bus_dish` VALUES ('17', '6', '3', '3', '1', 'rib', '米夫子蒸排骨', '', '', '21.00', '21.00', '1', '1', '1', '0', '', null, null, null, null);
INSERT INTO `bus_dish` VALUES ('18', '8', '1', '1', '三文鱼', '三文鱼刺身', '三文鱼刺身', '对的', '得到的', '68.00', '67.00', '1', '0', '1', '0', 'ddd', null, null, null, null);
INSERT INTO `bus_dish` VALUES ('19', '5', '1', '1', 'beef', 'Beef', 'Beef', '<span style=\"color: rgb(17, 17, 17); font-family: Arial, sans-serif; font-size: 12px;\">这家店的环境非常好，三个人选了包间，</span><span style=\"font-family: Arial, sans-serif; font-size: 12px; color: rgb(204, 0, 0);\">芥末章鱼</span><span style=\"color: rgb(17, 17, 17); font-family: Arial, sans-serif; font-size: 12px;\">好吃，三文鱼腩，牡丹虾，象拔棒刺身都很新鲜，厚切牛舌很香，饼和煎饺一般，鹅肝蒸蛋很好吃，</span>', '<span style=\"color: rgb(17, 17, 17); font-family: Arial, sans-serif; font-size: 12px;\">这家店的环境非常好，三个人选了包间，</span><span style=\"font-family: Arial, sans-serif; font-size: 12px; color: rgb(204, 0, 0);\">芥末章鱼</span><span style=\"color: rgb(17, 17, 17); font-family: Arial, sans-serif; font-size: 12px;\">好吃，三文鱼腩，牡丹虾，象拔棒刺身都很新鲜，厚切牛舌很香，饼和煎饺一般，鹅肝蒸蛋很好吃，</span>', '100.00', '80.00', '1', '0', '0', '0', '<span style=\"color: rgb(17, 17, 17); font-family: Arial, sans-serif; font-size: 12px;\">这家店的环境非常好，三个人选了包间，</span><span style=\"font-family: Arial, sans-serif; font-size: 12px; color: rgb(204, 0, 0);\">芥末章鱼</span><span style=\"color: rgb(17, 17, 17); font-family: Arial, sans-serif; font-size: 12px;\">好吃，三文鱼腩，牡丹虾，象拔棒刺身都很新鲜，厚切牛舌很香，饼和煎饺一般，鹅肝蒸蛋很好吃，</span>', null, null, null, null);
INSERT INTO `bus_dish` VALUES ('20', '8', '1', '1', '肉类', '烤鳗鱼', '烤鳗鱼', '<span style=\"color: rgb(17, 17, 17); font-family: Arial, sans-serif; font-size: 12px;\">环境和服务很不错，当我们菜点的多的时候会提醒我们，如果有招商银行信用卡还蛮格算的平时有85元面值100的代金券</span>\n                    ', '<span style=\"color: rgb(17, 17, 17); font-family: Arial, sans-serif; font-size: 12px;\">环境和服务很不错，当我们菜点的多的时候会提醒我们，如果有招商银行信用卡还蛮格算的平时有85元面值100的代金券</span>\n                    ', '100.00', '98.00', '1', '0', '2', '0', '<span style=\"color: rgb(17, 17, 17); font-family: Arial, sans-serif; font-size: 12px;\">环境和服务很不错，当我们菜点的多的时候会提醒我们，如果有招商银行信用卡还蛮格算的平时有85元面值100的代金券</span>\n                    ', null, null, null, null);
INSERT INTO `bus_dish` VALUES ('21', '8', '1', '1', '和风牛肉饭', '和风牛肉饭', '和风牛肉饭', '<span style=\"color: rgb(40, 40, 40); font-family: &quot;Microsoft YaHei&quot;, &quot;Hiragino Sans GB&quot;;\">偶然得知南丰城近期有个樱桃小丸子游园会，就想来瞧瞧，没想到晚上7点多到的时候，已经没什么人了，工作人员也都在准备收摊工作了</span>\n                    ', '<span style=\"color: rgb(40, 40, 40); font-family: &quot;Microsoft YaHei&quot;, &quot;Hiragino Sans GB&quot;;\">偶然得知南丰城近期有个樱桃小丸子游园会，就想来瞧瞧，没想到晚上7点多到的时候，已经没什么人了，工作人员也都在准备收摊工作了</span>\n                    ', '120.00', '100.00', '1', '0', '0', '0', '<span style=\"color: rgb(40, 40, 40); font-family: &quot;Microsoft YaHei&quot;, &quot;Hiragino Sans GB&quot;;\">偶然得知南丰城近期有个樱桃小丸子游园会，就想来瞧瞧，没想到晚上7点多到的时候，已经没什么人了，工作人员也都在准备收摊工作了</span>\n                    ', null, null, null, null);
INSERT INTO `bus_dish` VALUES ('22', '8', '1', '1', '芥末章鱼', '芥末章鱼', '芥末章鱼', '<span style=\"color: rgb(17, 17, 17); font-family: Arial, sans-serif; font-size: 12px;\">这家店的环境非常好，三个人选了包间，</span><span style=\"font-family: Arial, sans-serif; font-size: 12px; color: rgb(204, 0, 0);\">芥末章鱼</span><span style=\"color: rgb(17, 17, 17); font-family: Arial, sans-serif; font-size: 12px;\">好吃，三文鱼腩，牡丹虾，象拔棒刺身都很新鲜，厚切牛舌很香，饼和煎饺一般，鹅肝蒸蛋很好吃，</span>', '<span style=\"color: rgb(17, 17, 17); font-family: Arial, sans-serif; font-size: 12px;\">这家店的环境非常好，三个人选了包间，</span><span style=\"font-family: Arial, sans-serif; font-size: 12px; color: rgb(204, 0, 0);\">芥末章鱼</span><span style=\"color: rgb(17, 17, 17); font-family: Arial, sans-serif; font-size: 12px;\">好吃，三文鱼腩，牡丹虾，象拔棒刺身都很新鲜，厚切牛舌很香，饼和煎饺一般，鹅肝蒸蛋很好吃，</span>\n                    ', '20.00', '15.00', '1', '0', '4', '0', '<span style=\"color: rgb(17, 17, 17); font-family: Arial, sans-serif; font-size: 12px;\">这家店的环境非常好，三个人选了包间，</span><span style=\"font-family: Arial, sans-serif; font-size: 12px; color: rgb(204, 0, 0);\">芥末章鱼</span><span style=\"color: rgb(17, 17, 17); font-family: Arial, sans-serif; font-size: 12px;\">好吃，三文鱼腩，牡丹虾，象拔棒刺身都很新鲜，厚切牛舌很香，饼和煎饺一般，鹅肝蒸蛋很好吃，</span>\n                    ', null, null, null, null);
INSERT INTO `bus_dish` VALUES ('23', '8', '3', '3', '刺身', '九种刺身拼盘', '九种刺身拼盘', '<span style=\"color: rgb(17, 17, 17); font-family: Arial, sans-serif; font-size: 12px;\">藏的比较深，有点难找。定了一个独立包厢，就安排在进门第一间，所以没进去看看环境到底怎么样。</span>\n                    ', '<span style=\"color: rgb(17, 17, 17); font-family: Arial, sans-serif; font-size: 12px;\">藏的比较深，有点难找。定了一个独立包厢，就安排在进门第一间，所以没进去看看环境到底怎么样。</span>\n                    ', '300.00', '270.00', '1', '0', '0', '0', '<span style=\"color: rgb(17, 17, 17); font-family: Arial, sans-serif; font-size: 12px;\">藏的比较深，有点难找。定了一个独立包厢，就安排在进门第一间，所以没进去看看环境到底怎么样。</span>\n                    ', null, null, null, null);
INSERT INTO `bus_dish` VALUES ('24', '8', '3', '3', '牡丹虾', '牡丹虾', '牡丹虾', '<span style=\"color: rgb(17, 17, 17); font-family: Arial, sans-serif; font-size: 12px;\">基本刺身都包括了，，吃剩的鱼头和龙虾壳用来做了一份粥。熟的点了点儿烤鳗鱼</span>\n                    ', '<span style=\"color: rgb(17, 17, 17); font-family: Arial, sans-serif; font-size: 12px;\">基本刺身都包括了，，吃剩的鱼头和龙虾壳用来做了一份粥。熟的点了点儿烤鳗鱼</span>\n                    ', '300.00', '150.00', '1', '0', '10', '0', '<span style=\"color: rgb(17, 17, 17); font-family: Arial, sans-serif; font-size: 12px;\">基本刺身都包括了，，吃剩的鱼头和龙虾壳用来做了一份粥。熟的点了点儿烤鳗鱼</span>\n                    ', null, null, null, null);
INSERT INTO `bus_dish` VALUES ('25', '5', '2', '1', '周末餐', '西杏炸虾卷', '西杏炸虾卷', '<span style=\"color: rgb(17, 17, 17); font-family: Arial, sans-serif; font-size: 12px;\">每当想吃清淡的食物时，日料和粤菜会不自觉的出现在你的搜索引擎中。一直被放在waiting&nbsp;list上的恒悦轩成功被选为5/1假期收尾的地方。</span><br style=\"color: rgb(17, 17, 17); font-family: Arial, sans-serif; font-size: 12px;\">\n                    ', '<span style=\"color: rgb(17, 17, 17); font-family: Arial, sans-serif; font-size: 12px;\">每当想吃清淡的食物时，日料和粤菜会不自觉的出现在你的搜索引擎中。一直被放在waiting&nbsp;list上的恒悦轩成功被选为5/1假期收尾的地方。</span><br style=\"color: rgb(17, 17, 17); font-family: Arial, sans-serif; font-size: 12px;\">\n                    ', '40.00', '38.00', '1', '90', '0', '0', '<span style=\"color: rgb(17, 17, 17); font-family: Arial, sans-serif; font-size: 12px;\">每当想吃清淡的食物时，日料和粤菜会不自觉的出现在你的搜索引擎中。</span><br style=\"color: rgb(17, 17, 17); font-family: Arial, sans-serif; font-size: 12px;\">\n                    ', null, null, null, null);
INSERT INTO `bus_dish` VALUES ('26', '6', '2', '1', '午餐', 'XO酱萝卜糕', 'XO酱萝卜糕', '<span style=\"color: rgb(17, 17, 17); font-family: Arial, sans-serif; font-size: 12px;\">一点也不油腻，超赞～鲜虾腐皮卷口感也是棒棒哒。港式生煎包里有虾仁，也很好吃，推荐。雪媚娘与其它点心相比味道一般，不推荐。湘莲红豆沙，莲子的口感上乘，推荐这款糖水。三楼和四楼服务生服务态度都很赞，好评全五分</span>\n                    ', '<span style=\"color: rgb(17, 17, 17); font-family: Arial, sans-serif; font-size: 12px;\">一点也不油腻，超赞～鲜虾腐皮卷口感也是棒棒哒。港式生煎包里有虾仁，也很好吃，推荐。雪媚娘与其它点心相比味道一般，不推荐。湘莲红豆沙，莲子的口感上乘，推荐这款糖水。三楼和四楼服务生服务态度都很赞，好评全五分</span>\n                    ', '1.00', '1.00', '1', '100', '0', '0', '测试支付的，所以很便宜', null, null, null, null);
INSERT INTO `bus_dish` VALUES ('27', '10', '1', '1', '肉类', '红烧肉', '红烧肉', '<span style=\"color: rgb(17, 17, 17); font-family: Arial, sans-serif; font-size: 12px;\">特意找了家特色的本帮菜饭馆</span>\n                    ', '<span style=\"color: rgb(17, 17, 17); font-family: Arial, sans-serif; font-size: 12px;\">特意找了家特色的本帮菜饭馆</span>\n                    ', '67.00', '65.00', '1', '0', '1', '0', '<span style=\"color: rgb(17, 17, 17); font-family: Arial, sans-serif; font-size: 12px;\">特意找了家特色的本帮菜饭馆</span>\n                    ', null, null, null, null);
INSERT INTO `bus_dish` VALUES ('28', '10', '1', '2', '鱼类', '熏鱼', '熏鱼', '<span style=\"color: rgb(17, 17, 17); font-family: Arial, sans-serif; font-size: 12px;\">特意找了家特色的本帮菜饭馆</span>\n                    ', '<span style=\"color: rgb(17, 17, 17); font-family: Arial, sans-serif; font-size: 12px;\">特意找了家特色的本帮菜饭馆</span>\n                    ', '90.00', '80.00', '1', '9', '2', '0', '<span style=\"color: rgb(17, 17, 17); font-family: Arial, sans-serif; font-size: 12px;\">特意找了家特色的本帮菜饭馆</span>\n                    ', null, null, null, null);
INSERT INTO `bus_dish` VALUES ('29', '8', '3', '3', '测试', 'OneDollar', '一元餐', 'For Test', '仅供测试', '1.00', '1.00', '1', '999', '0', '0', '\n                    ', null, null, null, null);

-- ----------------------------
-- Table structure for `bus_dish_size`
-- ----------------------------
DROP TABLE IF EXISTS `bus_dish_size`;
CREATE TABLE `bus_dish_size` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `dish_id` int(11) NOT NULL,
  `affect_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `is_delete` int(11) NOT NULL DEFAULT '2',
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_dish_size
-- ----------------------------
INSERT INTO `bus_dish_size` VALUES ('3', '规格1', '3', '10.00', '2', null, null, null, null, null);
INSERT INTO `bus_dish_size` VALUES ('4', '规格3', '3', '11.00', '2', null, null, null, null, null);
INSERT INTO `bus_dish_size` VALUES ('5', '规格2', '4', '10.00', '2', null, null, null, null, null);
INSERT INTO `bus_dish_size` VALUES ('6', '规格2', '4', '10.00', '2', null, null, null, null, null);
INSERT INTO `bus_dish_size` VALUES ('7', '迷你', '18', '9.00', '0', null, null, null, null, null);
INSERT INTO `bus_dish_size` VALUES ('8', '打分', '18', '67.00', '1', '', null, null, null, null);
INSERT INTO `bus_dish_size` VALUES ('9', '超大份', '18', '15.00', '0', null, null, null, null, null);
INSERT INTO `bus_dish_size` VALUES ('10', '加葱', '19', '10.00', '0', null, null, null, null, null);
INSERT INTO `bus_dish_size` VALUES ('11', '加蒜', '19', '10.00', '0', null, null, null, null, null);
INSERT INTO `bus_dish_size` VALUES ('12', '加辣椒', '19', '10.00', '0', null, null, null, null, null);
INSERT INTO `bus_dish_size` VALUES ('13', '芥末', '23', '3.00', '0', null, null, null, null, null);
INSERT INTO `bus_dish_size` VALUES ('14', '芥末', '24', '6.00', '0', null, null, null, null, null);
INSERT INTO `bus_dish_size` VALUES ('15', '普通', '24', '0.00', '0', null, null, null, null, null);
INSERT INTO `bus_dish_size` VALUES ('16', '大薯条', '15', '5.00', '0', null, null, null, null, null);
INSERT INTO `bus_dish_size` VALUES ('17', '标准装', '15', '0.00', '0', null, null, null, null, null);
INSERT INTO `bus_dish_size` VALUES ('18', '超多虾', '25', '36.00', '0', null, null, null, null, null);
INSERT INTO `bus_dish_size` VALUES ('19', '普通装', '25', '0.00', '0', null, null, null, null, null);
INSERT INTO `bus_dish_size` VALUES ('20', '超大份', '27', '5.00', '0', null, null, null, null, null);
INSERT INTO `bus_dish_size` VALUES ('21', '中份', '27', '3.00', '0', null, null, null, null, null);

-- ----------------------------
-- Table structure for `bus_feedback`
-- ----------------------------
DROP TABLE IF EXISTS `bus_feedback`;
CREATE TABLE `bus_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(2000) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '2',
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_feedback
-- ----------------------------
INSERT INTO `bus_feedback` VALUES ('27', '哈哈', '20024', '0', null, null, '2017-05-16 15:10:29', null, '2017-05-16 15:10:29');
INSERT INTO `bus_feedback` VALUES ('28', '我在测试意见反馈', '20028', '0', null, null, '2017-05-17 09:43:03', null, '2017-05-17 09:43:03');
INSERT INTO `bus_feedback` VALUES ('29', '我觉得不好用', '20028', '1', '', null, '2017-05-25 13:30:27', null, '2017-05-25 13:30:27');
INSERT INTO `bus_feedback` VALUES ('30', '用户反馈功能', '20028', '0', null, null, '2017-05-25 20:37:16', null, '2017-05-25 20:37:16');
INSERT INTO `bus_feedback` VALUES ('31', '用户反馈功能', '20028', '0', null, null, '2017-05-25 20:37:31', null, '2017-05-25 20:37:31');
INSERT INTO `bus_feedback` VALUES ('32', '用户反馈功能', '20028', '0', null, null, '2017-05-25 20:37:44', null, '2017-05-25 20:37:44');
INSERT INTO `bus_feedback` VALUES ('33', '悟空美食用户端下载地址：https://fir.im/wkclient', '0', '0', '\n                    ', null, null, null, null);
INSERT INTO `bus_feedback` VALUES ('34', '123', '20028', '0', null, null, '2017-06-05 14:22:37', null, '2017-06-05 14:22:37');

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
  `is_delete` int(11) NOT NULL DEFAULT '2',
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_image
-- ----------------------------
INSERT INTO `bus_image` VALUES ('7', '1', '1', '1', '48a777a6b444dc317cc24d101220cjpeg.webp', '0', '0', null, null, null, null, null);
INSERT INTO `bus_image` VALUES ('84', '3', '2', '1', '1495704691516.jpg', '1', '0', null, null, null, null, null);
INSERT INTO `bus_image` VALUES ('85', '4', '2', '1', '1495704709940.jpg', '1', '0', null, null, null, null, null);
INSERT INTO `bus_image` VALUES ('123', '18', '2', '1', '1495689121251.jpg', '1', '0', null, null, null, null, null);
INSERT INTO `bus_image` VALUES ('134', '20', '2', '1', '1495714829204.jpg', '1', '0', null, null, null, null, null);
INSERT INTO `bus_image` VALUES ('135', '21', '2', '1', '1495714918213.jpg', '1', '0', null, null, null, null, null);
INSERT INTO `bus_image` VALUES ('137', '22', '2', '1', '1495715019418.jpg', '1', '0', null, null, null, null, null);
INSERT INTO `bus_image` VALUES ('138', '19', '2', '1', '1495706972004.jpg', '1', '0', null, null, null, null, null);
INSERT INTO `bus_image` VALUES ('141', '16', '2', '1', '1495696892974.jpg', '1', '0', null, null, null, null, null);
INSERT INTO `bus_image` VALUES ('142', '15', '2', '1', '1495696918360.jpg', '1', '0', null, null, null, null, null);
INSERT INTO `bus_image` VALUES ('148', '4', '1', '1', '1495695571065.jpeg', '0', '0', null, null, null, null, null);
INSERT INTO `bus_image` VALUES ('149', '3', '1', '1', '1495695764084.jpeg', '0', '0', null, null, null, null, null);
INSERT INTO `bus_image` VALUES ('150', '3', '1', '1', '1495695774592.jpeg', '0', '0', null, null, null, null, null);
INSERT INTO `bus_image` VALUES ('151', '14', '2', '1', '1495769529143.jpg', '1', '0', null, null, null, null, null);
INSERT INTO `bus_image` VALUES ('152', '11', '2', '1', '1495769547498.jpg', '1', '0', null, null, null, null, null);
INSERT INTO `bus_image` VALUES ('153', '5', '2', '1', '1495769560826.jpg', '1', '0', null, null, null, null, null);
INSERT INTO `bus_image` VALUES ('160', '25', '2', '1', '1495785691388.jpg', '1', '0', null, null, null, null, null);
INSERT INTO `bus_image` VALUES ('161', '26', '2', '1', '1495786640979.jpg', '1', '0', null, null, null, null, null);
INSERT INTO `bus_image` VALUES ('164', '17', '2', '1', '1495704596404.jpg', '1', '0', null, null, null, null, null);
INSERT INTO `bus_image` VALUES ('165', '24', '2', '1', '1495716314776.jpg', '1', '0', null, null, null, null, null);
INSERT INTO `bus_image` VALUES ('166', '23', '2', '1', '1495716043028.jpg', '1', '0', null, null, null, null, null);
INSERT INTO `bus_image` VALUES ('172', '27', '2', '1', '1496221671433.jpg', '1', '0', null, null, null, null, null);
INSERT INTO `bus_image` VALUES ('173', '27', '2', '1', '1496221676650.jpg', '2', '0', null, null, null, null, null);
INSERT INTO `bus_image` VALUES ('174', '28', '2', '1', '1496221791004.jpg', '1', '0', null, null, null, null, null);
INSERT INTO `bus_image` VALUES ('175', '10', '1', '1', '1496221404175.jpeg', '0', '0', null, null, null, null, null);
INSERT INTO `bus_image` VALUES ('176', '10', '1', '1', '1496221416131.jpeg', '0', '0', null, null, null, null, null);
INSERT INTO `bus_image` VALUES ('177', '10', '1', '1', '1496221425286.jpeg', '0', '0', null, null, null, null, null);
INSERT INTO `bus_image` VALUES ('178', '8', '1', '1', '1495695625845.jpeg', '0', '0', null, null, null, null, null);
INSERT INTO `bus_image` VALUES ('179', '8', '1', '1', '1495695638605.jpeg', '0', '0', null, null, null, null, null);
INSERT INTO `bus_image` VALUES ('180', '6', '1', '1', '1495695674967.jpeg', '0', '0', null, null, null, null, null);
INSERT INTO `bus_image` VALUES ('181', '6', '1', '1', '1495695683436.jpeg', '0', '0', null, null, null, null, null);
INSERT INTO `bus_image` VALUES ('182', '5', '1', '1', '1495695719358.jpeg', '0', '0', null, null, null, null, null);
INSERT INTO `bus_image` VALUES ('183', '5', '1', '1', '1495695725460.jpeg', '0', '0', null, null, null, null, null);
INSERT INTO `bus_image` VALUES ('184', '5', '1', '1', '1495695735173.jpeg', '0', '0', null, null, null, null, null);
INSERT INTO `bus_image` VALUES ('185', '29', '2', '1', '1496564486307.jpg', '1', '0', null, null, null, null, null);

-- ----------------------------
-- Table structure for `bus_market`
-- ----------------------------
DROP TABLE IF EXISTS `bus_market`;
CREATE TABLE `bus_market` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `market_code` varchar(100) DEFAULT NULL,
  `name_en` varchar(100) NOT NULL,
  `name_cn` varchar(100) NOT NULL,
  `market_type` varchar(500) DEFAULT '0',
  `market_tel` varchar(50) DEFAULT NULL COMMENT '商户电话',
  `area_id` int(11) DEFAULT '0',
  `lon` decimal(10,7) DEFAULT '0.0000000',
  `lat` decimal(10,7) DEFAULT '0.0000000',
  `address` varchar(200) NOT NULL,
  `description_en` varchar(1000) DEFAULT NULL,
  `description_cn` varchar(10000) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) DEFAULT '0',
  `is_delete` int(11) NOT NULL DEFAULT '2',
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `craete_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_market
-- ----------------------------
INSERT INTO `bus_market` VALUES ('3', '4', 'KFC', '肯德基', '西餐', null, '9', '0.0000000', '0.0000000', '上海市徐汇区凌云路365号A1商铺1F、2F', '本餐厅不使用饿了么配送，由肯德基宅急送官方品牌配送，会员用户无法享受免配送费服务\n                    ', '本餐厅不使用饿了么配送，由肯德基宅急送官方品牌配送，会员用户无法享受免配送费服务\n                    ', '1', '0', '0', '本餐厅不使用饿了么配送，由肯德基宅急送官方品牌配送，会员用户无法享受免配送费服务\n                    ', null, null, null, null);
INSERT INTO `bus_market` VALUES ('4', '3', 'McDonald', '麦当劳', '西餐', null, '9', '0.0000000', '0.0000000', '上海市徐汇区凌云路365号A3商铺1F、2F', 'KFC', 'KFC', '1', '0', '0', 'KFC', null, null, null, null);
INSERT INTO `bus_market` VALUES ('5', '1', 'Alley 41', '蜀巷', '川菜', null, '19', '0.0000000', '0.0000000', '136-45 41st Ave, Flushing, NY 11355', '\n                    ', '\n                    ', '1', '0', '0', '\n                    ', null, null, null, null);
INSERT INTO `bus_market` VALUES ('6', '2', 'Hunan Manor', '湘水山庄', '湘菜', null, '19', '0.0000000', '0.0000000', '137-40 Northern Blvd, Flushing, NY 11354', '\n                    ', '\n                    ', '1', '0', '0', '\n                    ', null, null, null, null);
INSERT INTO `bus_market` VALUES ('7', '1', '1', '1', '1', '', '6', '1.0000000', '1.0000000', '1', '1\n                    ', '1\n                    ', '1', '0', '1', '1\n                    ', null, null, null, null);
INSERT INTO `bus_market` VALUES ('8', '5', '纱羅餐精致料理', '纱羅餐精致料理', '日料', null, '9', '0.0000000', '0.0000000', '遵义路100号虹桥南丰城4层', '营业时间： 晚市 17:00-22:00 周一至周日;午市 11:00-14:00 周一至周日&nbsp;<div>日;午市 11:00-14:00 周一至周日&nbsp;</div>', '中文描述', '1', '0', '0', '熊伟新增饭店看就看j<div>阿卡丽djfs</div><div>阿斯蒂芬昆仑决kj</div><div>卡拉胶双方都&nbsp;</div>', null, null, null, null);
INSERT INTO `bus_market` VALUES ('9', '1', '1', '1', '1', '', '6', '-11.1111100', '-11.1111100', '1', '\n                    ', '\n                    ', '1', '0', '1', '1\n                    ', null, null, null, null);
INSERT INTO `bus_market` VALUES ('10', '6', 'ShangHai No.1', '上海1号私藏菜', '本帮菜', null, '9', '0.0000000', '0.0000000', '淮海东路99号6楼(近西藏南路)', '<span style=\"color: rgb(40, 40, 40); font-family: &quot;Microsoft YaHei&quot;, &quot;Hiragino Sans GB&quot;; font-size: 14px;\">517吃货节抢了一张红烧肉，经常路过却从未尝试过这家店。装修和名字感觉都是我妈的这个年龄喜欢的。所以就带妈妈来吃吃看啦~</span>\n                    ', '<span style=\"color: rgb(40, 40, 40); font-family: &quot;Microsoft YaHei&quot;, &quot;Hiragino Sans GB&quot;; font-size: 14px;\">517吃货节抢了一张红烧肉，经常路过却从未尝试过这家店。装修和名字感觉都是我妈的这个年龄喜欢的。所以就带妈妈来吃吃看啦~</span>\n                    ', '1', '0', '0', '<span style=\"color: rgb(40, 40, 40); font-family: &quot;Microsoft YaHei&quot;, &quot;Hiragino Sans GB&quot;; font-size: 14px;\">517吃货节抢了一张红烧肉</span>', null, null, null, null);

-- ----------------------------
-- Table structure for `bus_order`
-- ----------------------------
DROP TABLE IF EXISTS `bus_order`;
CREATE TABLE `bus_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_code` varchar(50) NOT NULL,
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
  `pickup_end_time` time NOT NULL,
  `pickup_date` datetime NOT NULL,
  `dish_time` int(11) NOT NULL,
  `eat_type` int(11) NOT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '2',
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=418 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_order
-- ----------------------------
INSERT INTO `bus_order` VALUES ('120', '1201705090001', '5', '0', '2', '20017', '20018', '12', '李四', '12345678901', '12.00', '12.00', '1', '12:00:00', '13:12:00', '2017-05-11 00:00:00', '1', '1', '1', 'sdfasf', null, '2017-05-09 18:49:12', null, '2017-05-13 09:30:57');
INSERT INTO `bus_order` VALUES ('121', '1201705090002', '5', '0', '2', '20017', '20018', '12', '张三', '13584563214', '36.00', '36.00', '3', '12:00:00', '13:12:00', '2017-05-11 00:00:00', '1', '1', '0', 'sdfasf', null, '2017-05-09 18:50:25', null, '2017-05-17 22:56:34');
INSERT INTO `bus_order` VALUES ('122', '1201705090003', '1', '0', '2', '20017', '20018', '12', '项羽', '18114584754', '48.00', '48.00', '2', '12:00:00', '13:12:00', '2017-05-11 00:00:00', '1', '1', '0', 'sdfasf', null, '2017-05-09 18:52:31', null, '2017-05-09 18:52:31');
INSERT INTO `bus_order` VALUES ('123', '1201705100001', '1', '0', '2', '20021', '20019', '12', 'Jevons', '18521411359', '80.00', '80.00', '1', '18:00:00', '18:20:00', '2017-05-13 00:00:00', '2', '2', '0', '', null, '2017-05-10 23:23:34', null, '2017-05-10 23:23:34');
INSERT INTO `bus_order` VALUES ('124', '1201705100002', '0', '0', '1', '20021', '20019', '12', 'Jevons', '18521411359', '40.00', '40.00', '1', '18:00:00', '18:20:00', '2017-05-13 00:00:00', '2', '2', '0', '', null, '2017-05-10 23:27:09', null, '2017-05-10 23:27:09');
INSERT INTO `bus_order` VALUES ('125', '1201705100003', '1', '0', '2', '20021', '20019', '12', 'Jevons', '18521411359', '40.00', '40.00', '1', '18:00:00', '18:20:00', '2017-05-13 00:00:00', '2', '2', '0', '', null, '2017-05-10 23:27:16', null, '2017-05-10 23:27:16');
INSERT INTO `bus_order` VALUES ('126', '1201705100004', '0', '0', '1', '20021', '20019', '12', 'Jevons', '18521411359', '80.00', '80.00', '1', '18:00:00', '18:20:00', '2017-05-13 00:00:00', '2', '2', '0', '', null, '2017-05-10 23:27:25', null, '2017-05-10 23:27:25');
INSERT INTO `bus_order` VALUES ('127', '1201705100005', '1', '0', '2', '20021', '20019', '12', 'Jevons', '18521411359', '24.00', '24.00', '1', '18:00:00', '18:20:00', '2017-05-13 00:00:00', '2', '2', '0', '', null, '2017-05-10 23:27:37', null, '2017-05-10 23:27:37');
INSERT INTO `bus_order` VALUES ('128', '1201705100006', '1', '0', '2', '20021', '20019', '12', 'Jevons', '18521411359', '36.00', '36.00', '1', '18:00:00', '18:20:00', '2017-05-13 00:00:00', '2', '2', '0', '', null, '2017-05-10 23:27:48', null, '2017-05-10 23:27:48');
INSERT INTO `bus_order` VALUES ('129', '1201705140001', '0', '0', '1', '20021', '20019', '12', 'Jevons', '18521411359', '24.00', '24.00', '1', '18:00:00', '18:20:00', '2017-05-17 00:00:00', '1', '2', '0', '', null, '2017-05-14 21:25:00', null, '2017-05-14 21:25:00');
INSERT INTO `bus_order` VALUES ('130', '1201705140002', '1', '0', '2', '20021', '20019', '12', 'Jevons', '18521411359', '88.00', '88.00', '1', '18:00:00', '18:20:00', '2017-05-17 00:00:00', '1', '2', '0', '', null, '2017-05-14 21:25:15', null, '2017-05-14 21:25:15');
INSERT INTO `bus_order` VALUES ('131', '1201705140003', '0', '0', '1', '20021', '20019', '12', 'Jevons', '18521411359', '60.00', '60.00', '1', '18:00:00', '18:20:00', '2017-05-17 00:00:00', '1', '2', '0', '', null, '2017-05-14 21:30:31', null, '2017-05-14 21:30:31');
INSERT INTO `bus_order` VALUES ('132', '1201705140004', '1', '0', '2', '20021', '20019', '12', 'Jevons', '18521411359', '84.00', '84.00', '1', '18:00:00', '18:20:00', '2017-05-17 00:00:00', '1', '2', '0', '', null, '2017-05-14 21:30:43', null, '2017-05-14 21:30:43');
INSERT INTO `bus_order` VALUES ('133', '1201705140005', '1', '0', '2', '20021', '20019', '12', 'Jevons', '18521411359', '60.00', '60.00', '1', '18:00:00', '18:20:00', '2017-05-17 00:00:00', '1', '2', '0', '', null, '2017-05-14 21:31:59', null, '2017-05-14 21:31:59');
INSERT INTO `bus_order` VALUES ('134', '1201705140006', '1', '0', '2', '20021', '20019', '12', 'Jevons', '18521411359', '60.00', '60.00', '1', '18:00:00', '18:20:00', '2017-05-17 00:00:00', '1', '2', '0', '', null, '2017-05-14 21:33:41', null, '2017-05-14 21:33:41');
INSERT INTO `bus_order` VALUES ('135', '1201705140007', '1', '0', '2', '20021', '20019', '12', 'Jevons', '18521411359', '40.00', '40.00', '1', '18:00:00', '18:20:00', '2017-05-17 00:00:00', '1', '2', '0', '', null, '2017-05-14 21:39:43', null, '2017-05-14 21:39:43');
INSERT INTO `bus_order` VALUES ('136', '1201705150001', '1', '0', '2', '20021', '20019', '12', 'Jevons', '18521411359', '84.00', '84.00', '1', '18:00:00', '18:20:00', '2017-05-17 00:00:00', '1', '2', '0', '', null, '2017-05-15 10:13:15', null, '2017-05-15 10:13:15');
INSERT INTO `bus_order` VALUES ('137', '1201705150002', '0', '0', '1', '20021', '20019', '12', 'Jevons', '18521411359', '52.00', '52.00', '1', '18:00:00', '18:20:00', '2017-05-17 00:00:00', '1', '2', '0', '', null, '2017-05-15 10:23:50', null, '2017-05-15 10:23:50');
INSERT INTO `bus_order` VALUES ('138', '1201705150003', '0', '0', '1', '20021', '20019', '12', 'Jevons', '18521411359', '521.00', '521.00', '1', '18:00:00', '18:20:00', '2017-05-17 00:00:00', '1', '2', '0', '', null, '2017-05-15 13:34:57', null, '2017-05-15 13:34:57');
INSERT INTO `bus_order` VALUES ('139', '1201705160001', '1', '0', '2', '20021', '20019', '12', 'Jevons', '18521411359', '48.00', '48.00', '1', '18:00:00', '18:20:00', '2017-05-17 00:00:00', '1', '2', '0', '', null, '2017-05-16 00:22:58', null, '2017-05-16 00:22:58');
INSERT INTO `bus_order` VALUES ('140', '1201705160002', '1', '0', '2', '20021', '20019', '12', 'Jevons', '18521411359', '48.00', '48.00', '1', '18:00:00', '18:20:00', '2017-05-17 00:00:00', '1', '2', '0', '', null, '2017-05-16 10:02:33', null, '2017-05-16 10:02:33');
INSERT INTO `bus_order` VALUES ('141', '1201705160003', '1', '0', '2', '20021', '20019', '12', 'Jevons', '18521411359', '84.00', '84.00', '1', '18:00:00', '18:20:00', '2017-05-17 00:00:00', '1', '2', '0', '', null, '2017-05-16 10:02:41', null, '2017-05-16 10:02:41');
INSERT INTO `bus_order` VALUES ('142', '1201705160004', '1', '0', '2', '20021', '20019', '12', 'Jevons', '18521411359', '36.00', '36.00', '1', '18:00:00', '18:20:00', '2017-05-17 00:00:00', '1', '2', '0', '', null, '2017-05-16 10:02:51', null, '2017-05-16 10:02:51');
INSERT INTO `bus_order` VALUES ('143', '1201705160005', '1', '0', '2', '20021', '20019', '12', 'Jevons', '18521411359', '126.00', '126.00', '1', '18:00:00', '18:20:00', '2017-05-17 00:00:00', '1', '2', '1', '', null, '2017-05-16 10:02:59', null, '2017-05-16 10:02:59');
INSERT INTO `bus_order` VALUES ('144', '1201705160006', '0', '0', '1', '20024', '20019', '12', '哈哈', '18516152738', '36.00', '36.00', '1', '18:00:00', '18:20:00', '2017-05-24 00:00:00', '1', '2', '0', '', null, '2017-05-16 15:23:42', null, '2017-05-16 15:23:42');
INSERT INTO `bus_order` VALUES ('145', '1201705160007', '1', '0', '2', '20024', '20019', '12', '哈哈', '18516152738', '42.00', '42.00', '1', '18:00:00', '18:20:00', '2017-05-24 00:00:00', '1', '2', '0', '', null, '2017-05-16 15:23:55', null, '2017-05-16 15:23:55');
INSERT INTO `bus_order` VALUES ('146', '1201705160008', '0', '0', '1', '20024', '20019', '12', '哈哈', '18516152738', '42.00', '42.00', '1', '18:00:00', '18:20:00', '2017-05-24 00:00:00', '1', '2', '0', '', null, '2017-05-16 15:25:43', null, '2017-05-16 15:25:43');
INSERT INTO `bus_order` VALUES ('147', '1201705160009', '1', '0', '2', '20024', '20019', '12', '哈哈', '18516152738', '63.00', '63.00', '1', '18:00:00', '18:20:00', '2017-05-24 00:00:00', '1', '2', '0', '', null, '2017-05-16 15:25:52', null, '2017-05-16 15:25:52');
INSERT INTO `bus_order` VALUES ('148', '1201705160010', '0', '0', '1', '20024', '20019', '12', '哈哈', '18516152738', '63.00', '63.00', '1', '18:00:00', '18:20:00', '2017-05-24 00:00:00', '1', '2', '0', '', null, '2017-05-16 15:26:30', null, '2017-05-16 15:26:30');
INSERT INTO `bus_order` VALUES ('149', '1201705160011', '0', '0', '1', '20024', '20019', '12', '哈哈', '18516152738', '63.00', '63.00', '1', '18:00:00', '18:20:00', '2017-05-24 00:00:00', '1', '2', '0', '', null, '2017-05-16 15:26:58', null, '2017-05-16 15:26:58');
INSERT INTO `bus_order` VALUES ('150', '1201705160012', '1', '0', '2', '20024', '20019', '12', '哈哈', '18516152738', '63.00', '63.00', '1', '18:00:00', '18:20:00', '2017-05-24 00:00:00', '1', '2', '0', '', null, '2017-05-16 15:30:26', null, '2017-05-16 15:30:26');
INSERT INTO `bus_order` VALUES ('151', '2201705160001', '0', '0', '1', '20024', '20018', '13', '哈哈', '18516152738', '21.00', '21.00', '1', '18:30:00', '18:50:00', '2017-05-17 00:00:00', '1', '2', '0', '', null, '2017-05-16 15:41:10', null, '2017-05-16 15:41:10');
INSERT INTO `bus_order` VALUES ('152', '2201705160002', '1', '0', '2', '20024', '20018', '13', '哈哈', '18516152738', '21.00', '21.00', '1', '18:30:00', '18:50:00', '2017-05-17 00:00:00', '1', '2', '0', '', null, '2017-05-16 15:41:25', null, '2017-05-16 15:41:25');
INSERT INTO `bus_order` VALUES ('153', '1201705160013', '0', '0', '1', '20021', '20019', '12', 'Jevons', '18521411359', '16.00', '16.00', '1', '18:00:00', '18:20:00', '2017-05-20 00:00:00', '2', '2', '0', '', null, '2017-05-16 21:49:23', null, '2017-05-16 21:49:23');
INSERT INTO `bus_order` VALUES ('154', '1201705160014', '1', '0', '2', '20021', '20019', '12', 'Jevons', '18521411359', '16.00', '16.00', '1', '18:00:00', '18:20:00', '2017-05-20 00:00:00', '2', '2', '0', '', null, '2017-05-16 21:49:44', null, '2017-05-16 21:49:44');
INSERT INTO `bus_order` VALUES ('155', '1201705160015', '1', '0', '2', '20021', '20019', '12', 'Jevons', '18521411359', '40.00', '40.00', '1', '18:00:00', '18:20:00', '2017-05-20 00:00:00', '2', '2', '0', '', null, '2017-05-16 21:51:06', null, '2017-05-16 21:51:06');
INSERT INTO `bus_order` VALUES ('156', '1201705160016', '1', '0', '2', '20021', '20019', '12', 'Jevons', '18521411359', '8.00', '8.00', '1', '18:00:00', '18:20:00', '2017-05-20 00:00:00', '2', '2', '0', '', null, '2017-05-16 21:52:23', null, '2017-05-16 21:52:23');
INSERT INTO `bus_order` VALUES ('157', '1201705160017', '1', '0', '2', '20021', '20019', '12', 'Jevons', '18521411359', '20.00', '20.00', '1', '18:00:00', '18:20:00', '2017-05-20 00:00:00', '2', '2', '0', '', null, '2017-05-16 21:53:36', null, '2017-05-16 21:53:36');
INSERT INTO `bus_order` VALUES ('158', '1201705160018', '0', '0', '1', '20021', '20019', '12', 'Jevons', '18521411359', '40.00', '40.00', '1', '18:00:00', '18:20:00', '2017-05-20 00:00:00', '2', '2', '0', '', null, '2017-05-16 22:00:33', null, '2017-05-16 22:00:33');
INSERT INTO `bus_order` VALUES ('159', '1201705160019', '1', '0', '2', '20021', '20019', '12', 'Jevons', '18521411359', '20.00', '20.00', '1', '18:00:00', '18:20:00', '2017-05-24 00:00:00', '1', '2', '0', '', null, '2017-05-16 22:04:45', null, '2017-05-16 22:04:45');
INSERT INTO `bus_order` VALUES ('160', '1201705170001', '0', '0', '1', '20021', '20019', '12', 'Jevons', '18521411359', '8.00', '8.00', '1', '18:00:00', '18:20:00', '2017-05-20 00:00:00', '2', '2', '0', '', null, '2017-05-17 14:58:42', null, '2017-05-17 14:58:42');
INSERT INTO `bus_order` VALUES ('161', '1201705170002', '1', '0', '2', '20021', '20019', '12', 'Jevons', '18521411359', '8.00', '8.00', '1', '18:00:00', '18:20:00', '2017-05-20 00:00:00', '2', '2', '0', '', null, '2017-05-17 14:58:58', null, '2017-05-17 14:58:58');
INSERT INTO `bus_order` VALUES ('162', '1201705170003', '1', '0', '2', '20021', '20019', '12', 'Jevons', '18521411359', '12.00', '12.00', '1', '18:00:00', '18:20:00', '2017-05-20 00:00:00', '2', '2', '0', '', null, '2017-05-17 14:59:14', null, '2017-05-17 14:59:14');
INSERT INTO `bus_order` VALUES ('163', '1201705200001', '4', '1', '2', '20021', '20019', '12', 'Jevons', '18521411359', '56.00', '56.00', '1', '12:00:00', '12:12:00', '2017-05-21 00:00:00', '2', '1', '0', '', null, '2017-05-20 20:48:51', null, '2017-05-21 22:41:57');
INSERT INTO `bus_order` VALUES ('164', '1201705200002', '4', '1', '2', '20021', '20019', '12', 'Jevons', '18521411359', '32.00', '32.00', '1', '12:00:00', '12:12:00', '2017-05-21 00:00:00', '2', '1', '0', '', null, '2017-05-20 21:06:35', null, '2017-05-21 22:42:16');
INSERT INTO `bus_order` VALUES ('165', '1201705200003', '4', '1', '2', '20021', '20019', '12', 'Jevons', '18521411359', '20.00', '20.00', '1', '12:00:00', '12:12:00', '2017-05-21 00:00:00', '2', '1', '0', '', null, '2017-05-20 21:06:48', null, '2017-05-21 22:41:55');
INSERT INTO `bus_order` VALUES ('166', '1201705200004', '4', '1', '2', '20021', '20019', '12', 'Jevons', '18521411359', '12.00', '12.00', '1', '12:00:00', '12:12:00', '2017-05-21 00:00:00', '2', '1', '0', '', null, '2017-05-20 21:22:30', null, '2017-05-21 22:42:16');
INSERT INTO `bus_order` VALUES ('167', '1201705200005', '4', '1', '2', '20021', '20019', '12', 'Jevons', '18521411359', '42.00', '42.00', '1', '12:00:00', '12:12:00', '2017-05-21 00:00:00', '2', '1', '0', '', null, '2017-05-20 21:24:48', null, '2017-05-21 22:42:07');
INSERT INTO `bus_order` VALUES ('168', '1201705200006', '4', '1', '2', '20021', '20019', '12', 'Jevons', '18521411359', '24.00', '24.00', '1', '12:00:00', '13:00:00', '2017-05-22 00:00:00', '1', '1', '0', '', null, '2017-05-20 21:25:00', null, '2017-05-22 20:15:54');
INSERT INTO `bus_order` VALUES ('169', '1201705200007', '4', '1', '2', '20021', '20019', '12', 'Jevons', '18521411359', '42.00', '42.00', '1', '12:00:00', '13:00:00', '2017-05-22 00:00:00', '1', '1', '0', '', null, '2017-05-20 21:25:10', null, '2017-05-22 20:15:54');
INSERT INTO `bus_order` VALUES ('170', '1201705210001', '4', '1', '2', '20021', '20019', '12', 'Jevons', '18521411359', '8.00', '8.00', '1', '12:00:00', '13:00:00', '2017-05-22 00:00:00', '1', '1', '0', '', null, '2017-05-21 16:19:53', null, '2017-05-22 20:14:26');
INSERT INTO `bus_order` VALUES ('171', '1201705210002', '4', '1', '2', '20021', '20019', '12', 'Jevons', '18521411359', '40.00', '40.00', '1', '12:00:00', '13:00:00', '2017-05-22 00:00:00', '1', '1', '0', '', null, '2017-05-21 21:48:33', null, '2017-05-22 20:15:54');
INSERT INTO `bus_order` VALUES ('172', '1201705240001', '1', '0', '2', '20021', '20019', '12', 'Jevons', '18521411359', '105.00', '105.00', '1', '12:00:00', '13:12:00', '2017-05-25 00:00:00', '1', '1', '0', '', null, '2017-05-24 09:58:16', null, '2017-05-24 09:58:16');
INSERT INTO `bus_order` VALUES ('173', '1201705240002', '1', '0', '2', '20021', '20019', '12', 'Jevons', '18521411359', '42.00', '42.00', '1', '12:00:00', '13:12:00', '2017-05-25 00:00:00', '1', '1', '0', '', null, '2017-05-24 09:58:30', null, '2017-05-24 09:58:30');
INSERT INTO `bus_order` VALUES ('174', '1201705240003', '1', '0', '2', '20021', '20019', '12', 'Jevons', '18521411359', '80.00', '80.00', '1', '12:00:00', '13:12:00', '2017-05-25 00:00:00', '1', '1', '0', '', null, '2017-05-24 19:46:00', null, '2017-05-24 19:46:00');
INSERT INTO `bus_order` VALUES ('175', '1201705240004', '1', '0', '2', '20021', '20019', '12', 'Jevons', '18521411359', '84.00', '84.00', '1', '12:00:00', '13:12:00', '2017-05-25 00:00:00', '1', '1', '0', '', null, '2017-05-24 19:46:08', null, '2017-05-24 19:46:08');
INSERT INTO `bus_order` VALUES ('176', '1201705240005', '1', '0', '2', '20021', '20019', '12', 'Jevons', '18521411359', '28.00', '28.00', '1', '12:00:00', '13:12:00', '2017-05-25 00:00:00', '1', '1', '0', '', null, '2017-05-24 19:46:16', null, '2017-05-24 19:46:16');
INSERT INTO `bus_order` VALUES ('177', '1201705250001', '1', '0', '2', '20021', '20019', '12', 'Jevons', '18521411359', '68.00', '68.00', '1', '12:00:00', '12:12:00', '2017-05-26 00:00:00', '1', '1', '0', '', null, '2017-05-25 14:26:32', null, '2017-05-25 14:26:32');
INSERT INTO `bus_order` VALUES ('178', '2201705250001', '2', '1', '1', '20028', '20018', '13', '熊伟', '18501754312', '11.00', '11.00', '1', '12:00:00', '12:20:00', '2017-05-26 00:00:00', '1', '1', '1', '', null, '2017-05-25 16:57:11', null, '2017-05-25 17:04:50');
INSERT INTO `bus_order` VALUES ('179', '2201705250002', '1', '0', '2', '20021', '20018', '13', 'Jevons', '18521411359', '331.00', '331.00', '1', '12:00:00', '12:20:00', '2017-05-26 00:00:00', '1', '1', '1', '', null, '2017-05-25 20:04:01', null, '2017-05-25 20:04:01');
INSERT INTO `bus_order` VALUES ('180', '2201705250003', '1', '0', '2', '20021', '20018', '13', 'Jevons', '18521411359', '123.00', '123.00', '1', '12:00:00', '12:20:00', '2017-05-26 00:00:00', '1', '1', '1', '', null, '2017-05-25 20:06:22', null, '2017-05-25 20:06:22');
INSERT INTO `bus_order` VALUES ('181', '2201705250004', '1', '0', '2', '20021', '20018', '13', 'Jevons', '18521411359', '100.00', '100.00', '1', '12:00:00', '12:20:00', '2017-05-26 00:00:00', '1', '1', '1', '', null, '2017-05-25 20:07:07', null, '2017-05-25 20:07:07');
INSERT INTO `bus_order` VALUES ('182', '2201705250005', '1', '0', '2', '20021', '20018', '13', 'Jevons', '18521411359', '158.00', '158.00', '1', '12:00:00', '12:20:00', '2017-05-26 00:00:00', '1', '1', '1', '', null, '2017-05-25 20:13:08', null, '2017-05-25 20:13:08');
INSERT INTO `bus_order` VALUES ('183', '2201705250006', '1', '0', '2', '20021', '20018', '13', 'Jevons', '18521411359', '240.00', '240.00', '1', '12:00:00', '12:20:00', '2017-05-26 00:00:00', '1', '1', '0', '', null, '2017-05-25 20:18:00', null, '2017-05-25 20:18:00');
INSERT INTO `bus_order` VALUES ('184', '2201705250007', '1', '0', '2', '20021', '20018', '13', 'Jevons', '18521411359', '164.00', '164.00', '1', '12:00:00', '12:20:00', '2017-05-26 00:00:00', '1', '1', '0', '', null, '2017-05-25 20:18:31', null, '2017-05-25 20:18:31');
INSERT INTO `bus_order` VALUES ('185', '2201705250008', '1', '0', '2', '20021', '20018', '13', 'Jevons', '18521411359', '164.00', '164.00', '1', '12:00:00', '12:20:00', '2017-05-26 00:00:00', '1', '1', '0', '', null, '2017-05-25 20:21:48', null, '2017-05-25 20:21:48');
INSERT INTO `bus_order` VALUES ('186', '2201705250009', '1', '0', '2', '20021', '20018', '13', 'Jevons', '18521411359', '280.00', '280.00', '1', '12:00:00', '12:20:00', '2017-05-26 00:00:00', '1', '1', '0', '', null, '2017-05-25 20:24:06', null, '2017-05-25 20:24:06');
INSERT INTO `bus_order` VALUES ('187', '2201705250010', '1', '0', '2', '20021', '20018', '13', 'Jevons', '18521411359', '182.00', '182.00', '1', '12:00:00', '12:20:00', '2017-05-26 00:00:00', '1', '1', '0', '', null, '2017-05-25 21:44:14', null, '2017-05-25 21:44:14');
INSERT INTO `bus_order` VALUES ('188', '2201705250011', '1', '0', '2', '20021', '20018', '13', 'Jevons', '18521411359', '100.00', '100.00', '1', '12:00:00', '12:20:00', '2017-05-26 00:00:00', '1', '1', '0', '', null, '2017-05-25 22:28:15', null, '2017-05-25 22:28:15');
INSERT INTO `bus_order` VALUES ('189', '2201705250012', '1', '0', '2', '20021', '20018', '13', 'Jevons', '18521411359', '100.00', '100.00', '1', '12:00:00', '12:20:00', '2017-05-26 00:00:00', '1', '1', '0', '', null, '2017-05-25 22:28:57', null, '2017-05-25 22:28:57');
INSERT INTO `bus_order` VALUES ('190', '2201705250013', '1', '0', '2', '20021', '20018', '13', 'Jevons', '18521411359', '100.00', '100.00', '1', '12:00:00', '12:20:00', '2017-05-26 00:00:00', '1', '1', '0', '', null, '2017-05-25 22:30:39', null, '2017-05-25 22:30:39');
INSERT INTO `bus_order` VALUES ('191', '2201705250014', '1', '0', '2', '20021', '20018', '13', 'Jevons', '18521411359', '100.00', '100.00', '1', '12:00:00', '12:20:00', '2017-05-26 00:00:00', '1', '1', '0', '', null, '2017-05-25 22:47:14', null, '2017-05-25 22:47:14');
INSERT INTO `bus_order` VALUES ('192', '2201705260001', '0', '0', '1', '20021', '20018', '13', 'Jevons', '18521411359', '21.00', '21.00', '1', '18:30:00', '18:50:00', '2017-05-27 00:00:00', '2', '2', '0', '', null, '2017-05-26 01:11:55', null, '2017-05-26 01:11:55');
INSERT INTO `bus_order` VALUES ('193', '2201705260002', '1', '0', '2', '20021', '20018', '13', 'Jevons', '18521411359', '21.00', '21.00', '1', '18:30:00', '18:50:00', '2017-05-27 00:00:00', '2', '2', '0', '', null, '2017-05-26 01:12:15', null, '2017-05-26 01:12:15');
INSERT INTO `bus_order` VALUES ('194', '2201705260003', '0', '0', '1', '20031', '20018', '13', '何乾', '7657190923', '42.00', '42.00', '1', '18:30:00', '18:50:00', '2017-05-28 00:00:00', '2', '2', '0', '', null, '2017-05-26 08:31:06', null, '2017-05-26 08:31:06');
INSERT INTO `bus_order` VALUES ('195', '2201705260004', '1', '0', '2', '20031', '20018', '13', '何乾', '7657190923', '42.00', '42.00', '1', '18:30:00', '18:50:00', '2017-05-28 00:00:00', '2', '2', '0', '', null, '2017-05-26 08:31:15', null, '2017-05-26 08:31:15');
INSERT INTO `bus_order` VALUES ('196', '2201705260005', '0', '0', '1', '20031', '20018', '13', '何乾', '7657190923', '42.00', '42.00', '1', '18:30:00', '18:50:00', '2017-05-28 00:00:00', '2', '2', '0', '', null, '2017-05-26 08:33:16', null, '2017-05-26 08:33:16');
INSERT INTO `bus_order` VALUES ('197', '2201705260006', '0', '0', '1', '20031', '20018', '13', '何乾', '7657190923', '42.00', '42.00', '1', '18:30:00', '18:50:00', '2017-05-28 00:00:00', '2', '2', '0', '', null, '2017-05-26 08:43:22', null, '2017-05-26 08:43:22');
INSERT INTO `bus_order` VALUES ('198', '2201705260007', '1', '0', '2', '20031', '20018', '13', '何乾', '7657190923', '63.00', '63.00', '1', '18:30:00', '18:50:00', '2017-05-28 00:00:00', '2', '2', '0', '', null, '2017-05-26 08:48:05', null, '2017-05-26 08:48:05');
INSERT INTO `bus_order` VALUES ('199', '2201705260008', '1', '0', '2', '20021', '20018', '13', 'Jevons', '18521411359', '42.00', '42.00', '1', '18:30:00', '18:50:00', '2017-05-27 00:00:00', '2', '2', '0', '', null, '2017-05-26 11:09:46', null, '2017-05-26 11:09:46');
INSERT INTO `bus_order` VALUES ('200', '102201705260001', '0', '0', '1', '20028', '20023', '16', '熊伟', '18501754312', '114.00', '114.00', '1', '12:30:00', '12:50:00', '2017-05-27 00:00:00', '2', '1', '1', '', null, '2017-05-26 16:02:51', null, '2017-05-26 16:02:51');
INSERT INTO `bus_order` VALUES ('201', '102201705260002', '0', '0', '1', '20028', '20023', '16', '熊伟', '18501754312', '114.00', '114.00', '1', '12:30:00', '12:50:00', '2017-05-27 00:00:00', '2', '1', '1', '', null, '2017-05-26 16:08:22', null, '2017-05-26 16:08:22');
INSERT INTO `bus_order` VALUES ('202', '102201705260003', '2', '0', '2', '20028', '20023', '16', '熊伟', '18501754312', '114.00', '114.00', '1', '12:30:00', '12:50:00', '2017-05-27 00:00:00', '2', '1', '1', '', null, '2017-05-26 16:09:44', null, '2017-05-26 16:09:44');
INSERT INTO `bus_order` VALUES ('203', '102201705260004', '0', '0', '1', '20028', '20023', '16', '熊伟', '18501754312', '270.00', '270.00', '1', '12:30:00', '12:50:00', '2017-05-27 00:00:00', '2', '1', '1', '', null, '2017-05-26 16:14:12', null, '2017-05-26 16:14:12');
INSERT INTO `bus_order` VALUES ('204', '102201705260005', '0', '0', '1', '20028', '20023', '16', '熊伟', '18501754312', '1.00', '1.00', '1', '12:30:00', '12:50:00', '2017-05-27 00:00:00', '2', '1', '1', '', null, '2017-05-26 16:20:40', null, '2017-05-26 16:20:40');
INSERT INTO `bus_order` VALUES ('205', '102201705260006', '0', '0', '1', '20028', '20023', '16', '熊伟', '18501754312', '273.00', '273.00', '1', '18:30:00', '18:50:00', '2017-05-27 00:00:00', '2', '2', '1', '', null, '2017-05-26 17:13:51', null, '2017-05-26 17:13:51');
INSERT INTO `bus_order` VALUES ('206', '102201705260007', '4', '1', '1', '20028', '20023', '16', '熊伟', '18501754312', '270.00', '270.00', '1', '17:40:00', '18:00:00', '2017-05-26 00:00:00', '1', '2', '1', '', null, '2017-05-26 17:30:37', null, '2017-05-26 18:00:10');
INSERT INTO `bus_order` VALUES ('207', '102201705260008', '4', '1', '1', '20028', '20023', '16', '熊伟', '18501754312', '156.00', '156.00', '1', '17:40:00', '18:00:00', '2017-05-26 00:00:00', '1', '2', '1', '', null, '2017-05-26 17:38:41', null, '2017-05-26 18:00:07');
INSERT INTO `bus_order` VALUES ('208', '102201705260009', '4', '1', '2', '20028', '20023', '16', '熊伟', '18501754312', '105.00', '105.00', '1', '17:40:00', '18:00:00', '2017-05-26 00:00:00', '1', '2', '1', '', null, '2017-05-26 17:44:31', null, '2017-05-26 18:00:09');
INSERT INTO `bus_order` VALUES ('209', '101201705260001', '0', '0', '1', '20028', '20023', '15', '熊伟', '18501754312', '573.00', '573.00', '1', '11:30:00', '11:45:00', '2017-05-26 00:00:00', '1', '1', '1', '', null, '2017-05-26 22:28:36', null, '2017-05-26 22:28:36');
INSERT INTO `bus_order` VALUES ('210', '101201705260002', '1', '0', '2', '20028', '20023', '15', '熊伟', '18501754312', '573.00', '573.00', '1', '11:30:00', '11:45:00', '2017-05-26 00:00:00', '1', '1', '1', '', null, '2017-05-26 22:28:40', null, '2017-05-26 22:28:40');
INSERT INTO `bus_order` VALUES ('211', '2201705270001', '0', '0', '1', '20033', '20018', '13', 'Lijinyang', '18201954319', '21.00', '0.00', '1', '18:30:00', '18:50:00', '2017-05-27 00:00:00', '2', '2', '0', '', null, '2017-05-27 10:49:15', null, '2017-05-27 10:49:15');
INSERT INTO `bus_order` VALUES ('212', '2201705270002', '1', '0', '2', '20033', '20018', '13', 'Lijinyang', '18201954319', '21.00', '0.00', '1', '18:30:00', '18:50:00', '2017-05-27 00:00:00', '2', '2', '0', '', null, '2017-05-27 10:49:20', null, '2017-05-27 10:49:20');
INSERT INTO `bus_order` VALUES ('213', '101201705270001', '5', '0', '2', '20028', '20023', '15', '熊伟', '18501754312', '844.00', '839.00', '1', '11:30:00', '12:00:00', '2017-05-27 00:00:00', '2', '1', '1', '', null, '2017-05-27 17:00:55', null, '2017-05-31 17:24:44');
INSERT INTO `bus_order` VALUES ('214', '101201705270002', '0', '0', '1', '20028', '20023', '15', '熊伟', '18501754312', '114.00', '109.00', '1', '11:30:00', '12:00:00', '2017-05-27 00:00:00', '2', '1', '1', '', null, '2017-05-27 17:14:52', null, '2017-05-27 17:14:52');
INSERT INTO `bus_order` VALUES ('215', '101201705270003', '5', '0', '2', '20028', '20023', '15', '熊伟', '18501754312', '114.00', '109.00', '1', '11:30:00', '12:00:00', '2017-05-27 00:00:00', '2', '1', '1', '', null, '2017-05-27 17:17:21', null, '2017-05-31 17:24:38');
INSERT INTO `bus_order` VALUES ('216', '101201705270004', '0', '0', '1', '20028', '20023', '15', '熊伟', '18501754312', '114.00', '109.00', '1', '11:30:00', '12:00:00', '2017-05-27 00:00:00', '2', '1', '1', '', null, '2017-05-27 17:21:16', null, '2017-05-27 17:21:16');
INSERT INTO `bus_order` VALUES ('217', '101201705270005', '1', '0', '2', '20028', '20023', '15', '熊伟', '18501754312', '74.00', '74.00', '1', '11:30:00', '12:00:00', '2017-05-27 00:00:00', '2', '1', '1', '', null, '2017-05-27 17:26:27', null, '2017-05-27 17:26:27');
INSERT INTO `bus_order` VALUES ('218', '102201705270001', '0', '0', '1', '20028', '20023', '16', '熊伟', '18501754312', '222.00', '217.00', '1', '12:30:00', '12:50:00', '2017-05-27 00:00:00', '2', '1', '1', '', null, '2017-05-27 17:43:25', null, '2017-05-27 17:43:25');
INSERT INTO `bus_order` VALUES ('219', '102201705270002', '5', '0', '2', '20028', '20023', '16', '熊伟', '18501754312', '222.00', '217.00', '1', '12:30:00', '12:50:00', '2017-05-27 00:00:00', '2', '1', '1', '', null, '2017-05-27 17:43:29', null, '2017-05-31 17:24:28');
INSERT INTO `bus_order` VALUES ('220', '101201705270006', '0', '0', '1', '20028', '20023', '15', '熊伟', '18501754312', '222.00', '217.00', '1', '12:30:00', '12:50:00', '2017-05-27 00:00:00', '2', '1', '1', '', null, '2017-05-27 17:44:41', null, '2017-05-27 17:44:41');
INSERT INTO `bus_order` VALUES ('221', '101201705270007', '1', '0', '2', '20028', '20023', '15', '熊伟', '18501754312', '222.00', '217.00', '1', '12:30:00', '12:50:00', '2017-05-27 00:00:00', '2', '1', '1', '', null, '2017-05-27 17:44:45', null, '2017-05-27 17:44:45');
INSERT INTO `bus_order` VALUES ('222', '101201705270008', '1', '0', '2', '20021', '20023', '15', 'Jevons', '18521411359', '74.00', '74.00', '1', '11:30:00', '12:00:00', '2017-05-27 00:00:00', '2', '1', '0', '', null, '2017-05-27 22:05:29', null, '2017-05-27 22:05:29');
INSERT INTO `bus_order` VALUES ('223', '101201705270009', '1', '0', '2', '20021', '20023', '15', 'Jevons', '18521411359', '38.00', '38.00', '1', '11:30:00', '12:00:00', '2017-05-27 00:00:00', '2', '1', '0', '', null, '2017-05-27 22:16:53', null, '2017-05-27 22:16:53');
INSERT INTO `bus_order` VALUES ('224', '101201705270010', '1', '0', '2', '20021', '20023', '15', 'Jevons', '18521411359', '370.00', '370.00', '1', '11:30:00', '12:00:00', '2017-05-27 00:00:00', '2', '1', '0', '', null, '2017-05-27 22:20:48', null, '2017-05-27 22:20:48');
INSERT INTO `bus_order` VALUES ('225', '101201705270011', '1', '0', '2', '20021', '20023', '15', 'Jevons', '18521411359', '546.00', '541.00', '1', '11:30:00', '12:00:00', '2017-05-27 00:00:00', '2', '1', '0', '', null, '2017-05-27 22:21:35', null, '2017-05-27 22:21:35');
INSERT INTO `bus_order` VALUES ('226', '101201705270012', '1', '0', '2', '20021', '20023', '15', 'Jevons', '18521411359', '467.00', '462.00', '1', '11:30:00', '12:00:00', '2017-05-27 00:00:00', '2', '1', '0', '', null, '2017-05-27 23:16:07', null, '2017-05-27 23:16:07');
INSERT INTO `bus_order` VALUES ('227', '101201705300001', '1', '0', '2', '20021', '20023', '15', 'Jevons', '18521411359', '180.00', '175.00', '1', '11:30:00', '11:45:00', '2017-05-30 00:00:00', '1', '1', '0', '', null, '2017-05-30 18:48:53', null, '2017-05-30 18:48:53');
INSERT INTO `bus_order` VALUES ('228', '102201705310001', '3', '1', '1', '20028', '20034', '16', '熊伟', '18501754312', '250.00', '250.00', '1', '11:30:00', '11:45:00', '2017-05-31 00:00:00', '1', '1', '1', '', null, '2017-05-31 18:01:22', null, '2017-05-31 18:02:34');
INSERT INTO `bus_order` VALUES ('229', '102201705310002', '3', '0', '2', '20021', '20034', '16', 'Jevons', '18521411359', '37.00', '37.00', '1', '12:30:00', '12:50:00', '2017-05-31 00:00:00', '1', '1', '0', '', null, '2017-05-31 18:17:32', null, '2017-05-31 18:17:32');
INSERT INTO `bus_order` VALUES ('230', '102201705310003', '1', '0', '2', '20021', '20034', '16', 'Jevons', '18521411359', '334.00', '334.00', '1', '12:30:00', '12:50:00', '2017-05-31 00:00:00', '1', '1', '0', '', null, '2017-05-31 20:22:17', null, '2017-05-31 20:22:17');
INSERT INTO `bus_order` VALUES ('231', '102201705310004', '1', '0', '2', '20021', '20034', '16', 'Jevons', '18521411359', '460.00', '455.00', '1', '12:30:00', '12:50:00', '2017-05-31 00:00:00', '1', '1', '0', '', null, '2017-05-31 20:31:52', null, '2017-05-31 20:31:52');
INSERT INTO `bus_order` VALUES ('232', '102201705310005', '1', '0', '2', '20021', '20034', '16', 'Jevons', '18521411359', '270.00', '270.00', '1', '12:30:00', '12:50:00', '2017-05-31 00:00:00', '1', '1', '0', '', null, '2017-05-31 20:36:58', null, '2017-05-31 20:36:58');
INSERT INTO `bus_order` VALUES ('233', '102201705310006', '1', '0', '2', '20021', '20034', '16', 'Jevons', '18521411359', '180.00', '175.00', '1', '12:30:00', '12:50:00', '2017-05-31 00:00:00', '1', '1', '0', '', null, '2017-05-31 20:37:54', null, '2017-05-31 20:37:54');
INSERT INTO `bus_order` VALUES ('234', '102201705310007', '1', '0', '2', '20021', '20034', '16', 'Jevons', '18521411359', '270.00', '270.00', '1', '12:30:00', '12:50:00', '2017-05-31 00:00:00', '1', '1', '0', '', null, '2017-05-31 20:38:57', null, '2017-05-31 20:38:57');
INSERT INTO `bus_order` VALUES ('235', '102201705310008', '1', '0', '2', '20021', '20034', '16', 'Jevons', '18521411359', '270.00', '270.00', '1', '12:30:00', '12:50:00', '2017-05-31 00:00:00', '1', '1', '0', '', null, '2017-05-31 20:42:25', null, '2017-05-31 20:42:25');
INSERT INTO `bus_order` VALUES ('236', '102201705310009', '1', '0', '2', '20021', '20034', '16', 'Jevons', '18521411359', '360.00', '360.00', '1', '12:30:00', '12:50:00', '2017-05-31 00:00:00', '1', '1', '0', '', null, '2017-05-31 20:45:20', null, '2017-05-31 20:45:20');
INSERT INTO `bus_order` VALUES ('237', '102201705310010', '1', '0', '2', '20021', '20034', '16', 'Jevons', '18521411359', '270.00', '270.00', '1', '12:30:00', '12:50:00', '2017-05-31 00:00:00', '1', '1', '0', '', null, '2017-05-31 20:48:28', null, '2017-05-31 20:48:28');
INSERT INTO `bus_order` VALUES ('238', '102201705310011', '1', '0', '2', '20021', '20034', '16', 'Jevons', '18521411359', '218.00', '213.00', '1', '12:30:00', '12:50:00', '2017-05-31 00:00:00', '1', '1', '0', '', null, '2017-05-31 20:50:13', null, '2017-05-31 20:50:13');
INSERT INTO `bus_order` VALUES ('239', '102201705310012', '1', '0', '2', '20021', '20034', '16', 'Jevons', '18521411359', '270.00', '270.00', '1', '12:30:00', '12:50:00', '2017-05-31 00:00:00', '1', '1', '0', '', null, '2017-05-31 20:51:02', null, '2017-05-31 20:51:02');
INSERT INTO `bus_order` VALUES ('240', '102201705310013', '1', '0', '2', '20021', '20034', '16', 'Jevons', '18521411359', '460.00', '455.00', '1', '12:30:00', '12:50:00', '2017-05-31 00:00:00', '1', '1', '0', '', null, '2017-05-31 20:54:21', null, '2017-05-31 20:54:21');
INSERT INTO `bus_order` VALUES ('241', '101201705310001', '0', '0', '1', '20028', '20023', '15', '熊伟', '18501754312', '160.00', '155.00', '1', '11:30:00', '11:45:00', '2017-05-31 00:00:00', '1', '1', '1', '', null, '2017-05-31 21:01:16', null, '2017-05-31 21:01:16');
INSERT INTO `bus_order` VALUES ('242', '102201705310014', '1', '0', '2', '20021', '20034', '16', 'Jevons', '18521411359', '154.00', '149.00', '1', '12:30:00', '12:50:00', '2017-05-31 00:00:00', '1', '1', '0', '', null, '2017-05-31 21:16:27', null, '2017-05-31 21:16:27');
INSERT INTO `bus_order` VALUES ('243', '101201705310002', '3', '0', '2', '20021', '20023', '15', 'Jevons', '18521411359', '160.00', '155.00', '1', '12:30:00', '12:50:00', '2017-05-31 00:00:00', '1', '1', '0', '', null, '2017-05-31 21:18:30', null, '2017-05-31 21:18:30');
INSERT INTO `bus_order` VALUES ('244', '101201705310003', '3', '0', '2', '20021', '20023', '15', 'Jevons', '18521411359', '160.00', '155.00', '1', '12:30:00', '12:50:00', '2017-05-31 00:00:00', '1', '1', '0', '', null, '2017-05-31 21:21:15', null, '2017-05-31 21:21:15');
INSERT INTO `bus_order` VALUES ('245', '102201705310015', '0', '0', '1', '20021', '20034', '16', 'Jevons', '18521411359', '160.00', '155.00', '1', '12:30:00', '12:50:00', '2017-05-31 00:00:00', '1', '1', '0', '', null, '2017-05-31 21:24:38', null, '2017-05-31 21:24:38');
INSERT INTO `bus_order` VALUES ('246', '102201705310016', '0', '0', '1', '20021', '20034', '16', 'Jevons', '18521411359', '160.00', '155.00', '1', '12:30:00', '12:50:00', '2017-05-31 00:00:00', '1', '1', '0', '', null, '2017-05-31 21:25:28', null, '2017-05-31 21:25:28');
INSERT INTO `bus_order` VALUES ('247', '102201705310017', '0', '0', '1', '20021', '20034', '16', 'Jevons', '18521411359', '160.00', '155.00', '1', '12:30:00', '12:50:00', '2017-05-31 00:00:00', '1', '1', '0', '', null, '2017-05-31 21:29:15', null, '2017-05-31 21:29:15');
INSERT INTO `bus_order` VALUES ('248', '102201705310018', '1', '1', '1', '20021', '20034', '16', 'Jevons', '18521411359', '160.00', '155.00', '1', '12:30:00', '12:50:00', '2017-05-31 00:00:00', '1', '1', '0', '', null, '2017-05-31 21:30:37', null, '2017-05-31 21:32:11');
INSERT INTO `bus_order` VALUES ('249', '102201706010001', '0', '0', '1', '20028', '20034', '16', '熊伟', '18501754312', '157.00', '152.00', '1', '17:40:00', '18:00:00', '2017-06-01 00:00:00', '1', '2', '1', '', null, '2017-06-01 10:34:11', null, '2017-06-01 10:34:11');
INSERT INTO `bus_order` VALUES ('250', '101201706010001', '4', '1', '1', '20028', '20023', '15', '熊伟', '18501754312', '167.00', '162.00', '1', '11:30:00', '11:45:00', '2017-06-01 00:00:00', '1', '1', '0', '', null, '2017-06-01 11:15:05', null, '2017-06-01 14:29:48');
INSERT INTO `bus_order` VALUES ('251', '102201706010002', '4', '1', '1', '20028', '20034', '16', '熊伟', '18501754312', '156.00', '151.00', '1', '12:30:00', '12:50:00', '2017-06-01 00:00:00', '1', '1', '0', '', null, '2017-06-01 11:16:38', null, '2017-06-01 11:43:55');
INSERT INTO `bus_order` VALUES ('252', '102201706010003', '3', '0', '2', '20033', '20034', '16', '金阳', '18201954319', '90.00', '90.00', '1', '12:30:00', '12:50:00', '2017-06-01 00:00:00', '1', '1', '0', '', null, '2017-06-01 12:26:02', null, '2017-06-01 12:26:02');
INSERT INTO `bus_order` VALUES ('253', '103201706010001', '4', '1', '1', '20028', '20036', '17', '熊伟', '18501754312', '189.00', '184.00', '1', '11:30:00', '11:45:00', '2017-06-01 00:00:00', '1', '1', '0', '监督地方此次肌肤', null, '2017-06-01 14:46:33', null, '2017-06-01 23:08:42');
INSERT INTO `bus_order` VALUES ('254', '101201706010002', '2', '1', '1', '20028', '20034', '15', '熊伟', '18501754312', '224.00', '219.00', '1', '11:30:00', '11:45:00', '2017-06-01 00:00:00', '1', '1', '1', '', null, '2017-06-01 14:47:59', null, '2017-06-01 14:48:19');
INSERT INTO `bus_order` VALUES ('255', '102201706010004', '0', '0', '1', '20028', '20036', '16', '熊伟', '18501754312', '500.00', '495.00', '1', '11:30:00', '11:45:00', '2017-06-01 00:00:00', '1', '1', '0', '', null, '2017-06-01 14:50:57', null, '2017-06-01 14:50:57');
INSERT INTO `bus_order` VALUES ('256', '102201706010005', '4', '1', '1', '20028', '20036', '16', '熊伟', '18501754312', '500.00', '495.00', '1', '11:30:00', '11:45:00', '2017-06-01 00:00:00', '1', '1', '0', '', null, '2017-06-01 14:53:09', null, '2017-06-01 18:07:06');
INSERT INTO `bus_order` VALUES ('257', '101201706010003', '0', '0', '1', '20028', '20034', '15', '熊伟', '18501754312', '101.00', '96.00', '1', '11:30:00', '11:45:00', '2017-06-01 00:00:00', '1', '1', '0', '', null, '2017-06-01 19:06:41', null, '2017-06-01 19:06:41');
INSERT INTO `bus_order` VALUES ('258', '102201706010006', '4', '1', '1', '20033', '20036', '16', '金阳', '18201954319', '133.00', '128.00', '1', '12:30:00', '12:50:00', '2017-06-01 00:00:00', '1', '1', '0', '', null, '2017-06-01 22:53:16', null, '2017-06-01 23:21:24');
INSERT INTO `bus_order` VALUES ('259', '102201706010007', '4', '1', '1', '20033', '20036', '16', '金阳', '18201954319', '168.00', '163.00', '1', '12:30:00', '12:50:00', '2017-06-01 00:00:00', '1', '1', '0', '', null, '2017-06-01 22:54:38', null, '2017-06-01 23:21:24');
INSERT INTO `bus_order` VALUES ('260', '102201706010008', '4', '1', '2', '20033', '20036', '16', '金阳', '18201954319', '500.00', '495.00', '1', '12:30:00', '12:50:00', '2017-06-01 00:00:00', '1', '1', '0', '', null, '2017-06-01 23:22:09', null, '2017-06-01 23:22:23');
INSERT INTO `bus_order` VALUES ('261', '102201706010009', '4', '1', '2', '20033', '20036', '16', '金阳', '18201954319', '100.00', '95.00', '1', '12:30:00', '12:50:00', '2017-06-01 00:00:00', '1', '1', '0', '', null, '2017-06-01 23:22:53', null, '2017-06-01 23:23:05');
INSERT INTO `bus_order` VALUES ('262', '102201706010010', '4', '1', '2', '20033', '20036', '16', '金阳', '18201954319', '100.00', '95.00', '1', '12:30:00', '12:50:00', '2017-06-01 00:00:00', '1', '1', '0', '', null, '2017-06-01 23:23:22', null, '2017-06-01 23:23:39');
INSERT INTO `bus_order` VALUES ('263', '102201706010011', '4', '1', '2', '20033', '20036', '16', '金阳', '18201954319', '100.00', '95.00', '1', '12:30:00', '12:50:00', '2017-06-01 00:00:00', '1', '1', '0', '', null, '2017-06-01 23:24:27', null, '2017-06-01 23:24:38');
INSERT INTO `bus_order` VALUES ('264', '102201706010012', '3', '0', '2', '20033', '20036', '16', '金阳', '18201954319', '200.00', '195.00', '1', '12:30:00', '12:50:00', '2017-06-01 00:00:00', '1', '1', '0', '', null, '2017-06-01 23:32:42', null, '2017-06-01 23:32:42');
INSERT INTO `bus_order` VALUES ('265', '102201706010013', '3', '0', '2', '20033', '20036', '16', '金阳', '18201954319', '70.00', '70.00', '1', '12:30:00', '12:50:00', '2017-06-01 00:00:00', '1', '1', '0', '', null, '2017-06-01 23:42:27', null, '2017-06-01 23:42:27');
INSERT INTO `bus_order` VALUES ('266', '102201706010014', '3', '0', '2', '20033', '20036', '16', 'kk j', '18201954319', '66.00', '66.00', '1', '12:30:00', '12:50:00', '2017-06-01 00:00:00', '1', '1', '0', '', null, '2017-06-01 23:44:52', null, '2017-06-01 23:44:52');
INSERT INTO `bus_order` VALUES ('267', '102201706010015', '3', '0', '2', '20033', '20036', '16', 'n j j', '18201954319', '55.00', '55.00', '1', '12:30:00', '12:50:00', '2017-06-01 00:00:00', '1', '1', '0', '', null, '2017-06-01 23:46:13', null, '2017-06-01 23:46:13');
INSERT INTO `bus_order` VALUES ('268', '102201706010016', '3', '0', '2', '20033', '20036', '16', 'k j j', '18201954319', '68.00', '68.00', '1', '12:30:00', '12:50:00', '2017-06-01 00:00:00', '1', '1', '0', '', null, '2017-06-01 23:47:30', null, '2017-06-01 23:47:30');
INSERT INTO `bus_order` VALUES ('269', '102201706020001', '3', '0', '2', '20033', '20036', '16', 'j j j j', '18201954319', '206.00', '201.00', '1', '12:30:00', '12:50:00', '2017-06-02 00:00:00', '1', '1', '0', '', null, '2017-06-02 00:03:49', null, '2017-06-02 00:03:49');
INSERT INTO `bus_order` VALUES ('270', '101201706030001', '4', '1', '1', '20028', '20034', '15', '熊伟', '18501754312', '156.00', '151.00', '1', '11:30:00', '12:00:00', '2017-06-03 00:00:00', '2', '1', '0', '', null, '2017-06-03 10:39:18', null, '2017-06-03 11:21:03');
INSERT INTO `bus_order` VALUES ('271', '102201706030001', '4', '1', '1', '20028', '20034', '16', '熊伟', '18501754312', '105.00', '100.00', '1', '11:30:00', '12:00:00', '2017-06-03 00:00:00', '2', '1', '0', '', null, '2017-06-03 11:21:50', null, '2017-06-03 11:50:26');
INSERT INTO `bus_order` VALUES ('272', '101201706030002', '4', '1', '2', '20033', '20034', '15', '金阳', '18201954319', '273.00', '273.00', '1', '11:30:00', '12:00:00', '2017-06-03 00:00:00', '2', '1', '0', '', null, '2017-06-03 13:06:55', null, '2017-06-03 13:08:40');
INSERT INTO `bus_order` VALUES ('273', '101201706030003', '4', '1', '2', '20033', '20034', '15', '金阳', '18201954319', '423.00', '418.00', '1', '11:30:00', '12:00:00', '2017-06-03 00:00:00', '2', '1', '0', '', null, '2017-06-03 13:10:06', null, '2017-06-03 13:18:01');
INSERT INTO `bus_order` VALUES ('274', '102201706040001', '0', '0', '1', '20028', '20034', '16', '熊伟', '18501754312', '1.00', '1.00', '1', '17:00:00', '17:35:00', '2017-06-04 00:00:00', '2', '2', '0', '', null, '2017-06-04 16:21:56', null, '2017-06-04 16:21:56');
INSERT INTO `bus_order` VALUES ('275', '102201706040002', '0', '0', '1', '20028', '20034', '16', '熊伟', '18501754312', '1.00', '1.00', '1', '17:00:00', '17:35:00', '2017-06-04 00:00:00', '2', '2', '0', '', null, '2017-06-04 16:24:51', null, '2017-06-04 16:24:51');
INSERT INTO `bus_order` VALUES ('276', '101201706050001', '4', '1', '2', '20033', '20034', '15', '金阳', '18201954319', '37.00', '37.00', '1', '11:30:00', '11:45:00', '2017-06-05 00:00:00', '1', '1', '0', '', null, '2017-06-05 09:52:22', null, '2017-06-05 14:30:29');
INSERT INTO `bus_order` VALUES ('277', '102201706050001', '4', '1', '2', '20033', '20034', '16', '金阳', '18201954319', '111.00', '106.00', '1', '12:30:00', '12:50:00', '2017-06-05 00:00:00', '1', '1', '0', '', null, '2017-06-05 09:52:39', null, '2017-06-05 14:30:34');
INSERT INTO `bus_order` VALUES ('278', '101201706050002', '0', '0', '1', '20028', '20034', '15', '熊伟', '18501754312', '1.00', '1.00', '1', '11:30:00', '11:45:00', '2017-06-05 00:00:00', '1', '1', '0', '', null, '2017-06-05 10:33:31', null, '2017-06-05 10:33:31');
INSERT INTO `bus_order` VALUES ('279', '102201706050002', '1', '0', '2', '20033', '20034', '16', '金阳', '18201954319', '25.00', '25.00', '1', '17:40:00', '18:00:00', '2017-06-05 00:00:00', '1', '2', '0', '', null, '2017-06-05 10:45:23', null, '2017-06-05 10:45:23');
INSERT INTO `bus_order` VALUES ('280', '101201706050003', '4', '1', '1', '20028', '20034', '15', '熊伟', '18501754312', '1.00', '1.00', '1', '11:30:00', '11:45:00', '2017-06-05 00:00:00', '1', '1', '0', '', null, '2017-06-05 11:03:53', null, '2017-06-05 11:38:03');
INSERT INTO `bus_order` VALUES ('281', '101201706050004', '4', '1', '2', '20028', '20034', '15', '熊伟', '18501754312', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-05 00:00:00', '1', '1', '0', '', null, '2017-06-05 11:56:04', null, '2017-06-05 14:58:46');
INSERT INTO `bus_order` VALUES ('282', '102201706050003', '4', '1', '2', '20028', '20034', '16', '熊伟', '18501754312', '13.00', '13.00', '1', '12:30:00', '12:50:00', '2017-06-05 00:00:00', '1', '1', '0', '', null, '2017-06-05 14:20:39', null, '2017-06-05 15:02:49');
INSERT INTO `bus_order` VALUES ('283', '102201706050004', '4', '1', '2', '20028', '20034', '16', '熊伟', '18501754312', '39.00', '39.00', '1', '12:30:00', '12:50:00', '2017-06-05 00:00:00', '1', '1', '0', '', null, '2017-06-05 14:22:01', null, '2017-06-05 15:02:49');
INSERT INTO `bus_order` VALUES ('284', '101201706050005', '0', '0', '1', '20028', '20034', '15', '熊伟', '18501754312', '1.00', '1.00', '1', '11:30:00', '11:45:00', '2017-06-05 00:00:00', '1', '1', '0', '', null, '2017-06-05 14:33:43', null, '2017-06-05 14:33:43');
INSERT INTO `bus_order` VALUES ('285', '101201706050006', '4', '1', '2', '20028', '20034', '15', '熊伟', '18501754312', '1.00', '1.00', '1', '11:30:00', '11:45:00', '2017-06-05 00:00:00', '1', '1', '0', '', null, '2017-06-05 14:39:19', null, '2017-06-05 14:58:46');
INSERT INTO `bus_order` VALUES ('286', '101201706050007', '0', '0', '1', '20028', '20034', '15', '熊伟', '18501754312', '1.00', '1.00', '1', '11:30:00', '11:45:00', '2017-06-05 00:00:00', '1', '1', '0', '', null, '2017-06-05 14:51:03', null, '2017-06-05 14:51:03');
INSERT INTO `bus_order` VALUES ('287', '102201706050005', '0', '0', '1', '20033', '20034', '16', '金阳', '18201954319', '8.00', '8.00', '1', '12:30:00', '12:50:00', '2017-06-05 00:00:00', '1', '1', '0', '', null, '2017-06-05 16:06:46', null, '2017-06-05 16:06:46');
INSERT INTO `bus_order` VALUES ('288', '102201706050006', '0', '0', '1', '20033', '20034', '16', '金阳', '18201954319', '8.00', '8.00', '1', '12:30:00', '12:50:00', '2017-06-05 00:00:00', '1', '1', '0', '', null, '2017-06-05 16:11:09', null, '2017-06-05 16:11:09');
INSERT INTO `bus_order` VALUES ('289', '102201706050007', '0', '0', '1', '20033', '20034', '16', '金阳', '18201954319', '8.00', '8.00', '1', '12:30:00', '12:50:00', '2017-06-05 00:00:00', '1', '1', '0', '', null, '2017-06-05 16:14:04', null, '2017-06-05 16:14:04');
INSERT INTO `bus_order` VALUES ('290', '102201706050008', '0', '0', '1', '20033', '20034', '16', '金阳', '18201954319', '8.00', '8.00', '1', '12:30:00', '12:50:00', '2017-06-05 00:00:00', '1', '1', '0', '', null, '2017-06-05 16:14:25', null, '2017-06-05 16:14:25');
INSERT INTO `bus_order` VALUES ('291', '102201706050009', '0', '0', '1', '20033', '20034', '16', '金阳', '18201954319', '8.00', '8.00', '1', '12:30:00', '12:50:00', '2017-06-05 00:00:00', '1', '1', '0', '', null, '2017-06-05 16:14:36', null, '2017-06-05 16:14:36');
INSERT INTO `bus_order` VALUES ('292', '102201706050010', '0', '0', '1', '20033', '20034', '16', '金阳', '18201954319', '8.00', '8.00', '1', '12:30:00', '12:50:00', '2017-06-05 00:00:00', '1', '1', '0', '', null, '2017-06-05 16:15:25', null, '2017-06-05 16:15:25');
INSERT INTO `bus_order` VALUES ('293', '102201706050011', '0', '0', '1', '20033', '20034', '16', '金阳', '18201954319', '8.00', '8.00', '1', '12:30:00', '12:50:00', '2017-06-05 00:00:00', '1', '1', '0', '', null, '2017-06-05 16:15:36', null, '2017-06-05 16:15:36');
INSERT INTO `bus_order` VALUES ('294', '102201706050012', '0', '0', '1', '20033', '20034', '16', '金阳', '18201954319', '8.00', '8.00', '1', '12:30:00', '12:50:00', '2017-06-05 00:00:00', '1', '1', '0', '', null, '2017-06-05 16:17:36', null, '2017-06-05 16:17:36');
INSERT INTO `bus_order` VALUES ('295', '102201706050013', '0', '0', '1', '20033', '20034', '16', '金阳', '18201954319', '16.00', '16.00', '1', '12:30:00', '12:50:00', '2017-06-05 00:00:00', '1', '1', '0', '', null, '2017-06-05 16:25:59', null, '2017-06-05 16:25:59');
INSERT INTO `bus_order` VALUES ('296', '102201706050014', '0', '0', '1', '20033', '20034', '16', '金阳', '18201954319', '16.00', '16.00', '1', '12:30:00', '12:50:00', '2017-06-05 00:00:00', '1', '1', '0', '', null, '2017-06-05 17:19:16', null, '2017-06-05 17:19:16');
INSERT INTO `bus_order` VALUES ('297', '102201706050015', '0', '0', '1', '20033', '20034', '16', '金阳', '18201954319', '16.00', '16.00', '1', '12:30:00', '12:50:00', '2017-06-05 00:00:00', '1', '1', '0', '', null, '2017-06-05 17:19:29', null, '2017-06-05 17:19:29');
INSERT INTO `bus_order` VALUES ('298', '102201706050016', '0', '0', '1', '20033', '20034', '16', '金阳', '18201954319', '16.00', '16.00', '1', '12:30:00', '12:50:00', '2017-06-05 00:00:00', '1', '1', '0', '', null, '2017-06-05 17:19:38', null, '2017-06-05 17:19:38');
INSERT INTO `bus_order` VALUES ('299', '102201706050017', '0', '0', '1', '20033', '20034', '16', '金阳', '18201954319', '16.00', '16.00', '1', '12:30:00', '12:50:00', '2017-06-05 00:00:00', '1', '1', '0', '', null, '2017-06-05 17:39:51', null, '2017-06-05 17:39:51');
INSERT INTO `bus_order` VALUES ('300', '102201706050018', '0', '0', '1', '20033', '20034', '16', '金阳', '18201954319', '16.00', '16.00', '1', '12:30:00', '12:50:00', '2017-06-05 00:00:00', '1', '1', '0', '', null, '2017-06-05 17:45:30', null, '2017-06-05 17:45:30');
INSERT INTO `bus_order` VALUES ('301', '102201706050019', '0', '0', '1', '20033', '20034', '16', '金阳', '18201954319', '16.00', '16.00', '1', '12:30:00', '12:50:00', '2017-06-05 00:00:00', '1', '1', '0', '', null, '2017-06-05 17:45:41', null, '2017-06-05 17:45:41');
INSERT INTO `bus_order` VALUES ('302', '102201706050020', '0', '0', '1', '20033', '20034', '16', '金阳', '18201954319', '16.00', '16.00', '1', '12:30:00', '12:50:00', '2017-06-05 00:00:00', '1', '1', '0', '', null, '2017-06-05 17:46:15', null, '2017-06-05 17:46:15');
INSERT INTO `bus_order` VALUES ('303', '102201706050021', '0', '0', '1', '20033', '20034', '16', '金阳', '18201954319', '16.00', '16.00', '1', '12:30:00', '12:50:00', '2017-06-05 00:00:00', '1', '1', '0', '', null, '2017-06-05 17:49:22', null, '2017-06-05 17:49:22');
INSERT INTO `bus_order` VALUES ('304', '102201706050022', '0', '0', '1', '20033', '20034', '16', '金阳', '18201954319', '16.00', '16.00', '1', '12:30:00', '12:50:00', '2017-06-05 00:00:00', '1', '1', '0', '', null, '2017-06-05 17:49:55', null, '2017-06-05 17:49:55');
INSERT INTO `bus_order` VALUES ('305', '102201706050023', '0', '0', '1', '20033', '20034', '16', '金阳', '18201954319', '16.00', '16.00', '1', '12:30:00', '12:50:00', '2017-06-05 00:00:00', '1', '1', '0', '', null, '2017-06-05 18:01:32', null, '2017-06-05 18:01:32');
INSERT INTO `bus_order` VALUES ('306', '102201706050024', '0', '0', '1', '20033', '20034', '16', '金阳', '18201954319', '16.00', '16.00', '1', '12:30:00', '12:50:00', '2017-06-05 00:00:00', '1', '1', '0', '', null, '2017-06-05 18:01:38', null, '2017-06-05 18:01:38');
INSERT INTO `bus_order` VALUES ('307', '102201706050025', '0', '0', '1', '20033', '20034', '16', '金阳', '18201954319', '16.00', '16.00', '1', '12:30:00', '12:50:00', '2017-06-05 00:00:00', '1', '1', '0', '', null, '2017-06-05 18:01:47', null, '2017-06-05 18:01:47');
INSERT INTO `bus_order` VALUES ('308', '102201706050026', '0', '0', '1', '20033', '20034', '16', '金阳', '18201954319', '16.00', '16.00', '1', '12:30:00', '12:50:00', '2017-06-05 00:00:00', '1', '1', '0', '', null, '2017-06-05 18:01:51', null, '2017-06-05 18:01:51');
INSERT INTO `bus_order` VALUES ('309', '102201706050027', '0', '0', '1', '20033', '20034', '16', '金阳', '18201954319', '16.00', '16.00', '1', '12:30:00', '12:50:00', '2017-06-05 00:00:00', '1', '1', '0', '', null, '2017-06-05 18:02:35', null, '2017-06-05 18:02:35');
INSERT INTO `bus_order` VALUES ('310', '102201706050028', '0', '0', '1', '20033', '20034', '16', '金阳', '18201954319', '16.00', '16.00', '1', '12:30:00', '12:50:00', '2017-06-05 00:00:00', '1', '1', '0', '', null, '2017-06-05 18:03:11', null, '2017-06-05 18:03:11');
INSERT INTO `bus_order` VALUES ('311', '102201706050029', '0', '0', '1', '20033', '20034', '16', '金阳', '18201954319', '16.00', '16.00', '1', '12:30:00', '12:50:00', '2017-06-05 00:00:00', '1', '1', '0', '', null, '2017-06-05 18:06:00', null, '2017-06-05 18:06:00');
INSERT INTO `bus_order` VALUES ('312', '102201706050030', '0', '0', '1', '20033', '20034', '16', '金阳', '18201954319', '16.00', '16.00', '1', '12:30:00', '12:50:00', '2017-06-05 00:00:00', '1', '1', '0', '', null, '2017-06-05 19:38:51', null, '2017-06-05 19:38:51');
INSERT INTO `bus_order` VALUES ('313', '102201706050031', '0', '0', '1', '20033', '20034', '16', '金阳', '18201954319', '16.00', '16.00', '1', '12:30:00', '12:50:00', '2017-06-05 00:00:00', '1', '1', '0', '', null, '2017-06-05 19:40:46', null, '2017-06-05 19:40:46');
INSERT INTO `bus_order` VALUES ('314', '102201706050032', '0', '0', '1', '20033', '20034', '16', '金阳', '18201954319', '16.00', '16.00', '1', '12:30:00', '12:50:00', '2017-06-05 00:00:00', '1', '1', '0', '', null, '2017-06-05 19:40:51', null, '2017-06-05 19:40:51');
INSERT INTO `bus_order` VALUES ('315', '101201706060001', '0', '0', '1', '20033', '20034', '15', '金阳', '18201954319', '25.00', '25.00', '1', '11:30:00', '11:45:00', '2017-06-06 00:00:00', '1', '1', '0', '', null, '2017-06-06 20:14:02', null, '2017-06-06 20:14:02');
INSERT INTO `bus_order` VALUES ('316', '101201706060002', '0', '0', '1', '20033', '20034', '15', '金阳', '18201954319', '25.00', '25.00', '1', '11:30:00', '11:45:00', '2017-06-06 00:00:00', '1', '1', '0', '', null, '2017-06-06 20:15:31', null, '2017-06-06 20:15:31');
INSERT INTO `bus_order` VALUES ('317', '101201706060003', '0', '0', '1', '20033', '20034', '15', '金阳', '18201954319', '25.00', '25.00', '1', '11:30:00', '11:45:00', '2017-06-06 00:00:00', '1', '1', '0', '', null, '2017-06-06 20:16:29', null, '2017-06-06 20:16:29');
INSERT INTO `bus_order` VALUES ('318', '101201706060004', '0', '0', '1', '20033', '20034', '15', '金阳', '18201954319', '25.00', '25.00', '1', '11:30:00', '11:45:00', '2017-06-06 00:00:00', '1', '1', '0', '', null, '2017-06-06 20:18:00', null, '2017-06-06 20:18:00');
INSERT INTO `bus_order` VALUES ('319', '101201706060005', '0', '0', '1', '20033', '20034', '15', '金阳', '18201954319', '25.00', '25.00', '1', '11:30:00', '11:45:00', '2017-06-06 00:00:00', '1', '1', '0', '', null, '2017-06-06 20:19:59', null, '2017-06-06 20:19:59');
INSERT INTO `bus_order` VALUES ('320', '101201706060006', '0', '0', '1', '20033', '20034', '15', '金阳', '18201954319', '25.00', '25.00', '1', '11:30:00', '11:45:00', '2017-06-06 00:00:00', '1', '1', '0', '', null, '2017-06-06 20:20:45', null, '2017-06-06 20:20:45');
INSERT INTO `bus_order` VALUES ('321', '101201706060007', '0', '0', '1', '20033', '20034', '15', '金阳', '18201954319', '25.00', '25.00', '1', '11:30:00', '11:45:00', '2017-06-06 00:00:00', '1', '1', '0', '', null, '2017-06-06 20:26:59', null, '2017-06-06 20:26:59');
INSERT INTO `bus_order` VALUES ('322', '101201706060008', '0', '0', '1', '20033', '20034', '15', '金阳', '18201954319', '25.00', '25.00', '1', '11:30:00', '11:45:00', '2017-06-06 00:00:00', '1', '1', '0', '', null, '2017-06-06 20:28:49', null, '2017-06-06 20:28:49');
INSERT INTO `bus_order` VALUES ('323', '101201706060009', '0', '0', '1', '20033', '20034', '15', '金阳', '18201954319', '25.00', '25.00', '1', '11:30:00', '11:45:00', '2017-06-06 00:00:00', '1', '1', '0', '', null, '2017-06-06 20:30:17', null, '2017-06-06 20:30:17');
INSERT INTO `bus_order` VALUES ('324', '101201706060010', '0', '0', '1', '20033', '20034', '15', '金阳', '18201954319', '25.00', '25.00', '1', '11:30:00', '11:45:00', '2017-06-06 00:00:00', '1', '1', '0', '', null, '2017-06-06 20:45:04', null, '2017-06-06 20:45:04');
INSERT INTO `bus_order` VALUES ('325', '101201706060011', '0', '0', '1', '20033', '20034', '15', '金阳', '18201954319', '25.00', '25.00', '1', '11:30:00', '11:45:00', '2017-06-06 00:00:00', '1', '1', '0', '', null, '2017-06-06 20:45:42', null, '2017-06-06 20:45:42');
INSERT INTO `bus_order` VALUES ('326', '101201706060012', '0', '0', '1', '20033', '20034', '15', '金阳', '18201954319', '25.00', '25.00', '1', '11:30:00', '11:45:00', '2017-06-06 00:00:00', '1', '1', '0', '', null, '2017-06-06 20:47:20', null, '2017-06-06 20:47:20');
INSERT INTO `bus_order` VALUES ('327', '101201706060013', '0', '0', '1', '20033', '20034', '15', '金阳', '18201954319', '25.00', '25.00', '1', '11:30:00', '11:45:00', '2017-06-06 00:00:00', '1', '1', '0', '', null, '2017-06-06 20:48:37', null, '2017-06-06 20:48:37');
INSERT INTO `bus_order` VALUES ('328', '101201706060014', '0', '0', '1', '20033', '20034', '15', '金阳', '18201954319', '25.00', '25.00', '1', '11:30:00', '11:45:00', '2017-06-06 00:00:00', '1', '1', '0', '', null, '2017-06-06 20:48:53', null, '2017-06-06 20:48:53');
INSERT INTO `bus_order` VALUES ('329', '101201706060015', '0', '0', '1', '20033', '20034', '15', '金阳', '18201954319', '25.00', '25.00', '1', '11:30:00', '11:45:00', '2017-06-06 00:00:00', '1', '1', '0', '', null, '2017-06-06 20:49:51', null, '2017-06-06 20:49:51');
INSERT INTO `bus_order` VALUES ('330', '101201706060016', '0', '0', '1', '20033', '20034', '15', '金阳', '18201954319', '25.00', '25.00', '1', '11:30:00', '11:45:00', '2017-06-06 00:00:00', '1', '1', '0', '', null, '2017-06-06 20:50:20', null, '2017-06-06 20:50:20');
INSERT INTO `bus_order` VALUES ('331', '101201706060017', '1', '1', '1', '20033', '20034', '15', '金阳', '18201954319', '25.00', '25.00', '1', '11:30:00', '11:45:00', '2017-06-06 00:00:00', '1', '1', '0', '', null, '2017-06-06 23:03:37', null, '2017-06-06 23:03:58');
INSERT INTO `bus_order` VALUES ('332', '101201706060018', '0', '0', '1', '20033', '20034', '15', '金阳', '18201954319', '8.00', '8.00', '1', '11:30:00', '11:45:00', '2017-06-06 00:00:00', '1', '1', '0', '', null, '2017-06-06 23:04:31', null, '2017-06-06 23:04:31');
INSERT INTO `bus_order` VALUES ('333', '101201706060019', '0', '0', '1', '20033', '20034', '15', '金阳', '18201954319', '8.00', '8.00', '1', '11:30:00', '11:45:00', '2017-06-06 00:00:00', '1', '1', '0', '', null, '2017-06-06 23:11:01', null, '2017-06-06 23:11:01');
INSERT INTO `bus_order` VALUES ('334', '101201706060020', '0', '0', '1', '20033', '20034', '15', '金阳', '18201954319', '8.00', '8.00', '1', '11:30:00', '11:45:00', '2017-06-06 00:00:00', '1', '1', '0', '', null, '2017-06-06 23:12:06', null, '2017-06-06 23:12:06');
INSERT INTO `bus_order` VALUES ('335', '101201706060021', '0', '0', '1', '20033', '20034', '15', '金阳', '18201954319', '8.00', '8.00', '1', '11:30:00', '11:45:00', '2017-06-06 00:00:00', '1', '1', '0', '', null, '2017-06-06 23:19:12', null, '2017-06-06 23:19:12');
INSERT INTO `bus_order` VALUES ('336', '101201706060022', '0', '0', '1', '20033', '20034', '15', '金阳', '18201954319', '8.00', '8.00', '1', '11:30:00', '11:45:00', '2017-06-06 00:00:00', '1', '1', '0', '', null, '2017-06-06 23:19:20', null, '2017-06-06 23:19:20');
INSERT INTO `bus_order` VALUES ('337', '101201706060023', '0', '0', '1', '20033', '20034', '15', '金阳', '18201954319', '8.00', '8.00', '1', '11:30:00', '11:45:00', '2017-06-06 00:00:00', '1', '1', '0', '', null, '2017-06-06 23:19:28', null, '2017-06-06 23:19:28');
INSERT INTO `bus_order` VALUES ('338', '101201706060024', '0', '0', '1', '20033', '20034', '15', '金阳', '18201954319', '8.00', '8.00', '1', '11:30:00', '11:45:00', '2017-06-06 00:00:00', '1', '1', '0', '', null, '2017-06-06 23:19:42', null, '2017-06-06 23:19:42');
INSERT INTO `bus_order` VALUES ('339', '101201706060025', '0', '0', '1', '20033', '20034', '15', '金阳', '18201954319', '8.00', '8.00', '1', '11:30:00', '11:45:00', '2017-06-06 00:00:00', '1', '1', '0', '', null, '2017-06-06 23:43:42', null, '2017-06-06 23:43:42');
INSERT INTO `bus_order` VALUES ('340', '101201706060026', '0', '0', '1', '20033', '20034', '15', '金阳', '18201954319', '8.00', '8.00', '1', '11:30:00', '11:45:00', '2017-06-06 00:00:00', '1', '1', '0', '', null, '2017-06-06 23:43:53', null, '2017-06-06 23:43:53');
INSERT INTO `bus_order` VALUES ('341', '101201706060027', '0', '0', '1', '20033', '20034', '15', '金阳', '18201954319', '8.00', '8.00', '1', '11:30:00', '11:45:00', '2017-06-06 00:00:00', '1', '1', '0', '', null, '2017-06-06 23:43:59', null, '2017-06-06 23:43:59');
INSERT INTO `bus_order` VALUES ('342', '101201706060028', '0', '0', '1', '20033', '20034', '15', '金阳', '18201954319', '8.00', '8.00', '1', '11:30:00', '11:45:00', '2017-06-06 00:00:00', '1', '1', '0', '', null, '2017-06-06 23:47:54', null, '2017-06-06 23:47:54');
INSERT INTO `bus_order` VALUES ('343', '101201706060029', '0', '0', '1', '20033', '20034', '15', '金阳', '18201954319', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-06 23:56:26', null, '2017-06-06 23:56:26');
INSERT INTO `bus_order` VALUES ('344', '101201706060030', '0', '0', '1', '20033', '20034', '15', '金阳', '18201954319', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-06 23:56:48', null, '2017-06-06 23:56:48');
INSERT INTO `bus_order` VALUES ('345', '101201706070001', '0', '0', '1', '20033', '20034', '15', '金阳', '18201954319', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 00:06:45', null, '2017-06-07 00:06:45');
INSERT INTO `bus_order` VALUES ('346', '101201706070002', '0', '0', '1', '20033', '20034', '15', '金阳', '18201954319', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 00:06:59', null, '2017-06-07 00:06:59');
INSERT INTO `bus_order` VALUES ('347', '101201706070003', '0', '0', '1', '20033', '20034', '15', '金阳', '18201954319', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 00:07:07', null, '2017-06-07 00:07:07');
INSERT INTO `bus_order` VALUES ('348', '101201706070004', '0', '0', '1', '20033', '20034', '15', '金阳', '18201954319', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 00:07:12', null, '2017-06-07 00:07:12');
INSERT INTO `bus_order` VALUES ('349', '101201706070005', '0', '0', '1', '20033', '20034', '15', '金阳', '18201954319', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 00:07:32', null, '2017-06-07 00:07:32');
INSERT INTO `bus_order` VALUES ('350', '101201706070006', '0', '0', '1', '20033', '20034', '15', '金阳', '18201954319', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 00:08:16', null, '2017-06-07 00:08:16');
INSERT INTO `bus_order` VALUES ('351', '101201706070007', '0', '0', '1', '20033', '20034', '15', '金阳', '18201954319', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 00:08:54', null, '2017-06-07 00:08:54');
INSERT INTO `bus_order` VALUES ('352', '101201706070008', '0', '0', '1', '20039', '20034', '15', 'h h', '13127756590', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 00:10:41', null, '2017-06-07 00:10:41');
INSERT INTO `bus_order` VALUES ('353', '101201706070009', '0', '0', '1', '20039', '20034', '15', 'h h', '13127756590', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 00:12:07', null, '2017-06-07 00:12:07');
INSERT INTO `bus_order` VALUES ('354', '101201706070010', '0', '0', '1', '20039', '20034', '15', 'h h', '13127756590', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 00:12:38', null, '2017-06-07 00:12:38');
INSERT INTO `bus_order` VALUES ('355', '101201706070011', '0', '0', '1', '20039', '20034', '15', 'h h', '13127756590', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 00:12:42', null, '2017-06-07 00:12:42');
INSERT INTO `bus_order` VALUES ('356', '101201706070012', '0', '0', '1', '20039', '20034', '15', 'h h', '13127756590', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 00:13:19', null, '2017-06-07 00:13:19');
INSERT INTO `bus_order` VALUES ('357', '101201706070013', '0', '0', '1', '20039', '20034', '15', 'h h', '13127756590', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 00:16:22', null, '2017-06-07 00:16:22');
INSERT INTO `bus_order` VALUES ('358', '101201706070014', '0', '0', '1', '20039', '20034', '15', 'h h', '13127756590', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 00:18:02', null, '2017-06-07 00:18:02');
INSERT INTO `bus_order` VALUES ('359', '101201706070015', '0', '0', '1', '20039', '20034', '15', 'h h', '13127756590', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 00:19:55', null, '2017-06-07 00:19:55');
INSERT INTO `bus_order` VALUES ('360', '101201706070016', '0', '0', '1', '20039', '20034', '15', 'h h', '13127756590', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 00:20:10', null, '2017-06-07 00:20:10');
INSERT INTO `bus_order` VALUES ('361', '101201706070017', '0', '0', '1', '20039', '20034', '15', 'h h', '13127756590', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 00:27:57', null, '2017-06-07 00:27:57');
INSERT INTO `bus_order` VALUES ('362', '101201706070018', '0', '0', '1', '20039', '20034', '15', 'h h', '13127756590', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 09:44:36', null, '2017-06-07 09:44:36');
INSERT INTO `bus_order` VALUES ('363', '101201706070019', '0', '0', '1', '20039', '20034', '15', 'h h', '13127756590', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 09:49:39', null, '2017-06-07 09:49:39');
INSERT INTO `bus_order` VALUES ('364', '101201706070020', '0', '0', '1', '20039', '20034', '15', 'h h', '13127756590', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 09:57:29', null, '2017-06-07 09:57:29');
INSERT INTO `bus_order` VALUES ('365', '101201706070021', '0', '0', '1', '20039', '20034', '15', 'h h', '13127756590', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 10:41:26', null, '2017-06-07 10:41:26');
INSERT INTO `bus_order` VALUES ('366', '101201706070022', '0', '0', '1', '20039', '20034', '15', 'h h', '13127756590', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 10:45:02', null, '2017-06-07 10:45:02');
INSERT INTO `bus_order` VALUES ('367', '101201706070023', '0', '0', '1', '20039', '20034', '15', 'h h', '13127756590', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 10:53:56', null, '2017-06-07 10:53:56');
INSERT INTO `bus_order` VALUES ('368', '101201706070024', '0', '0', '1', '20039', '20034', '15', 'h h', '13127756590', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 10:57:18', null, '2017-06-07 10:57:18');
INSERT INTO `bus_order` VALUES ('369', '101201706070025', '0', '0', '1', '20039', '20034', '15', 'h h', '13127756590', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 10:59:01', null, '2017-06-07 10:59:01');
INSERT INTO `bus_order` VALUES ('370', '101201706070026', '0', '0', '1', '20039', '20034', '15', 'h h', '13127756590', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 10:59:39', null, '2017-06-07 10:59:39');
INSERT INTO `bus_order` VALUES ('371', '101201706070027', '0', '0', '1', '20039', '20034', '15', 'h h', '13127756590', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 11:11:48', null, '2017-06-07 11:11:48');
INSERT INTO `bus_order` VALUES ('372', '101201706070028', '0', '0', '1', '20039', '20034', '15', 'h h', '13127756590', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 11:16:57', null, '2017-06-07 11:16:57');
INSERT INTO `bus_order` VALUES ('373', '101201706070029', '0', '0', '1', '20039', '20034', '15', 'h h', '13127756590', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 12:30:10', null, '2017-06-07 12:30:10');
INSERT INTO `bus_order` VALUES ('374', '101201706070030', '0', '0', '1', '20039', '20034', '15', 'h h', '13127756590', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 12:31:20', null, '2017-06-07 12:31:20');
INSERT INTO `bus_order` VALUES ('375', '101201706070031', '0', '0', '1', '20039', '20034', '15', 'h h', '13127756590', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 12:33:46', null, '2017-06-07 12:33:46');
INSERT INTO `bus_order` VALUES ('376', '101201706070032', '0', '0', '1', '20039', '20034', '15', 'h h', '13127756590', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 12:33:56', null, '2017-06-07 12:33:56');
INSERT INTO `bus_order` VALUES ('377', '101201706070033', '0', '0', '1', '20039', '20034', '15', 'h h', '13127756590', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 12:34:45', null, '2017-06-07 12:34:45');
INSERT INTO `bus_order` VALUES ('378', '101201706070034', '0', '0', '1', '20039', '20034', '15', 'h h', '13127756590', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 12:37:42', null, '2017-06-07 12:37:42');
INSERT INTO `bus_order` VALUES ('379', '101201706070035', '0', '0', '1', '20039', '20034', '15', 'h h', '13127756590', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 12:37:57', null, '2017-06-07 12:37:57');
INSERT INTO `bus_order` VALUES ('380', '101201706070036', '0', '0', '1', '20039', '20034', '15', 'h h', '13127756590', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 12:52:38', null, '2017-06-07 12:52:38');
INSERT INTO `bus_order` VALUES ('381', '101201706070037', '0', '0', '1', '20039', '20034', '15', 'h h', '13127756590', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 12:54:00', null, '2017-06-07 12:54:00');
INSERT INTO `bus_order` VALUES ('382', '101201706070038', '1', '1', '1', '20039', '20034', '15', 'h h', '13127756590', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 17:14:06', null, '2017-06-07 17:14:15');
INSERT INTO `bus_order` VALUES ('383', '101201706070039', '0', '0', '1', '20039', '20034', '15', 'h h', '13127756590', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 18:35:33', null, '2017-06-07 18:35:33');
INSERT INTO `bus_order` VALUES ('384', '101201706070040', '1', '1', '1', '20039', '20034', '15', 'h h', '13127756590', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 18:42:14', null, '2017-06-07 18:42:40');
INSERT INTO `bus_order` VALUES ('385', '101201706070041', '0', '0', '1', '20040', '20034', '15', '均价', '13127756576', '13.00', '13.00', '1', '11:30:00', '11:45:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 18:43:11', null, '2017-06-07 18:43:11');
INSERT INTO `bus_order` VALUES ('386', '102201706070001', '0', '0', '1', '20040', '20034', '16', '均价', '13127756576', '13.00', '13.00', '1', '12:30:00', '12:50:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 18:44:33', null, '2017-06-07 18:44:33');
INSERT INTO `bus_order` VALUES ('387', '102201706070002', '0', '0', '1', '20041', '20034', '16', '你姐姐', '13127756575', '13.00', '13.00', '1', '12:30:00', '12:50:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 18:45:07', null, '2017-06-07 18:45:07');
INSERT INTO `bus_order` VALUES ('388', '102201706070003', '0', '0', '1', '20042', '20034', '16', '快捷键', '18201954310', '13.00', '13.00', '1', '12:30:00', '12:50:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 19:08:06', null, '2017-06-07 19:08:06');
INSERT INTO `bus_order` VALUES ('389', '102201706070004', '0', '0', '1', '20042', '20034', '16', '看看看', '18201954310', '13.00', '13.00', '1', '12:30:00', '12:50:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 20:41:45', null, '2017-06-07 20:41:45');
INSERT INTO `bus_order` VALUES ('390', '102201706070005', '1', '1', '1', '20042', '20034', '16', '哥哥', '18201954310', '13.00', '13.00', '1', '12:30:00', '12:50:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 20:43:25', null, '2017-06-07 20:43:40');
INSERT INTO `bus_order` VALUES ('391', '102201706070006', '0', '0', '1', '20043', '20034', '16', 'Hhq', '18201954312', '13.00', '13.00', '1', '12:30:00', '12:50:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 20:44:22', null, '2017-06-07 20:44:22');
INSERT INTO `bus_order` VALUES ('392', '102201706070007', '0', '0', '1', '20045', '20034', '16', '就', '18201956789', '13.00', '13.00', '1', '12:30:00', '12:50:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 21:25:53', null, '2017-06-07 21:25:53');
INSERT INTO `bus_order` VALUES ('393', '102201706070008', '0', '0', '1', '20050', '20034', '16', 'j j', '18201967567', '13.00', '13.00', '1', '12:30:00', '12:50:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 21:45:56', null, '2017-06-07 21:45:56');
INSERT INTO `bus_order` VALUES ('394', '102201706070009', '0', '0', '1', '20050', '20034', '16', 'j j', '18201967567', '13.00', '13.00', '1', '12:30:00', '12:50:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 21:46:12', null, '2017-06-07 21:46:12');
INSERT INTO `bus_order` VALUES ('395', '102201706070010', '0', '0', '1', '20051', '20034', '16', 'n j', '1820197657', '13.00', '13.00', '1', '12:30:00', '12:50:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 21:49:14', null, '2017-06-07 21:49:14');
INSERT INTO `bus_order` VALUES ('396', '102201706070011', '0', '0', '1', '20052', '20034', '16', 'n n', '18209766788', '13.00', '13.00', '1', '12:30:00', '12:50:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 22:05:47', null, '2017-06-07 22:05:47');
INSERT INTO `bus_order` VALUES ('397', '102201706070012', '0', '0', '1', '20052', '20034', '16', 'co o d', '18209766788', '13.00', '13.00', '1', '12:30:00', '12:50:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 22:07:36', null, '2017-06-07 22:07:36');
INSERT INTO `bus_order` VALUES ('398', '102201706070013', '1', '1', '1', '20054', '20034', '16', 'x d', '1820197646', '13.00', '13.00', '1', '12:30:00', '12:50:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 22:10:58', null, '2017-06-07 22:11:14');
INSERT INTO `bus_order` VALUES ('399', '102201706070014', '1', '1', '1', '20054', '20034', '16', 'k k k', '1820197646', '61.00', '61.00', '1', '12:30:00', '12:50:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 22:14:08', null, '2017-06-07 22:14:16');
INSERT INTO `bus_order` VALUES ('400', '102201706070015', '1', '1', '1', '20028', '20034', '16', '熊伟', '18501754312', '65.00', '65.00', '1', '12:30:00', '12:50:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 23:25:57', null, '2017-06-07 23:26:10');
INSERT INTO `bus_order` VALUES ('401', '102201706070016', '1', '1', '1', '20055', '20034', '16', '大哥大', '18501754313', '65.00', '65.00', '1', '12:30:00', '12:50:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 23:27:34', null, '2017-06-07 23:27:40');
INSERT INTO `bus_order` VALUES ('402', '102201706070017', '1', '1', '1', '20055', '20034', '16', '大疙瘩', '18501754313', '200.00', '195.00', '1', '12:30:00', '12:50:00', '2017-06-07 00:00:00', '1', '1', '0', '', null, '2017-06-07 23:28:33', null, '2017-06-07 23:28:44');
INSERT INTO `bus_order` VALUES ('403', '102201706080001', '1', '1', '1', '20054', '20034', '16', 'l l', '1820197646', '8.00', '8.00', '1', '12:30:00', '12:50:00', '2017-06-08 00:00:00', '1', '1', '0', '', null, '2017-06-08 00:22:44', null, '2017-06-08 00:22:49');
INSERT INTO `bus_order` VALUES ('404', '102201706080002', '1', '1', '1', '20056', '20034', '16', 'o o l', '19877787788', '61.00', '61.00', '1', '12:30:00', '12:50:00', '2017-06-08 00:00:00', '1', '1', '0', '', null, '2017-06-08 00:23:49', null, '2017-06-08 00:23:53');
INSERT INTO `bus_order` VALUES ('405', '102201706080003', '1', '1', '1', '20056', '20034', '16', 'x x', '19877787788', '49.00', '49.00', '1', '12:30:00', '12:50:00', '2017-06-08 00:00:00', '1', '1', '0', '', null, '2017-06-08 07:36:48', null, '2017-06-08 07:36:55');
INSERT INTO `bus_order` VALUES ('406', '102201706120001', '0', '0', '1', '20056', '20034', '16', '阿狸', '19877787788', '37.00', '37.00', '1', '12:30:00', '12:50:00', '2017-06-12 00:00:00', '1', '1', '0', '', null, '2017-06-12 08:07:25', null, '2017-06-12 08:07:25');
INSERT INTO `bus_order` VALUES ('407', '102201706120002', '0', '0', '1', '20056', '20034', '16', '阿狸', '19877787788', '37.00', '37.00', '1', '12:30:00', '12:50:00', '2017-06-12 00:00:00', '1', '1', '0', '', null, '2017-06-12 08:07:33', null, '2017-06-12 08:07:33');
INSERT INTO `bus_order` VALUES ('408', '102201706120003', '0', '0', '1', '20056', '20034', '16', '哦哦哦', '19877787788', '37.00', '37.00', '1', '12:30:00', '12:50:00', '2017-06-12 00:00:00', '1', '1', '0', '', null, '2017-06-12 08:07:45', null, '2017-06-12 08:07:45');
INSERT INTO `bus_order` VALUES ('409', '102201706120004', '5', '1', '1', '20028', '20034', '16', '熊伟', '18501754312', '1.00', '1.00', '1', '12:30:00', '12:50:00', '2017-06-12 00:00:00', '1', '1', '0', '', null, '2017-06-12 14:21:44', null, '2017-06-12 14:21:50');
INSERT INTO `bus_order` VALUES ('410', '102201706150001', '0', '0', '1', '20028', '20034', '16', '熊伟', '18501754312', '1.00', '1.00', '1', '12:30:00', '12:50:00', '2017-06-20 00:00:00', '1', '1', '0', '', null, '2017-06-15 10:32:43', null, '2017-06-15 10:32:43');
INSERT INTO `bus_order` VALUES ('411', '102201706150002', '2', '0', '2', '20028', '20034', '16', '熊伟', '18501754312', '1.00', '1.00', '1', '12:30:00', '12:50:00', '2017-06-20 00:00:00', '1', '1', '0', '', null, '2017-06-15 10:32:54', null, '2017-06-15 10:32:54');
INSERT INTO `bus_order` VALUES ('412', '102201706150003', '1', '0', '2', '20028', '20034', '16', '熊伟', '18501754312', '60.00', '60.00', '1', '12:30:00', '12:50:00', '2017-06-15 00:00:00', '1', '1', '0', '', null, '2017-06-15 10:33:38', null, '2017-06-15 10:33:38');
INSERT INTO `bus_order` VALUES ('413', '102201706150004', '1', '0', '2', '20028', '20034', '16', '熊伟', '18501754312', '400.00', '395.00', '1', '17:40:00', '18:00:00', '2017-06-23 00:00:00', '1', '2', '0', '', null, '2017-06-15 10:34:22', null, '2017-06-15 10:34:22');
INSERT INTO `bus_order` VALUES ('414', '102201706150005', '1', '0', '2', '20028', '20034', '16', '熊伟', '18501754312', '84.00', '84.00', '1', '17:40:00', '18:00:00', '2017-06-23 00:00:00', '1', '2', '0', '', null, '2017-06-15 10:34:35', null, '2017-06-15 10:34:35');
INSERT INTO `bus_order` VALUES ('415', '102201706150006', '2', '0', '2', '20028', '20034', '16', '熊伟', '18501754312', '70.00', '70.00', '1', '12:30:00', '12:50:00', '2017-06-23 00:00:00', '1', '1', '0', '', null, '2017-06-15 10:57:04', null, '2017-06-15 10:57:04');
INSERT INTO `bus_order` VALUES ('416', '102201706150007', '1', '0', '2', '20033', '20034', '16', '金阳', '18201954319', '13.00', '13.00', '1', '12:30:00', '12:50:00', '2017-06-15 00:00:00', '1', '1', '0', '', null, '2017-06-15 00:23:44', null, '2017-06-15 00:23:44');
INSERT INTO `bus_order` VALUES ('417', '102201706150008', '1', '0', '2', '20033', '20034', '16', '金阳', '18201954319', '13.00', '13.00', '1', '12:30:00', '12:50:00', '2017-06-16 00:00:00', '1', '1', '0', '', null, '2017-06-15 06:03:44', null, '2017-06-15 06:03:44');

-- ----------------------------
-- Table structure for `bus_order_discount`
-- ----------------------------
DROP TABLE IF EXISTS `bus_order_discount`;
CREATE TABLE `bus_order_discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `discount_id` int(11) NOT NULL,
  `discount_name` varchar(50) DEFAULT NULL,
  `discount_desc` char(10) DEFAULT NULL,
  `discount_amount` decimal(10,2) DEFAULT '0.00',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_order_discount
-- ----------------------------
INSERT INTO `bus_order_discount` VALUES ('22', '143', '2', '满100减5', '满100减5\n', '0.00', '1', '满100减5', null, '2017-05-16 10:02:59', null, null);
INSERT INTO `bus_order_discount` VALUES ('23', '179', '3', '满250送美女', '满250送美女\n', '0.00', '1', '满250送美女', null, '2017-05-25 20:04:01', null, null);
INSERT INTO `bus_order_discount` VALUES ('24', '180', '2', '满100减5', '满100减5\n', '0.00', '1', '满100减5', null, '2017-05-25 20:06:22', null, null);
INSERT INTO `bus_order_discount` VALUES ('25', '181', '2', '满100减5', '满100减5\n', '0.00', '1', '满100减5', null, '2017-05-25 20:07:07', null, null);
INSERT INTO `bus_order_discount` VALUES ('26', '182', '2', '满100减5', '满100减5\n', '0.00', '1', '满100减5', null, '2017-05-25 20:13:08', null, null);
INSERT INTO `bus_order_discount` VALUES ('27', '183', '2', '满100减5', '满100减5\n', '0.00', '0', '满100减5', null, '2017-05-25 20:18:00', null, null);
INSERT INTO `bus_order_discount` VALUES ('28', '184', '2', '满100减5', '满100减5\n', '0.00', '0', '满100减5', null, '2017-05-25 20:18:31', null, null);
INSERT INTO `bus_order_discount` VALUES ('29', '185', '2', '满100减5', '满100减5\n', '0.00', '0', '满100减5', null, '2017-05-25 20:21:48', null, null);
INSERT INTO `bus_order_discount` VALUES ('30', '186', '3', '满250送美女', '满250送美女\n', '0.00', '0', '满250送美女', null, '2017-05-25 20:24:06', null, null);
INSERT INTO `bus_order_discount` VALUES ('31', '187', '2', '满100减5', '满100减5\n', '0.00', '0', '满100减5', null, '2017-05-25 21:44:14', null, null);
INSERT INTO `bus_order_discount` VALUES ('32', '188', '2', '满100减5', '满100减5\n', '0.00', '0', '满100减5', null, '2017-05-25 22:28:15', null, null);
INSERT INTO `bus_order_discount` VALUES ('33', '189', '2', '满100减5', '满100减5\n', '0.00', '0', '满100减5', null, '2017-05-25 22:28:57', null, null);
INSERT INTO `bus_order_discount` VALUES ('34', '190', '2', '满100减5', '满100减5\n', '0.00', '0', '满100减5', null, '2017-05-25 22:30:39', null, null);
INSERT INTO `bus_order_discount` VALUES ('35', '191', '2', '满100减5', '满100减5\n', '0.00', '0', '满100减5', null, '2017-05-25 22:47:14', null, null);
INSERT INTO `bus_order_discount` VALUES ('36', '200', '2', '满100减5', '满100减5\n', '0.00', '1', '满100减5', null, '2017-05-26 16:02:51', null, null);
INSERT INTO `bus_order_discount` VALUES ('37', '201', '2', '满100减5', '满100减5\n', '0.00', '1', '满100减5', null, '2017-05-26 16:08:22', null, null);
INSERT INTO `bus_order_discount` VALUES ('38', '202', '2', '满100减5', '满100减5\n', '0.00', '1', '满100减5', null, '2017-05-26 16:09:44', null, null);
INSERT INTO `bus_order_discount` VALUES ('39', '203', '3', '满250送美女', '满250送美女\n', '0.00', '1', '满250送美女', null, '2017-05-26 16:14:12', null, null);
INSERT INTO `bus_order_discount` VALUES ('40', '205', '3', '满250送美女', '满250送美女\n', '0.00', '1', '满250送美女', null, '2017-05-26 17:13:51', null, null);
INSERT INTO `bus_order_discount` VALUES ('41', '206', '3', '满250送美女', '满250送美女\n', '0.00', '1', '满250送美女', null, '2017-05-26 17:30:37', null, null);
INSERT INTO `bus_order_discount` VALUES ('42', '207', '2', '满100减5', '满100减5\n', '0.00', '1', '满100减5', null, '2017-05-26 17:38:41', null, null);
INSERT INTO `bus_order_discount` VALUES ('43', '208', '2', '满100减5', '满100减5\n', '0.00', '1', '满100减5', null, '2017-05-26 17:44:31', null, null);
INSERT INTO `bus_order_discount` VALUES ('44', '209', '2', '满100减5', '满100减5\n', '0.00', '1', '满100减5', null, '2017-05-26 22:28:36', null, null);
INSERT INTO `bus_order_discount` VALUES ('45', '210', '2', '满100减5', '满100减5\n', '0.00', '1', '满100减5', null, '2017-05-26 22:28:40', null, null);
INSERT INTO `bus_order_discount` VALUES ('46', '213', '2', '满100减5', '满100减5\n', '5.00', '1', '满100减5', null, '2017-05-27 17:00:55', null, null);
INSERT INTO `bus_order_discount` VALUES ('47', '214', '2', '满100减5', '满100减5\n', '5.00', '1', '满100减5', null, '2017-05-27 17:14:52', null, null);
INSERT INTO `bus_order_discount` VALUES ('48', '215', '2', '满100减5', '满100减5\n', '5.00', '1', '满100减5', null, '2017-05-27 17:17:21', null, null);
INSERT INTO `bus_order_discount` VALUES ('49', '216', '2', '满100减5', '满100减5\n', '5.00', '1', '满100减5', null, '2017-05-27 17:21:16', null, null);
INSERT INTO `bus_order_discount` VALUES ('50', '218', '2', '满100减5', '满100减5\n', '5.00', '1', '满100减5', null, '2017-05-27 17:43:25', null, null);
INSERT INTO `bus_order_discount` VALUES ('51', '219', '2', '满100减5', '满100减5\n', '5.00', '1', '满100减5', null, '2017-05-27 17:43:29', null, null);
INSERT INTO `bus_order_discount` VALUES ('52', '220', '2', '满100减5', '满100减5\n', '5.00', '1', '满100减5', null, '2017-05-27 17:44:41', null, null);
INSERT INTO `bus_order_discount` VALUES ('53', '221', '2', '满100减5', '满100减5\n', '5.00', '1', '满100减5', null, '2017-05-27 17:44:45', null, null);
INSERT INTO `bus_order_discount` VALUES ('54', '224', '3', '满250送美女', '满250送美女\n', '0.00', '0', '满250送美女', null, '2017-05-27 22:20:48', null, null);
INSERT INTO `bus_order_discount` VALUES ('55', '225', '2', '满100减5', '满100减5\n', '5.00', '0', '满100减5', null, '2017-05-27 22:21:35', null, null);
INSERT INTO `bus_order_discount` VALUES ('56', '226', '2', '满100减5', '满100减5\n', '5.00', '0', '满100减5', null, '2017-05-27 23:16:07', null, null);
INSERT INTO `bus_order_discount` VALUES ('57', '227', '2', '满100减5', '满100减5\n', '5.00', '0', '满100减5', null, '2017-05-30 18:48:53', null, null);
INSERT INTO `bus_order_discount` VALUES ('58', '228', '3', '满250送美女', '满250送美女\n', '0.00', '1', '满250送美女', null, '2017-05-31 18:01:22', null, null);
INSERT INTO `bus_order_discount` VALUES ('59', '230', '3', '满250送美女', '满250送美女\n', '0.00', '0', '满250送美女', null, '2017-05-31 20:22:17', null, null);
INSERT INTO `bus_order_discount` VALUES ('60', '231', '2', '满100减5', '满100减5\n', '5.00', '0', '满100减5', null, '2017-05-31 20:31:52', null, null);
INSERT INTO `bus_order_discount` VALUES ('61', '232', '3', '满250送美女', '满250送美女\n', '0.00', '0', '满250送美女', null, '2017-05-31 20:36:58', null, null);
INSERT INTO `bus_order_discount` VALUES ('62', '233', '2', '满100减5', '满100减5\n', '5.00', '0', '满100减5', null, '2017-05-31 20:37:54', null, null);
INSERT INTO `bus_order_discount` VALUES ('63', '234', '3', '满250送美女', '满250送美女\n', '0.00', '0', '满250送美女', null, '2017-05-31 20:38:57', null, null);
INSERT INTO `bus_order_discount` VALUES ('64', '235', '3', '满250送美女', '满250送美女\n', '0.00', '0', '满250送美女', null, '2017-05-31 20:42:25', null, null);
INSERT INTO `bus_order_discount` VALUES ('65', '236', '3', '满250送美女', '满250送美女\n', '0.00', '0', '满250送美女', null, '2017-05-31 20:45:20', null, null);
INSERT INTO `bus_order_discount` VALUES ('66', '237', '3', '满250送美女', '满250送美女\n', '0.00', '0', '满250送美女', null, '2017-05-31 20:48:29', null, null);
INSERT INTO `bus_order_discount` VALUES ('67', '238', '2', '满100减5', '满100减5\n', '5.00', '0', '满100减5', null, '2017-05-31 20:50:13', null, null);
INSERT INTO `bus_order_discount` VALUES ('68', '239', '3', '满250送美女', '满250送美女\n', '0.00', '0', '满250送美女', null, '2017-05-31 20:51:02', null, null);
INSERT INTO `bus_order_discount` VALUES ('69', '240', '2', '满100减5', '满100减5\n', '5.00', '0', '满100减5', null, '2017-05-31 20:54:21', null, null);
INSERT INTO `bus_order_discount` VALUES ('70', '241', '2', '满100减5', '满100减5\n', '5.00', '1', '满100减5', null, '2017-05-31 21:01:16', null, null);
INSERT INTO `bus_order_discount` VALUES ('71', '242', '2', '满100减5', '满100减5\n', '5.00', '0', '满100减5', null, '2017-05-31 21:16:27', null, null);
INSERT INTO `bus_order_discount` VALUES ('72', '243', '2', '满100减5', '满100减5\n', '5.00', '0', '满100减5', null, '2017-05-31 21:18:30', null, null);
INSERT INTO `bus_order_discount` VALUES ('73', '244', '2', '满100减5', '满100减5\n', '5.00', '0', '满100减5', null, '2017-05-31 21:21:15', null, null);
INSERT INTO `bus_order_discount` VALUES ('74', '245', '2', '满100减5', '满100减5\n', '5.00', '0', '满100减5', null, '2017-05-31 21:24:38', null, null);
INSERT INTO `bus_order_discount` VALUES ('75', '246', '2', '满100减5', '满100减5\n', '5.00', '0', '满100减5', null, '2017-05-31 21:25:28', null, null);
INSERT INTO `bus_order_discount` VALUES ('76', '247', '2', '满100减5', '满100减5\n', '5.00', '0', '满100减5', null, '2017-05-31 21:29:15', null, null);
INSERT INTO `bus_order_discount` VALUES ('77', '248', '2', '满100减5', '满100减5\n', '5.00', '0', '满100减5', null, '2017-05-31 21:30:37', null, null);
INSERT INTO `bus_order_discount` VALUES ('78', '249', '2', '满100减5', '满100减5\n', '5.00', '1', '满100减5', null, '2017-06-01 10:34:11', null, null);
INSERT INTO `bus_order_discount` VALUES ('79', '250', '2', '满100减5', '满100减5\n', '5.00', '0', '满100减5', null, '2017-06-01 11:15:05', null, null);
INSERT INTO `bus_order_discount` VALUES ('80', '251', '2', '满100减5', '满100减5\n', '5.00', '0', '满100减5', null, '2017-06-01 11:16:38', null, null);
INSERT INTO `bus_order_discount` VALUES ('81', '253', '2', '满100减5', '满100减5\n', '5.00', '0', '满100减5', null, '2017-06-01 14:46:33', null, null);
INSERT INTO `bus_order_discount` VALUES ('82', '254', '2', '满100减5', '满100减5\n', '5.00', '1', '满100减5', null, '2017-06-01 14:47:59', null, null);
INSERT INTO `bus_order_discount` VALUES ('83', '255', '2', '满100减5', '满100减5\n', '5.00', '0', '满100减5', null, '2017-06-01 14:50:57', null, null);
INSERT INTO `bus_order_discount` VALUES ('84', '256', '2', '满100减5', '满100减5\n', '5.00', '0', '满100减5', null, '2017-06-01 14:53:09', null, null);
INSERT INTO `bus_order_discount` VALUES ('85', '257', '2', '满100减5', '满100减5\n', '5.00', '0', '满100减5', null, '2017-06-01 19:06:41', null, null);
INSERT INTO `bus_order_discount` VALUES ('86', '258', '2', '满100减5', '满100减5\n', '5.00', '0', '满100减5', null, '2017-06-01 22:53:16', null, null);
INSERT INTO `bus_order_discount` VALUES ('87', '259', '2', '满100减5', '满100减5\n', '5.00', '0', '满100减5', null, '2017-06-01 22:54:38', null, null);
INSERT INTO `bus_order_discount` VALUES ('88', '260', '2', '满100减5', '满100减5\n', '5.00', '0', '满100减5', null, '2017-06-01 23:22:09', null, null);
INSERT INTO `bus_order_discount` VALUES ('89', '261', '2', '满100减5', '满100减5\n', '5.00', '0', '满100减5', null, '2017-06-01 23:22:53', null, null);
INSERT INTO `bus_order_discount` VALUES ('90', '262', '2', '满100减5', '满100减5\n', '5.00', '0', '满100减5', null, '2017-06-01 23:23:22', null, null);
INSERT INTO `bus_order_discount` VALUES ('91', '263', '2', '满100减5', '满100减5\n', '5.00', '0', '满100减5', null, '2017-06-01 23:24:27', null, null);
INSERT INTO `bus_order_discount` VALUES ('92', '264', '2', '满100减5', '满100减5\n', '5.00', '0', '满100减5', null, '2017-06-01 23:32:42', null, null);
INSERT INTO `bus_order_discount` VALUES ('93', '269', '2', '满100减5', '满100减5\n', '5.00', '0', '满100减5', null, '2017-06-02 00:03:49', null, null);
INSERT INTO `bus_order_discount` VALUES ('94', '270', '2', '满100减5', '满100减5\n', '5.00', '0', '满100减5', null, '2017-06-03 10:39:18', null, null);
INSERT INTO `bus_order_discount` VALUES ('95', '271', '2', '满100减5', '满100减5\n', '5.00', '0', '满100减5', null, '2017-06-03 11:21:50', null, null);
INSERT INTO `bus_order_discount` VALUES ('96', '272', '3', '满250送美女', '满250送美女\n', '0.00', '0', '满250送美女', null, '2017-06-03 13:06:55', null, null);
INSERT INTO `bus_order_discount` VALUES ('97', '273', '2', '满100减5', '满100减5\n', '5.00', '0', '满100减5', null, '2017-06-03 13:10:06', null, null);
INSERT INTO `bus_order_discount` VALUES ('98', '277', '2', '满100减5', '满100减5\n', '5.00', '0', '满100减5', null, '2017-06-05 09:52:39', null, null);
INSERT INTO `bus_order_discount` VALUES ('99', '402', '2', '满100减5', '满100减5\n', '5.00', '0', '满100减5', null, '2017-06-07 23:28:33', null, null);
INSERT INTO `bus_order_discount` VALUES ('100', '413', '2', '满100减5', '满100减5\n', '5.00', '0', '满100减5', null, '2017-06-15 10:34:22', null, null);

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
  `dish_name_cn` varchar(100) DEFAULT NULL,
  `dish_name_en` varchar(100) DEFAULT NULL,
  `market_id` int(11) NOT NULL,
  `market_name_cn` varchar(100) DEFAULT NULL,
  `market_name_en` varchar(100) DEFAULT NULL,
  `order_status` int(11) NOT NULL DEFAULT '0',
  `is_delete` int(11) NOT NULL DEFAULT '2',
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=597 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_order_dish
-- ----------------------------
INSERT INTO `bus_order_dish` VALUES ('186', '120', '5', '11.00', '11.00', '11.00', '11.00', '1', null, '香辣鸡腿堡', '香辣鸡腿堡', '3', '肯德基', 'KFC', '1', '1', null, null, '2017-05-09 18:49:12', null, '2017-05-09 18:49:12');
INSERT INTO `bus_order_dish` VALUES ('187', '120', '10', '1.00', '1.00', '1.00', '1.00', '1', null, '黄金鸡块5块装', '黄金鸡块5块装', '3', '肯德基', 'KFC', '1', '1', null, null, '2017-05-09 18:49:12', null, '2017-05-09 18:49:12');
INSERT INTO `bus_order_dish` VALUES ('188', '121', '5', '33.00', '33.00', '11.00', '11.00', '3', null, '香辣鸡腿堡', '香辣鸡腿堡', '3', '肯德基', 'KFC', '1', '0', null, null, '2017-05-09 18:50:25', null, '2017-05-09 18:50:25');
INSERT INTO `bus_order_dish` VALUES ('189', '121', '10', '3.00', '3.00', '1.00', '1.00', '3', null, '黄金鸡块5块装', '黄金鸡块5块装', '3', '肯德基', 'KFC', '1', '0', null, null, '2017-05-09 18:50:25', null, '2017-05-09 18:50:25');
INSERT INTO `bus_order_dish` VALUES ('190', '122', '15', '24.00', '24.00', '8.00', '8.00', '3', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-09 18:52:31', null, '2017-05-09 18:52:31');
INSERT INTO `bus_order_dish` VALUES ('191', '122', '16', '24.00', '24.00', '12.00', '12.00', '2', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-09 18:52:31', null, '2017-05-09 18:52:31');
INSERT INTO `bus_order_dish` VALUES ('192', '123', '15', '32.00', '32.00', '8.00', '8.00', '4', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-10 23:23:34', null, '2017-05-10 23:23:34');
INSERT INTO `bus_order_dish` VALUES ('193', '123', '16', '48.00', '48.00', '12.00', '12.00', '4', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-10 23:23:34', null, '2017-05-10 23:23:34');
INSERT INTO `bus_order_dish` VALUES ('194', '124', '15', '40.00', '40.00', '8.00', '8.00', '5', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-10 23:27:09', null, '2017-05-10 23:27:09');
INSERT INTO `bus_order_dish` VALUES ('195', '125', '15', '40.00', '40.00', '8.00', '8.00', '5', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-10 23:27:16', null, '2017-05-10 23:27:16');
INSERT INTO `bus_order_dish` VALUES ('196', '126', '16', '48.00', '48.00', '12.00', '12.00', '4', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-10 23:27:25', null, '2017-05-10 23:27:25');
INSERT INTO `bus_order_dish` VALUES ('197', '126', '15', '32.00', '32.00', '8.00', '8.00', '4', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-10 23:27:25', null, '2017-05-10 23:27:25');
INSERT INTO `bus_order_dish` VALUES ('198', '127', '15', '24.00', '24.00', '8.00', '8.00', '3', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-10 23:27:37', null, '2017-05-10 23:27:37');
INSERT INTO `bus_order_dish` VALUES ('199', '128', '16', '36.00', '36.00', '12.00', '12.00', '3', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-10 23:27:48', null, '2017-05-10 23:27:48');
INSERT INTO `bus_order_dish` VALUES ('200', '129', '15', '24.00', '24.00', '8.00', '8.00', '3', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-14 21:25:00', null, '2017-05-14 21:25:00');
INSERT INTO `bus_order_dish` VALUES ('201', '130', '15', '40.00', '40.00', '8.00', '8.00', '5', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-14 21:25:15', null, '2017-05-14 21:25:15');
INSERT INTO `bus_order_dish` VALUES ('202', '130', '16', '48.00', '48.00', '12.00', '12.00', '4', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-14 21:25:15', null, '2017-05-14 21:25:15');
INSERT INTO `bus_order_dish` VALUES ('203', '131', '15', '48.00', '48.00', '8.00', '8.00', '6', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-14 21:30:31', null, '2017-05-14 21:30:31');
INSERT INTO `bus_order_dish` VALUES ('204', '131', '16', '12.00', '12.00', '12.00', '12.00', '1', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-14 21:30:31', null, '2017-05-14 21:30:31');
INSERT INTO `bus_order_dish` VALUES ('205', '132', '16', '60.00', '60.00', '12.00', '12.00', '5', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-14 21:30:43', null, '2017-05-14 21:30:43');
INSERT INTO `bus_order_dish` VALUES ('206', '132', '15', '24.00', '24.00', '8.00', '8.00', '3', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-14 21:30:43', null, '2017-05-14 21:30:43');
INSERT INTO `bus_order_dish` VALUES ('207', '133', '15', '24.00', '24.00', '8.00', '8.00', '3', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-14 21:31:59', null, '2017-05-14 21:31:59');
INSERT INTO `bus_order_dish` VALUES ('208', '133', '16', '36.00', '36.00', '12.00', '12.00', '3', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-14 21:31:59', null, '2017-05-14 21:31:59');
INSERT INTO `bus_order_dish` VALUES ('209', '134', '15', '24.00', '24.00', '8.00', '8.00', '3', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-14 21:33:41', null, '2017-05-14 21:33:41');
INSERT INTO `bus_order_dish` VALUES ('210', '134', '16', '36.00', '36.00', '12.00', '12.00', '3', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-14 21:33:41', null, '2017-05-14 21:33:41');
INSERT INTO `bus_order_dish` VALUES ('211', '135', '15', '16.00', '16.00', '8.00', '8.00', '2', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-14 21:39:43', null, '2017-05-14 21:39:43');
INSERT INTO `bus_order_dish` VALUES ('212', '135', '16', '24.00', '24.00', '12.00', '12.00', '2', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-14 21:39:43', null, '2017-05-14 21:39:43');
INSERT INTO `bus_order_dish` VALUES ('213', '136', '17', '84.00', '84.00', '21.00', '21.00', '4', null, '米夫子蒸排骨', 'rib', '6', '湘水山庄', 'Hunan Manor', '1', '0', null, null, '2017-05-15 10:13:15', null, '2017-05-15 10:13:15');
INSERT INTO `bus_order_dish` VALUES ('214', '137', '15', '16.00', '16.00', '8.00', '8.00', '2', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-15 10:23:50', null, '2017-05-15 10:23:50');
INSERT INTO `bus_order_dish` VALUES ('215', '137', '16', '36.00', '36.00', '12.00', '12.00', '3', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-15 10:23:50', null, '2017-05-15 10:23:50');
INSERT INTO `bus_order_dish` VALUES ('216', '138', '15', '32.00', '32.00', '8.00', '8.00', '4', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-15 13:34:57', null, '2017-05-15 13:34:57');
INSERT INTO `bus_order_dish` VALUES ('217', '138', '16', '48.00', '48.00', '12.00', '12.00', '4', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-15 13:34:57', null, '2017-05-15 13:34:57');
INSERT INTO `bus_order_dish` VALUES ('218', '138', '17', '441.00', '441.00', '21.00', '21.00', '21', null, '米夫子蒸排骨', 'rib', '6', '湘水山庄', 'Hunan Manor', '1', '0', null, null, '2017-05-15 13:34:57', null, '2017-05-15 13:34:57');
INSERT INTO `bus_order_dish` VALUES ('219', '139', '15', '24.00', '24.00', '8.00', '8.00', '3', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-16 00:22:58', null, '2017-05-16 00:22:58');
INSERT INTO `bus_order_dish` VALUES ('220', '139', '16', '24.00', '24.00', '12.00', '12.00', '2', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-16 00:22:58', null, '2017-05-16 00:22:58');
INSERT INTO `bus_order_dish` VALUES ('221', '140', '15', '24.00', '24.00', '8.00', '8.00', '3', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-16 10:02:33', null, '2017-05-16 10:02:33');
INSERT INTO `bus_order_dish` VALUES ('222', '140', '16', '24.00', '24.00', '12.00', '12.00', '2', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-16 10:02:33', null, '2017-05-16 10:02:33');
INSERT INTO `bus_order_dish` VALUES ('223', '141', '17', '84.00', '84.00', '21.00', '21.00', '4', null, '米夫子蒸排骨', 'rib', '6', '湘水山庄', 'Hunan Manor', '1', '0', null, null, '2017-05-16 10:02:41', null, '2017-05-16 10:02:41');
INSERT INTO `bus_order_dish` VALUES ('224', '142', '16', '36.00', '36.00', '12.00', '12.00', '3', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-16 10:02:51', null, '2017-05-16 10:02:51');
INSERT INTO `bus_order_dish` VALUES ('225', '143', '17', '126.00', '126.00', '21.00', '21.00', '6', null, '米夫子蒸排骨', 'rib', '6', '湘水山庄', 'Hunan Manor', '1', '1', null, null, '2017-05-16 10:02:59', null, '2017-05-16 10:02:59');
INSERT INTO `bus_order_dish` VALUES ('226', '144', '16', '36.00', '36.00', '12.00', '12.00', '3', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-16 15:23:42', null, '2017-05-16 15:23:42');
INSERT INTO `bus_order_dish` VALUES ('227', '145', '17', '42.00', '42.00', '21.00', '21.00', '2', null, '米夫子蒸排骨', 'rib', '6', '湘水山庄', 'Hunan Manor', '1', '0', null, null, '2017-05-16 15:23:55', null, '2017-05-16 15:23:55');
INSERT INTO `bus_order_dish` VALUES ('228', '146', '17', '42.00', '42.00', '21.00', '21.00', '2', null, '米夫子蒸排骨', 'rib', '6', '湘水山庄', 'Hunan Manor', '1', '0', null, null, '2017-05-16 15:25:43', null, '2017-05-16 15:25:43');
INSERT INTO `bus_order_dish` VALUES ('229', '147', '17', '63.00', '63.00', '21.00', '21.00', '3', null, '米夫子蒸排骨', 'rib', '6', '湘水山庄', 'Hunan Manor', '1', '0', null, null, '2017-05-16 15:25:52', null, '2017-05-16 15:25:52');
INSERT INTO `bus_order_dish` VALUES ('230', '148', '17', '63.00', '63.00', '21.00', '21.00', '3', null, '米夫子蒸排骨', 'rib', '6', '湘水山庄', 'Hunan Manor', '1', '0', null, null, '2017-05-16 15:26:30', null, '2017-05-16 15:26:30');
INSERT INTO `bus_order_dish` VALUES ('231', '149', '17', '63.00', '63.00', '21.00', '21.00', '3', null, '米夫子蒸排骨', 'rib', '6', '湘水山庄', 'Hunan Manor', '1', '0', null, null, '2017-05-16 15:26:58', null, '2017-05-16 15:26:58');
INSERT INTO `bus_order_dish` VALUES ('232', '150', '17', '63.00', '63.00', '21.00', '21.00', '3', null, '米夫子蒸排骨', 'rib', '6', '湘水山庄', 'Hunan Manor', '1', '0', null, null, '2017-05-16 15:30:26', null, '2017-05-16 15:30:26');
INSERT INTO `bus_order_dish` VALUES ('233', '151', '17', '21.00', '21.00', '21.00', '21.00', '1', null, '米夫子蒸排骨', 'rib', '6', '湘水山庄', 'Hunan Manor', '1', '0', null, null, '2017-05-16 15:41:10', null, '2017-05-16 15:41:10');
INSERT INTO `bus_order_dish` VALUES ('234', '152', '17', '21.00', '21.00', '21.00', '21.00', '1', null, '米夫子蒸排骨', 'rib', '6', '湘水山庄', 'Hunan Manor', '1', '0', null, null, '2017-05-16 15:41:25', null, '2017-05-16 15:41:25');
INSERT INTO `bus_order_dish` VALUES ('235', '153', '15', '16.00', '16.00', '8.00', '8.00', '2', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-16 21:49:23', null, '2017-05-16 21:49:23');
INSERT INTO `bus_order_dish` VALUES ('236', '154', '15', '16.00', '16.00', '8.00', '8.00', '2', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-16 21:49:44', null, '2017-05-16 21:49:44');
INSERT INTO `bus_order_dish` VALUES ('237', '155', '15', '16.00', '16.00', '8.00', '8.00', '2', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-16 21:51:06', null, '2017-05-16 21:51:06');
INSERT INTO `bus_order_dish` VALUES ('238', '155', '16', '24.00', '24.00', '12.00', '12.00', '2', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-16 21:51:06', null, '2017-05-16 21:51:06');
INSERT INTO `bus_order_dish` VALUES ('239', '156', '15', '8.00', '8.00', '8.00', '8.00', '1', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-16 21:52:23', null, '2017-05-16 21:52:23');
INSERT INTO `bus_order_dish` VALUES ('240', '157', '15', '8.00', '8.00', '8.00', '8.00', '1', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-16 21:53:36', null, '2017-05-16 21:53:36');
INSERT INTO `bus_order_dish` VALUES ('241', '157', '16', '12.00', '12.00', '12.00', '12.00', '1', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-16 21:53:36', null, '2017-05-16 21:53:36');
INSERT INTO `bus_order_dish` VALUES ('242', '158', '15', '16.00', '16.00', '8.00', '8.00', '2', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-16 22:00:33', null, '2017-05-16 22:00:33');
INSERT INTO `bus_order_dish` VALUES ('243', '158', '16', '24.00', '24.00', '12.00', '12.00', '2', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-16 22:00:33', null, '2017-05-16 22:00:33');
INSERT INTO `bus_order_dish` VALUES ('244', '159', '15', '8.00', '8.00', '8.00', '8.00', '1', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-16 22:04:45', null, '2017-05-16 22:04:45');
INSERT INTO `bus_order_dish` VALUES ('245', '159', '16', '12.00', '12.00', '12.00', '12.00', '1', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-16 22:04:45', null, '2017-05-16 22:04:45');
INSERT INTO `bus_order_dish` VALUES ('246', '160', '15', '8.00', '8.00', '8.00', '8.00', '1', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-17 14:58:42', null, '2017-05-17 14:58:42');
INSERT INTO `bus_order_dish` VALUES ('247', '161', '15', '8.00', '8.00', '8.00', '8.00', '1', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-17 14:58:58', null, '2017-05-17 14:58:58');
INSERT INTO `bus_order_dish` VALUES ('248', '162', '16', '12.00', '12.00', '12.00', '12.00', '1', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-17 14:59:14', null, '2017-05-17 14:59:14');
INSERT INTO `bus_order_dish` VALUES ('249', '163', '16', '24.00', '24.00', '12.00', '12.00', '2', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '4', '0', null, null, '2017-05-20 20:48:51', null, '2017-05-20 20:48:51');
INSERT INTO `bus_order_dish` VALUES ('250', '163', '15', '32.00', '32.00', '8.00', '8.00', '4', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '4', '0', null, null, '2017-05-20 20:48:51', null, '2017-05-20 20:48:51');
INSERT INTO `bus_order_dish` VALUES ('251', '164', '15', '8.00', '8.00', '8.00', '8.00', '1', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '4', '0', null, null, '2017-05-20 21:06:35', null, '2017-05-20 21:06:35');
INSERT INTO `bus_order_dish` VALUES ('252', '164', '16', '24.00', '24.00', '12.00', '12.00', '2', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '4', '0', null, null, '2017-05-20 21:06:35', null, '2017-05-20 21:06:35');
INSERT INTO `bus_order_dish` VALUES ('253', '165', '15', '8.00', '8.00', '8.00', '8.00', '1', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '4', '0', null, null, '2017-05-20 21:06:48', null, '2017-05-20 21:06:48');
INSERT INTO `bus_order_dish` VALUES ('254', '165', '16', '12.00', '12.00', '12.00', '12.00', '1', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '4', '0', null, null, '2017-05-20 21:06:48', null, '2017-05-20 21:06:48');
INSERT INTO `bus_order_dish` VALUES ('255', '166', '16', '12.00', '12.00', '12.00', '12.00', '1', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '4', '0', null, null, '2017-05-20 21:22:30', null, '2017-05-20 21:22:30');
INSERT INTO `bus_order_dish` VALUES ('256', '167', '17', '42.00', '42.00', '21.00', '21.00', '2', null, '米夫子蒸排骨', 'rib', '6', '湘水山庄', 'Hunan Manor', '4', '0', null, null, '2017-05-20 21:24:48', null, '2017-05-20 21:24:48');
INSERT INTO `bus_order_dish` VALUES ('257', '168', '16', '24.00', '24.00', '12.00', '12.00', '2', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '4', '0', null, null, '2017-05-20 21:25:00', null, '2017-05-20 21:25:00');
INSERT INTO `bus_order_dish` VALUES ('258', '169', '17', '42.00', '42.00', '21.00', '21.00', '2', null, '米夫子蒸排骨', 'rib', '6', '湘水山庄', 'Hunan Manor', '4', '0', null, null, '2017-05-20 21:25:10', null, '2017-05-20 21:25:10');
INSERT INTO `bus_order_dish` VALUES ('259', '170', '15', '8.00', '8.00', '8.00', '8.00', '1', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '4', '0', null, null, '2017-05-21 16:19:53', null, '2017-05-21 16:19:53');
INSERT INTO `bus_order_dish` VALUES ('260', '171', '15', '16.00', '16.00', '8.00', '8.00', '2', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '4', '0', null, null, '2017-05-21 21:48:33', null, '2017-05-21 21:48:33');
INSERT INTO `bus_order_dish` VALUES ('261', '171', '16', '24.00', '24.00', '12.00', '12.00', '2', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '4', '0', null, null, '2017-05-21 21:48:33', null, '2017-05-21 21:48:33');
INSERT INTO `bus_order_dish` VALUES ('262', '172', '17', '105.00', '105.00', '21.00', '21.00', '5', null, '米夫子蒸排骨', 'rib', '6', '湘水山庄', 'Hunan Manor', '1', '0', null, null, '2017-05-24 09:58:16', null, '2017-05-24 09:58:16');
INSERT INTO `bus_order_dish` VALUES ('263', '173', '17', '42.00', '42.00', '21.00', '21.00', '2', null, '米夫子蒸排骨', 'rib', '6', '湘水山庄', 'Hunan Manor', '1', '0', null, null, '2017-05-24 09:58:30', null, '2017-05-24 09:58:30');
INSERT INTO `bus_order_dish` VALUES ('264', '174', '3', '24.00', '24.00', '8.00', '8.00', '3', null, '一块吮指原味鸡', '一块吮指原味鸡', '3', '肯德基', 'KFC', '1', '0', null, null, '2017-05-24 19:46:00', null, '2017-05-24 19:46:00');
INSERT INTO `bus_order_dish` VALUES ('265', '174', '4', '34.00', '34.00', '17.00', '17.00', '2', null, '老北京鸡肉卷', '老北京鸡肉卷', '3', '肯德基', 'KFC', '1', '0', null, null, '2017-05-24 19:46:00', null, '2017-05-24 19:46:00');
INSERT INTO `bus_order_dish` VALUES ('266', '174', '5', '22.00', '22.00', '11.00', '11.00', '2', null, '香辣鸡腿堡', '香辣鸡腿堡', '3', '肯德基', 'KFC', '1', '0', null, null, '2017-05-24 19:46:00', null, '2017-05-24 19:46:00');
INSERT INTO `bus_order_dish` VALUES ('267', '175', '17', '84.00', '84.00', '21.00', '21.00', '4', null, '米夫子蒸排骨', 'rib', '6', '湘水山庄', 'Hunan Manor', '1', '0', null, null, '2017-05-24 19:46:08', null, '2017-05-24 19:46:08');
INSERT INTO `bus_order_dish` VALUES ('268', '176', '4', '17.00', '17.00', '17.00', '17.00', '1', null, '老北京鸡肉卷', '老北京鸡肉卷', '3', '肯德基', 'KFC', '1', '0', null, null, '2017-05-24 19:46:16', null, '2017-05-24 19:46:16');
INSERT INTO `bus_order_dish` VALUES ('269', '176', '5', '11.00', '11.00', '11.00', '11.00', '1', null, '香辣鸡腿堡', '香辣鸡腿堡', '3', '肯德基', 'KFC', '1', '0', null, null, '2017-05-24 19:46:16', null, '2017-05-24 19:46:16');
INSERT INTO `bus_order_dish` VALUES ('270', '177', '4', '68.00', '68.00', '17.00', '17.00', '4', null, '老北京鸡肉卷', '老北京鸡肉卷', '3', '肯德基', 'KFC', '1', '0', null, null, '2017-05-25 14:26:32', null, '2017-05-25 14:26:32');
INSERT INTO `bus_order_dish` VALUES ('271', '178', '7', '11.00', '11.00', '11.00', '11.00', '1', null, '香辣鸡腿堡', '香辣鸡腿堡', '3', '肯德基', 'KFC', '1', '1', null, null, '2017-05-25 16:57:11', null, '2017-05-25 16:57:11');
INSERT INTO `bus_order_dish` VALUES ('272', '179', '18', '164.00', '164.00', '67.00', '67.00', '2', '[{\"sizeId\":9,\"sizeName\":\"超大份\",\"sizePrice\":15}]', '三文鱼刺身', '三文鱼刺身', '8', '纱羅餐精致料理', '纱羅餐精致料理', '1', '1', null, null, '2017-05-25 20:04:01', null, '2017-05-25 20:04:01');
INSERT INTO `bus_order_dish` VALUES ('273', '179', '18', '76.00', '76.00', '67.00', '67.00', '1', '[{\"sizeId\":7,\"sizeName\":\"迷你\",\"sizePrice\":9}]', '三文鱼刺身', '三文鱼刺身', '8', '纱羅餐精致料理', '纱羅餐精致料理', '1', '1', null, null, '2017-05-25 20:04:01', null, '2017-05-25 20:04:01');
INSERT INTO `bus_order_dish` VALUES ('274', '179', '18', '91.00', '91.00', '67.00', '67.00', '1', '[{\"sizeId\":7,\"sizeName\":\"迷你\",\"sizePrice\":9},{\"sizeId\":9,\"sizeName\":\"超大份\",\"sizePrice\":15}]', '三文鱼刺身', '三文鱼刺身', '8', '纱羅餐精致料理', '纱羅餐精致料理', '1', '1', null, null, '2017-05-25 20:04:01', null, '2017-05-25 20:04:01');
INSERT INTO `bus_order_dish` VALUES ('275', '180', '18', '82.00', '82.00', '67.00', '67.00', '1', '[{\"sizeId\":9,\"sizeName\":\"超大份\",\"sizePrice\":15}]', '三文鱼刺身', '三文鱼刺身', '8', '纱羅餐精致料理', '纱羅餐精致料理', '1', '1', null, null, '2017-05-25 20:06:22', null, '2017-05-25 20:06:22');
INSERT INTO `bus_order_dish` VALUES ('276', '180', '17', '21.00', '21.00', '21.00', '21.00', '1', null, '米夫子蒸排骨', 'rib', '6', '湘水山庄', 'Hunan Manor', '1', '1', null, null, '2017-05-25 20:06:22', null, '2017-05-25 20:06:22');
INSERT INTO `bus_order_dish` VALUES ('277', '180', '15', '8.00', '8.00', '8.00', '8.00', '1', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '1', null, null, '2017-05-25 20:06:22', null, '2017-05-25 20:06:22');
INSERT INTO `bus_order_dish` VALUES ('278', '180', '16', '12.00', '12.00', '12.00', '12.00', '1', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '1', null, null, '2017-05-25 20:06:22', null, '2017-05-25 20:06:22');
INSERT INTO `bus_order_dish` VALUES ('279', '181', '19', '0.00', '0.00', '0.00', '0.00', '9', null, 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '1', '1', null, null, '2017-05-25 20:07:07', null, '2017-05-25 20:07:07');
INSERT INTO `bus_order_dish` VALUES ('280', '181', '3', '32.00', '32.00', '8.00', '8.00', '4', null, '一块吮指原味鸡', '一块吮指原味鸡', '3', '肯德基', 'KFC', '1', '1', null, null, '2017-05-25 20:07:07', null, '2017-05-25 20:07:07');
INSERT INTO `bus_order_dish` VALUES ('281', '181', '4', '68.00', '68.00', '17.00', '17.00', '4', null, '老北京鸡肉卷', '老北京鸡肉卷', '3', '肯德基', 'KFC', '1', '1', null, null, '2017-05-25 20:07:07', null, '2017-05-25 20:07:07');
INSERT INTO `bus_order_dish` VALUES ('282', '182', '18', '76.00', '76.00', '67.00', '67.00', '1', '[{\"sizeId\":7,\"sizeName\":\"迷你\",\"sizePrice\":9}]', '三文鱼刺身', '三文鱼刺身', '8', '纱羅餐精致料理', '纱羅餐精致料理', '1', '1', null, null, '2017-05-25 20:13:08', null, '2017-05-25 20:13:08');
INSERT INTO `bus_order_dish` VALUES ('283', '182', '18', '82.00', '82.00', '67.00', '67.00', '1', '[{\"sizeId\":9,\"sizeName\":\"超大份\",\"sizePrice\":15}]', '三文鱼刺身', '三文鱼刺身', '8', '纱羅餐精致料理', '纱羅餐精致料理', '1', '1', null, null, '2017-05-25 20:13:08', null, '2017-05-25 20:13:08');
INSERT INTO `bus_order_dish` VALUES ('284', '183', '18', '164.00', '164.00', '67.00', '67.00', '2', '[{\"sizeId\":9,\"sizeName\":\"超大份\",\"sizePrice\":15}]', '三文鱼刺身', '三文鱼刺身', '8', '纱羅餐精致料理', '纱羅餐精致料理', '1', '0', null, null, '2017-05-25 20:18:00', null, '2017-05-25 20:18:00');
INSERT INTO `bus_order_dish` VALUES ('285', '183', '18', '76.00', '76.00', '67.00', '67.00', '1', '[{\"sizeId\":7,\"sizeName\":\"迷你\",\"sizePrice\":9}]', '三文鱼刺身', '三文鱼刺身', '8', '纱羅餐精致料理', '纱羅餐精致料理', '1', '0', null, null, '2017-05-25 20:18:00', null, '2017-05-25 20:18:00');
INSERT INTO `bus_order_dish` VALUES ('286', '184', '18', '164.00', '164.00', '67.00', '67.00', '2', '[{\"sizeId\":9,\"sizeName\":\"超大份\",\"sizePrice\":15}]', '三文鱼刺身', '三文鱼刺身', '8', '纱羅餐精致料理', '纱羅餐精致料理', '1', '0', null, null, '2017-05-25 20:18:31', null, '2017-05-25 20:18:31');
INSERT INTO `bus_order_dish` VALUES ('287', '185', '18', '164.00', '164.00', '67.00', '67.00', '2', '[{\"sizeId\":9,\"sizeName\":\"超大份\",\"sizePrice\":15}]', '三文鱼刺身', '三文鱼刺身', '8', '纱羅餐精致料理', '纱羅餐精致料理', '1', '0', null, null, '2017-05-25 20:21:48', null, '2017-05-25 20:21:48');
INSERT INTO `bus_order_dish` VALUES ('288', '186', '21', '100.00', '100.00', '100.00', '100.00', '1', null, '和风牛肉饭', '和风牛肉饭', '8', '纱羅餐精致料理', '纱羅餐精致料理', '1', '0', null, null, '2017-05-25 20:24:06', null, '2017-05-25 20:24:06');
INSERT INTO `bus_order_dish` VALUES ('289', '186', '18', '82.00', '82.00', '67.00', '67.00', '1', '[{\"sizeId\":9,\"sizeName\":\"超大份\",\"sizePrice\":15}]', '三文鱼刺身', '三文鱼刺身', '8', '纱羅餐精致料理', '纱羅餐精致料理', '1', '0', null, null, '2017-05-25 20:24:06', null, '2017-05-25 20:24:06');
INSERT INTO `bus_order_dish` VALUES ('290', '186', '20', '98.00', '98.00', '98.00', '98.00', '1', null, '烤鳗鱼', '烤鳗鱼', '8', '纱羅餐精致料理', '纱羅餐精致料理', '1', '0', null, null, '2017-05-25 20:24:06', null, '2017-05-25 20:24:06');
INSERT INTO `bus_order_dish` VALUES ('291', '187', '21', '100.00', '100.00', '100.00', '100.00', '1', null, '和风牛肉饭', '和风牛肉饭', '8', '纱羅餐精致料理', '纱羅餐精致料理', '1', '0', null, null, '2017-05-25 21:44:14', null, '2017-05-25 21:44:14');
INSERT INTO `bus_order_dish` VALUES ('292', '187', '18', '82.00', '82.00', '67.00', '67.00', '1', '[{\"sizeId\":9,\"sizeName\":\"超大份\",\"sizePrice\":15}]', '三文鱼刺身', '三文鱼刺身', '8', '纱羅餐精致料理', '纱羅餐精致料理', '1', '0', null, null, '2017-05-25 21:44:14', null, '2017-05-25 21:44:14');
INSERT INTO `bus_order_dish` VALUES ('293', '188', '21', '100.00', '100.00', '100.00', '100.00', '1', null, '和风牛肉饭', '和风牛肉饭', '8', '纱羅餐精致料理', '纱羅餐精致料理', '1', '0', null, null, '2017-05-25 22:28:15', null, '2017-05-25 22:28:15');
INSERT INTO `bus_order_dish` VALUES ('294', '189', '21', '100.00', '100.00', '100.00', '100.00', '1', null, '和风牛肉饭', '和风牛肉饭', '8', '纱羅餐精致料理', '纱羅餐精致料理', '1', '0', null, null, '2017-05-25 22:28:57', null, '2017-05-25 22:28:57');
INSERT INTO `bus_order_dish` VALUES ('295', '190', '21', '100.00', '100.00', '100.00', '100.00', '1', null, '和风牛肉饭', '和风牛肉饭', '8', '纱羅餐精致料理', '纱羅餐精致料理', '1', '0', null, null, '2017-05-25 22:30:39', null, '2017-05-25 22:30:39');
INSERT INTO `bus_order_dish` VALUES ('296', '191', '21', '100.00', '100.00', '100.00', '100.00', '1', null, '和风牛肉饭', '和风牛肉饭', '8', '纱羅餐精致料理', '纱羅餐精致料理', '1', '0', null, null, '2017-05-25 22:47:14', null, '2017-05-25 22:47:14');
INSERT INTO `bus_order_dish` VALUES ('297', '192', '17', '21.00', '21.00', '21.00', '21.00', '1', null, '米夫子蒸排骨', 'rib', '6', '湘水山庄', 'Hunan Manor', '1', '0', null, null, '2017-05-26 01:11:55', null, '2017-05-26 01:11:55');
INSERT INTO `bus_order_dish` VALUES ('298', '193', '17', '21.00', '21.00', '21.00', '21.00', '1', null, '米夫子蒸排骨', 'rib', '6', '湘水山庄', 'Hunan Manor', '1', '0', null, null, '2017-05-26 01:12:15', null, '2017-05-26 01:12:15');
INSERT INTO `bus_order_dish` VALUES ('299', '194', '17', '42.00', '42.00', '21.00', '21.00', '2', null, '米夫子蒸排骨', 'rib', '6', '湘水山庄', 'Hunan Manor', '1', '0', null, null, '2017-05-26 08:31:06', null, '2017-05-26 08:31:06');
INSERT INTO `bus_order_dish` VALUES ('300', '195', '17', '42.00', '42.00', '21.00', '21.00', '2', null, '米夫子蒸排骨', 'rib', '6', '湘水山庄', 'Hunan Manor', '1', '0', null, null, '2017-05-26 08:31:15', null, '2017-05-26 08:31:15');
INSERT INTO `bus_order_dish` VALUES ('301', '196', '17', '42.00', '42.00', '21.00', '21.00', '2', null, '米夫子蒸排骨', 'rib', '6', '湘水山庄', 'Hunan Manor', '1', '0', null, null, '2017-05-26 08:33:16', null, '2017-05-26 08:33:16');
INSERT INTO `bus_order_dish` VALUES ('302', '197', '17', '42.00', '42.00', '21.00', '21.00', '2', null, '米夫子蒸排骨', 'rib', '6', '湘水山庄', 'Hunan Manor', '1', '0', null, null, '2017-05-26 08:43:22', null, '2017-05-26 08:43:22');
INSERT INTO `bus_order_dish` VALUES ('303', '198', '17', '63.00', '63.00', '21.00', '21.00', '3', null, '米夫子蒸排骨', 'rib', '6', '湘水山庄', 'Hunan Manor', '1', '0', null, null, '2017-05-26 08:48:05', null, '2017-05-26 08:48:05');
INSERT INTO `bus_order_dish` VALUES ('304', '199', '17', '42.00', '42.00', '21.00', '21.00', '2', null, '米夫子蒸排骨', 'rib', '6', '湘水山庄', 'Hunan Manor', '1', '0', null, null, '2017-05-26 11:09:46', null, '2017-05-26 11:09:46');
INSERT INTO `bus_order_dish` VALUES ('305', '200', '25', '114.00', '114.00', '38.00', '38.00', '3', '[{\"sizeId\":19,\"sizeName\":\"普通装\",\"sizePrice\":0}]', '西杏炸虾卷', '西杏炸虾卷', '5', '蜀巷', 'Alley 41', '1', '1', null, null, '2017-05-26 16:02:51', null, '2017-05-26 16:02:51');
INSERT INTO `bus_order_dish` VALUES ('306', '201', '25', '114.00', '114.00', '38.00', '38.00', '3', '[{\"sizeId\":19,\"sizeName\":\"普通装\",\"sizePrice\":0}]', '西杏炸虾卷', '西杏炸虾卷', '5', '蜀巷', 'Alley 41', '1', '1', null, null, '2017-05-26 16:08:22', null, '2017-05-26 16:08:22');
INSERT INTO `bus_order_dish` VALUES ('307', '202', '25', '114.00', '114.00', '38.00', '38.00', '3', '[{\"sizeId\":19,\"sizeName\":\"普通装\",\"sizePrice\":0}]', '西杏炸虾卷', '西杏炸虾卷', '5', '蜀巷', 'Alley 41', '2', '1', null, null, '2017-05-26 16:09:44', null, '2017-05-26 16:09:44');
INSERT INTO `bus_order_dish` VALUES ('308', '203', '23', '270.00', '270.00', '270.00', '270.00', '1', null, '九种刺身拼盘', '九种刺身拼盘', '8', '纱羅餐精致料理', '纱羅餐精致料理', '1', '1', null, null, '2017-05-26 16:14:12', null, '2017-05-26 16:14:12');
INSERT INTO `bus_order_dish` VALUES ('309', '204', '26', '1.00', '1.00', '1.00', '1.00', '1', null, 'XO酱萝卜糕', 'XO酱萝卜糕', '6', '湘水山庄', 'Hunan Manor', '1', '1', null, null, '2017-05-26 16:20:40', null, '2017-05-26 16:20:40');
INSERT INTO `bus_order_dish` VALUES ('310', '205', '23', '273.00', '273.00', '270.00', '270.00', '1', '[{\"sizeId\":13,\"sizeName\":\"芥末\",\"sizePrice\":3}]', '九种刺身拼盘', '九种刺身拼盘', '8', '纱羅餐精致料理', '纱羅餐精致料理', '1', '1', null, null, '2017-05-26 17:13:51', null, '2017-05-26 17:13:51');
INSERT INTO `bus_order_dish` VALUES ('311', '206', '23', '270.00', '270.00', '270.00', '270.00', '1', null, '九种刺身拼盘', '九种刺身拼盘', '8', '纱羅餐精致料理', '纱羅餐精致料理', '4', '1', null, null, '2017-05-26 17:30:37', null, '2017-05-26 17:30:37');
INSERT INTO `bus_order_dish` VALUES ('312', '207', '24', '156.00', '156.00', '150.00', '150.00', '1', '[{\"sizeId\":14,\"sizeName\":\"芥末\",\"sizePrice\":6}]', '牡丹虾', '牡丹虾', '8', '纱羅餐精致料理', '纱羅餐精致料理', '4', '1', null, null, '2017-05-26 17:38:41', null, '2017-05-26 17:38:41');
INSERT INTO `bus_order_dish` VALUES ('313', '208', '17', '105.00', '105.00', '21.00', '21.00', '5', null, '米夫子蒸排骨', 'rib', '6', '湘水山庄', 'Hunan Manor', '4', '1', null, null, '2017-05-26 17:44:31', null, '2017-05-26 17:44:31');
INSERT INTO `bus_order_dish` VALUES ('314', '209', '21', '300.00', '300.00', '100.00', '100.00', '3', null, '和风牛肉饭', '和风牛肉饭', '8', '纱羅餐精致料理', '纱羅餐精致料理', '1', '1', null, null, '2017-05-26 22:28:36', null, '2017-05-26 22:28:36');
INSERT INTO `bus_order_dish` VALUES ('315', '209', '23', '273.00', '273.00', '270.00', '270.00', '1', '[{\"sizeId\":13,\"sizeName\":\"芥末\",\"sizePrice\":3}]', '九种刺身拼盘', '九种刺身拼盘', '8', '纱羅餐精致料理', '纱羅餐精致料理', '1', '1', null, null, '2017-05-26 22:28:36', null, '2017-05-26 22:28:36');
INSERT INTO `bus_order_dish` VALUES ('316', '210', '21', '300.00', '300.00', '100.00', '100.00', '3', null, '和风牛肉饭', '和风牛肉饭', '8', '纱羅餐精致料理', '纱羅餐精致料理', '1', '1', null, null, '2017-05-26 22:28:40', null, '2017-05-26 22:28:40');
INSERT INTO `bus_order_dish` VALUES ('317', '210', '23', '273.00', '273.00', '270.00', '270.00', '1', '[{\"sizeId\":13,\"sizeName\":\"芥末\",\"sizePrice\":3}]', '九种刺身拼盘', '九种刺身拼盘', '8', '纱羅餐精致料理', '纱羅餐精致料理', '1', '1', null, null, '2017-05-26 22:28:40', null, '2017-05-26 22:28:40');
INSERT INTO `bus_order_dish` VALUES ('318', '211', '17', '21.00', '21.00', '21.00', '21.00', '1', null, '米夫子蒸排骨', 'rib', '6', '湘水山庄', 'Hunan Manor', '1', '0', null, null, '2017-05-27 10:49:15', null, '2017-05-27 10:49:15');
INSERT INTO `bus_order_dish` VALUES ('319', '212', '17', '21.00', '21.00', '21.00', '21.00', '1', null, '米夫子蒸排骨', 'rib', '6', '湘水山庄', 'Hunan Manor', '1', '0', null, null, '2017-05-27 10:49:20', null, '2017-05-27 10:49:20');
INSERT INTO `bus_order_dish` VALUES ('320', '213', '23', '540.00', '540.00', '270.00', '270.00', '2', null, '九种刺身拼盘', '九种刺身拼盘', '8', '纱羅餐精致料理', '纱羅餐精致料理', '1', '1', null, null, '2017-05-27 17:00:55', null, '2017-05-27 17:00:55');
INSERT INTO `bus_order_dish` VALUES ('321', '213', '24', '156.00', '156.00', '150.00', '150.00', '1', '[{\"sizeId\":14,\"sizeName\":\"芥末\",\"sizePrice\":6}]', '牡丹虾', '牡丹虾', '8', '纱羅餐精致料理', '纱羅餐精致料理', '1', '1', null, null, '2017-05-27 17:00:55', null, '2017-05-27 17:00:55');
INSERT INTO `bus_order_dish` VALUES ('322', '213', '25', '148.00', '148.00', '38.00', '38.00', '2', '[{\"sizeId\":18,\"sizeName\":\"超多虾\",\"sizePrice\":36}]', '西杏炸虾卷', '西杏炸虾卷', '5', '蜀巷', 'Alley 41', '1', '1', null, null, '2017-05-27 17:00:55', null, '2017-05-27 17:00:55');
INSERT INTO `bus_order_dish` VALUES ('323', '214', '25', '114.00', '114.00', '38.00', '38.00', '3', null, '西杏炸虾卷', '西杏炸虾卷', '5', '蜀巷', 'Alley 41', '1', '1', null, null, '2017-05-27 17:14:52', null, '2017-05-27 17:14:52');
INSERT INTO `bus_order_dish` VALUES ('324', '215', '25', '114.00', '114.00', '38.00', '38.00', '3', null, '西杏炸虾卷', '西杏炸虾卷', '5', '蜀巷', 'Alley 41', '1', '1', null, null, '2017-05-27 17:17:21', null, '2017-05-27 17:17:21');
INSERT INTO `bus_order_dish` VALUES ('325', '216', '25', '114.00', '114.00', '38.00', '38.00', '3', null, '西杏炸虾卷', '西杏炸虾卷', '5', '蜀巷', 'Alley 41', '1', '1', null, null, '2017-05-27 17:21:16', null, '2017-05-27 17:21:16');
INSERT INTO `bus_order_dish` VALUES ('326', '217', '25', '74.00', '74.00', '38.00', '38.00', '1', '[{\"sizeId\":18,\"sizeName\":\"超多虾\",\"sizePrice\":36}]', '西杏炸虾卷', '西杏炸虾卷', '5', '蜀巷', 'Alley 41', '1', '1', null, null, '2017-05-27 17:26:27', null, '2017-05-27 17:26:27');
INSERT INTO `bus_order_dish` VALUES ('327', '218', '25', '222.00', '222.00', '38.00', '38.00', '3', '[{\"sizeId\":18,\"sizeName\":\"超多虾\",\"sizePrice\":36}]', '西杏炸虾卷', '西杏炸虾卷', '5', '蜀巷', 'Alley 41', '1', '1', null, null, '2017-05-27 17:43:25', null, '2017-05-27 17:43:25');
INSERT INTO `bus_order_dish` VALUES ('328', '219', '25', '222.00', '222.00', '38.00', '38.00', '3', '[{\"sizeId\":18,\"sizeName\":\"超多虾\",\"sizePrice\":36}]', '西杏炸虾卷', '西杏炸虾卷', '5', '蜀巷', 'Alley 41', '1', '1', null, null, '2017-05-27 17:43:29', null, '2017-05-27 17:43:29');
INSERT INTO `bus_order_dish` VALUES ('329', '220', '25', '222.00', '222.00', '38.00', '38.00', '3', '[{\"sizeId\":18,\"sizeName\":\"超多虾\",\"sizePrice\":36}]', '西杏炸虾卷', '西杏炸虾卷', '5', '蜀巷', 'Alley 41', '1', '1', null, null, '2017-05-27 17:44:41', null, '2017-05-27 17:44:41');
INSERT INTO `bus_order_dish` VALUES ('330', '221', '25', '222.00', '222.00', '38.00', '38.00', '3', '[{\"sizeId\":18,\"sizeName\":\"超多虾\",\"sizePrice\":36}]', '西杏炸虾卷', '西杏炸虾卷', '5', '蜀巷', 'Alley 41', '1', '1', null, null, '2017-05-27 17:44:45', null, '2017-05-27 17:44:45');
INSERT INTO `bus_order_dish` VALUES ('331', '222', '25', '74.00', '74.00', '38.00', '38.00', '1', '[{\"sizeId\":18,\"sizeName\":\"超多虾\",\"sizePrice\":36}]', '西杏炸虾卷', '西杏炸虾卷', '5', '蜀巷', 'Alley 41', '1', '0', null, null, '2017-05-27 22:05:29', null, '2017-05-27 22:05:29');
INSERT INTO `bus_order_dish` VALUES ('332', '223', '25', '38.00', '38.00', '38.00', '38.00', '1', '[{\"sizeId\":19,\"sizeName\":\"普通装\",\"sizePrice\":0}]', '西杏炸虾卷', '西杏炸虾卷', '5', '蜀巷', 'Alley 41', '1', '0', null, null, '2017-05-27 22:16:53', null, '2017-05-27 22:16:53');
INSERT INTO `bus_order_dish` VALUES ('333', '224', '25', '370.00', '370.00', '38.00', '38.00', '5', '[{\"sizeId\":18,\"sizeName\":\"超多虾\",\"sizePrice\":36}]', '西杏炸虾卷', '西杏炸虾卷', '5', '蜀巷', 'Alley 41', '1', '0', null, null, '2017-05-27 22:20:48', null, '2017-05-27 22:20:48');
INSERT INTO `bus_order_dish` VALUES ('334', '225', '23', '546.00', '546.00', '270.00', '270.00', '2', '[{\"sizeId\":13,\"sizeName\":\"芥末\",\"sizePrice\":3}]', '九种刺身拼盘', '九种刺身拼盘', '8', '纱羅餐精致料理', '纱羅餐精致料理', '1', '0', null, null, '2017-05-27 22:21:35', null, '2017-05-27 22:21:35');
INSERT INTO `bus_order_dish` VALUES ('335', '226', '23', '273.00', '273.00', '270.00', '270.00', '1', '[{\"sizeId\":13,\"sizeName\":\"芥末\",\"sizePrice\":3}]', '九种刺身拼盘', '九种刺身拼盘', '8', '纱羅餐精致料理', '纱羅餐精致料理', '1', '0', null, null, '2017-05-27 23:16:07', null, '2017-05-27 23:16:07');
INSERT INTO `bus_order_dish` VALUES ('336', '226', '24', '156.00', '156.00', '150.00', '150.00', '1', '[{\"sizeId\":14,\"sizeName\":\"芥末\",\"sizePrice\":6}]', '牡丹虾', '牡丹虾', '8', '纱羅餐精致料理', '纱羅餐精致料理', '1', '0', null, null, '2017-05-27 23:16:07', null, '2017-05-27 23:16:07');
INSERT INTO `bus_order_dish` VALUES ('337', '226', '25', '38.00', '38.00', '38.00', '38.00', '1', null, '西杏炸虾卷', '西杏炸虾卷', '5', '蜀巷', 'Alley 41', '1', '0', null, null, '2017-05-27 23:16:07', null, '2017-05-27 23:16:07');
INSERT INTO `bus_order_dish` VALUES ('338', '227', '19', '90.00', '90.00', '80.00', '80.00', '1', '[{\"sizeId\":12,\"sizeName\":\"加辣椒\",\"sizePrice\":10}]', 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '1', '0', null, null, '2017-05-30 18:48:53', null, '2017-05-30 18:48:53');
INSERT INTO `bus_order_dish` VALUES ('339', '227', '19', '90.00', '90.00', '80.00', '80.00', '1', '[{\"sizeId\":11,\"sizeName\":\"加蒜\",\"sizePrice\":10}]', 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '1', '0', null, null, '2017-05-30 18:48:53', null, '2017-05-30 18:48:53');
INSERT INTO `bus_order_dish` VALUES ('340', '228', '19', '90.00', '90.00', '80.00', '80.00', '1', '[{\"sizeId\":12,\"sizeName\":\"加辣椒\",\"sizePrice\":10}]', 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '3', '1', null, null, '2017-05-31 18:01:22', null, '2017-05-31 18:01:22');
INSERT INTO `bus_order_dish` VALUES ('341', '228', '19', '160.00', '160.00', '80.00', '80.00', '2', null, 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '3', '1', null, null, '2017-05-31 18:01:22', null, '2017-05-31 18:01:22');
INSERT INTO `bus_order_dish` VALUES ('342', '229', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '3', '0', null, null, '2017-05-31 18:17:32', null, '2017-05-31 18:17:32');
INSERT INTO `bus_order_dish` VALUES ('343', '229', '16', '24.00', '24.00', '12.00', '12.00', '2', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '3', '0', null, null, '2017-05-31 18:17:32', null, '2017-05-31 18:17:32');
INSERT INTO `bus_order_dish` VALUES ('344', '230', '15', '26.00', '26.00', '8.00', '8.00', '2', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-31 20:22:17', null, '2017-05-31 20:22:17');
INSERT INTO `bus_order_dish` VALUES ('345', '230', '16', '108.00', '108.00', '12.00', '12.00', '9', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-31 20:22:17', null, '2017-05-31 20:22:17');
INSERT INTO `bus_order_dish` VALUES ('346', '230', '19', '90.00', '90.00', '80.00', '80.00', '1', '[{\"sizeId\":11,\"sizeName\":\"加蒜\",\"sizePrice\":10}]', 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '1', '0', null, null, '2017-05-31 20:22:17', null, '2017-05-31 20:22:17');
INSERT INTO `bus_order_dish` VALUES ('347', '230', '19', '110.00', '110.00', '80.00', '80.00', '1', '[{\"sizeId\":10,\"sizeName\":\"加葱\",\"sizePrice\":10},{\"sizeId\":12,\"sizeName\":\"加辣椒\",\"sizePrice\":10},{\"sizeId\":11,\"sizeName\":\"加蒜\",\"sizePrice\":10}]', 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '1', '0', null, null, '2017-05-31 20:22:17', null, '2017-05-31 20:22:17');
INSERT INTO `bus_order_dish` VALUES ('348', '231', '19', '110.00', '110.00', '80.00', '80.00', '1', '[{\"sizeId\":11,\"sizeName\":\"加蒜\",\"sizePrice\":10},{\"sizeId\":10,\"sizeName\":\"加葱\",\"sizePrice\":10},{\"sizeId\":12,\"sizeName\":\"加辣椒\",\"sizePrice\":10}]', 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '1', '0', null, null, '2017-05-31 20:31:52', null, '2017-05-31 20:31:52');
INSERT INTO `bus_order_dish` VALUES ('349', '231', '19', '90.00', '90.00', '80.00', '80.00', '1', '[{\"sizeId\":12,\"sizeName\":\"加辣椒\",\"sizePrice\":10}]', 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '1', '0', null, null, '2017-05-31 20:31:52', null, '2017-05-31 20:31:52');
INSERT INTO `bus_order_dish` VALUES ('350', '231', '19', '90.00', '90.00', '80.00', '80.00', '1', '[{\"sizeId\":10,\"sizeName\":\"加葱\",\"sizePrice\":10}]', 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '1', '0', null, null, '2017-05-31 20:31:52', null, '2017-05-31 20:31:52');
INSERT INTO `bus_order_dish` VALUES ('351', '231', '19', '90.00', '90.00', '80.00', '80.00', '1', '[{\"sizeId\":11,\"sizeName\":\"加蒜\",\"sizePrice\":10}]', 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '1', '0', null, null, '2017-05-31 20:31:52', null, '2017-05-31 20:31:52');
INSERT INTO `bus_order_dish` VALUES ('352', '231', '19', '80.00', '80.00', '80.00', '80.00', '1', null, 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '1', '0', null, null, '2017-05-31 20:31:52', null, '2017-05-31 20:31:52');
INSERT INTO `bus_order_dish` VALUES ('353', '232', '19', '90.00', '90.00', '80.00', '80.00', '1', '[{\"sizeId\":12,\"sizeName\":\"加辣椒\",\"sizePrice\":10}]', 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '1', '0', null, null, '2017-05-31 20:36:58', null, '2017-05-31 20:36:58');
INSERT INTO `bus_order_dish` VALUES ('354', '232', '19', '90.00', '90.00', '80.00', '80.00', '1', '[{\"sizeId\":11,\"sizeName\":\"加蒜\",\"sizePrice\":10}]', 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '1', '0', null, null, '2017-05-31 20:36:58', null, '2017-05-31 20:36:58');
INSERT INTO `bus_order_dish` VALUES ('355', '232', '19', '90.00', '90.00', '80.00', '80.00', '1', '[{\"sizeId\":10,\"sizeName\":\"加葱\",\"sizePrice\":10}]', 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '1', '0', null, null, '2017-05-31 20:36:58', null, '2017-05-31 20:36:58');
INSERT INTO `bus_order_dish` VALUES ('356', '233', '19', '90.00', '90.00', '80.00', '80.00', '1', '[{\"sizeId\":12,\"sizeName\":\"加辣椒\",\"sizePrice\":10}]', 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '1', '0', null, null, '2017-05-31 20:37:54', null, '2017-05-31 20:37:54');
INSERT INTO `bus_order_dish` VALUES ('357', '233', '19', '90.00', '90.00', '80.00', '80.00', '1', '[{\"sizeId\":11,\"sizeName\":\"加蒜\",\"sizePrice\":10}]', 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '1', '0', null, null, '2017-05-31 20:37:54', null, '2017-05-31 20:37:54');
INSERT INTO `bus_order_dish` VALUES ('358', '234', '19', '90.00', '90.00', '80.00', '80.00', '1', '[{\"sizeId\":12,\"sizeName\":\"加辣椒\",\"sizePrice\":10}]', 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '1', '0', null, null, '2017-05-31 20:38:57', null, '2017-05-31 20:38:57');
INSERT INTO `bus_order_dish` VALUES ('359', '234', '19', '90.00', '90.00', '80.00', '80.00', '1', '[{\"sizeId\":11,\"sizeName\":\"加蒜\",\"sizePrice\":10}]', 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '1', '0', null, null, '2017-05-31 20:38:57', null, '2017-05-31 20:38:57');
INSERT INTO `bus_order_dish` VALUES ('360', '234', '19', '90.00', '90.00', '80.00', '80.00', '1', '[{\"sizeId\":10,\"sizeName\":\"加葱\",\"sizePrice\":10}]', 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '1', '0', null, null, '2017-05-31 20:38:57', null, '2017-05-31 20:38:57');
INSERT INTO `bus_order_dish` VALUES ('361', '235', '19', '90.00', '90.00', '80.00', '80.00', '1', '[{\"sizeId\":12,\"sizeName\":\"加辣椒\",\"sizePrice\":10}]', 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '1', '0', null, null, '2017-05-31 20:42:25', null, '2017-05-31 20:42:25');
INSERT INTO `bus_order_dish` VALUES ('362', '235', '19', '90.00', '90.00', '80.00', '80.00', '1', '[{\"sizeId\":11,\"sizeName\":\"加蒜\",\"sizePrice\":10}]', 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '1', '0', null, null, '2017-05-31 20:42:25', null, '2017-05-31 20:42:25');
INSERT INTO `bus_order_dish` VALUES ('363', '235', '19', '90.00', '90.00', '80.00', '80.00', '1', '[{\"sizeId\":10,\"sizeName\":\"加葱\",\"sizePrice\":10}]', 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '1', '0', null, null, '2017-05-31 20:42:25', null, '2017-05-31 20:42:25');
INSERT INTO `bus_order_dish` VALUES ('364', '236', '19', '90.00', '90.00', '80.00', '80.00', '1', '[{\"sizeId\":11,\"sizeName\":\"加蒜\",\"sizePrice\":10}]', 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '1', '0', null, null, '2017-05-31 20:45:20', null, '2017-05-31 20:45:20');
INSERT INTO `bus_order_dish` VALUES ('365', '236', '19', '180.00', '180.00', '80.00', '80.00', '2', '[{\"sizeId\":12,\"sizeName\":\"加辣椒\",\"sizePrice\":10}]', 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '1', '0', null, null, '2017-05-31 20:45:20', null, '2017-05-31 20:45:20');
INSERT INTO `bus_order_dish` VALUES ('366', '236', '19', '90.00', '90.00', '80.00', '80.00', '1', '[{\"sizeId\":10,\"sizeName\":\"加葱\",\"sizePrice\":10}]', 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '1', '0', null, null, '2017-05-31 20:45:20', null, '2017-05-31 20:45:20');
INSERT INTO `bus_order_dish` VALUES ('367', '237', '19', '90.00', '90.00', '80.00', '80.00', '1', '[{\"sizeId\":12,\"sizeName\":\"加辣椒\",\"sizePrice\":10}]', 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '1', '0', null, null, '2017-05-31 20:48:29', null, '2017-05-31 20:48:29');
INSERT INTO `bus_order_dish` VALUES ('368', '237', '19', '90.00', '90.00', '80.00', '80.00', '1', '[{\"sizeId\":11,\"sizeName\":\"加蒜\",\"sizePrice\":10}]', 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '1', '0', null, null, '2017-05-31 20:48:29', null, '2017-05-31 20:48:29');
INSERT INTO `bus_order_dish` VALUES ('369', '237', '19', '90.00', '90.00', '80.00', '80.00', '1', '[{\"sizeId\":10,\"sizeName\":\"加葱\",\"sizePrice\":10}]', 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '1', '0', null, null, '2017-05-31 20:48:29', null, '2017-05-31 20:48:29');
INSERT INTO `bus_order_dish` VALUES ('370', '238', '15', '26.00', '26.00', '8.00', '8.00', '2', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-31 20:50:13', null, '2017-05-31 20:50:13');
INSERT INTO `bus_order_dish` VALUES ('371', '238', '16', '192.00', '192.00', '12.00', '12.00', '16', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-05-31 20:50:13', null, '2017-05-31 20:50:13');
INSERT INTO `bus_order_dish` VALUES ('372', '239', '19', '90.00', '90.00', '80.00', '80.00', '1', '[{\"sizeId\":11,\"sizeName\":\"加蒜\",\"sizePrice\":10}]', 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '1', '0', null, null, '2017-05-31 20:51:02', null, '2017-05-31 20:51:02');
INSERT INTO `bus_order_dish` VALUES ('373', '239', '19', '90.00', '90.00', '80.00', '80.00', '1', '[{\"sizeId\":12,\"sizeName\":\"加辣椒\",\"sizePrice\":10}]', 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '1', '0', null, null, '2017-05-31 20:51:02', null, '2017-05-31 20:51:02');
INSERT INTO `bus_order_dish` VALUES ('374', '239', '19', '90.00', '90.00', '80.00', '80.00', '1', '[{\"sizeId\":10,\"sizeName\":\"加葱\",\"sizePrice\":10}]', 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '1', '0', null, null, '2017-05-31 20:51:02', null, '2017-05-31 20:51:02');
INSERT INTO `bus_order_dish` VALUES ('375', '240', '19', '90.00', '90.00', '80.00', '80.00', '1', '[{\"sizeId\":12,\"sizeName\":\"加辣椒\",\"sizePrice\":10}]', 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '1', '0', null, null, '2017-05-31 20:54:21', null, '2017-05-31 20:54:21');
INSERT INTO `bus_order_dish` VALUES ('376', '240', '19', '90.00', '90.00', '80.00', '80.00', '1', '[{\"sizeId\":11,\"sizeName\":\"加蒜\",\"sizePrice\":10}]', 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '1', '0', null, null, '2017-05-31 20:54:21', null, '2017-05-31 20:54:21');
INSERT INTO `bus_order_dish` VALUES ('377', '240', '19', '90.00', '90.00', '80.00', '80.00', '1', '[{\"sizeId\":10,\"sizeName\":\"加葱\",\"sizePrice\":10}]', 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '1', '0', null, null, '2017-05-31 20:54:21', null, '2017-05-31 20:54:21');
INSERT INTO `bus_order_dish` VALUES ('378', '240', '19', '110.00', '110.00', '80.00', '80.00', '1', '[{\"sizeId\":11,\"sizeName\":\"加蒜\",\"sizePrice\":10},{\"sizeId\":10,\"sizeName\":\"加葱\",\"sizePrice\":10},{\"sizeId\":12,\"sizeName\":\"加辣椒\",\"sizePrice\":10}]', 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '1', '0', null, null, '2017-05-31 20:54:21', null, '2017-05-31 20:54:21');
INSERT INTO `bus_order_dish` VALUES ('379', '240', '19', '80.00', '80.00', '80.00', '80.00', '1', null, 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '1', '0', null, null, '2017-05-31 20:54:21', null, '2017-05-31 20:54:21');
INSERT INTO `bus_order_dish` VALUES ('380', '241', '19', '160.00', '160.00', '80.00', '80.00', '2', null, 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '1', '1', null, null, '2017-05-31 21:01:16', null, '2017-05-31 21:01:16');
INSERT INTO `bus_order_dish` VALUES ('381', '242', '14', '154.00', '154.00', '11.00', '11.00', '14', null, '拿铁(大)', '拿铁(大)', '3', '肯德基', 'KFC', '1', '0', null, null, '2017-05-31 21:16:27', null, '2017-05-31 21:16:27');
INSERT INTO `bus_order_dish` VALUES ('382', '243', '19', '160.00', '160.00', '80.00', '80.00', '2', null, 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '3', '0', null, null, '2017-05-31 21:18:30', null, '2017-05-31 21:18:30');
INSERT INTO `bus_order_dish` VALUES ('383', '244', '19', '160.00', '160.00', '80.00', '80.00', '2', null, 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '3', '0', null, null, '2017-05-31 21:21:15', null, '2017-05-31 21:21:15');
INSERT INTO `bus_order_dish` VALUES ('384', '245', '19', '160.00', '160.00', '80.00', '80.00', '2', null, 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '1', '0', null, null, '2017-05-31 21:24:38', null, '2017-05-31 21:24:38');
INSERT INTO `bus_order_dish` VALUES ('385', '246', '19', '160.00', '160.00', '80.00', '80.00', '2', null, 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '1', '0', null, null, '2017-05-31 21:25:28', null, '2017-05-31 21:25:28');
INSERT INTO `bus_order_dish` VALUES ('386', '247', '19', '160.00', '160.00', '80.00', '80.00', '2', null, 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '1', '0', null, null, '2017-05-31 21:29:15', null, '2017-05-31 21:29:15');
INSERT INTO `bus_order_dish` VALUES ('387', '248', '19', '160.00', '160.00', '80.00', '80.00', '2', null, 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '1', '0', null, null, '2017-05-31 21:30:37', null, '2017-05-31 21:30:37');
INSERT INTO `bus_order_dish` VALUES ('388', '249', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '1', null, null, '2017-06-01 10:34:11', null, '2017-06-01 10:34:11');
INSERT INTO `bus_order_dish` VALUES ('389', '249', '16', '144.00', '144.00', '12.00', '12.00', '12', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '1', null, null, '2017-06-01 10:34:11', null, '2017-06-01 10:34:11');
INSERT INTO `bus_order_dish` VALUES ('390', '250', '21', '100.00', '100.00', '100.00', '100.00', '1', null, '和风牛肉饭', '和风牛肉饭', '8', '纱羅餐精致料理', '纱羅餐精致料理', '4', '0', null, null, '2017-06-01 11:15:05', null, '2017-06-01 11:15:05');
INSERT INTO `bus_order_dish` VALUES ('391', '250', '18', '67.00', '67.00', '67.00', '67.00', '1', null, '三文鱼刺身', '三文鱼刺身', '8', '纱羅餐精致料理', '纱羅餐精致料理', '4', '0', null, null, '2017-06-01 11:15:05', null, '2017-06-01 11:15:05');
INSERT INTO `bus_order_dish` VALUES ('392', '251', '16', '156.00', '156.00', '12.00', '12.00', '13', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '4', '0', null, null, '2017-06-01 11:16:38', null, '2017-06-01 11:16:38');
INSERT INTO `bus_order_dish` VALUES ('393', '252', '19', '90.00', '90.00', '80.00', '80.00', '1', '[{\"sizeId\":12,\"sizeName\":\"加辣椒\",\"sizePrice\":10}]', 'Beef', 'Beef', '5', '蜀巷', 'Alley 41', '3', '0', null, null, '2017-06-01 12:26:02', null, '2017-06-01 12:26:02');
INSERT INTO `bus_order_dish` VALUES ('394', '253', '17', '189.00', '189.00', '21.00', '21.00', '9', null, '米夫子蒸排骨', 'rib', '6', '湘水山庄', 'Hunan Manor', '4', '0', null, null, '2017-06-01 14:46:33', null, '2017-06-01 14:46:33');
INSERT INTO `bus_order_dish` VALUES ('395', '254', '14', '66.00', '66.00', '11.00', '11.00', '6', null, '拿铁(大)', '拿铁(大)', '3', '肯德基', 'KFC', '2', '1', null, null, '2017-06-01 14:47:59', null, '2017-06-01 14:47:59');
INSERT INTO `bus_order_dish` VALUES ('396', '254', '3', '24.00', '24.00', '8.00', '8.00', '3', null, '一块吮指原味鸡', '一块吮指原味鸡', '3', '肯德基', 'KFC', '2', '1', null, null, '2017-06-01 14:47:59', null, '2017-06-01 14:47:59');
INSERT INTO `bus_order_dish` VALUES ('397', '254', '4', '119.00', '119.00', '17.00', '17.00', '7', null, '老北京鸡肉卷', '老北京鸡肉卷', '3', '肯德基', 'KFC', '2', '1', null, null, '2017-06-01 14:47:59', null, '2017-06-01 14:47:59');
INSERT INTO `bus_order_dish` VALUES ('398', '254', '11', '15.00', '15.00', '1.00', '1.00', '15', null, '黄金鸡块5块装', '黄金鸡块5块装', '3', '肯德基', 'KFC', '2', '1', null, null, '2017-06-01 14:47:59', null, '2017-06-01 14:47:59');
INSERT INTO `bus_order_dish` VALUES ('399', '255', '21', '500.00', '500.00', '100.00', '100.00', '5', null, '和风牛肉饭', '和风牛肉饭', '8', '纱羅餐精致料理', '纱羅餐精致料理', '1', '0', null, null, '2017-06-01 14:50:57', null, '2017-06-01 14:50:57');
INSERT INTO `bus_order_dish` VALUES ('400', '256', '21', '500.00', '500.00', '100.00', '100.00', '5', null, '和风牛肉饭', '和风牛肉饭', '8', '纱羅餐精致料理', '纱羅餐精致料理', '4', '0', null, null, '2017-06-01 14:53:09', null, '2017-06-01 14:53:09');
INSERT INTO `bus_order_dish` VALUES ('401', '257', '14', '33.00', '33.00', '11.00', '11.00', '3', null, '拿铁(大)', '拿铁(大)', '3', '肯德基', 'KFC', '1', '0', null, null, '2017-06-01 19:06:41', null, '2017-06-01 19:06:41');
INSERT INTO `bus_order_dish` VALUES ('402', '257', '15', '8.00', '8.00', '8.00', '8.00', '1', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-01 19:06:41', null, '2017-06-01 19:06:41');
INSERT INTO `bus_order_dish` VALUES ('403', '257', '16', '60.00', '60.00', '12.00', '12.00', '5', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-01 19:06:41', null, '2017-06-01 19:06:41');
INSERT INTO `bus_order_dish` VALUES ('404', '258', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '4', '0', null, null, '2017-06-01 22:53:16', null, '2017-06-01 22:53:16');
INSERT INTO `bus_order_dish` VALUES ('405', '258', '16', '120.00', '120.00', '12.00', '12.00', '10', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '4', '0', null, null, '2017-06-01 22:53:16', null, '2017-06-01 22:53:16');
INSERT INTO `bus_order_dish` VALUES ('406', '259', '17', '168.00', '168.00', '21.00', '21.00', '8', null, '米夫子蒸排骨', 'rib', '6', '湘水山庄', 'Hunan Manor', '4', '0', null, null, '2017-06-01 22:54:38', null, '2017-06-01 22:54:38');
INSERT INTO `bus_order_dish` VALUES ('407', '260', '21', '500.00', '500.00', '100.00', '100.00', '5', null, '和风牛肉饭', '和风牛肉饭', '8', '纱羅餐精致料理', '纱羅餐精致料理', '4', '0', null, null, '2017-06-01 23:22:09', null, '2017-06-01 23:22:09');
INSERT INTO `bus_order_dish` VALUES ('408', '261', '21', '100.00', '100.00', '100.00', '100.00', '1', null, '和风牛肉饭', '和风牛肉饭', '8', '纱羅餐精致料理', '纱羅餐精致料理', '4', '0', null, null, '2017-06-01 23:22:53', null, '2017-06-01 23:22:53');
INSERT INTO `bus_order_dish` VALUES ('409', '262', '21', '100.00', '100.00', '100.00', '100.00', '1', null, '和风牛肉饭', '和风牛肉饭', '8', '纱羅餐精致料理', '纱羅餐精致料理', '5', '0', null, null, '2017-06-01 23:23:22', null, '2017-06-01 23:23:22');
INSERT INTO `bus_order_dish` VALUES ('410', '263', '21', '100.00', '100.00', '100.00', '100.00', '1', null, '和风牛肉饭', '和风牛肉饭', '8', '纱羅餐精致料理', '纱羅餐精致料理', '4', '0', null, null, '2017-06-01 23:24:27', null, '2017-06-01 23:24:27');
INSERT INTO `bus_order_dish` VALUES ('411', '264', '21', '200.00', '200.00', '100.00', '100.00', '2', null, '和风牛肉饭', '和风牛肉饭', '8', '纱羅餐精致料理', '纱羅餐精致料理', '3', '0', null, null, '2017-06-01 23:32:42', null, '2017-06-01 23:32:42');
INSERT INTO `bus_order_dish` VALUES ('412', '265', '27', '70.00', '70.00', '65.00', '65.00', '1', '[{\"sizeId\":20,\"sizeName\":\"超大份\",\"sizePrice\":5}]', '红烧肉', '红烧肉', '10', '上海1号私藏菜', 'ShangHai No.1', '3', '0', null, null, '2017-06-01 23:42:27', null, '2017-06-01 23:42:27');
INSERT INTO `bus_order_dish` VALUES ('413', '266', '14', '66.00', '66.00', '11.00', '11.00', '6', null, '拿铁(大)', '拿铁(大)', '3', '肯德基', 'KFC', '3', '0', null, null, '2017-06-01 23:44:52', null, '2017-06-01 23:44:52');
INSERT INTO `bus_order_dish` VALUES ('414', '267', '14', '55.00', '55.00', '11.00', '11.00', '5', null, '拿铁(大)', '拿铁(大)', '3', '肯德基', 'KFC', '3', '0', null, null, '2017-06-01 23:46:13', null, '2017-06-01 23:46:13');
INSERT INTO `bus_order_dish` VALUES ('415', '268', '27', '68.00', '68.00', '65.00', '65.00', '1', '[{\"sizeId\":21,\"sizeName\":\"中份\",\"sizePrice\":3}]', '红烧肉', '红烧肉', '10', '上海1号私藏菜', 'ShangHai No.1', '3', '0', null, null, '2017-06-01 23:47:30', null, '2017-06-01 23:47:30');
INSERT INTO `bus_order_dish` VALUES ('416', '269', '27', '136.00', '136.00', '65.00', '65.00', '2', '[{\"sizeId\":21,\"sizeName\":\"中份\",\"sizePrice\":3}]', '红烧肉', '红烧肉', '10', '上海1号私藏菜', 'ShangHai No.1', '3', '0', null, null, '2017-06-02 00:03:49', null, '2017-06-02 00:03:49');
INSERT INTO `bus_order_dish` VALUES ('417', '269', '27', '70.00', '70.00', '65.00', '65.00', '1', '[{\"sizeId\":20,\"sizeName\":\"超大份\",\"sizePrice\":5}]', '红烧肉', '红烧肉', '10', '上海1号私藏菜', 'ShangHai No.1', '3', '0', null, null, '2017-06-02 00:03:49', null, '2017-06-02 00:03:49');
INSERT INTO `bus_order_dish` VALUES ('418', '270', '24', '156.00', '156.00', '150.00', '150.00', '1', '[{\"sizeId\":14,\"sizeName\":\"芥末\",\"sizePrice\":6}]', '牡丹虾', '牡丹虾', '8', '纱羅餐精致料理', '纱羅餐精致料理', '4', '0', null, null, '2017-06-03 10:39:18', null, '2017-06-03 10:39:18');
INSERT INTO `bus_order_dish` VALUES ('419', '271', '17', '105.00', '105.00', '21.00', '21.00', '5', null, '米夫子蒸排骨', 'rib', '6', '湘水山庄', 'Hunan Manor', '4', '0', null, null, '2017-06-03 11:21:50', null, '2017-06-03 11:21:50');
INSERT INTO `bus_order_dish` VALUES ('420', '272', '23', '273.00', '273.00', '270.00', '270.00', '1', '[{\"sizeId\":13,\"sizeName\":\"芥末\",\"sizePrice\":3}]', '九种刺身拼盘', '九种刺身拼盘', '8', '纱羅餐精致料理', '纱羅餐精致料理', '4', '0', null, null, '2017-06-03 13:06:55', null, '2017-06-03 13:06:55');
INSERT INTO `bus_order_dish` VALUES ('421', '273', '23', '273.00', '273.00', '270.00', '270.00', '1', '[{\"sizeId\":13,\"sizeName\":\"芥末\",\"sizePrice\":3}]', '九种刺身拼盘', '九种刺身拼盘', '8', '纱羅餐精致料理', '纱羅餐精致料理', '4', '0', null, null, '2017-06-03 13:10:06', null, '2017-06-03 13:10:06');
INSERT INTO `bus_order_dish` VALUES ('422', '273', '24', '150.00', '150.00', '150.00', '150.00', '1', '[{\"sizeId\":15,\"sizeName\":\"普通\",\"sizePrice\":0}]', '牡丹虾', '牡丹虾', '8', '纱羅餐精致料理', '纱羅餐精致料理', '4', '0', null, null, '2017-06-03 13:10:06', null, '2017-06-03 13:10:06');
INSERT INTO `bus_order_dish` VALUES ('423', '274', '29', '1.00', '1.00', '1.00', '1.00', '1', null, '一元餐', 'OneDollar', '8', '纱羅餐精致料理', '纱羅餐精致料理', '1', '0', null, null, '2017-06-04 16:21:56', null, '2017-06-04 16:21:56');
INSERT INTO `bus_order_dish` VALUES ('424', '275', '29', '1.00', '1.00', '1.00', '1.00', '1', null, '一元餐', 'OneDollar', '8', '纱羅餐精致料理', '纱羅餐精致料理', '1', '0', null, null, '2017-06-04 16:24:51', null, '2017-06-04 16:24:51');
INSERT INTO `bus_order_dish` VALUES ('425', '276', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '4', '0', null, null, '2017-06-05 09:52:22', null, '2017-06-05 09:52:22');
INSERT INTO `bus_order_dish` VALUES ('426', '276', '16', '24.00', '24.00', '12.00', '12.00', '2', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '4', '0', null, null, '2017-06-05 09:52:22', null, '2017-06-05 09:52:22');
INSERT INTO `bus_order_dish` VALUES ('427', '277', '14', '44.00', '44.00', '11.00', '11.00', '4', null, '拿铁(大)', '拿铁(大)', '3', '肯德基', 'KFC', '4', '0', null, null, '2017-06-05 09:52:39', null, '2017-06-05 09:52:39');
INSERT INTO `bus_order_dish` VALUES ('428', '277', '3', '16.00', '16.00', '8.00', '8.00', '2', null, '一块吮指原味鸡', '一块吮指原味鸡', '3', '肯德基', 'KFC', '4', '0', null, null, '2017-06-05 09:52:39', null, '2017-06-05 09:52:39');
INSERT INTO `bus_order_dish` VALUES ('429', '277', '4', '51.00', '51.00', '17.00', '17.00', '3', null, '老北京鸡肉卷', '老北京鸡肉卷', '3', '肯德基', 'KFC', '4', '0', null, null, '2017-06-05 09:52:39', null, '2017-06-05 09:52:39');
INSERT INTO `bus_order_dish` VALUES ('430', '278', '29', '1.00', '1.00', '1.00', '1.00', '1', null, '一元餐', 'OneDollar', '8', '纱羅餐精致料理', '纱羅餐精致料理', '1', '0', null, null, '2017-06-05 10:33:31', null, '2017-06-05 10:33:31');
INSERT INTO `bus_order_dish` VALUES ('431', '279', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-05 10:45:23', null, '2017-06-05 10:45:23');
INSERT INTO `bus_order_dish` VALUES ('432', '279', '16', '12.00', '12.00', '12.00', '12.00', '1', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-05 10:45:23', null, '2017-06-05 10:45:23');
INSERT INTO `bus_order_dish` VALUES ('433', '280', '29', '1.00', '1.00', '1.00', '1.00', '1', null, '一元餐', 'OneDollar', '8', '纱羅餐精致料理', '纱羅餐精致料理', '4', '0', null, null, '2017-06-05 11:03:53', null, '2017-06-05 11:03:53');
INSERT INTO `bus_order_dish` VALUES ('434', '281', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '4', '0', null, null, '2017-06-05 11:56:04', null, '2017-06-05 11:56:04');
INSERT INTO `bus_order_dish` VALUES ('435', '282', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '4', '0', null, null, '2017-06-05 14:20:39', null, '2017-06-05 14:20:39');
INSERT INTO `bus_order_dish` VALUES ('436', '283', '14', '11.00', '11.00', '11.00', '11.00', '1', null, '拿铁(大)', '拿铁(大)', '3', '肯德基', 'KFC', '4', '0', null, null, '2017-06-05 14:22:01', null, '2017-06-05 14:22:01');
INSERT INTO `bus_order_dish` VALUES ('437', '283', '3', '8.00', '8.00', '8.00', '8.00', '1', null, '一块吮指原味鸡', '一块吮指原味鸡', '3', '肯德基', 'KFC', '4', '0', null, null, '2017-06-05 14:22:01', null, '2017-06-05 14:22:01');
INSERT INTO `bus_order_dish` VALUES ('438', '283', '4', '17.00', '17.00', '17.00', '17.00', '1', null, '老北京鸡肉卷', '老北京鸡肉卷', '3', '肯德基', 'KFC', '4', '0', null, null, '2017-06-05 14:22:01', null, '2017-06-05 14:22:01');
INSERT INTO `bus_order_dish` VALUES ('439', '283', '11', '3.00', '3.00', '1.00', '1.00', '3', null, '黄金鸡块5块装', '黄金鸡块5块装', '3', '肯德基', 'KFC', '4', '0', null, null, '2017-06-05 14:22:01', null, '2017-06-05 14:22:01');
INSERT INTO `bus_order_dish` VALUES ('440', '284', '29', '1.00', '1.00', '1.00', '1.00', '1', null, '一元餐', 'OneDollar', '8', '纱羅餐精致料理', '纱羅餐精致料理', '1', '0', null, null, '2017-06-05 14:33:43', null, '2017-06-05 14:33:43');
INSERT INTO `bus_order_dish` VALUES ('441', '285', '29', '1.00', '1.00', '1.00', '1.00', '1', null, '一元餐', 'OneDollar', '8', '纱羅餐精致料理', '纱羅餐精致料理', '4', '0', null, null, '2017-06-05 14:39:19', null, '2017-06-05 14:39:19');
INSERT INTO `bus_order_dish` VALUES ('442', '286', '29', '1.00', '1.00', '1.00', '1.00', '1', null, '一元餐', 'OneDollar', '8', '纱羅餐精致料理', '纱羅餐精致料理', '1', '0', null, null, '2017-06-05 14:51:03', null, '2017-06-05 14:51:03');
INSERT INTO `bus_order_dish` VALUES ('443', '287', '15', '8.00', '8.00', '8.00', '8.00', '1', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-05 16:06:46', null, '2017-06-05 16:06:46');
INSERT INTO `bus_order_dish` VALUES ('444', '288', '15', '8.00', '8.00', '8.00', '8.00', '1', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-05 16:11:09', null, '2017-06-05 16:11:09');
INSERT INTO `bus_order_dish` VALUES ('445', '289', '15', '8.00', '8.00', '8.00', '8.00', '1', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-05 16:14:04', null, '2017-06-05 16:14:04');
INSERT INTO `bus_order_dish` VALUES ('446', '290', '15', '8.00', '8.00', '8.00', '8.00', '1', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-05 16:14:25', null, '2017-06-05 16:14:25');
INSERT INTO `bus_order_dish` VALUES ('447', '291', '15', '8.00', '8.00', '8.00', '8.00', '1', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-05 16:14:36', null, '2017-06-05 16:14:36');
INSERT INTO `bus_order_dish` VALUES ('448', '292', '15', '8.00', '8.00', '8.00', '8.00', '1', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-05 16:15:25', null, '2017-06-05 16:15:25');
INSERT INTO `bus_order_dish` VALUES ('449', '293', '15', '8.00', '8.00', '8.00', '8.00', '1', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-05 16:15:36', null, '2017-06-05 16:15:36');
INSERT INTO `bus_order_dish` VALUES ('450', '294', '15', '8.00', '8.00', '8.00', '8.00', '1', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-05 16:17:36', null, '2017-06-05 16:17:36');
INSERT INTO `bus_order_dish` VALUES ('451', '295', '15', '16.00', '16.00', '8.00', '8.00', '2', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-05 16:25:59', null, '2017-06-05 16:25:59');
INSERT INTO `bus_order_dish` VALUES ('452', '296', '15', '16.00', '16.00', '8.00', '8.00', '2', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-05 17:19:16', null, '2017-06-05 17:19:16');
INSERT INTO `bus_order_dish` VALUES ('453', '297', '15', '16.00', '16.00', '8.00', '8.00', '2', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-05 17:19:29', null, '2017-06-05 17:19:29');
INSERT INTO `bus_order_dish` VALUES ('454', '298', '15', '16.00', '16.00', '8.00', '8.00', '2', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-05 17:19:38', null, '2017-06-05 17:19:38');
INSERT INTO `bus_order_dish` VALUES ('455', '299', '15', '16.00', '16.00', '8.00', '8.00', '2', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-05 17:39:51', null, '2017-06-05 17:39:51');
INSERT INTO `bus_order_dish` VALUES ('456', '300', '15', '16.00', '16.00', '8.00', '8.00', '2', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-05 17:45:30', null, '2017-06-05 17:45:30');
INSERT INTO `bus_order_dish` VALUES ('457', '301', '15', '16.00', '16.00', '8.00', '8.00', '2', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-05 17:45:41', null, '2017-06-05 17:45:41');
INSERT INTO `bus_order_dish` VALUES ('458', '302', '15', '16.00', '16.00', '8.00', '8.00', '2', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-05 17:46:15', null, '2017-06-05 17:46:15');
INSERT INTO `bus_order_dish` VALUES ('459', '303', '15', '16.00', '16.00', '8.00', '8.00', '2', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-05 17:49:22', null, '2017-06-05 17:49:22');
INSERT INTO `bus_order_dish` VALUES ('460', '304', '15', '16.00', '16.00', '8.00', '8.00', '2', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-05 17:49:55', null, '2017-06-05 17:49:55');
INSERT INTO `bus_order_dish` VALUES ('461', '305', '15', '16.00', '16.00', '8.00', '8.00', '2', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-05 18:01:32', null, '2017-06-05 18:01:32');
INSERT INTO `bus_order_dish` VALUES ('462', '306', '15', '16.00', '16.00', '8.00', '8.00', '2', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-05 18:01:38', null, '2017-06-05 18:01:38');
INSERT INTO `bus_order_dish` VALUES ('463', '307', '15', '16.00', '16.00', '8.00', '8.00', '2', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-05 18:01:47', null, '2017-06-05 18:01:47');
INSERT INTO `bus_order_dish` VALUES ('464', '308', '15', '16.00', '16.00', '8.00', '8.00', '2', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-05 18:01:51', null, '2017-06-05 18:01:51');
INSERT INTO `bus_order_dish` VALUES ('465', '309', '15', '16.00', '16.00', '8.00', '8.00', '2', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-05 18:02:35', null, '2017-06-05 18:02:35');
INSERT INTO `bus_order_dish` VALUES ('466', '310', '15', '16.00', '16.00', '8.00', '8.00', '2', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-05 18:03:11', null, '2017-06-05 18:03:11');
INSERT INTO `bus_order_dish` VALUES ('467', '311', '15', '16.00', '16.00', '8.00', '8.00', '2', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-05 18:06:00', null, '2017-06-05 18:06:00');
INSERT INTO `bus_order_dish` VALUES ('468', '312', '15', '16.00', '16.00', '8.00', '8.00', '2', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-05 19:38:51', null, '2017-06-05 19:38:51');
INSERT INTO `bus_order_dish` VALUES ('469', '313', '15', '16.00', '16.00', '8.00', '8.00', '2', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-05 19:40:46', null, '2017-06-05 19:40:46');
INSERT INTO `bus_order_dish` VALUES ('470', '314', '15', '16.00', '16.00', '8.00', '8.00', '2', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-05 19:40:51', null, '2017-06-05 19:40:51');
INSERT INTO `bus_order_dish` VALUES ('471', '315', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 20:14:02', null, '2017-06-06 20:14:02');
INSERT INTO `bus_order_dish` VALUES ('472', '315', '16', '12.00', '12.00', '12.00', '12.00', '1', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 20:14:02', null, '2017-06-06 20:14:02');
INSERT INTO `bus_order_dish` VALUES ('473', '316', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 20:15:31', null, '2017-06-06 20:15:31');
INSERT INTO `bus_order_dish` VALUES ('474', '316', '16', '12.00', '12.00', '12.00', '12.00', '1', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 20:15:31', null, '2017-06-06 20:15:31');
INSERT INTO `bus_order_dish` VALUES ('475', '317', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 20:16:29', null, '2017-06-06 20:16:29');
INSERT INTO `bus_order_dish` VALUES ('476', '317', '16', '12.00', '12.00', '12.00', '12.00', '1', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 20:16:29', null, '2017-06-06 20:16:29');
INSERT INTO `bus_order_dish` VALUES ('477', '318', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 20:18:00', null, '2017-06-06 20:18:00');
INSERT INTO `bus_order_dish` VALUES ('478', '318', '16', '12.00', '12.00', '12.00', '12.00', '1', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 20:18:00', null, '2017-06-06 20:18:00');
INSERT INTO `bus_order_dish` VALUES ('479', '319', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 20:19:59', null, '2017-06-06 20:19:59');
INSERT INTO `bus_order_dish` VALUES ('480', '319', '16', '12.00', '12.00', '12.00', '12.00', '1', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 20:19:59', null, '2017-06-06 20:19:59');
INSERT INTO `bus_order_dish` VALUES ('481', '320', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 20:20:45', null, '2017-06-06 20:20:45');
INSERT INTO `bus_order_dish` VALUES ('482', '320', '16', '12.00', '12.00', '12.00', '12.00', '1', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 20:20:45', null, '2017-06-06 20:20:45');
INSERT INTO `bus_order_dish` VALUES ('483', '321', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 20:26:59', null, '2017-06-06 20:26:59');
INSERT INTO `bus_order_dish` VALUES ('484', '321', '16', '12.00', '12.00', '12.00', '12.00', '1', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 20:26:59', null, '2017-06-06 20:26:59');
INSERT INTO `bus_order_dish` VALUES ('485', '322', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 20:28:49', null, '2017-06-06 20:28:49');
INSERT INTO `bus_order_dish` VALUES ('486', '322', '16', '12.00', '12.00', '12.00', '12.00', '1', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 20:28:49', null, '2017-06-06 20:28:49');
INSERT INTO `bus_order_dish` VALUES ('487', '323', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 20:30:17', null, '2017-06-06 20:30:17');
INSERT INTO `bus_order_dish` VALUES ('488', '323', '16', '12.00', '12.00', '12.00', '12.00', '1', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 20:30:17', null, '2017-06-06 20:30:17');
INSERT INTO `bus_order_dish` VALUES ('489', '324', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 20:45:04', null, '2017-06-06 20:45:04');
INSERT INTO `bus_order_dish` VALUES ('490', '324', '16', '12.00', '12.00', '12.00', '12.00', '1', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 20:45:04', null, '2017-06-06 20:45:04');
INSERT INTO `bus_order_dish` VALUES ('491', '325', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 20:45:42', null, '2017-06-06 20:45:42');
INSERT INTO `bus_order_dish` VALUES ('492', '325', '16', '12.00', '12.00', '12.00', '12.00', '1', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 20:45:42', null, '2017-06-06 20:45:42');
INSERT INTO `bus_order_dish` VALUES ('493', '326', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 20:47:20', null, '2017-06-06 20:47:20');
INSERT INTO `bus_order_dish` VALUES ('494', '326', '16', '12.00', '12.00', '12.00', '12.00', '1', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 20:47:20', null, '2017-06-06 20:47:20');
INSERT INTO `bus_order_dish` VALUES ('495', '327', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 20:48:37', null, '2017-06-06 20:48:37');
INSERT INTO `bus_order_dish` VALUES ('496', '327', '16', '12.00', '12.00', '12.00', '12.00', '1', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 20:48:37', null, '2017-06-06 20:48:37');
INSERT INTO `bus_order_dish` VALUES ('497', '328', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 20:48:53', null, '2017-06-06 20:48:53');
INSERT INTO `bus_order_dish` VALUES ('498', '328', '16', '12.00', '12.00', '12.00', '12.00', '1', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 20:48:53', null, '2017-06-06 20:48:53');
INSERT INTO `bus_order_dish` VALUES ('499', '329', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 20:49:51', null, '2017-06-06 20:49:51');
INSERT INTO `bus_order_dish` VALUES ('500', '329', '16', '12.00', '12.00', '12.00', '12.00', '1', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 20:49:51', null, '2017-06-06 20:49:51');
INSERT INTO `bus_order_dish` VALUES ('501', '330', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 20:50:20', null, '2017-06-06 20:50:20');
INSERT INTO `bus_order_dish` VALUES ('502', '330', '16', '12.00', '12.00', '12.00', '12.00', '1', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 20:50:20', null, '2017-06-06 20:50:20');
INSERT INTO `bus_order_dish` VALUES ('503', '331', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 23:03:37', null, '2017-06-06 23:03:37');
INSERT INTO `bus_order_dish` VALUES ('504', '331', '16', '12.00', '12.00', '12.00', '12.00', '1', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 23:03:37', null, '2017-06-06 23:03:37');
INSERT INTO `bus_order_dish` VALUES ('505', '332', '15', '8.00', '8.00', '8.00', '8.00', '1', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 23:04:31', null, '2017-06-06 23:04:31');
INSERT INTO `bus_order_dish` VALUES ('506', '333', '15', '8.00', '8.00', '8.00', '8.00', '1', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 23:11:01', null, '2017-06-06 23:11:01');
INSERT INTO `bus_order_dish` VALUES ('507', '334', '15', '8.00', '8.00', '8.00', '8.00', '1', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 23:12:06', null, '2017-06-06 23:12:06');
INSERT INTO `bus_order_dish` VALUES ('508', '335', '15', '8.00', '8.00', '8.00', '8.00', '1', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 23:19:12', null, '2017-06-06 23:19:12');
INSERT INTO `bus_order_dish` VALUES ('509', '336', '15', '8.00', '8.00', '8.00', '8.00', '1', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 23:19:20', null, '2017-06-06 23:19:20');
INSERT INTO `bus_order_dish` VALUES ('510', '337', '15', '8.00', '8.00', '8.00', '8.00', '1', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 23:19:28', null, '2017-06-06 23:19:28');
INSERT INTO `bus_order_dish` VALUES ('511', '338', '15', '8.00', '8.00', '8.00', '8.00', '1', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 23:19:42', null, '2017-06-06 23:19:42');
INSERT INTO `bus_order_dish` VALUES ('512', '339', '15', '8.00', '8.00', '8.00', '8.00', '1', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 23:43:42', null, '2017-06-06 23:43:42');
INSERT INTO `bus_order_dish` VALUES ('513', '340', '15', '8.00', '8.00', '8.00', '8.00', '1', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 23:43:53', null, '2017-06-06 23:43:53');
INSERT INTO `bus_order_dish` VALUES ('514', '341', '15', '8.00', '8.00', '8.00', '8.00', '1', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 23:43:59', null, '2017-06-06 23:43:59');
INSERT INTO `bus_order_dish` VALUES ('515', '342', '15', '8.00', '8.00', '8.00', '8.00', '1', null, '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 23:47:54', null, '2017-06-06 23:47:54');
INSERT INTO `bus_order_dish` VALUES ('516', '343', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 23:56:26', null, '2017-06-06 23:56:26');
INSERT INTO `bus_order_dish` VALUES ('517', '344', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-06 23:56:48', null, '2017-06-06 23:56:48');
INSERT INTO `bus_order_dish` VALUES ('518', '345', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 00:06:45', null, '2017-06-07 00:06:45');
INSERT INTO `bus_order_dish` VALUES ('519', '346', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 00:06:59', null, '2017-06-07 00:06:59');
INSERT INTO `bus_order_dish` VALUES ('520', '347', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 00:07:07', null, '2017-06-07 00:07:07');
INSERT INTO `bus_order_dish` VALUES ('521', '348', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 00:07:12', null, '2017-06-07 00:07:12');
INSERT INTO `bus_order_dish` VALUES ('522', '349', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 00:07:32', null, '2017-06-07 00:07:32');
INSERT INTO `bus_order_dish` VALUES ('523', '350', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 00:08:16', null, '2017-06-07 00:08:16');
INSERT INTO `bus_order_dish` VALUES ('524', '351', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 00:08:54', null, '2017-06-07 00:08:54');
INSERT INTO `bus_order_dish` VALUES ('525', '352', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 00:10:41', null, '2017-06-07 00:10:41');
INSERT INTO `bus_order_dish` VALUES ('526', '353', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 00:12:07', null, '2017-06-07 00:12:07');
INSERT INTO `bus_order_dish` VALUES ('527', '354', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 00:12:38', null, '2017-06-07 00:12:38');
INSERT INTO `bus_order_dish` VALUES ('528', '355', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 00:12:42', null, '2017-06-07 00:12:42');
INSERT INTO `bus_order_dish` VALUES ('529', '356', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 00:13:19', null, '2017-06-07 00:13:19');
INSERT INTO `bus_order_dish` VALUES ('530', '357', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 00:16:22', null, '2017-06-07 00:16:22');
INSERT INTO `bus_order_dish` VALUES ('531', '358', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 00:18:02', null, '2017-06-07 00:18:02');
INSERT INTO `bus_order_dish` VALUES ('532', '359', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 00:19:55', null, '2017-06-07 00:19:55');
INSERT INTO `bus_order_dish` VALUES ('533', '360', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 00:20:10', null, '2017-06-07 00:20:10');
INSERT INTO `bus_order_dish` VALUES ('534', '361', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 00:27:57', null, '2017-06-07 00:27:57');
INSERT INTO `bus_order_dish` VALUES ('535', '362', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 09:44:36', null, '2017-06-07 09:44:36');
INSERT INTO `bus_order_dish` VALUES ('536', '363', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 09:49:39', null, '2017-06-07 09:49:39');
INSERT INTO `bus_order_dish` VALUES ('537', '364', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 09:57:29', null, '2017-06-07 09:57:29');
INSERT INTO `bus_order_dish` VALUES ('538', '365', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 10:41:26', null, '2017-06-07 10:41:26');
INSERT INTO `bus_order_dish` VALUES ('539', '366', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 10:45:02', null, '2017-06-07 10:45:02');
INSERT INTO `bus_order_dish` VALUES ('540', '367', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 10:53:56', null, '2017-06-07 10:53:56');
INSERT INTO `bus_order_dish` VALUES ('541', '368', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 10:57:18', null, '2017-06-07 10:57:18');
INSERT INTO `bus_order_dish` VALUES ('542', '369', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 10:59:01', null, '2017-06-07 10:59:01');
INSERT INTO `bus_order_dish` VALUES ('543', '370', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 10:59:39', null, '2017-06-07 10:59:39');
INSERT INTO `bus_order_dish` VALUES ('544', '371', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 11:11:48', null, '2017-06-07 11:11:48');
INSERT INTO `bus_order_dish` VALUES ('545', '372', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 11:16:57', null, '2017-06-07 11:16:57');
INSERT INTO `bus_order_dish` VALUES ('546', '373', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 12:30:10', null, '2017-06-07 12:30:10');
INSERT INTO `bus_order_dish` VALUES ('547', '374', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 12:31:20', null, '2017-06-07 12:31:20');
INSERT INTO `bus_order_dish` VALUES ('548', '375', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 12:33:46', null, '2017-06-07 12:33:46');
INSERT INTO `bus_order_dish` VALUES ('549', '376', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 12:33:56', null, '2017-06-07 12:33:56');
INSERT INTO `bus_order_dish` VALUES ('550', '377', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 12:34:45', null, '2017-06-07 12:34:45');
INSERT INTO `bus_order_dish` VALUES ('551', '378', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 12:37:42', null, '2017-06-07 12:37:42');
INSERT INTO `bus_order_dish` VALUES ('552', '379', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 12:37:57', null, '2017-06-07 12:37:57');
INSERT INTO `bus_order_dish` VALUES ('553', '380', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 12:52:38', null, '2017-06-07 12:52:38');
INSERT INTO `bus_order_dish` VALUES ('554', '381', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 12:54:00', null, '2017-06-07 12:54:00');
INSERT INTO `bus_order_dish` VALUES ('555', '382', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 17:14:06', null, '2017-06-07 17:14:06');
INSERT INTO `bus_order_dish` VALUES ('556', '383', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 18:35:33', null, '2017-06-07 18:35:33');
INSERT INTO `bus_order_dish` VALUES ('557', '384', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 18:42:14', null, '2017-06-07 18:42:14');
INSERT INTO `bus_order_dish` VALUES ('558', '385', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 18:43:11', null, '2017-06-07 18:43:11');
INSERT INTO `bus_order_dish` VALUES ('559', '386', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 18:44:33', null, '2017-06-07 18:44:33');
INSERT INTO `bus_order_dish` VALUES ('560', '387', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 18:45:07', null, '2017-06-07 18:45:07');
INSERT INTO `bus_order_dish` VALUES ('561', '388', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 19:08:06', null, '2017-06-07 19:08:06');
INSERT INTO `bus_order_dish` VALUES ('562', '389', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 20:41:45', null, '2017-06-07 20:41:45');
INSERT INTO `bus_order_dish` VALUES ('563', '390', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 20:43:25', null, '2017-06-07 20:43:25');
INSERT INTO `bus_order_dish` VALUES ('564', '391', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 20:44:22', null, '2017-06-07 20:44:22');
INSERT INTO `bus_order_dish` VALUES ('565', '392', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 21:25:53', null, '2017-06-07 21:25:53');
INSERT INTO `bus_order_dish` VALUES ('566', '393', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 21:45:56', null, '2017-06-07 21:45:56');
INSERT INTO `bus_order_dish` VALUES ('567', '394', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 21:46:12', null, '2017-06-07 21:46:12');
INSERT INTO `bus_order_dish` VALUES ('568', '395', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 21:49:14', null, '2017-06-07 21:49:14');
INSERT INTO `bus_order_dish` VALUES ('569', '396', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 22:05:47', null, '2017-06-07 22:05:47');
INSERT INTO `bus_order_dish` VALUES ('570', '397', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 22:07:36', null, '2017-06-07 22:07:36');
INSERT INTO `bus_order_dish` VALUES ('571', '398', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 22:10:58', null, '2017-06-07 22:10:58');
INSERT INTO `bus_order_dish` VALUES ('572', '399', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 22:14:08', null, '2017-06-07 22:14:08');
INSERT INTO `bus_order_dish` VALUES ('573', '399', '16', '48.00', '48.00', '12.00', '12.00', '4', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-07 22:14:08', null, '2017-06-07 22:14:08');
INSERT INTO `bus_order_dish` VALUES ('574', '400', '27', '65.00', '65.00', '65.00', '65.00', '1', null, '红烧肉', '红烧肉', '10', '上海1号私藏菜', 'ShangHai No.1', '1', '0', null, null, '2017-06-07 23:25:57', null, '2017-06-07 23:25:57');
INSERT INTO `bus_order_dish` VALUES ('575', '401', '27', '65.00', '65.00', '65.00', '65.00', '1', null, '红烧肉', '红烧肉', '10', '上海1号私藏菜', 'ShangHai No.1', '1', '0', null, null, '2017-06-07 23:27:34', null, '2017-06-07 23:27:34');
INSERT INTO `bus_order_dish` VALUES ('576', '402', '21', '200.00', '200.00', '100.00', '100.00', '2', null, '和风牛肉饭', '和风牛肉饭', '8', '纱羅餐精致料理', '纱羅餐精致料理', '1', '0', null, null, '2017-06-07 23:28:33', null, '2017-06-07 23:28:33');
INSERT INTO `bus_order_dish` VALUES ('577', '403', '15', '8.00', '8.00', '8.00', '8.00', '1', '[{\"sizeId\":17,\"sizeName\":\"标准装\",\"sizePrice\":0}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-08 00:22:44', null, '2017-06-08 00:22:44');
INSERT INTO `bus_order_dish` VALUES ('578', '404', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-08 00:23:49', null, '2017-06-08 00:23:49');
INSERT INTO `bus_order_dish` VALUES ('579', '404', '16', '48.00', '48.00', '12.00', '12.00', '4', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-08 00:23:49', null, '2017-06-08 00:23:49');
INSERT INTO `bus_order_dish` VALUES ('580', '405', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-08 07:36:48', null, '2017-06-08 07:36:48');
INSERT INTO `bus_order_dish` VALUES ('581', '405', '16', '36.00', '36.00', '12.00', '12.00', '3', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-08 07:36:48', null, '2017-06-08 07:36:48');
INSERT INTO `bus_order_dish` VALUES ('582', '406', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-12 08:07:25', null, '2017-06-12 08:07:25');
INSERT INTO `bus_order_dish` VALUES ('583', '406', '16', '24.00', '24.00', '12.00', '12.00', '2', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-12 08:07:25', null, '2017-06-12 08:07:25');
INSERT INTO `bus_order_dish` VALUES ('584', '407', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-12 08:07:33', null, '2017-06-12 08:07:33');
INSERT INTO `bus_order_dish` VALUES ('585', '407', '16', '24.00', '24.00', '12.00', '12.00', '2', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-12 08:07:33', null, '2017-06-12 08:07:33');
INSERT INTO `bus_order_dish` VALUES ('586', '408', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-12 08:07:45', null, '2017-06-12 08:07:45');
INSERT INTO `bus_order_dish` VALUES ('587', '408', '16', '24.00', '24.00', '12.00', '12.00', '2', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-12 08:07:45', null, '2017-06-12 08:07:45');
INSERT INTO `bus_order_dish` VALUES ('588', '409', '29', '1.00', '1.00', '1.00', '1.00', '1', null, '一元餐', 'OneDollar', '8', '纱羅餐精致料理', '纱羅餐精致料理', '1', '0', null, null, '2017-06-12 14:21:44', null, '2017-06-12 14:21:44');
INSERT INTO `bus_order_dish` VALUES ('589', '410', '29', '1.00', '1.00', '1.00', '1.00', '1', null, '一元餐', 'OneDollar', '8', '纱羅餐精致料理', '纱羅餐精致料理', '1', '0', null, null, '2017-06-15 10:32:43', null, '2017-06-15 10:32:43');
INSERT INTO `bus_order_dish` VALUES ('590', '411', '29', '1.00', '1.00', '1.00', '1.00', '1', null, '一元餐', 'OneDollar', '8', '纱羅餐精致料理', '纱羅餐精致料理', '2', '0', null, null, '2017-06-15 10:32:54', null, '2017-06-15 10:32:54');
INSERT INTO `bus_order_dish` VALUES ('591', '412', '16', '60.00', '60.00', '12.00', '12.00', '5', null, '牛肉煲', '牛肉煲', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-15 10:33:38', null, '2017-06-15 10:33:38');
INSERT INTO `bus_order_dish` VALUES ('592', '413', '28', '400.00', '400.00', '80.00', '80.00', '5', null, '熏鱼', '熏鱼', '10', '上海1号私藏菜', 'ShangHai No.1', '1', '0', null, null, '2017-06-15 10:34:22', null, '2017-06-15 10:34:22');
INSERT INTO `bus_order_dish` VALUES ('593', '414', '17', '84.00', '84.00', '21.00', '21.00', '4', null, '米夫子蒸排骨', 'rib', '6', '湘水山庄', 'Hunan Manor', '1', '0', null, null, '2017-06-15 10:34:35', null, '2017-06-15 10:34:35');
INSERT INTO `bus_order_dish` VALUES ('594', '415', '27', '70.00', '70.00', '65.00', '65.00', '1', '[{\"sizeId\":20,\"sizeName\":\"超大份\",\"sizePrice\":5}]', '红烧肉', '红烧肉', '10', '上海1号私藏菜', 'ShangHai No.1', '2', '0', null, null, '2017-06-15 10:57:04', null, '2017-06-15 10:57:04');
INSERT INTO `bus_order_dish` VALUES ('595', '416', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-15 00:23:44', null, '2017-06-15 00:23:44');
INSERT INTO `bus_order_dish` VALUES ('596', '417', '15', '13.00', '13.00', '8.00', '8.00', '1', '[{\"sizeId\":16,\"sizeName\":\"大薯条\",\"sizePrice\":5}]', '薯条', '薯条', '4', '麦当劳', 'McDonald', '1', '0', null, null, '2017-06-15 06:03:44', null, '2017-06-15 06:03:44');

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
  `is_delete` int(11) NOT NULL DEFAULT '2',
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_payment
-- ----------------------------
INSERT INTO `bus_payment` VALUES ('12', '1', '1', '11.00', '178', '20028', '9', '1', 'token:tok_1ANHtlAEM5k6wIOLO8AwFr61;', null, '2017-05-25 17:04:50', null, '2017-05-25 17:04:50');
INSERT INTO `bus_payment` VALUES ('13', '1', '1', '270.00', '206', '20028', '11', '1', 'token:tok_1ANemtAEM5k6wIOLZxuLjRcS;', null, '2017-05-26 17:31:18', null, '2017-05-26 17:31:18');
INSERT INTO `bus_payment` VALUES ('14', '1', '1', '156.00', '207', '20028', '12', '1', 'token:tok_1ANeuhAEM5k6wIOLAvksSXLm;', null, '2017-05-26 17:39:20', null, '2017-05-26 17:39:20');
INSERT INTO `bus_payment` VALUES ('15', '1', '1', '250.00', '228', '20028', '13', '1', 'token:tok_1APTezAEM5k6wIOLGa532z4h;', null, '2017-05-31 18:02:34', null, '2017-05-31 18:02:34');
INSERT INTO `bus_payment` VALUES ('16', '1', '1', '155.00', '248', '20021', '14', '0', 'token:tok_1APWvgAEM5k6wIOLyPvSPpXJ;', null, '2017-05-31 21:32:11', null, '2017-05-31 21:32:11');
INSERT INTO `bus_payment` VALUES ('17', '1', '1', '162.00', '250', '20028', '15', '0', 'token:tok_1APjmWAEM5k6wIOLJXw7JNbI;', null, '2017-06-01 11:15:30', null, '2017-06-01 11:15:30');
INSERT INTO `bus_payment` VALUES ('18', '1', '1', '151.00', '251', '20028', '16', '0', 'token:tok_1APjnvAEM5k6wIOLw1kx3VFm;', null, '2017-06-01 11:16:57', null, '2017-06-01 11:16:57');
INSERT INTO `bus_payment` VALUES ('19', '1', '1', '184.00', '253', '20028', '17', '0', 'token:tok_1APn57AEM5k6wIOLo2NMX0vw;', null, '2017-06-01 14:46:55', null, '2017-06-01 14:46:55');
INSERT INTO `bus_payment` VALUES ('20', '1', '1', '219.00', '254', '20028', '18', '1', 'token:tok_1APn6TAEM5k6wIOL8UO2lE5Q;', null, '2017-06-01 14:48:19', null, '2017-06-01 14:48:19');
INSERT INTO `bus_payment` VALUES ('21', '1', '1', '495.00', '256', '20028', '19', '0', 'token:tok_1APnBYAEM5k6wIOLu4TFA3rq;', null, '2017-06-01 14:53:34', null, '2017-06-01 14:53:34');
INSERT INTO `bus_payment` VALUES ('22', '1', '1', '128.00', '258', '20033', '20', '0', 'token:tok_1APug9AEM5k6wIOLGobyEYXU;', null, '2017-06-01 22:53:41', null, '2017-06-01 22:53:41');
INSERT INTO `bus_payment` VALUES ('23', '1', '1', '163.00', '259', '20033', '21', '0', 'token:tok_1APuhPAEM5k6wIOLJkhlPWMk;', null, '2017-06-01 22:54:57', null, '2017-06-01 22:54:57');
INSERT INTO `bus_payment` VALUES ('24', '1', '1', '151.00', '270', '20028', '22', '0', 'token:tok_1AQSBHAEM5k6wIOLPWJh3CQu;', null, '2017-06-03 10:40:01', null, '2017-06-03 10:40:01');
INSERT INTO `bus_payment` VALUES ('25', '1', '1', '100.00', '271', '20028', '23', '0', 'token:tok_1AQSqCAEM5k6wIOLdbmn6XtC;', null, '2017-06-03 11:22:18', null, '2017-06-03 11:22:18');
INSERT INTO `bus_payment` VALUES ('26', '1', '1', '1.00', '280', '20028', '24', '0', 'token:tok_1ARBWIAEM5k6wIOLiUpGkwVC;', null, '2017-06-05 11:04:45', null, '2017-06-05 11:04:45');
INSERT INTO `bus_payment` VALUES ('27', '1', '1', '25.00', '331', '20033', '28', '0', 'token:tok_1ARjDsAEM5k6wIOLaWKuZObT;', null, '2017-06-06 23:03:58', null, '2017-06-06 23:03:58');
INSERT INTO `bus_payment` VALUES ('28', '1', '1', '13.00', '382', '20039', '30', '0', 'token:card_1ARkGtAEM5k6wIOLr0CjHaTk;', null, '2017-06-07 17:14:15', null, '2017-06-07 17:14:15');
INSERT INTO `bus_payment` VALUES ('29', '1', '1', '13.00', '384', '20039', '31', '0', 'token:card_1ARkGtAEM5k6wIOLr0CjHaTk;', null, '2017-06-07 18:42:40', null, '2017-06-07 18:42:40');
INSERT INTO `bus_payment` VALUES ('30', '1', '1', '13.00', '390', '20042', '32', '0', 'token:card_1AS3U9AEM5k6wIOLW2ZorPiN;', null, '2017-06-07 20:43:40', null, '2017-06-07 20:43:40');
INSERT INTO `bus_payment` VALUES ('31', '1', '1', '13.00', '398', '20054', '33', '0', 'token:card_1AS4s6AEM5k6wIOLjgBeRGb1;', null, '2017-06-07 22:11:14', null, '2017-06-07 22:11:14');
INSERT INTO `bus_payment` VALUES ('32', '1', '1', '61.00', '399', '20054', '34', '0', 'token:card_1AS4s6AEM5k6wIOLjgBeRGb1;', null, '2017-06-07 22:14:16', null, '2017-06-07 22:14:16');
INSERT INTO `bus_payment` VALUES ('33', '1', '1', '65.00', '400', '20028', '35', '0', 'token:card_1ARariAEM5k6wIOLpxiUFtXi;', null, '2017-06-07 23:26:10', null, '2017-06-07 23:26:10');
INSERT INTO `bus_payment` VALUES ('34', '1', '1', '65.00', '401', '20055', '36', '0', 'token:card_1AS64GAEM5k6wIOLKnRgPvsm;', null, '2017-06-07 23:27:40', null, '2017-06-07 23:27:40');
INSERT INTO `bus_payment` VALUES ('35', '1', '1', '195.00', '402', '20055', '37', '0', 'token:card_1AS64GAEM5k6wIOLKnRgPvsm;', null, '2017-06-07 23:28:44', null, '2017-06-07 23:28:44');
INSERT INTO `bus_payment` VALUES ('36', '1', '1', '8.00', '403', '20054', '38', '0', 'token:card_1AS4s6AEM5k6wIOLjgBeRGb1;', null, '2017-06-08 00:22:49', null, '2017-06-08 00:22:49');
INSERT INTO `bus_payment` VALUES ('37', '1', '1', '61.00', '404', '20056', '39', '0', 'token:card_1AS6whAEM5k6wIOLHgJ0HmRG;', null, '2017-06-08 00:23:53', null, '2017-06-08 00:23:53');
INSERT INTO `bus_payment` VALUES ('38', '1', '1', '49.00', '405', '20056', '40', '0', 'token:card_1AS6whAEM5k6wIOLHgJ0HmRG;', null, '2017-06-08 07:36:55', null, '2017-06-08 07:36:55');
INSERT INTO `bus_payment` VALUES ('39', '1', '1', '1.00', '409', '20028', '41', '0', 'token:card_1ATlvlAEM5k6wIOL3kaYQCu2;', null, '2017-06-12 14:21:50', null, '2017-06-12 14:21:50');
INSERT INTO `bus_payment` VALUES ('40', '1', '3', '1.00', '409', '20028', '41', '0', 're_1ATlyHAEM5k6wIOLAJPcq5ku', null, '2017-06-12 14:24:18', null, '2017-06-12 14:24:18');

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
  `address_url` varchar(2000) DEFAULT NULL,
  `sort` int(11) DEFAULT '0',
  `is_delete` int(11) NOT NULL DEFAULT '2',
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_pickup_address
-- ----------------------------
INSERT INTO `bus_pickup_address` VALUES ('8', '1001', '自提点1', '上海市徐汇区凌云路365号', '0', '121.4194053', '31.1364602', '1', '20014', null, '1', '1', '\n                    ', null, null, null, null);
INSERT INTO `bus_pickup_address` VALUES ('9', '1002', '自提点2', '上海市宝山区聚丰园路205号', '0', '121.3829289', '31.3151939', '1', '20015', null, '2', '1', '\n                    ', null, null, null, null);
INSERT INTO `bus_pickup_address` VALUES ('12', '1', 'Hartford领餐点', '100 Constitution Plaza, Hartford, CT, 06103', '0', '-72.4717261', '41.5671242', '1', '20019', null, '1', '0', 'Kinsley St', null, null, null, null);
INSERT INTO `bus_pickup_address` VALUES ('13', '2', 'Storrs领餐点', '1244 Storrs Rd, Storrs, CT 06268', '0', '-72.6717461', '41.7671242', '1', '20018', null, '2', '0', '张家园后停车场', null, null, null, null);
INSERT INTO `bus_pickup_address` VALUES ('14', '3', '恐龙园自提点', '新北区黄河中路88号', '0', '72.6717461', '41.7671242', '1', '20014', null, '0', '1', '\n                    ', null, null, null, null);
INSERT INTO `bus_pickup_address` VALUES ('15', '101', '虹桥路地铁站', '虹桥路地铁站1号口', '0', '121.4207820', '31.1979420', '1', '20034', null, '0', '0', '熊伟用来测试的自提点', null, null, null, null);
INSERT INTO `bus_pickup_address` VALUES ('16', '102', '杨思路地铁站', '杨思路地铁站2号口', '0', '121.4941170', '31.1611350', '1', '20034', 'http://olamk7iwq.bkt.gdipper.com/pick_16_20170601_0319', '0', '0', '杨思路地铁站', null, null, null, null);
INSERT INTO `bus_pickup_address` VALUES ('17', '103', '宜山路地铁站', '宜山路地铁站4号口', '0', '121.4266980', '31.1874450', '1', '20034', 'http://olamk7iwq.bkt.gdipper.com/pick_17_20170601_0957', '0', '0', '熊伟家的取餐点', null, null, null, null);

-- ----------------------------
-- Table structure for `bus_pickup_market`
-- ----------------------------
DROP TABLE IF EXISTS `bus_pickup_market`;
CREATE TABLE `bus_pickup_market` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pickup_address_id` int(11) NOT NULL,
  `market_id` int(11) NOT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '2',
  `sort` int(11) DEFAULT '0',
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_pickup_market
-- ----------------------------
INSERT INTO `bus_pickup_market` VALUES ('135', '12', '4', '0', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_market` VALUES ('136', '13', '4', '0', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_market` VALUES ('137', '15', '4', '0', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_market` VALUES ('138', '16', '4', '0', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_market` VALUES ('139', '12', '3', '0', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_market` VALUES ('140', '13', '3', '0', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_market` VALUES ('141', '15', '3', '0', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_market` VALUES ('142', '16', '3', '0', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_market` VALUES ('156', '15', '10', '0', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_market` VALUES ('157', '16', '10', '0', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_market` VALUES ('158', '17', '10', '0', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_market` VALUES ('159', '12', '8', '0', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_market` VALUES ('160', '13', '8', '0', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_market` VALUES ('161', '15', '8', '0', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_market` VALUES ('162', '16', '8', '0', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_market` VALUES ('163', '17', '8', '0', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_market` VALUES ('164', '12', '6', '0', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_market` VALUES ('165', '13', '6', '0', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_market` VALUES ('166', '15', '6', '0', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_market` VALUES ('167', '16', '6', '0', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_market` VALUES ('168', '17', '6', '0', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_market` VALUES ('169', '12', '5', '0', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_market` VALUES ('170', '13', '5', '0', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_market` VALUES ('171', '15', '5', '0', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_market` VALUES ('172', '16', '5', '0', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_market` VALUES ('173', '17', '5', '0', '0', null, null, null, null, null);

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
  `is_delete` int(11) NOT NULL DEFAULT '2',
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_pickup_times
-- ----------------------------
INSERT INTO `bus_pickup_times` VALUES ('12', '12', '1', '1', '12:00:00', '13:00:00', '0', '', null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('13', '12', '1', '2', '18:00:00', '20:00:00', '0', '', null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('14', '12', '2', '2', '18:00:00', '20:00:00', '0', '', null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('15', '12', '2', '1', '12:00:00', '13:00:00', '0', '', null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('16', '12', '3', '1', '12:00:00', '13:08:00', '0', '', null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('17', '12', '3', '2', '18:00:00', '18:12:00', '0', '', null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('18', '12', '4', '1', '12:00:00', '13:12:00', '0', '', null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('19', '12', '4', '2', '16:00:00', '20:12:00', '0', '', null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('20', '13', '5', '2', '20:00:00', '21:00:00', '0', '', null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('21', '13', '5', '1', '12:00:00', '12:20:00', '0', '', null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('22', '13', '6', '2', '18:30:00', '18:50:00', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('23', '13', '7', '2', '18:30:00', '18:50:00', '0', '', null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('24', '13', '4', '1', '12:00:00', '12:20:00', '0', '', null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('25', '13', '3', '2', '18:30:00', '18:50:00', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('26', '12', '6', '2', '18:00:00', '18:20:00', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('28', '12', '5', '1', '12:00:00', '12:12:00', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('29', '12', '5', '2', '18:00:00', '18:12:00', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('30', '12', '6', '1', '12:00:00', '12:12:00', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('32', '12', '7', '1', '12:00:00', '12:12:00', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('33', '12', '7', '2', '18:00:00', '18:12:00', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('34', '15', '1', '1', '19:00:00', '19:30:00', '1', '', null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('35', '15', '2', '1', '19:00:00', '19:30:00', '1', '', null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('36', '15', '1', '1', '11:30:00', '11:45:00', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('37', '15', '2', '1', '11:30:00', '11:45:00', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('38', '15', '3', '1', '11:30:00', '11:45:00', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('39', '15', '4', '1', '11:30:00', '11:45:00', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('40', '15', '5', '1', '11:30:00', '11:45:00', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('41', '15', '6', '1', '11:30:00', '11:45:00', '1', '', null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('42', '15', '6', '1', '11:30:00', '12:00:00', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('43', '16', '1', '1', '12:30:00', '12:50:00', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('44', '16', '2', '1', '12:30:00', '12:50:00', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('45', '16', '3', '1', '12:30:00', '12:50:00', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('46', '16', '4', '1', '12:30:00', '12:50:00', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('47', '16', '5', '1', '12:30:00', '12:50:00', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('48', '16', '6', '1', '12:30:00', '12:50:00', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('49', '16', '1', '2', '17:40:00', '18:00:00', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('50', '16', '2', '2', '17:40:00', '18:00:00', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('51', '16', '3', '2', '17:40:00', '18:00:00', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('52', '16', '4', '2', '17:40:00', '18:00:00', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('53', '16', '5', '2', '17:40:00', '18:00:00', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('54', '16', '6', '2', '17:40:00', '18:00:00', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('55', '17', '1', '1', '10:40:00', '10:55:00', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('56', '17', '2', '1', '10:40:00', '10:55:00', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('57', '17', '3', '1', '10:40:00', '10:55:00', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('58', '17', '4', '1', '10:40:00', '10:55:00', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('59', '17', '5', '1', '10:40:00', '10:55:00', '0', null, null, null, null, null);
INSERT INTO `bus_pickup_times` VALUES ('60', '16', '7', '2', '17:00:00', '17:35:00', '0', null, null, null, null, null);

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
  `is_delete` int(11) NOT NULL DEFAULT '2',
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
-- Table structure for `bus_stripe_pay`
-- ----------------------------
DROP TABLE IF EXISTS `bus_stripe_pay`;
CREATE TABLE `bus_stripe_pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(200) DEFAULT NULL,
  `card_id` varchar(200) NOT NULL,
  `customer_id` varchar(200) DEFAULT NULL,
  `charge_id` varchar(200) DEFAULT NULL,
  `refund_id` varchar(200) DEFAULT NULL,
  `currency` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL,
  `desc` varchar(2000) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '2',
  `is_delete` int(11) NOT NULL DEFAULT '2',
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_stripe_pay
-- ----------------------------
INSERT INTO `bus_stripe_pay` VALUES ('9', '178', '20028', 'tok_1ANHtlAEM5k6wIOLO8AwFr61', 'card_1ANHtlAEM5k6wIOLCP2ExUaw', null, 'ch_1ANHtnAEM5k6wIOLO5FQ8N3S', null, 'usd', '1100', 'token:tok_1ANHtlAEM5k6wIOLO8AwFr61;', '1', '1', null, null, '2017-05-25 17:04:49', null, '2017-05-25 17:04:49');
INSERT INTO `bus_stripe_pay` VALUES ('10', '200', '20028', 'tok_1ANdQYAEM5k6wIOLF6e0uAvA', 'card_1ANdQYAEM5k6wIOLzhkRyJut', null, '', null, 'usd', '11400', 'token:tok_1ANdQYAEM5k6wIOLF6e0uAvA;', '0', '1', null, null, '2017-05-26 16:04:07', null, '2017-05-26 16:04:07');
INSERT INTO `bus_stripe_pay` VALUES ('11', '206', '20028', 'tok_1ANemtAEM5k6wIOLZxuLjRcS', 'card_1ANemtAEM5k6wIOLAWb4Qg7X', null, 'ch_1ANemvAEM5k6wIOL11kx3lcy', null, 'usd', '27000', 'token:tok_1ANemtAEM5k6wIOLZxuLjRcS;', '1', '1', null, null, '2017-05-26 17:31:17', null, '2017-05-26 17:31:17');
INSERT INTO `bus_stripe_pay` VALUES ('12', '207', '20028', 'tok_1ANeuhAEM5k6wIOLAvksSXLm', 'card_1ANeuhAEM5k6wIOLxPOBVso7', null, 'ch_1ANeuiAEM5k6wIOLexQg2513', null, 'usd', '15600', 'token:tok_1ANeuhAEM5k6wIOLAvksSXLm;', '1', '1', null, null, '2017-05-26 17:39:20', null, '2017-05-26 17:39:20');
INSERT INTO `bus_stripe_pay` VALUES ('13', '228', '20028', 'tok_1APTezAEM5k6wIOLGa532z4h', 'card_1APTezAEM5k6wIOLVjYPZ3Ct', null, 'ch_1APTf0AEM5k6wIOLUQwa5RWm', null, 'usd', '25000', 'token:tok_1APTezAEM5k6wIOLGa532z4h;', '1', '1', null, null, '2017-05-31 18:02:34', null, '2017-05-31 18:02:34');
INSERT INTO `bus_stripe_pay` VALUES ('14', '248', '20021', 'tok_1APWvgAEM5k6wIOLyPvSPpXJ', 'card_1APWvgAEM5k6wIOLfCQ1ihB4', null, 'ch_1APWvrAEM5k6wIOLybh04MDI', null, 'usd', '15500', 'token:tok_1APWvgAEM5k6wIOLyPvSPpXJ;', '1', '0', null, null, '2017-05-31 21:32:11', null, '2017-05-31 21:32:11');
INSERT INTO `bus_stripe_pay` VALUES ('15', '250', '20028', 'tok_1APjmWAEM5k6wIOLJXw7JNbI', 'card_1APjmWAEM5k6wIOLHHcoZU0d', null, 'ch_1APjmXAEM5k6wIOLBHgH1IDA', null, 'usd', '16200', 'token:tok_1APjmWAEM5k6wIOLJXw7JNbI;', '1', '0', null, null, '2017-06-01 11:15:30', null, '2017-06-01 11:15:30');
INSERT INTO `bus_stripe_pay` VALUES ('16', '251', '20028', 'tok_1APjnvAEM5k6wIOLw1kx3VFm', 'card_1APjnvAEM5k6wIOLVJO1HqhV', null, 'ch_1APjnwAEM5k6wIOLeOfYUI9F', null, 'usd', '15100', 'token:tok_1APjnvAEM5k6wIOLw1kx3VFm;', '1', '0', null, null, '2017-06-01 11:16:56', null, '2017-06-01 11:16:56');
INSERT INTO `bus_stripe_pay` VALUES ('17', '253', '20028', 'tok_1APn57AEM5k6wIOLo2NMX0vw', 'card_1APn57AEM5k6wIOL4YQdvofL', null, 'ch_1APn58AEM5k6wIOLh7D2Sknk', null, 'usd', '18400', 'token:tok_1APn57AEM5k6wIOLo2NMX0vw;', '1', '0', null, null, '2017-06-01 14:46:55', null, '2017-06-01 14:46:55');
INSERT INTO `bus_stripe_pay` VALUES ('18', '254', '20028', 'tok_1APn6TAEM5k6wIOL8UO2lE5Q', 'card_1APn6TAEM5k6wIOLobBzMaBl', null, 'ch_1APn6UAEM5k6wIOLLnjMaWqu', null, 'usd', '21900', 'token:tok_1APn6TAEM5k6wIOL8UO2lE5Q;', '1', '1', null, null, '2017-06-01 14:48:19', null, '2017-06-01 14:48:19');
INSERT INTO `bus_stripe_pay` VALUES ('19', '256', '20028', 'tok_1APnBYAEM5k6wIOLu4TFA3rq', 'card_1APnBYAEM5k6wIOL1XCYOzIN', null, 'ch_1APnBZAEM5k6wIOLxEpBADrq', null, 'usd', '49500', 'token:tok_1APnBYAEM5k6wIOLu4TFA3rq;', '1', '0', null, null, '2017-06-01 14:53:34', null, '2017-06-01 14:53:34');
INSERT INTO `bus_stripe_pay` VALUES ('20', '258', '20033', 'tok_1APug9AEM5k6wIOLGobyEYXU', 'card_1APug9AEM5k6wIOLM8qO1y5V', null, 'ch_1APugBAEM5k6wIOLApcK5wlT', null, 'usd', '12800', 'token:tok_1APug9AEM5k6wIOLGobyEYXU;', '1', '0', null, null, '2017-06-01 22:53:41', null, '2017-06-01 22:53:41');
INSERT INTO `bus_stripe_pay` VALUES ('21', '259', '20033', 'tok_1APuhPAEM5k6wIOLJkhlPWMk', 'card_1APuhPAEM5k6wIOLizJPaPHg', null, 'ch_1APuhPAEM5k6wIOLZ3QJ88ob', null, 'usd', '16300', 'token:tok_1APuhPAEM5k6wIOLJkhlPWMk;', '1', '0', null, null, '2017-06-01 22:54:57', null, '2017-06-01 22:54:57');
INSERT INTO `bus_stripe_pay` VALUES ('22', '270', '20028', 'tok_1AQSBHAEM5k6wIOLPWJh3CQu', 'card_1AQSBHAEM5k6wIOLDBNq4Q7m', null, 'ch_1AQSBIAEM5k6wIOL9fefgIwL', null, 'usd', '15100', 'token:tok_1AQSBHAEM5k6wIOLPWJh3CQu;', '1', '0', null, null, '2017-06-03 10:40:01', null, '2017-06-03 10:40:01');
INSERT INTO `bus_stripe_pay` VALUES ('23', '271', '20028', 'tok_1AQSqCAEM5k6wIOLdbmn6XtC', 'card_1AQSqCAEM5k6wIOLmtNN8snT', null, 'ch_1AQSqDAEM5k6wIOLQvPGDzHu', null, 'usd', '10000', 'token:tok_1AQSqCAEM5k6wIOLdbmn6XtC;', '1', '0', null, null, '2017-06-03 11:22:17', null, '2017-06-03 11:22:17');
INSERT INTO `bus_stripe_pay` VALUES ('24', '280', '20028', 'tok_1ARBWIAEM5k6wIOLiUpGkwVC', 'card_1ARBWIAEM5k6wIOLDx7kkZma', null, 'ch_1ARBWJAEM5k6wIOLzWkdDc1j', null, 'usd', '100', 'token:tok_1ARBWIAEM5k6wIOLiUpGkwVC;', '1', '0', null, null, '2017-06-05 11:04:43', null, '2017-06-05 11:04:43');
INSERT INTO `bus_stripe_pay` VALUES ('25', '324', '20033', 'tok_1ARh3oAEM5k6wIOLRL2CPVG6', 'card_1ARh3oAEM5k6wIOLoHb6wRV0', null, '', null, 'usd', '2500', 'token:tok_1ARh3oAEM5k6wIOLRL2CPVG6;', '0', '0', null, null, '2017-06-06 20:45:27', null, '2017-06-06 20:45:27');
INSERT INTO `bus_stripe_pay` VALUES ('26', '325', '20033', 'tok_1ARh4QAEM5k6wIOLbr7oKosO', 'card_1ARh4QAEM5k6wIOLaPum3dxk', null, '', null, 'usd', '2500', 'token:tok_1ARh4QAEM5k6wIOLbr7oKosO;', '0', '0', null, null, '2017-06-06 20:46:41', null, '2017-06-06 20:46:41');
INSERT INTO `bus_stripe_pay` VALUES ('27', '326', '20033', 'tok_1ARh5zAEM5k6wIOLiqKyyuyM', 'card_1ARh5yAEM5k6wIOLfvrLUEIj', null, '', null, 'usd', '2500', 'token:tok_1ARh5zAEM5k6wIOLiqKyyuyM;', '0', '0', null, null, '2017-06-06 20:47:41', null, '2017-06-06 20:47:41');
INSERT INTO `bus_stripe_pay` VALUES ('28', '331', '20033', 'tok_1ARjDsAEM5k6wIOLaWKuZObT', 'card_1ARjDsAEM5k6wIOL66IyQTjr', null, 'ch_1ARjDtAEM5k6wIOLq95RmZaK', null, 'usd', '2500', 'token:tok_1ARjDsAEM5k6wIOLaWKuZObT;', '1', '0', null, null, '2017-06-06 23:03:57', null, '2017-06-06 23:03:57');
INSERT INTO `bus_stripe_pay` VALUES ('29', '332', '20033', 'tok_1ARjEhAEM5k6wIOL4kOfePTZ', 'card_1ARjEhAEM5k6wIOLQiNhvpkj', null, '', null, 'usd', '800', 'token:tok_1ARjEhAEM5k6wIOL4kOfePTZ;', '0', '0', null, null, '2017-06-06 23:04:50', null, '2017-06-06 23:04:50');
INSERT INTO `bus_stripe_pay` VALUES ('30', '382', '20039', 'card_1ARkGtAEM5k6wIOLr0CjHaTk', 'card_1ARkGtAEM5k6wIOLr0CjHaTk', 'cus_AnKw0LPG3dEnVh', 'ch_1AS0F1AEM5k6wIOLEUlkMVln', null, 'usd', '1300', 'token:card_1ARkGtAEM5k6wIOLr0CjHaTk;', '1', '0', null, null, '2017-06-07 17:14:15', null, '2017-06-07 17:14:15');
INSERT INTO `bus_stripe_pay` VALUES ('31', '384', '20039', 'card_1ARkGtAEM5k6wIOLr0CjHaTk', 'card_1ARkGtAEM5k6wIOLr0CjHaTk', 'cus_AnKw0LPG3dEnVh', 'ch_1AS1cZAEM5k6wIOLOu7BALOM', null, 'usd', '1300', 'token:card_1ARkGtAEM5k6wIOLr0CjHaTk;', '1', '0', null, null, '2017-06-07 18:42:39', null, '2017-06-07 18:42:39');
INSERT INTO `bus_stripe_pay` VALUES ('32', '390', '20042', 'card_1AS3U9AEM5k6wIOLW2ZorPiN', 'card_1AS3U9AEM5k6wIOLW2ZorPiN', 'cus_AnenWPEnVbLcAH', 'ch_1AS3VfAEM5k6wIOLb5GTurgO', null, 'usd', '1300', 'token:card_1AS3U9AEM5k6wIOLW2ZorPiN;', '1', '0', null, null, '2017-06-07 20:43:39', null, '2017-06-07 20:43:39');
INSERT INTO `bus_stripe_pay` VALUES ('33', '398', '20054', 'card_1AS4s6AEM5k6wIOLjgBeRGb1', 'card_1AS4s6AEM5k6wIOLjgBeRGb1', 'cus_AngEzOnKU65fUJ', 'ch_1AS4sPAEM5k6wIOLp2svX60Z', null, 'usd', '1300', 'token:card_1AS4s6AEM5k6wIOLjgBeRGb1;', '1', '0', null, null, '2017-06-07 22:11:13', null, '2017-06-07 22:11:13');
INSERT INTO `bus_stripe_pay` VALUES ('34', '399', '20054', 'card_1AS4s6AEM5k6wIOLjgBeRGb1', 'card_1AS4s6AEM5k6wIOLjgBeRGb1', 'cus_AngEzOnKU65fUJ', 'ch_1AS4vLAEM5k6wIOLnZ9PwxUd', null, 'usd', '6100', 'token:card_1AS4s6AEM5k6wIOLjgBeRGb1;', '1', '0', null, null, '2017-06-07 22:14:15', null, '2017-06-07 22:14:15');
INSERT INTO `bus_stripe_pay` VALUES ('35', '400', '20028', 'card_1ARariAEM5k6wIOLpxiUFtXi', 'card_1ARariAEM5k6wIOLpxiUFtXi', 'cus_AnBESbl02OG4aX', 'ch_1AS62wAEM5k6wIOLGObVFKmr', null, 'usd', '6500', 'token:card_1ARariAEM5k6wIOLpxiUFtXi;', '1', '0', null, null, '2017-06-07 23:26:10', null, '2017-06-07 23:26:10');
INSERT INTO `bus_stripe_pay` VALUES ('36', '401', '20055', 'card_1AS64GAEM5k6wIOLKnRgPvsm', 'card_1AS64GAEM5k6wIOLKnRgPvsm', 'cus_AnhTxfdnQXSpUh', 'ch_1AS64NAEM5k6wIOLnN6VIFzM', null, 'usd', '6500', 'token:card_1AS64GAEM5k6wIOLKnRgPvsm;', '1', '0', null, null, '2017-06-07 23:27:40', null, '2017-06-07 23:27:40');
INSERT INTO `bus_stripe_pay` VALUES ('37', '402', '20055', 'card_1AS64GAEM5k6wIOLKnRgPvsm', 'card_1AS64GAEM5k6wIOLKnRgPvsm', 'cus_AnhTxfdnQXSpUh', 'ch_1AS65PAEM5k6wIOLwOgvwVul', null, 'usd', '19500', 'token:card_1AS64GAEM5k6wIOLKnRgPvsm;', '1', '0', null, null, '2017-06-07 23:28:43', null, '2017-06-07 23:28:43');
INSERT INTO `bus_stripe_pay` VALUES ('38', '403', '20054', 'card_1AS4s6AEM5k6wIOLjgBeRGb1', 'card_1AS4s6AEM5k6wIOLjgBeRGb1', 'cus_AngEzOnKU65fUJ', 'ch_1AS6vkAEM5k6wIOLGaHM5wVe', null, 'usd', '800', 'token:card_1AS4s6AEM5k6wIOLjgBeRGb1;', '1', '0', null, null, '2017-06-08 00:22:48', null, '2017-06-08 00:22:48');
INSERT INTO `bus_stripe_pay` VALUES ('39', '404', '20056', 'card_1AS6whAEM5k6wIOLHgJ0HmRG', 'card_1AS6whAEM5k6wIOLHgJ0HmRG', 'cus_AniNpndwVN2uk5', 'ch_1AS6wmAEM5k6wIOLQsHasPCH', null, 'usd', '6100', 'token:card_1AS6whAEM5k6wIOLHgJ0HmRG;', '1', '0', null, null, '2017-06-08 00:23:52', null, '2017-06-08 00:23:52');
INSERT INTO `bus_stripe_pay` VALUES ('40', '405', '20056', 'card_1AS6whAEM5k6wIOLHgJ0HmRG', 'card_1AS6whAEM5k6wIOLHgJ0HmRG', 'cus_AniNpndwVN2uk5', 'ch_1ASDhqAEM5k6wIOLl6aRwD1B', null, 'usd', '4900', 'token:card_1AS6whAEM5k6wIOLHgJ0HmRG;', '1', '0', null, null, '2017-06-08 07:36:55', null, '2017-06-08 07:36:55');
INSERT INTO `bus_stripe_pay` VALUES ('41', '409', '20028', 'card_1ATlvlAEM5k6wIOL3kaYQCu2', 'card_1ATlvlAEM5k6wIOL3kaYQCu2', 'cus_ApQnZGvMS9W0W8', 'ch_1ATlvsAEM5k6wIOL2snde4af', 're_1ATlyHAEM5k6wIOLAJPcq5ku', 'usd', '100', 'token:card_1ATlvlAEM5k6wIOL3kaYQCu2;', '1', '0', null, null, '2017-06-12 14:21:48', null, '2017-06-12 14:21:48');

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
  `customer_id` varchar(500) DEFAULT NULL,
  `phone_num` varchar(50) DEFAULT NULL,
  `pic_url` varchar(1000) DEFAULT NULL,
  `sex` int(11) NOT NULL DEFAULT '1',
  `generate_time` datetime DEFAULT NULL,
  `cur_deviceId` varchar(100) DEFAULT NULL,
  `push_token` varchar(100) DEFAULT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '2',
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20057 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_user
-- ----------------------------
INSERT INTO `bus_user` VALUES ('20014', '2', '3FF9A2E4EF2539D9', '配送员1', '1', null, '13398979879', '', '1', null, '', '', '1', '', null, null, null, null);
INSERT INTO `bus_user` VALUES ('20015', '2', '3FF9A2E4EF2539D9', '配送员2', '1', null, '17788287738', '', '1', null, '', '', '1', '', null, null, null, null);
INSERT INTO `bus_user` VALUES ('20016', '2', '3FF9A2E4EF2539D9', '配送员3', '1', null, '18733339873', '', '1', null, '', '', '1', '', null, null, null, null);
INSERT INTO `bus_user` VALUES ('20017', '1', '49ba59abbe56e057', 'Jevons', '1', null, '18521411359', '', '1', null, '112233', 'cb3d875c dcc52c85 d78ab859 2d07c873 e5ca4b41 9fcdf085 4dd022f0 c9128177', '1', '', null, '2017-05-04 21:32:47', null, '2017-05-08 23:54:02');
INSERT INTO `bus_user` VALUES ('20018', '2', '74F62AB67847F262', 'Hugo', '1', null, '9178157682', null, '1', null, null, null, '0', null, null, null, null, null);
INSERT INTO `bus_user` VALUES ('20019', '2', 'A0C00315E6A52F0EB6BBCDD8142A6E74', '瞧至', '1', null, '7657190923', null, '1', null, 'd0a68677e6df30299ad00419d6f5959c739827da3f8988961e7d3e8df7119f61', 'd0a68677e6df30299ad00419d6f5959c739827da3f8988961e7d3e8df7119f61', '0', null, null, null, null, '2017-05-24 10:25:59');
INSERT INTO `bus_user` VALUES ('20020', '1', '49ba59abbe56e057', 'Jevons', '1', null, '8521411359', null, '1', null, '', '', '0', null, null, '2017-05-10 21:32:31', null, '2017-05-10 21:32:31');
INSERT INTO `bus_user` VALUES ('20021', '1', '49ba59abbe56e057', 'Jevons', '1', null, '18521411359', null, '1', null, '', '', '0', null, null, '2017-05-10 21:34:22', null, '2017-05-27 22:05:04');
INSERT INTO `bus_user` VALUES ('20022', '1', '49ba59abbe56e057', '毛毛', '1', null, '08054789267', null, '1', null, '52356d041e48653901f43592b52e319ab3ad4e4504779a6bf56fdea843563af9', 'EEE297763089809', '0', null, null, '2017-05-15 16:09:21', null, '2017-05-15 16:12:01');
INSERT INTO `bus_user` VALUES ('20023', '2', '79EA5B12E3E7B0BC', 'TedXiong', '1', null, '18501754312', null, '1', null, '78637c7efa6530fefee323ef83760a633336dcf40acebf5db96969cc74af9af5', '78637c7efa6530fefee323ef83760a633336dcf40acebf5db96969cc74af9af5', '0', null, null, null, null, '2017-06-05 14:57:55');
INSERT INTO `bus_user` VALUES ('20024', '1', '49ba59abbe56e057', '哈哈', '1', null, '18516152738', '', '1', null, 'aed85f82fac331d9aa1be34ddb584d21ce4149eb2b183ba610c9ef99896ae153', 'EEE297763089809', '1', '', null, '2017-05-16 15:09:39', null, '2017-05-16 15:56:08');
INSERT INTO `bus_user` VALUES ('20025', '1', '49ba59abbe56e057', '', '1', null, '13571798331', '', '1', null, '', '', '1', '', null, '2017-05-16 15:52:27', null, '2017-05-16 15:52:27');
INSERT INTO `bus_user` VALUES ('20026', '2', '4A32C00C61D14F6A', '石头', '1', null, '18516152738', null, '1', null, '002f13e623c4b5cf3b79f843b58be4e42ae18f7b30af46b5703e752ee3c711c7', '002f13e623c4b5cf3b79f843b58be4e42ae18f7b30af46b5703e752ee3c711c7', '0', null, null, null, null, '2017-05-27 23:15:47');
INSERT INTO `bus_user` VALUES ('20027', '1', '49ba59abbe56e057', '', '1', null, '8608784575', '', '1', null, '937f28cf29e5058383e8ec8cb59a7520469d3fca1c518ff2320520dc59d5b3f8', 'EEE297763089809', '1', '', null, '2017-05-16 18:57:56', null, '2017-05-16 18:57:56');
INSERT INTO `bus_user` VALUES ('20028', '1', '49ba59abbe56e057', '熊伟', '1', 'cus_ApQnZGvMS9W0W8', '18501754312', null, '1', null, '', '', '0', null, null, '2017-05-17 09:42:23', null, '2017-06-15 11:44:51');
INSERT INTO `bus_user` VALUES ('20029', '2', '97427EB0488D2A50', '金阳', '1', null, '18201954319', null, '1', null, '002f13e623c4b5cf3b79f843b58be4e42ae18f7b30af46b5703e752ee3c711c7', '002f13e623c4b5cf3b79f843b58be4e42ae18f7b30af46b5703e752ee3c711c7', '0', null, null, null, null, '2017-05-24 09:50:08');
INSERT INTO `bus_user` VALUES ('20030', '2', 'FAFDE45E318BF2AE', '123', '1', null, '18201954319', '', '1', null, '', '', '1', '', null, null, null, null);
INSERT INTO `bus_user` VALUES ('20031', '1', '79EA5B12E3E7B0BC', '何乾', '1', null, '7657190923', null, '1', null, '4bf00f73feb464b1489660bea7968dc40ae8434369e989f88665152bb3b4961f', 'EEE297763089809', '0', null, null, '2017-05-24 09:23:43', null, '2017-05-26 08:30:16');
INSERT INTO `bus_user` VALUES ('20032', '1', '79EA5B12E3E7B0BC', 'Orochi', '1', null, '13962175755', null, '1', null, '12345', 'abcdefg', '0', null, null, '2017-05-25 11:01:17', null, '2017-05-25 11:01:17');
INSERT INTO `bus_user` VALUES ('20033', '1', '79EA5B12E3E7B0BC', '金阳', '1', null, '18201954319', null, '1', null, '', '', '0', null, null, '2017-05-27 10:47:51', null, '2017-06-12 08:08:24');
INSERT INTO `bus_user` VALUES ('20034', '2', '79EA5B12E3E7B0BC', '店小二', '1', null, '17621163178', null, '1', null, '112233', 'unknow', '0', null, null, null, null, '2017-06-16 13:07:09');
INSERT INTO `bus_user` VALUES ('20036', '2', '3FF9A2E4EF2539D9', '光头强', '1', null, '15026679294', null, '1', null, '112233', 'unknow', '0', null, null, null, null, '2017-06-15 10:17:58');
INSERT INTO `bus_user` VALUES ('20037', '1', '79EA5B12E3E7B0BC', '', '1', null, '18581754312', null, '1', null, '', '', '0', null, null, '2017-06-05 10:32:19', null, '2017-06-05 10:32:19');
INSERT INTO `bus_user` VALUES ('20038', '1', '79EA5B12E3E7B0BC', '', '1', null, '6264603192', null, '1', null, '112233', 'unknow', '0', null, null, '2017-06-05 15:36:35', null, '2017-06-05 15:36:35');
INSERT INTO `bus_user` VALUES ('20039', '1', '79EA5B12E3E7B0BC', 'h h', '1', null, '13127756590', null, '1', null, '', '', '0', null, null, '2017-06-07 00:10:31', null, '2017-06-07 00:11:08');
INSERT INTO `bus_user` VALUES ('20040', '1', '79EA5B12E3E7B0BC', '', '1', null, '13127756576', null, '1', null, '', '', '0', null, null, '2017-06-07 18:43:01', null, '2017-06-07 18:43:32');
INSERT INTO `bus_user` VALUES ('20041', '1', '79EA5B12E3E7B0BC', '你姐姐', '1', null, '13127756575', null, '1', null, '', '', '0', null, null, '2017-06-07 18:44:58', null, '2017-06-07 18:45:49');
INSERT INTO `bus_user` VALUES ('20042', '1', '79EA5B12E3E7B0BC', '', '1', null, '18201954310', null, '1', null, '', '', '0', null, null, '2017-06-07 19:07:55', null, '2017-06-07 20:42:06');
INSERT INTO `bus_user` VALUES ('20043', '1', '79EA5B12E3E7B0BC', '', '1', null, '18201954312', null, '1', null, '', '', '0', null, null, '2017-06-07 20:44:10', null, '2017-06-07 20:44:10');
INSERT INTO `bus_user` VALUES ('20044', '1', '79EA5B12E3E7B0BC', 'Ghhh', '1', null, '18201954316', null, '1', null, '', '', '0', null, null, '2017-06-07 20:54:05', null, '2017-06-07 20:54:05');
INSERT INTO `bus_user` VALUES ('20045', '1', '79EA5B12E3E7B0BC', '', '1', null, '18201956789', null, '1', null, '', '', '0', null, null, '2017-06-07 21:24:33', null, '2017-06-07 21:25:12');
INSERT INTO `bus_user` VALUES ('20046', '1', '79EA5B12E3E7B0BC', '', '1', null, '18201954378', null, '1', null, '', '', '0', null, null, '2017-06-07 21:26:12', null, '2017-06-07 21:26:54');
INSERT INTO `bus_user` VALUES ('20047', '1', '79EA5B12E3E7B0BC', 'j j', '1', null, '18209876788', null, '1', null, '', '', '0', null, null, '2017-06-07 21:29:22', null, '2017-06-07 21:30:12');
INSERT INTO `bus_user` VALUES ('20048', '1', '79EA5B12E3E7B0BC', '', '1', null, '18201965478', null, '1', null, '', '', '0', null, null, '2017-06-07 21:36:13', null, '2017-06-07 21:37:05');
INSERT INTO `bus_user` VALUES ('20049', '1', '79EA5B12E3E7B0BC', '', '1', null, '1820076980', null, '1', null, '', '', '0', null, null, '2017-06-07 21:38:56', null, '2017-06-07 21:39:28');
INSERT INTO `bus_user` VALUES ('20050', '1', '79EA5B12E3E7B0BC', '', '1', null, '18201967567', null, '1', null, '', '', '0', null, null, '2017-06-07 21:45:31', null, '2017-06-07 21:45:55');
INSERT INTO `bus_user` VALUES ('20051', '1', '79EA5B12E3E7B0BC', '', '1', null, '1820197657', null, '1', null, '', '', '0', null, null, '2017-06-07 21:47:16', null, '2017-06-07 21:48:18');
INSERT INTO `bus_user` VALUES ('20052', '1', '79EA5B12E3E7B0BC', '', '1', null, '18209766788', null, '1', null, '', '', '0', null, null, '2017-06-07 22:05:10', null, '2017-06-07 22:05:42');
INSERT INTO `bus_user` VALUES ('20053', '1', '79EA5B12E3E7B0BC', '', '1', null, '18201954837', null, '1', null, '', '', '0', null, null, '2017-06-07 22:08:22', null, '2017-06-07 22:08:53');
INSERT INTO `bus_user` VALUES ('20054', '1', '79EA5B12E3E7B0BC', '', '1', null, '1820197646', null, '1', null, '', '', '0', null, null, '2017-06-07 22:10:26', null, '2017-06-07 22:10:57');
INSERT INTO `bus_user` VALUES ('20055', '1', '79EA5B12E3E7B0BC', '大疙瘩', '1', null, '18501754313', null, '1', null, '2f50aaa29609bffed3222e75b02ff9dfa5f75c901ef2282aa0b7e271346c492b', '2f50aaa29609bffed3222e75b02ff9dfa5f75c901ef2282aa0b7e271346c492b', '0', null, null, '2017-06-07 23:26:37', null, '2017-06-07 23:27:33');
INSERT INTO `bus_user` VALUES ('20056', '1', '79EA5B12E3E7B0BC', '', '1', null, '19877787788', null, '1', null, '', '', '0', null, null, '2017-06-08 00:23:12', null, '2017-06-08 00:23:48');

-- ----------------------------
-- Table structure for `bus_user_black_list`
-- ----------------------------
DROP TABLE IF EXISTS `bus_user_black_list`;
CREATE TABLE `bus_user_black_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type` int(11) NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '2',
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
  `is_delete` int(11) NOT NULL DEFAULT '2',
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
  `is_delete` int(11) NOT NULL DEFAULT '2',
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_verify_code
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

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
INSERT INTO `sys_constant` VALUES ('14', '其他业务配置参数', '其他业务配置参数', null, null, null, null);
INSERT INTO `sys_constant` VALUES ('15', '周', '周', null, null, null, null);
INSERT INTO `sys_constant` VALUES ('17', '支付方式', '订单允许的支付方式', null, null, null, null);
INSERT INTO `sys_constant` VALUES ('18', '线上支付渠道', '线上支付渠道', null, null, null, null);
INSERT INTO `sys_constant` VALUES ('19', 'bus_payment表支付类型', 'bus_payment表支付类型', null, null, null, null);
INSERT INTO `sys_constant` VALUES ('20', 'Image_Url前缀', 'Image_Url前缀', null, null, null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

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
INSERT INTO `sys_constant_detail` VALUES ('10', '6', '登录/注册验证', '1', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('11', '6', '其它验证', '2', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('12', '7', '午餐', '1', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('13', '7', '晚餐', '2', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('14', '7', '全部', '3', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('15', '8', '工作日', '1', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('16', '8', '周末', '2', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('17', '8', '全部', '3', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('18', '9', '启用', '1', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('19', '9', '停用', '0', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('20', '10', '是', '1', '已删除', null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('21', '10', '否', '0', '未删除', null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('22', '11', '已预订', '1', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('23', '11', '取餐完毕', '2', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('24', '11', '待送达', '3', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('25', '11', '已完成', '4', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('26', '11', '已退单', '5', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('27', '11', '申请退单', '6', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('28', '12', '未支付', '0', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('29', '12', '已支付', '1', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('30', '13', '线上支付', '1', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('31', '13', '货到付款', '2', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('32', '14', '最多展示天数', '8', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('33', '14', '当日最多发送短信数', '12', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('34', '15', '周一', '1', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('35', '15', '周二', '2', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('36', '15', '周三', '3', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('37', '15', '周四', '4', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('38', '15', '周五', '5', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('39', '15', '周六', '6', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('40', '15', '周日', '7', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('41', '11', '未生效', '0', '未生效(在线支付未支付)', null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('42', '13', '全部', '3', '全部支付类型', null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('43', '17', '可用支付方式', '3', '订单允许的可用支付方式', null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('44', '18', 'Stripe', '1', null, null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('45', '19', '在线支付', '1', 'bus_payment表支付类型', null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('46', '19', '线下支付', '2', 'bus_payment表支付类型', null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('47', '19', '退款', '3', 'bus_payment表支付类型', null, null, null, null);
INSERT INTO `sys_constant_detail` VALUES ('48', '20', 'Image_Url前缀', 'http://wkps.tedxiong.com/', 'Image_Url前缀', null, null, null, null);

-- ----------------------------
-- Table structure for `sys_sequence`
-- ----------------------------
DROP TABLE IF EXISTS `sys_sequence`;
CREATE TABLE `sys_sequence` (
  `sequence_name` varchar(200) NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`sequence_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_sequence
-- ----------------------------
INSERT INTO `sys_sequence` VALUES ('10120170526', '2');
INSERT INTO `sys_sequence` VALUES ('10120170527', '12');
INSERT INTO `sys_sequence` VALUES ('10120170530', '1');
INSERT INTO `sys_sequence` VALUES ('10120170531', '3');
INSERT INTO `sys_sequence` VALUES ('10120170601', '3');
INSERT INTO `sys_sequence` VALUES ('10120170603', '3');
INSERT INTO `sys_sequence` VALUES ('10120170605', '7');
INSERT INTO `sys_sequence` VALUES ('10120170606', '30');
INSERT INTO `sys_sequence` VALUES ('10120170607', '41');
INSERT INTO `sys_sequence` VALUES ('10220170526', '9');
INSERT INTO `sys_sequence` VALUES ('10220170527', '2');
INSERT INTO `sys_sequence` VALUES ('10220170531', '18');
INSERT INTO `sys_sequence` VALUES ('10220170601', '16');
INSERT INTO `sys_sequence` VALUES ('10220170602', '1');
INSERT INTO `sys_sequence` VALUES ('10220170603', '1');
INSERT INTO `sys_sequence` VALUES ('10220170604', '2');
INSERT INTO `sys_sequence` VALUES ('10220170605', '32');
INSERT INTO `sys_sequence` VALUES ('10220170607', '17');
INSERT INTO `sys_sequence` VALUES ('10220170608', '3');
INSERT INTO `sys_sequence` VALUES ('10220170612', '4');
INSERT INTO `sys_sequence` VALUES ('10220170615', '8');
INSERT INTO `sys_sequence` VALUES ('10320170601', '1');
INSERT INTO `sys_sequence` VALUES ('120170509', '3');
INSERT INTO `sys_sequence` VALUES ('120170510', '6');
INSERT INTO `sys_sequence` VALUES ('120170514', '7');
INSERT INTO `sys_sequence` VALUES ('120170515', '3');
INSERT INTO `sys_sequence` VALUES ('120170516', '19');
INSERT INTO `sys_sequence` VALUES ('120170517', '3');
INSERT INTO `sys_sequence` VALUES ('120170520', '7');
INSERT INTO `sys_sequence` VALUES ('120170521', '2');
INSERT INTO `sys_sequence` VALUES ('120170524', '5');
INSERT INTO `sys_sequence` VALUES ('120170525', '1');
INSERT INTO `sys_sequence` VALUES ('220170516', '2');
INSERT INTO `sys_sequence` VALUES ('220170525', '14');
INSERT INTO `sys_sequence` VALUES ('220170526', '8');
INSERT INTO `sys_sequence` VALUES ('220170527', '2');

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
  `is_delete` int(11) NOT NULL DEFAULT '2',
  `remark` varchar(500) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '407798401EBD0029', 'admin', '0', '0', null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('2', 'admin1', '806D9F4C1B8014CD', 'admin1', '0', '0', null, null, null, null, null);

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
-- Function structure for `dishNameAsTag`
-- ----------------------------
DROP FUNCTION IF EXISTS `dishNameAsTag`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `dishNameAsTag`(marketId int(11),dishTime int(11),eatType INT(11)) RETURNS blob
BEGIN
    DECLARE tag BLOB(2000);
    SELECT CONCAT(GROUP_CONCAT(CAST(bd.name_en AS CHAR) SEPARATOR '/'),'|',GROUP_CONCAT(CAST(bd.name_cn AS CHAR) SEPARATOR '/')) into tag
    FROM (SELECT name_en,name_cn,market_id 
            FROM bus_dish sub_bd 
           WHERE sub_bd.`market_id`=marketId 
             and sub_bd.status=1 
             and sub_bd.is_delete<>1
             and (sub_bd.dish_time=dishTime or sub_bd.dish_time=3)
             and (sub_bd.eat_type=eatType OR sub_bd.eat_type=3)
            order by sub_bd.sort
           LIMIT 5) bd
    GROUP BY bd.market_id ;
    return tag;
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
