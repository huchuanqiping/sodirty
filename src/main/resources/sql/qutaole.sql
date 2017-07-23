/*
Navicat MySQL Data Transfer

Source Server         : localdb
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : qutaole

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-06-03 15:39:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` bigint(20) NOT NULL COMMENT '商品id',
  `goods_name` varchar(500) DEFAULT NULL COMMENT '商品名称',
  `category_id` bigint(20) DEFAULT NULL COMMENT '商品类目id',
  `goods_status` int(11) DEFAULT NULL COMMENT '商品状态：1：上架；2；下架；3：缺货',
  `brand_id` varchar(500) DEFAULT NULL COMMENT '品牌id',
  `image_url` varchar(500) DEFAULT NULL COMMENT '商品图片url',
  `desc` varchar(500) DEFAULT NULL COMMENT '商品描述',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------

-- ----------------------------
-- Table structure for goods_category
-- ----------------------------
DROP TABLE IF EXISTS `goods_category`;
CREATE TABLE `goods_category` (
  `id` bigint(20) NOT NULL COMMENT '类目id',
  `category_name` varchar(500) NOT NULL COMMENT '类目名称',
  PRIMARY KEY (`id`,`category_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_category
-- ----------------------------

-- ----------------------------
-- Table structure for goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `goods_sku`;
CREATE TABLE `goods_sku` (
  `sku_id` bigint(20) NOT NULL COMMENT '商品skuid',
  `goods_id` bigint(20) DEFAULT NULL,
  `color` int(10) DEFAULT NULL COMMENT '颜色：1-红；2-白...',
  `size` double DEFAULT NULL COMMENT '尺寸',
  `weight` double DEFAULT NULL COMMENT '重量',
  `market_price` decimal(10,2) DEFAULT NULL COMMENT '市场价',
  `supply_price` decimal(10,2) DEFAULT NULL COMMENT '供货价',
  `sale_price` decimal(10,2) DEFAULT NULL COMMENT '售价',
  `deliver_fee` decimal(10,0) DEFAULT NULL COMMENT '运费',
  `storage` int(11) DEFAULT NULL COMMENT '库存',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sku_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_sku
-- ----------------------------

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `payment` decimal(10,0) DEFAULT NULL COMMENT '实付金额',
  `pay_type` tinyint(4) DEFAULT NULL COMMENT '支付类型：1-支付宝；2-转帐；3-货到付款',
  `status` int(11) DEFAULT NULL COMMENT '订单状态 未付款/已付款/未发货/已发货/交易成功/交易关闭',
  `order_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '下单时间',
  `pay_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '支付时间',
  `deliver_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '发货时间',
  `finish_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '交易完成时间',
  `close_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '交易关闭时间',
  `deliver_fee` decimal(10,0) DEFAULT NULL COMMENT '运费',
  `logistics_num` varchar(255) DEFAULT NULL COMMENT '物流单号',
  `logistics_name` varchar(255) DEFAULT NULL COMMENT '物流名称',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for order_deliver
-- ----------------------------
DROP TABLE IF EXISTS `order_deliver`;
CREATE TABLE `order_deliver` (
  `id` bigint(20) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `reciver_name` varchar(255) DEFAULT NULL COMMENT '收货人姓名',
  `reciver_phone` varchar(255) DEFAULT NULL COMMENT '收货人电话',
  `reciver_province` varchar(255) DEFAULT NULL COMMENT '收货人省份',
  `reciver_city` varchar(255) DEFAULT NULL COMMENT '收货人城市',
  `reciver_district` varchar(255) DEFAULT NULL COMMENT '收货人地区',
  `reciver_address` varchar(255) DEFAULT NULL COMMENT '收货人详细地址',
  `reciver_postcode` varchar(255) DEFAULT NULL COMMENT '邮编',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_deliver
-- ----------------------------

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `id` bigint(20) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '购买者id',
  `order_num` int(11) DEFAULT NULL COMMENT '购买数量',
  `order_price` decimal(10,2) DEFAULT NULL COMMENT '购买单价',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `upate_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_detail
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL COMMENT '用户id',
  `user_name` varchar(255) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `sex` tinyint(4) DEFAULT NULL COMMENT '性别 1：男；2：女',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机号',
  `register_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '注册时间',
  `province` int(10) DEFAULT NULL COMMENT '省',
  `city` int(10) DEFAULT NULL COMMENT '城市',
  `district` int(10) DEFAULT NULL COMMENT '地区/县',
  `address` varchar(500) DEFAULT NULL COMMENT '地址',
  `level` int(10) DEFAULT NULL COMMENT '用户等级',
  `status` int(11) DEFAULT NULL COMMENT '用户状态：0：正常用户；1:黑名单；2：白名单',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
