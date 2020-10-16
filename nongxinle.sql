/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : 140.143.186.94:3306
 Source Schema         : nongxinle

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 14/10/2020 20:09:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for nx_adsense
-- ----------------------------
DROP TABLE IF EXISTS `nx_adsense`;
CREATE TABLE `nx_adsense` (
  `nx_adsense_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '广告位id',
  `nx_adsense_file_path` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '广告位图片',
  `nx_adsense_click` varchar(200) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '广告位链接',
  `nx_adsense_community_id` int(20) DEFAULT NULL COMMENT '社区id',
  `nx_adsense_sort` int(4) DEFAULT NULL COMMENT '广告位排序',
  PRIMARY KEY (`nx_adsense_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_adsense
-- ----------------------------
BEGIN;
INSERT INTO `nx_adsense` VALUES (1, NULL, NULL, NULL, NULL);
INSERT INTO `nx_adsense` VALUES (2, 'uploadImage/4.jpg', NULL, 1, NULL);
INSERT INTO `nx_adsense` VALUES (3, 'uploadImage/80.png', NULL, 1, NULL);
COMMIT;

-- ----------------------------
-- Table structure for nx_agent
-- ----------------------------
DROP TABLE IF EXISTS `nx_agent`;
CREATE TABLE `nx_agent` (
  `agent_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '批发商用户id',
  `agent_name` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '送货员名字',
  `agent_dis_id` int(20) DEFAULT NULL COMMENT '批发商id',
  PRIMARY KEY (`agent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_agent
-- ----------------------------
BEGIN;
INSERT INTO `nx_agent` VALUES (1, '美林湾北门林夕超市', 1);
COMMIT;

-- ----------------------------
-- Table structure for nx_agent_user
-- ----------------------------
DROP TABLE IF EXISTS `nx_agent_user`;
CREATE TABLE `nx_agent_user` (
  `nx_agent_user_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '代理商用户id',
  `AU_wx_nick_name` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '代理商用户微信昵称',
  `AU_wx_avartra_url` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '代理商用户微信头像',
  `AU_wx_agender` varchar(4) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '代理商用户微信性别',
  `AU_name` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '代理商用户姓名',
  `AU_phone` varchar(11) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '代理商用户手机号码',
  PRIMARY KEY (`nx_agent_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Table structure for nx_alias
-- ----------------------------
DROP TABLE IF EXISTS `nx_alias`;
CREATE TABLE `nx_alias` (
  `nx_alias_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '别名id',
  `nx_alias_name` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '别名名称',
  `nx_als_goods_id` int(20) DEFAULT NULL COMMENT '别名商品id',
  `nx_als_sort` int(10) DEFAULT NULL COMMENT '别名排序',
  PRIMARY KEY (`nx_alias_id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_alias
-- ----------------------------
BEGIN;
INSERT INTO `nx_alias` VALUES (144, '红苕', 45104, NULL);
INSERT INTO `nx_alias` VALUES (146, '红萝卜', 45094, NULL);
INSERT INTO `nx_alias` VALUES (147, '地瓜', 45104, NULL);
INSERT INTO `nx_alias` VALUES (148, '莲菜', 45103, NULL);
INSERT INTO `nx_alias` VALUES (149, '洋芋', 44678, NULL);
INSERT INTO `nx_alias` VALUES (150, '豆角', 45146, NULL);
INSERT INTO `nx_alias` VALUES (151, '圣女果', 17600016, NULL);
COMMIT;

-- ----------------------------
-- Table structure for nx_applys
-- ----------------------------
DROP TABLE IF EXISTS `nx_applys`;
CREATE TABLE `nx_applys` (
  `nx_applys_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '申请id',
  `nx_apply_customer_id` int(20) DEFAULT NULL COMMENT '申请客户id',
  `nx_apply_user_id` int(20) DEFAULT NULL COMMENT '申请用户id',
  `nx_apply_distributer_id` int(20) DEFAULT NULL COMMENT '批发商id',
  `nx_apply_goods_id` int(20) DEFAULT NULL COMMENT '申请商品id',
  `nx_apply_quantity` float(10,1) DEFAULT NULL COMMENT '申请数量',
  `nx_apply_date` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '申请日期',
  `nx_apply_status` tinyint(2) DEFAULT NULL COMMENT '申请状态',
  `nx_apply_remark` tinyint(200) DEFAULT NULL COMMENT '申请备注',
  `nx_apply_weight` float(10,1) DEFAULT NULL COMMENT '申请数量',
  `nx_apply_price` float(10,1) DEFAULT NULL COMMENT '商品单价',
  `nx_apply_subtotal` float(10,1) DEFAULT NULL COMMENT '小计',
  `nx_weigh_user_id` int(20) DEFAULT NULL COMMENT '称重用户id',
  `nx_account_user_id` int(20) DEFAULT NULL COMMENT '输入单价用户id',
  `nx_bill_id` int(20) DEFAULT NULL COMMENT '账单id',
  PRIMARY KEY (`nx_applys_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Table structure for nx_community
-- ----------------------------
DROP TABLE IF EXISTS `nx_community`;
CREATE TABLE `nx_community` (
  `nx_community_id` int(20) NOT NULL,
  `nx_community_name` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_community_lat` varchar(50) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_community_lng` varchar(50) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_community_route_id` int(20) DEFAULT NULL,
  `nx_community_dis_id` int(20) DEFAULT NULL,
  `nx_community_polygon` varchar(10000) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_community_region` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL,
  PRIMARY KEY (`nx_community_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_community
-- ----------------------------
BEGIN;
INSERT INTO `nx_community` VALUES (1, '美林湾', '39.97956', '116.774149', 1, 1, '{\"id\":1,\"data\":[{\"lng\":116.770772,\"lat\":39.98437},{\"lng\":116.763729,\"lat\":39.972372},{\"lng\":116.787516,\"lat\":39.971709},{\"lng\":116.787085,\"lat\":39.985476}]}', '三河市');
INSERT INTO `nx_community` VALUES (2, '悦榕湾', NULL, NULL, 1, 1, NULL, '三河市');
INSERT INTO `nx_community` VALUES (3, '纳丹堡', NULL, NULL, 1, 1, NULL, '三河市');
COMMIT;

-- ----------------------------
-- Table structure for nx_community_adsense
-- ----------------------------
DROP TABLE IF EXISTS `nx_community_adsense`;
CREATE TABLE `nx_community_adsense` (
  `nx_community_adsense_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '广告位id',
  `nx_CA_file_path` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '广告位图片',
  `nx_CA_click` varchar(200) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '广告位链接',
  `nx_CA_community_id` int(20) DEFAULT NULL COMMENT '社区id',
  `nx_CA_sort` int(4) DEFAULT NULL COMMENT '广告位排序',
  PRIMARY KEY (`nx_community_adsense_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_community_adsense
-- ----------------------------
BEGIN;
INSERT INTO `nx_community_adsense` VALUES (2, 'uploadImage/4.jpg', NULL, 1, NULL);
INSERT INTO `nx_community_adsense` VALUES (3, 'uploadImage/80.png', NULL, 1, NULL);
COMMIT;

-- ----------------------------
-- Table structure for nx_community_agent
-- ----------------------------
DROP TABLE IF EXISTS `nx_community_agent`;
CREATE TABLE `nx_community_agent` (
  `nx_CA_id` int(20) NOT NULL AUTO_INCREMENT,
  `CA_community_id` int(20) DEFAULT NULL,
  `CA_angent_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`nx_CA_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_community_agent
-- ----------------------------
BEGIN;
INSERT INTO `nx_community_agent` VALUES (1, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for nx_community_daytime
-- ----------------------------
DROP TABLE IF EXISTS `nx_community_daytime`;
CREATE TABLE `nx_community_daytime` (
  `nx_week_id` int(20) NOT NULL AUTO_INCREMENT,
  `nx_day_name` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_day_open` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_day_close` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_dis_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`nx_week_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Table structure for nx_community_father_goods
-- ----------------------------
DROP TABLE IF EXISTS `nx_community_father_goods`;
CREATE TABLE `nx_community_father_goods` (
  `nx_community_father_goods_id` int(20) NOT NULL AUTO_INCREMENT,
  `nx_father_goods_name` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_father_goods_img` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_father_goods_sort` int(4) DEFAULT NULL,
  `nx_father_goods_color` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_fathers_father_id` int(20) DEFAULT NULL,
  `nx_father_goods_level` tinyint(2) DEFAULT NULL,
  `nx_CFG_community_id` int(20) DEFAULT NULL,
  `nx_CFG_goods_amount` int(4) DEFAULT NULL,
  PRIMARY KEY (`nx_community_father_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_community_father_goods
-- ----------------------------
BEGIN;
INSERT INTO `nx_community_father_goods` VALUES (1, '生鲜', NULL, NULL, NULL, 0, 0, 1, NULL);
INSERT INTO `nx_community_father_goods` VALUES (2, '新鲜蔬菜', NULL, NULL, NULL, 1, 1, 1, NULL);
INSERT INTO `nx_community_father_goods` VALUES (3, '根茎类', 'goodsImage/1.jpg', NULL, '#20afb8', 2, 2, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for nx_community_goods
-- ----------------------------
DROP TABLE IF EXISTS `nx_community_goods`;
CREATE TABLE `nx_community_goods` (
  `nx_community_goods_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '社区商品id',
  `nx_cg_distribute_id` int(20) DEFAULT NULL COMMENT '批发商id',
  `nx_cg_community_id` int(20) DEFAULT NULL COMMENT '社区id',
  `nx_cg_goods_status` tinyint(2) DEFAULT NULL COMMENT '商品状态',
  `nx_cg_goods_is_weight` tinyint(2) DEFAULT NULL COMMENT '是否称重',
  `nx_cg_goods_price` float(10,1) DEFAULT NULL COMMENT '价格',
  `nx_cg_goods_price_decimal` int(10) DEFAULT NULL COMMENT '价格小数点部分',
  `nx_cg_nx_goods_file_path` varchar(200) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '商品图片',
  `nx_cg_goods_sell_type` tinyint(2) DEFAULT NULL COMMENT '批发商商品销售规格模式0按standardname销售，1 按自己的规格销售',
  `nx_cg_goods_buy_type` tinyint(2) DEFAULT NULL COMMENT '自采购商品的状态',
  `nx_cg_cf_goods_father_id` int(20) DEFAULT NULL COMMENT '社区商品父类id',
  `nx_cg_nx_goods_id` int(10) DEFAULT NULL COMMENT '购买热度',
  `nx_cg_nx_goods_father_id` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '采购数量',
  `nx_cg_nx_goods_father_img` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '进货方式',
  `nx_cg_goods_total_hits` int(20) DEFAULT NULL COMMENT '自采购员工id',
  `nx_cg_purchase_quantity` int(20) DEFAULT NULL COMMENT 'App订货供货商appid',
  `nx_cg_buy_purchase_user_id` int(20) DEFAULT NULL COMMENT '供货商id',
  `nx_cg_buy_app_id` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '进价',
  `nx_cg_buy_status` int(20) DEFAULT NULL COMMENT '商品id',
  `nx_cg_supplier_id` int(20) DEFAULT NULL COMMENT '商品库父类id',
  `nx_cg_buying_price` varchar(200) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '商品库image',
  `nx_cg_goods_type` tinyint(2) DEFAULT NULL COMMENT '0 供货商，1 社区库存，2 自采购 4 加工',
  `nx_cg_goods_name` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '商品名称',
  `nx_cg_goods_detail` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '商品详细',
  `nx_cg_goods_standardname` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '商品规格',
  `nx_cg_goods_stock` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '社区库存商品库存量',
  `nx_cg_goods_pinyin` varchar(200) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '社区商品拼音',
  `nx_cg_goods_py` varchar(50) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '社区商品拼音简拼',
  PRIMARY KEY (`nx_community_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_community_goods
-- ----------------------------
BEGIN;
INSERT INTO `nx_community_goods` VALUES (1, 1, 1, 0, NULL, 1.0, 6, 'uploadImage/blb.jpg', 1, NULL, 3, 45096, '111', 'uploadImage/1.jpg', 0, 9, 1, NULL, 2, 1, '0.8', 1, '白萝卜', '山东,四川', '斤', NULL, 'bailuobu', 'blb');
INSERT INTO `nx_community_goods` VALUES (2, 1, 1, 0, NULL, 2.0, 2, 'uploadImage/logo.jpg', 0, NULL, 3, 45097, '111', 'uploadImage/1.jpg', 0, NULL, NULL, NULL, NULL, 1, '1.1', 1, '卞萝卜', '', '斤', NULL, 'bianluobu', 'blb');
INSERT INTO `nx_community_goods` VALUES (3, 1, 1, 0, NULL, 23.0, 0, 'goodsImage/logo.jpg', 0, NULL, 3, 45545, '111', 'goodsImage/1.jpg', 0, NULL, NULL, NULL, NULL, 1, '3', 1, 'nihao', NULL, 'dmm', NULL, NULL, NULL);
INSERT INTO `nx_community_goods` VALUES (4, 1, 1, 0, NULL, 23.0, 0, 'goodsImage/logo.jpg', 0, NULL, 3, 45545, '111', 'goodsImage/1.jpg', 0, NULL, NULL, NULL, NULL, 1, '3', 1, 'nihao', NULL, 'dmm', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for nx_community_orders
-- ----------------------------
DROP TABLE IF EXISTS `nx_community_orders`;
CREATE TABLE `nx_community_orders` (
  `nx_community_orders_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `nx_CO_distributer_id` int(20) DEFAULT NULL COMMENT '批发商id',
  `nx_CO_community_id` int(20) DEFAULT NULL COMMENT '订单社区id',
  `nx_CO_customer_id` int(20) DEFAULT NULL COMMENT '订单客户id',
  `nx_CO_user_id` int(20) DEFAULT NULL COMMENT '订单用户id',
  `nx_CO_date` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订单日期',
  `nx_CO_status` tinyint(2) DEFAULT NULL COMMENT '订单状态',
  `nx_CO_service` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订单送达时间',
  `nx_CO_amount` float(10,0) DEFAULT NULL COMMENT '订单总金额',
  `nx_CO_service_date` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订单送到日期',
  `nx_CO_service_time` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订单送到时间',
  `nx_CO_weigh_user_id` int(20) DEFAULT NULL COMMENT '订单称重用户id',
  `nx_CO_delivery_user_id` int(20) DEFAULT NULL COMMENT '订单配送员工id',
  `nx_CO_sub_amount` int(10) DEFAULT NULL COMMENT '订单子商品数量',
  `nx_CO_sub_finished` int(10) DEFAULT NULL COMMENT '订单子商品完成数量',
  `nx_CO_weigh_number` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订单称重订单号',
  `nx_CO_payment_status` tinyint(2) DEFAULT NULL COMMENT '订单支付状态',
  `nx_CO_payment_send_time` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订单支付发送时间',
  `nx_CO_payment_time` varchar(0) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订单支付时间',
  `nx_CO_type` tinyint(2) DEFAULT NULL COMMENT '订单类型 0先付款1后付款',
  PRIMARY KEY (`nx_community_orders_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_community_orders
-- ----------------------------
BEGIN;
INSERT INTO `nx_community_orders` VALUES (1, 1, 1, 1, 1, '06-12 10:18', 0, '06121600', 140, '06-12', '16:00', NULL, NULL, 2, 0, NULL, 1, NULL, NULL, 0);
INSERT INTO `nx_community_orders` VALUES (2, 1, 1, 2, 2, '06-12 10:53', 0, '06121600', 2, '06-12', '16:00', NULL, NULL, 1, 0, NULL, 1, NULL, NULL, 0);
INSERT INTO `nx_community_orders` VALUES (3, 1, 1, 3, 3, '06-12 10:55', 0, '06121600', 8, '06-12', '16:00', NULL, NULL, 1, 0, NULL, 1, NULL, NULL, 0);
INSERT INTO `nx_community_orders` VALUES (4, 1, 1, 3, 3, '06-18 16:05', 1, '06190900', 24, '06-19', '9:00', 1, NULL, 2, 0, NULL, 1, NULL, NULL, 0);
INSERT INTO `nx_community_orders` VALUES (5, 1, 1, 3, 3, '06-18 19:40', 1, '06190900', 24, '06-19', '9:00', 1, NULL, 2, 0, NULL, 1, NULL, NULL, 0);
INSERT INTO `nx_community_orders` VALUES (6, 1, 1, 3, 3, '06-18 19:47', 0, '06190900', 24, '06-19', '9:00', NULL, NULL, 2, 0, NULL, 1, NULL, NULL, 0);
INSERT INTO `nx_community_orders` VALUES (7, 1, 1, 3, 3, '06-18 19:47', 0, '06190900', 24, '06-19', '9:00', NULL, NULL, 2, 0, NULL, 1, NULL, NULL, 0);
INSERT INTO `nx_community_orders` VALUES (8, 1, 1, 3, 3, '06-19 14:35', 0, '06200900', 30, '06-20', '9:00', NULL, NULL, 2, 0, NULL, 1, NULL, NULL, 0);
INSERT INTO `nx_community_orders` VALUES (9, 1, 1, 3, 3, '06-19 14:36', 0, '06200900', 45, '06-20', '9:00', NULL, NULL, 2, 0, NULL, 1, NULL, NULL, 0);
INSERT INTO `nx_community_orders` VALUES (10, 1, 1, 1, 1, '06-20 13:33', 0, '06201600', 140, '06-21', '16:00', NULL, NULL, 2, 0, NULL, 1, NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for nx_community_orders_sub
-- ----------------------------
DROP TABLE IF EXISTS `nx_community_orders_sub`;
CREATE TABLE `nx_community_orders_sub` (
  `nx_community_orders_sub_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '子订单id',
  `nx_COS_orders_id` int(11) DEFAULT NULL COMMENT '订单id',
  `nx_COS_nx_goods_id` int(20) DEFAULT NULL COMMENT '子订单nx商品id',
  `nx_COS_community_goods_id` int(20) DEFAULT NULL COMMENT '子订单社区商品id',
  `nx_COS_community_goods_father_id` int(20) DEFAULT NULL COMMENT '子订单商品父id',
  `nx_COS_quantity` float(10,1) DEFAULT NULL COMMENT '子订单申请数量',
  `nx_COS_standard` varchar(4) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '子订单申请规格',
  `nx_COS_price` float(10,1) DEFAULT NULL COMMENT '子订单申请商品单价',
  `nx_COS_remark` varchar(200) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '子订单申请备注',
  `nx_COS_weight` float(10,1) DEFAULT NULL COMMENT '子订单申请商品称重',
  `nx_COS_subtotal` float(10,1) DEFAULT NULL COMMENT '子订单申请商品小计',
  `nx_COS_status` tinyint(2) DEFAULT NULL COMMENT '子订单申请商品状态',
  `nx_COS_weigh_user_id` int(20) DEFAULT NULL COMMENT '子订单商品称重用户id',
  `nx_COS_account_user_id` int(20) DEFAULT NULL COMMENT '子订单商品输入单价用户id',
  `nx_COS_purchase_user_id` int(20) DEFAULT NULL COMMENT '子商品采购元id',
  `nx_COS_distributer_id` int(20) DEFAULT NULL COMMENT '子订单批发商id',
  `nx_COS_buy_status` tinyint(2) DEFAULT NULL COMMENT '子订单商品进货状态',
  `nx_COS_order_user_id` int(20) DEFAULT NULL COMMENT '子订单订货用户id',
  `nx_COS_sub_weight` float(4,1) DEFAULT NULL COMMENT '子订单重量',
  `nx_COS_sub_supplier_id` int(20) DEFAULT NULL COMMENT '子订单商品供货商id',
  `nx_COS_community_id` int(20) DEFAULT NULL COMMENT '子订单社区id',
  `nx_COS_goods_type` tinyint(2) DEFAULT NULL COMMENT '子订单社区商品类型',
  PRIMARY KEY (`nx_community_orders_sub_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_community_orders_sub
-- ----------------------------
BEGIN;
INSERT INTO `nx_community_orders_sub` VALUES (1, 1, 45096, 1, 3, 4.0, '根', 1.6, NULL, NULL, 8.4, 0, NULL, NULL, NULL, 1, 1, 1, 5.2, 1, 1, 1);
INSERT INTO `nx_community_orders_sub` VALUES (2, 1, 45097, 2, 3, 33.0, '斤', 4.0, NULL, NULL, 132.0, 0, NULL, NULL, NULL, 1, 0, 1, 33.0, 1, 1, 1);
INSERT INTO `nx_community_orders_sub` VALUES (4, 3, 45096, 1, 3, 1.0, '根', 1.6, NULL, NULL, 8.4, 0, NULL, NULL, NULL, 1, 1, 3, 5.2, 1, 1, 1);
INSERT INTO `nx_community_orders_sub` VALUES (5, 4, 45096, 1, 3, 2.0, '根', 1.6, NULL, NULL, 4.2, 0, NULL, NULL, NULL, 1, 0, 3, 2.6, 1, 1, 1);
INSERT INTO `nx_community_orders_sub` VALUES (6, 4, 45097, 2, 3, 5.0, '斤', 4.0, NULL, NULL, 20.0, 0, NULL, NULL, NULL, 1, 0, 3, 5.0, 1, 1, 1);
INSERT INTO `nx_community_orders_sub` VALUES (7, 5, 45096, 1, 3, 2.0, '根', 1.6, NULL, NULL, 4.2, 0, NULL, NULL, NULL, 1, 0, 3, 2.6, 1, 1, 1);
INSERT INTO `nx_community_orders_sub` VALUES (8, 5, 45097, 2, 3, 5.0, '斤', 4.0, NULL, NULL, 20.0, 0, NULL, NULL, NULL, 1, 0, 3, 5.0, 1, 1, 1);
INSERT INTO `nx_community_orders_sub` VALUES (9, 6, 45096, 1, 3, 2.0, '根', 1.6, NULL, NULL, 4.2, 0, NULL, NULL, NULL, 1, 0, 3, 2.6, 1, 1, 1);
INSERT INTO `nx_community_orders_sub` VALUES (10, 6, 45097, 2, 3, 5.0, '斤', 4.0, NULL, NULL, 20.0, 0, NULL, NULL, NULL, 1, 0, 3, 5.0, 1, 1, 1);
INSERT INTO `nx_community_orders_sub` VALUES (11, 7, 45096, 1, 3, 2.0, '根', 1.6, NULL, NULL, 4.2, 0, NULL, NULL, NULL, 1, 0, 3, 2.6, 1, 1, 1);
INSERT INTO `nx_community_orders_sub` VALUES (12, 7, 45097, 2, 3, 5.0, '斤', 4.0, NULL, NULL, 20.0, 0, NULL, NULL, NULL, 1, 0, 3, 5.0, 1, 1, 1);
INSERT INTO `nx_community_orders_sub` VALUES (13, 8, 45096, 1, 3, 4.0, '根', 1.6, NULL, NULL, 8.4, 0, NULL, NULL, NULL, 1, 0, 3, 5.2, 1, 1, 1);
INSERT INTO `nx_community_orders_sub` VALUES (14, 8, 45097, 2, 3, 5.5, '斤', 4.0, NULL, NULL, 22.0, 0, NULL, NULL, NULL, 1, 0, 3, 5.5, 1, 1, 1);
INSERT INTO `nx_community_orders_sub` VALUES (15, 9, 45096, 1, 3, 9.0, '根', 1.6, NULL, NULL, 18.9, 0, NULL, NULL, NULL, 1, 0, 3, 11.7, 1, 1, 1);
INSERT INTO `nx_community_orders_sub` VALUES (16, 9, 45097, 2, 3, 6.6, '斤', 4.0, NULL, NULL, 26.4, 0, NULL, NULL, NULL, 1, 0, 3, 6.6, 1, 1, 1);
INSERT INTO `nx_community_orders_sub` VALUES (17, 10, 45096, 1, 3, 4.0, '根', 1.6, NULL, NULL, 8.4, 0, NULL, NULL, NULL, 1, 0, 1, 5.2, 1, 1, 1);
INSERT INTO `nx_community_orders_sub` VALUES (18, 10, 45097, 2, 3, 33.0, '斤', 4.0, NULL, NULL, 132.0, 0, NULL, NULL, NULL, 1, 0, 1, 33.0, 1, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for nx_community_promote
-- ----------------------------
DROP TABLE IF EXISTS `nx_community_promote`;
CREATE TABLE `nx_community_promote` (
  `nx_promote_id` int(20) NOT NULL AUTO_INCREMENT,
  `nx_promote_cg_id` int(20) DEFAULT NULL,
  `nx_orignal_price` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_promote_price` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_promote_standard` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_promote_weight` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_promote_expired` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_promote_storage` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_promote_words` varchar(1000) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_promote_recommand_goods` varchar(1000) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_promote_file_path` varchar(200) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_promote_community_id` int(20) DEFAULT NULL,
  `nx_promote_cg_father_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`nx_promote_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Table structure for nx_community_standard
-- ----------------------------
DROP TABLE IF EXISTS `nx_community_standard`;
CREATE TABLE `nx_community_standard` (
  `nx_community_standard_id` int(20) NOT NULL AUTO_INCREMENT,
  `nx_CS_comm_goods_id` int(20) DEFAULT NULL,
  `nx_CS_standard_name` varchar(4) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_CS_standard_file_path` varchar(200) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_CS_standard_scale` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_CS_standard_error` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_CS_standard_sort` int(10) DEFAULT NULL,
  PRIMARY KEY (`nx_community_standard_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_community_standard
-- ----------------------------
BEGIN;
INSERT INTO `nx_community_standard` VALUES (1, 1, '根', 'uploadImage/wxbc686226ccc443f1.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.0r30bxBpTNcFbabac3529edec5e2c86ba0c548932af5.jpg', '1.3', '0.2', NULL);
COMMIT;

-- ----------------------------
-- Table structure for nx_community_stock
-- ----------------------------
DROP TABLE IF EXISTS `nx_community_stock`;
CREATE TABLE `nx_community_stock` (
  `nx_community_stock_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '社区库存id',
  `nx_cs_community_id` int(20) DEFAULT NULL COMMENT '社区库存社区id',
  `nx_stock_total` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '社区库存数量',
  `nx_stock_requier_date` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '社区库存请求入库时间',
  `nx_stock_requier_user_id` int(20) DEFAULT NULL COMMENT '社区库存请求入库用户',
  `nx_stock_status` tinyint(2) DEFAULT NULL COMMENT '社区库存状态',
  `nx_stock_in_date` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '社区库存入库时间',
  `nx_stock_in_user_id` int(20) DEFAULT NULL COMMENT '社区库存入库用户',
  PRIMARY KEY (`nx_community_stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_community_stock
-- ----------------------------
BEGIN;
INSERT INTO `nx_community_stock` VALUES (1, 1, '19.0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_community_stock` VALUES (2, 1, '19.0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_community_stock` VALUES (3, 1, '19.0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_community_stock` VALUES (4, 1, '19.0', '2020-06-08', NULL, 0, NULL, NULL);
INSERT INTO `nx_community_stock` VALUES (5, 1, '19.0', '2020-06-08', NULL, 0, NULL, NULL);
INSERT INTO `nx_community_stock` VALUES (6, 1, '19.0', '2020-06-08', NULL, 0, NULL, NULL);
INSERT INTO `nx_community_stock` VALUES (7, 1, '19.0', '2020-06-08', NULL, 0, NULL, NULL);
INSERT INTO `nx_community_stock` VALUES (8, 1, '19.0', '2020-06-08', NULL, 0, NULL, NULL);
INSERT INTO `nx_community_stock` VALUES (9, 1, '19.0', '2020-06-08', NULL, 0, NULL, NULL);
INSERT INTO `nx_community_stock` VALUES (10, 1, '19.0', '2020-06-08', NULL, 0, NULL, NULL);
INSERT INTO `nx_community_stock` VALUES (11, 1, '19.0', '2020-06-08', NULL, 0, NULL, NULL);
INSERT INTO `nx_community_stock` VALUES (12, 1, '19.0', '2020-06-08', NULL, 0, NULL, NULL);
INSERT INTO `nx_community_stock` VALUES (13, 1, '19.0', '2020-06-08', NULL, 0, NULL, NULL);
INSERT INTO `nx_community_stock` VALUES (14, 1, '19.0', '2020-06-08', NULL, 0, NULL, NULL);
INSERT INTO `nx_community_stock` VALUES (15, 1, '19.0', '2020-06-08', NULL, 0, NULL, NULL);
INSERT INTO `nx_community_stock` VALUES (16, 1, '19.0', '2020-06-08', NULL, 0, NULL, NULL);
INSERT INTO `nx_community_stock` VALUES (17, 1, '19.0', '2020-06-08', NULL, 0, NULL, NULL);
INSERT INTO `nx_community_stock` VALUES (18, 1, '19.0', '2020-06-08', NULL, 0, NULL, NULL);
INSERT INTO `nx_community_stock` VALUES (19, 1, '19.0', '2020-06-08', NULL, 0, NULL, NULL);
INSERT INTO `nx_community_stock` VALUES (20, 1, '19.0', '2020-06-08', NULL, 0, NULL, NULL);
INSERT INTO `nx_community_stock` VALUES (21, 1, '8.0', '2020-06-09', NULL, 0, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for nx_community_stock_sub
-- ----------------------------
DROP TABLE IF EXISTS `nx_community_stock_sub`;
CREATE TABLE `nx_community_stock_sub` (
  `nx_community_sub_stock_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '社区子库存id',
  `nx_cs_id` int(20) DEFAULT NULL COMMENT '社区子库存库存id',
  `nx_css_cg_id` int(20) DEFAULT NULL COMMENT '社区子社区商品id',
  `nx_css_entry_amount` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '社区子库存入库数量',
  `nx_css_entry_standard` varchar(4) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '社区子库存入库单位',
  `nx_css_entry_price` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '社区子库存入库单价',
  `nx_css_entry_sub_total` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '社区子库存入库小计',
  `nx_css_entry_date` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '社区子库存入库日期',
  `nx_css_stock_amount` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '社区子库存库存数量',
  PRIMARY KEY (`nx_community_sub_stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_community_stock_sub
-- ----------------------------
BEGIN;
INSERT INTO `nx_community_stock_sub` VALUES (1, NULL, 8, '2', '斤', '5.0', '10.0', '2020-06-08', NULL);
INSERT INTO `nx_community_stock_sub` VALUES (2, NULL, 10, '3', '斤', '3.0', '9.0', '2020-06-08', NULL);
INSERT INTO `nx_community_stock_sub` VALUES (3, NULL, 8, '2', '斤', '5.0', '10.0', '2020-06-08', NULL);
INSERT INTO `nx_community_stock_sub` VALUES (4, NULL, 10, '3', '斤', '3.0', '9.0', '2020-06-08', NULL);
INSERT INTO `nx_community_stock_sub` VALUES (5, NULL, 8, '2', '斤', '5.0', '10.0', '2020-06-08', NULL);
INSERT INTO `nx_community_stock_sub` VALUES (6, NULL, 10, '3', '斤', '3.0', '9.0', '2020-06-08', NULL);
INSERT INTO `nx_community_stock_sub` VALUES (7, NULL, 8, '2', '斤', '5.0', '10.0', '2020-06-08', NULL);
INSERT INTO `nx_community_stock_sub` VALUES (8, NULL, 10, '3', '斤', '3.0', '9.0', '2020-06-08', NULL);
INSERT INTO `nx_community_stock_sub` VALUES (9, NULL, 8, '2', '斤', '5.0', '10.0', '2020-06-08', NULL);
INSERT INTO `nx_community_stock_sub` VALUES (10, NULL, 10, '3', '斤', '3.0', '9.0', '2020-06-08', NULL);
INSERT INTO `nx_community_stock_sub` VALUES (11, NULL, 8, '2', '斤', '5.0', '10.0', '2020-06-08', '2');
INSERT INTO `nx_community_stock_sub` VALUES (12, NULL, 10, '3', '斤', '3.0', '9.0', '2020-06-08', '3');
INSERT INTO `nx_community_stock_sub` VALUES (13, NULL, 8, '2', '斤', '5.0', '10.0', '2020-06-08', '2');
INSERT INTO `nx_community_stock_sub` VALUES (14, NULL, 10, '3', '斤', '3.0', '9.0', '2020-06-08', '3');
INSERT INTO `nx_community_stock_sub` VALUES (15, NULL, 8, '2', '斤', '5.0', '10.0', '2020-06-08', '2');
INSERT INTO `nx_community_stock_sub` VALUES (16, NULL, 10, '3', '斤', '3.0', '9.0', '2020-06-08', '3');
INSERT INTO `nx_community_stock_sub` VALUES (17, NULL, 8, '2', '斤', '5.0', '10.0', '2020-06-08', '2');
INSERT INTO `nx_community_stock_sub` VALUES (18, NULL, 10, '3', '斤', '3.0', '9.0', '2020-06-08', '3');
INSERT INTO `nx_community_stock_sub` VALUES (19, NULL, 8, '2', '斤', '5.0', '10.0', '2020-06-08', '2');
INSERT INTO `nx_community_stock_sub` VALUES (20, NULL, 10, '3', '斤', '3.0', '9.0', '2020-06-08', '3');
INSERT INTO `nx_community_stock_sub` VALUES (21, NULL, 8, '2', '斤', '5.0', '10.0', '2020-06-08', '2');
INSERT INTO `nx_community_stock_sub` VALUES (22, NULL, 10, '3', '斤', '3.0', '9.0', '2020-06-08', '3');
INSERT INTO `nx_community_stock_sub` VALUES (23, NULL, 8, '2', '斤', '5.0', '10.0', '2020-06-08', '2');
INSERT INTO `nx_community_stock_sub` VALUES (24, NULL, 10, '3', '斤', '3.0', '9.0', '2020-06-08', '3');
INSERT INTO `nx_community_stock_sub` VALUES (25, NULL, 8, '2', '斤', '5.0', '10.0', '2020-06-08', '2');
INSERT INTO `nx_community_stock_sub` VALUES (26, NULL, 10, '3', '斤', '3.0', '9.0', '2020-06-08', '3');
INSERT INTO `nx_community_stock_sub` VALUES (27, NULL, 8, '2', '斤', '5.0', '10.0', '2020-06-08', '2');
INSERT INTO `nx_community_stock_sub` VALUES (28, NULL, 10, '3', '斤', '3.0', '9.0', '2020-06-08', '3');
INSERT INTO `nx_community_stock_sub` VALUES (29, NULL, 8, '2', '斤', '5.0', '10.0', '2020-06-08', '2');
INSERT INTO `nx_community_stock_sub` VALUES (30, NULL, 10, '3', '斤', '3.0', '9.0', '2020-06-08', '3');
INSERT INTO `nx_community_stock_sub` VALUES (31, NULL, 12, '2', '斤', '4.0', '8.0', '2020-06-09', '2');
COMMIT;

-- ----------------------------
-- Table structure for nx_community_user
-- ----------------------------
DROP TABLE IF EXISTS `nx_community_user`;
CREATE TABLE `nx_community_user` (
  `nx_agent_user_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '社区用户id',
  `AU_wx_nick_name` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '社区用户用户微信昵称',
  `AU_wx_avartra_url` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '社区用户用户微信头像',
  `AU_wx_agender` varchar(4) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '社区用户用户微信性别',
  `AU_name` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '社区用户用户姓名',
  `AU_phone` varchar(11) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '社区用户用户手机号码',
  PRIMARY KEY (`nx_agent_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Table structure for nx_customer
-- ----------------------------
DROP TABLE IF EXISTS `nx_customer`;
CREATE TABLE `nx_customer` (
  `nx_customer_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '客户id',
  `nx_customer_name` varchar(50) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '客户名称',
  `nx_customer_print_label` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '客户打印名称',
  `nx_customer_out_label` varchar(50) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '客户对外名称',
  `nx_customer_type` tinyint(2) DEFAULT NULL COMMENT '客户类型',
  `nx_customer_address` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '客户地址',
  `nx_customer_phone` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '客户手机',
  `nx_customer_call` int(10) DEFAULT NULL COMMENT '客户称呼',
  `nx_customer_lat` varchar(30) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_customer_lng` varchar(30) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_customer_dis_id` int(20) DEFAULT NULL COMMENT '客户批发商id',
  `nx_customer_community_id` int(20) DEFAULT NULL COMMENT '社区id',
  `nx_customer_join_date` date DEFAULT NULL COMMENT '客户加入日期',
  `nx_customer_order_amount` float(10,1) DEFAULT NULL COMMENT '客户订货金额',
  `nx_customer_order_times` int(10) DEFAULT NULL COMMENT '客户订货次数',
  `nx_customer_detail_address` varchar(200) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '客户详细地址',
  PRIMARY KEY (`nx_customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_customer
-- ----------------------------
BEGIN;
INSERT INTO `nx_customer` VALUES (1, 'lipeiyi', NULL, NULL, NULL, '美林湾-41号楼', '13000099999', 2, '39.985476', '116.787085', 1, 1, NULL, NULL, NULL, '1haolou');
INSERT INTO `nx_customer` VALUES (2, '李佩仪', NULL, NULL, NULL, '美林湾-41号楼', '13910825707', 2, '39.985476', '116.787085', 1, 1, NULL, NULL, NULL, '1单元');
INSERT INTO `nx_customer` VALUES (3, '吗', NULL, NULL, NULL, '美林湾-52号楼', '13969636963', 2, '39.985476', '116.787085', 1, 1, NULL, NULL, NULL, '的');
INSERT INTO `nx_customer` VALUES (4, 'dd', NULL, NULL, NULL, '美林湾', '13910899999', 2, '39.985476', '116.787085', 1, 1, NULL, NULL, NULL, '22');
INSERT INTO `nx_customer` VALUES (5, 'dd', NULL, NULL, NULL, '美林湾', '13910899999', 2, '39.985476', '116.787085', 1, 1, NULL, NULL, NULL, '22');
INSERT INTO `nx_customer` VALUES (6, '111', NULL, NULL, NULL, '美林湾', '13900000000', 2, '39.985476', '116.787085', 1, 1, NULL, NULL, NULL, '12hao');
COMMIT;

-- ----------------------------
-- Table structure for nx_customer_user
-- ----------------------------
DROP TABLE IF EXISTS `nx_customer_user`;
CREATE TABLE `nx_customer_user` (
  `nx_CU_user_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '客户用户id',
  `nx_CU_customer_id` int(20) DEFAULT NULL COMMENT '客户id',
  `nx_CU_wx_nick_name` varchar(50) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '客户用户微信昵称',
  `nx_CU_wx_avatar_url` varchar(200) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '微信头像',
  `nx_CU_wx_gender` int(2) DEFAULT NULL COMMENT '微信性别',
  `nx_CU_wx_open_id` varchar(40) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '微信openid',
  `nx_CU_wx_phone_number` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '微信手机号',
  `nx_CU_join_date` date DEFAULT NULL COMMENT '客户加入时间',
  `nx_CU_order_amount` float(10,1) DEFAULT NULL COMMENT '客户订货总金额',
  `nx_CU_order_times` int(10) DEFAULT NULL COMMENT '客户订货次数',
  PRIMARY KEY (`nx_CU_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_customer_user
-- ----------------------------
BEGIN;
INSERT INTO `nx_customer_user` VALUES (1, 1, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL, NULL, NULL, NULL);
INSERT INTO `nx_customer_user` VALUES (2, 2, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL, NULL, NULL, NULL);
INSERT INTO `nx_customer_user` VALUES (3, 3, '李君', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL, NULL, NULL, NULL);
INSERT INTO `nx_customer_user` VALUES (4, 5, '李君', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL, NULL, NULL, NULL);
INSERT INTO `nx_customer_user` VALUES (5, 6, '李君', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmFzvphh03pmzPe490lSNn38SBB18VWm3fL8VGT0KibzOmKehqvLRHCicUicEtrzToAvFQnQJic4kibSQ/132', 2, 'oX2485BL9V-FjEa7bKOkFJcqxD0E', NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for nx_customer_user_goods
-- ----------------------------
DROP TABLE IF EXISTS `nx_customer_user_goods`;
CREATE TABLE `nx_customer_user_goods` (
  `nx_CUG_goods_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '客户用户商品id',
  `nx_CUG_user_id` int(20) DEFAULT NULL COMMENT '客户用户id',
  `nx_CUG_community_goods_id` int(20) DEFAULT NULL COMMENT '批发商商品id',
  `nx_CUG_first_order_time` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '客户用户第一次订货时间',
  `nx_CUG_last_order_time` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '客户用户最后一次订货时间',
  `nx_CUG_order_amount` float(10,1) DEFAULT NULL COMMENT '客户用户订货总量',
  `nx_CUG_order_times` int(10) DEFAULT NULL COMMENT '客户用户订货次数',
  `nx_CUG_is_love` tinyint(2) DEFAULT NULL COMMENT '客户用户最爱',
  `nx_CUG_order_rate` int(4) DEFAULT NULL COMMENT '客户订货频率',
  `nx_CUG_last_order_quantity` float(10,1) DEFAULT NULL COMMENT '客户最后一次订货数量',
  `nx_CUG_last_order_standard` varchar(4) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '客户最后一次订货规格',
  `nx_CUG_join_my_template` tinyint(2) DEFAULT NULL COMMENT '是否加入用户订货模版',
  `nx_CUG_order_quantity` float(4,1) DEFAULT NULL,
  `nx_CUG_order_standard` varchar(4) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_CUG_goods_color` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  PRIMARY KEY (`nx_CUG_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_customer_user_goods
-- ----------------------------
BEGIN;
INSERT INTO `nx_customer_user_goods` VALUES (1, 1, 1, '2020-06-12', '2020-06-20', 8.0, 2, NULL, NULL, 4.0, '根', 0, NULL, NULL, NULL);
INSERT INTO `nx_customer_user_goods` VALUES (2, 1, 2, '2020-06-12', '2020-06-20', 66.0, 2, NULL, NULL, 33.0, '斤', 0, NULL, NULL, NULL);
INSERT INTO `nx_customer_user_goods` VALUES (3, 2, 1, '2020-06-12', '2020-06-12', 1.0, 1, NULL, NULL, 1.0, '根', 0, NULL, NULL, NULL);
INSERT INTO `nx_customer_user_goods` VALUES (4, 3, 1, '2020-06-12', '2020-06-19', 25.0, 7, NULL, NULL, 9.0, '根', 0, NULL, NULL, NULL);
INSERT INTO `nx_customer_user_goods` VALUES (5, 3, 2, '2020-06-18', '2020-06-19', 32.1, 6, NULL, NULL, 6.6, '斤', 0, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for nx_department
-- ----------------------------
DROP TABLE IF EXISTS `nx_department`;
CREATE TABLE `nx_department` (
  `nx_department_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '订货部门id',
  `nx_department_name` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订货部门名称',
  `nx_department_father_id` int(20) DEFAULT NULL COMMENT '订货部门上级id',
  `nx_department_type` varchar(50) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订货部门类型',
  `nx_department_sub_amount` int(2) DEFAULT NULL COMMENT '订货部门子部门数量',
  `nx_department_dis_id` int(20) DEFAULT NULL COMMENT '订货部门批发商id',
  `nx_department_file_path` varchar(200) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_department_is_group_dep` tinyint(2) DEFAULT NULL COMMENT '是客户吗',
  `nx_department_print_name` varchar(200) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_department_show_weeks` tinyint(2) DEFAULT '1',
  PRIMARY KEY (`nx_department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_department
-- ----------------------------
BEGIN;
INSERT INTO `nx_department` VALUES (1, '子祥', 0, '1', 0, 1, 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJrPWubwbROMC55HdcicQicia2M7OvqibxBkD7FC0icTHV08UmUYIphSo03ZQdG52WDs1cCws1ADPoIeLA/132', 1, NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for nx_department_bill
-- ----------------------------
DROP TABLE IF EXISTS `nx_department_bill`;
CREATE TABLE `nx_department_bill` (
  `nx_department_bill_id` int(20) NOT NULL AUTO_INCREMENT,
  `nx_DB_dis_id` int(20) DEFAULT NULL,
  `nx_DB_dep_id` int(20) DEFAULT NULL,
  `nx_DB_total` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DB_status` tinyint(2) DEFAULT NULL,
  `nx_DB_time` varchar(30) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DB_issue_user_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`nx_department_bill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_department_bill
-- ----------------------------
BEGIN;
INSERT INTO `nx_department_bill` VALUES (1, 1, 1, '129.0', 0, '2020-10-14', 1);
COMMIT;

-- ----------------------------
-- Table structure for nx_department_dis_goods
-- ----------------------------
DROP TABLE IF EXISTS `nx_department_dis_goods`;
CREATE TABLE `nx_department_dis_goods` (
  `nx_department_dis_goods_id` int(20) NOT NULL AUTO_INCREMENT,
  `nx_DDG_department_father_id` int(20) DEFAULT NULL,
  `nx_DDG_department_id` int(20) DEFAULT NULL,
  `nx_DDG_dis_goods_id` int(20) DEFAULT NULL,
  `nx_DDG_dis_goods_father_id` int(20) DEFAULT NULL,
  `nx_DDG_dep_goods_name` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DDG_dep_goods_pinyin` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DDG_dep_goods_py` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DDG_dep_goods_standardname` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DDG_dep_goods_detail` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DDG_dep_goods_brand` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DDG_dep_goods_place` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DDG_dep_goods_price` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DDG_dep_goods_price_date` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL,
  PRIMARY KEY (`nx_department_dis_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_department_dis_goods
-- ----------------------------
BEGIN;
INSERT INTO `nx_department_dis_goods` VALUES (2, 1, NULL, 1, 1, '白萝卜', 'bailuobu', 'blb', '斤', '', NULL, '', '2', '10-14');
INSERT INTO `nx_department_dis_goods` VALUES (3, 1, NULL, 3, 1, '胡萝卜', 'huluobu', 'hlb', '斤', '', '', '', '2', '10-14');
INSERT INTO `nx_department_dis_goods` VALUES (4, 1, NULL, 4, 1, '红薯', 'hongshu', 'hs', '斤', '普通', NULL, '', NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (5, 1, NULL, 5, 1, '绿萝卜', 'lüluobu', 'llb', '斤', NULL, NULL, NULL, '3', '10-14');
INSERT INTO `nx_department_dis_goods` VALUES (6, 1, NULL, 10, 1, '土豆', 'tudou', 'td', '斤', '', NULL, '', NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (7, 1, NULL, 11, 1, '铁棍山药', 'tiegunshanyao', 'tgsy', '斤', NULL, NULL, NULL, '6', '10-14');
INSERT INTO `nx_department_dis_goods` VALUES (8, 1, NULL, 2, 1, '卞萝卜', 'bianluobu', 'blb', '斤', '', NULL, '', NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (9, 1, NULL, 7, 1, '蜜薯', 'mishu', 'ms', '斤', '', '', '', NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (10, 1, NULL, 8, 1, '麻山药', 'mashanyao', 'msy', '斤', '', NULL, '', NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (11, 1, NULL, 9, 1, '藕', 'ou', 'o', '斤', '', NULL, '', NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (12, 1, NULL, 12, 1, '莴笋', 'wosun', 'ws', '斤', '', NULL, '', NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (13, 1, NULL, 13, 1, '心里美', 'xinlimei', 'xlm', '斤', '', NULL, '', NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (14, 1, NULL, 14, 1, '新土豆', 'xintudou', 'xtd', '斤', '', NULL, '', NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (15, 1, NULL, 15, 1, '芋头', 'yutou', 'yt', '斤', '', NULL, '', NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (16, 1, NULL, 16, 1, '樱桃萝卜', 'yingtaoluobu', 'ytlb', '斤', '', NULL, '', NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (17, 1, NULL, 17, 4, '白不老', 'baibulao', 'bbl', '斤', '', NULL, '', NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (18, 1, NULL, 18, 4, '扁豆', 'biandou', 'bd', '斤', '', NULL, '', NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (19, 1, NULL, 19, 4, '荸荠', 'biji', 'bj', '斤', '', NULL, '', NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (20, 1, NULL, 20, 4, '板栗南瓜', 'banlinangua', 'blng', '斤', '', NULL, '', NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (21, 1, NULL, 21, 4, '长茄子', 'changqiezi', 'cqz', '斤', '', '', '', NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (22, 1, NULL, 22, 4, '冬春笋', 'dongchunsun', 'dcs', '斤', '', NULL, '', NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (23, 1, NULL, 23, 4, '吊冬瓜', 'diaodonggua', 'ddg', '斤', '', NULL, '', NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (24, 1, NULL, 24, 4, '地冬瓜', 'didonggua', 'ddg', '斤', '', NULL, '', NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (25, 1, NULL, 25, 4, '豆王', 'douwang', 'dw', '斤', '', NULL, '', NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (26, 1, NULL, 26, 4, '广茄', 'guangqie', 'gq', '斤', '', NULL, '', NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (27, 1, NULL, 27, 4, '黄瓜', 'huanggua', 'hg', '斤', '', NULL, '', NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (28, 1, NULL, 28, 4, '荷兰瓜', 'helangua', 'hlg', '斤', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (29, 1, NULL, 29, 4, '花生', 'huasheng', 'hs', '斤', '', NULL, '', NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (30, 1, NULL, 30, 4, '菜花', 'caihua', 'ch', '斤', '', NULL, '', NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (31, 1, NULL, 31, 4, '架豆', 'jiadou', 'jd', '斤', '', NULL, '', NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (32, 1, NULL, 33, 4, '金丝南瓜', 'jinsinangua', 'jsng', '斤', '', NULL, '', NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (33, 1, NULL, 32, 4, '豇豆', 'jiangdou', 'jd', '斤', '', NULL, '', NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (34, 1, NULL, 34, 4, '苦瓜', 'kugua', 'kg', '斤', '', NULL, '', NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (35, 1, NULL, 35, 4, '毛豆', 'maodou', 'md', '斤', '', NULL, '', NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (36, 1, NULL, 39, 4, '散菜花', 'sancaihua', 'sch', '斤', '', NULL, '', NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (37, 1, NULL, 38, 4, '丝瓜', 'sigua', 'sg', '斤', '', NULL, '', NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (38, 1, NULL, 37, 4, '秋葵', 'qiukui', 'qk', '斤', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (39, 1, NULL, 36, 4, '南北瓜', 'nanbeigua', 'nbg', '斤', '', NULL, '', NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (40, 1, NULL, 40, 4, '甜豆', 'tiandou', 'td', '斤', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (41, 1, NULL, 42, 4, '西胡芦', 'xihulu', 'xhl', '斤', '', NULL, '', NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (42, 1, NULL, 41, 4, '豌豆', 'wandou', 'wd', '斤', '', NULL, '', NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (43, 1, NULL, 43, 4, '西红柿', 'xihongshi', 'xhs', '斤', '', NULL, '', NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (44, 1, NULL, 44, 4, '西兰花', 'xilanhua', 'xlh', '斤', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (45, 1, NULL, 45, 4, '小毛冬瓜', 'xiaomaodonggua', 'xmdg', '斤', '', NULL, '', NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (46, 1, NULL, 46, 4, '线茄', 'xianqie', 'xq', '斤', '', NULL, '', NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (47, 1, NULL, 47, 4, '小西红柿', 'xiaoxihongshi', 'xxhs', '斤', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (48, 1, NULL, 48, 4, '油豆', 'youdou', 'yd', '斤', '', NULL, '', NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (49, 1, NULL, 49, 4, '玉米', 'yumi', 'ym', '斤', '', NULL, '', NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (50, 1, NULL, 50, 4, '圆茄子', 'yuanqiezi', 'yqz', '斤', '', '', '', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for nx_department_independent_goods
-- ----------------------------
DROP TABLE IF EXISTS `nx_department_independent_goods`;
CREATE TABLE `nx_department_independent_goods` (
  `nx_department_independent_goods_id` int(20) NOT NULL AUTO_INCREMENT,
  `nx_DIG_goods_name` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DIG_goods_standardname` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DIG_department_father_id` int(20) DEFAULT NULL,
  `nx_DIG_department_id` int(20) DEFAULT NULL,
  `nx_DIG_alarm_rate` int(2) DEFAULT NULL,
  `nx_DIG_goods_pinyin` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DIG_goods_py` varchar(50) COLLATE utf16_czech_ci DEFAULT NULL,
  PRIMARY KEY (`nx_department_independent_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_department_independent_goods
-- ----------------------------
BEGIN;
INSERT INTO `nx_department_independent_goods` VALUES (1, '餐盒', NULL, NULL, 1, NULL, 'canhe', 'ch');
COMMIT;

-- ----------------------------
-- Table structure for nx_department_orders
-- ----------------------------
DROP TABLE IF EXISTS `nx_department_orders`;
CREATE TABLE `nx_department_orders` (
  `nx_department_orders_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '部门订单id',
  `nx_DO_nx_goods_id` int(20) DEFAULT NULL COMMENT '部门订单nx商品id',
  `nx_DO_nx_goods_father_id` int(20) DEFAULT NULL COMMENT '部门订单商品父id',
  `nx_DO_dis_goods_id` int(20) DEFAULT NULL COMMENT '部门订单社区商品id',
  `nx_DO_dis_goods_father_id` int(20) DEFAULT NULL COMMENT '批发商父级商品id',
  `nx_DO_dep_dis_goods_id` int(20) DEFAULT NULL,
  `nx_DO_dep_dis_goods_price` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '部门商品价格',
  `nx_DO_quantity` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '部门订单申请数量',
  `nx_DO_standard` varchar(4) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '部门订单申请规格',
  `nx_DO_remark` varchar(200) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '部门订单申请备注',
  `nx_DO_weight` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '部门订单重量',
  `nx_DO_price` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '部门订单商品单价',
  `nx_DO_subtotal` varchar(50) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '部门订单申请商品小计',
  `nx_DO_department_id` int(20) DEFAULT NULL COMMENT '部门订单部门id',
  `nx_DO_department_father_id` int(20) DEFAULT NULL,
  `nx_DO_distributer_id` int(20) DEFAULT NULL COMMENT '部门订单批发商id',
  `nx_DO_purchase_user_id` int(20) DEFAULT NULL COMMENT '部门商品采购员id',
  `nx_DO_bill_id` int(11) DEFAULT NULL COMMENT '部门订单账单id',
  `nx_DO_status` tinyint(2) DEFAULT NULL COMMENT '部门订单申请商品状态',
  `nx_DO_order_user_id` int(20) DEFAULT NULL COMMENT '部门订单订货用户id',
  `nx_DO_pick_user_id` int(20) DEFAULT NULL COMMENT '部门订单商品称重用户id',
  `nx_DO_account_user_id` int(20) DEFAULT NULL COMMENT '部门订单商品输入单价用户id',
  `nx_DO_buy_status` tinyint(2) DEFAULT NULL COMMENT '部门订单商品进货状态',
  `nx_DO_apply_date` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '部门订单申请时间',
  `nx_DO_arrive_date` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '部门订单送达时间',
  `nx_DO_purchase_goods_id` int(20) DEFAULT NULL COMMENT '订单采购商品id',
  `nx_DO_apply_only_date` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DO_apply_only_time` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DO_goods_type` tinyint(2) DEFAULT NULL,
  `nx_DO_ind_goods_id` int(20) DEFAULT NULL,
  `nx_DO_ind_goods_py` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DO_operation_time` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DO_apply_what_day` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '星期几',
  `nx_DO_is_agent` tinyint(2) DEFAULT NULL,
  `nx_DO_apply_weeks_year` int(4) DEFAULT NULL COMMENT '本年第几周',
  PRIMARY KEY (`nx_department_orders_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_department_orders
-- ----------------------------
BEGIN;
INSERT INTO `nx_department_orders` VALUES (1, NULL, NULL, 1, NULL, 2, NULL, '2', '根', '', '3', '2', '6.0', 1, 1, 1, NULL, NULL, 4, 1, NULL, NULL, 0, '2020-10-14', '2020-10-15', NULL, '10-14', '17:25', 0, NULL, NULL, NULL, '星期三', 0, 52);
INSERT INTO `nx_department_orders` VALUES (2, NULL, NULL, 54, NULL, 1, NULL, '1', '颗', '', '8', '1', '8.0', 1, 1, 1, NULL, NULL, 4, 1, NULL, NULL, 0, '2020-10-14', '2020-10-15', NULL, '10-14', '17:29', 0, NULL, NULL, NULL, '星期三', 0, 52);
INSERT INTO `nx_department_orders` VALUES (3, NULL, NULL, 3, NULL, 3, NULL, '3', '斤', '', '5', '2', '10.0', 1, 1, 1, NULL, NULL, 4, 1, NULL, NULL, 0, '2020-10-14', '2020-10-15', NULL, '10-14', '17:29', 0, NULL, NULL, NULL, '星期三', 0, 52);
INSERT INTO `nx_department_orders` VALUES (4, NULL, NULL, 5, NULL, 5, NULL, '25', '斤', '', '25', '3', '75.0', 1, 1, 1, NULL, NULL, 4, 1, NULL, NULL, 0, '2020-10-14', '2020-10-15', NULL, '10-14', '17:29', 0, NULL, NULL, NULL, '星期三', 0, 52);
INSERT INTO `nx_department_orders` VALUES (5, NULL, NULL, 11, NULL, 7, NULL, '1', '根', '', '5', '6', '30.0', 1, 1, 1, NULL, NULL, 4, 1, NULL, NULL, 0, '2020-10-14', '2020-10-15', NULL, '10-14', '17:29', 0, NULL, NULL, NULL, '星期三', 0, 52);
COMMIT;

-- ----------------------------
-- Table structure for nx_department_standard
-- ----------------------------
DROP TABLE IF EXISTS `nx_department_standard`;
CREATE TABLE `nx_department_standard` (
  `nx_department_standard_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '部门规格id',
  `nx_DDS_dds_goods_id` int(20) DEFAULT NULL COMMENT '部门商品id',
  `nx_DDS_standard_name` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '部门规格名称',
  `nx_DDS_standard_sort` int(10) DEFAULT NULL COMMENT '部门规格排序',
  PRIMARY KEY (`nx_department_standard_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_department_standard
-- ----------------------------
BEGIN;
INSERT INTO `nx_department_standard` VALUES (1, 1, '颗', NULL);
INSERT INTO `nx_department_standard` VALUES (2, 2, '根', NULL);
INSERT INTO `nx_department_standard` VALUES (3, 3, '根', NULL);
INSERT INTO `nx_department_standard` VALUES (4, 4, '个', NULL);
INSERT INTO `nx_department_standard` VALUES (5, 5, '个', NULL);
INSERT INTO `nx_department_standard` VALUES (6, 6, '个', NULL);
INSERT INTO `nx_department_standard` VALUES (7, 7, '根', NULL);
INSERT INTO `nx_department_standard` VALUES (8, 8, '个', NULL);
INSERT INTO `nx_department_standard` VALUES (9, 9, '个', NULL);
INSERT INTO `nx_department_standard` VALUES (10, 10, '根', NULL);
INSERT INTO `nx_department_standard` VALUES (11, 11, '根', NULL);
INSERT INTO `nx_department_standard` VALUES (12, 11, '节', NULL);
INSERT INTO `nx_department_standard` VALUES (13, 12, '根', NULL);
INSERT INTO `nx_department_standard` VALUES (14, 13, '个', NULL);
INSERT INTO `nx_department_standard` VALUES (15, 14, '个', NULL);
INSERT INTO `nx_department_standard` VALUES (16, 15, '个', NULL);
INSERT INTO `nx_department_standard` VALUES (17, 16, '把', NULL);
INSERT INTO `nx_department_standard` VALUES (18, 20, '个', NULL);
INSERT INTO `nx_department_standard` VALUES (19, 21, '根', NULL);
INSERT INTO `nx_department_standard` VALUES (20, 22, '根', NULL);
INSERT INTO `nx_department_standard` VALUES (21, 23, '个', NULL);
INSERT INTO `nx_department_standard` VALUES (22, 24, '个', NULL);
INSERT INTO `nx_department_standard` VALUES (23, 26, '根', NULL);
INSERT INTO `nx_department_standard` VALUES (24, 27, '根', NULL);
INSERT INTO `nx_department_standard` VALUES (25, 28, '根', NULL);
INSERT INTO `nx_department_standard` VALUES (26, 30, '颗', NULL);
INSERT INTO `nx_department_standard` VALUES (27, 32, '个', NULL);
INSERT INTO `nx_department_standard` VALUES (28, 34, '根', NULL);
INSERT INTO `nx_department_standard` VALUES (29, 36, '颗', NULL);
INSERT INTO `nx_department_standard` VALUES (30, 37, '根', NULL);
INSERT INTO `nx_department_standard` VALUES (31, 39, '个', NULL);
INSERT INTO `nx_department_standard` VALUES (32, 41, '根', NULL);
INSERT INTO `nx_department_standard` VALUES (33, 43, '个', NULL);
INSERT INTO `nx_department_standard` VALUES (34, 44, '颗', NULL);
INSERT INTO `nx_department_standard` VALUES (35, 45, '个', NULL);
INSERT INTO `nx_department_standard` VALUES (36, 46, '根', NULL);
INSERT INTO `nx_department_standard` VALUES (37, 49, '根', NULL);
INSERT INTO `nx_department_standard` VALUES (38, 50, '个', NULL);
COMMIT;

-- ----------------------------
-- Table structure for nx_department_user
-- ----------------------------
DROP TABLE IF EXISTS `nx_department_user`;
CREATE TABLE `nx_department_user` (
  `nx_department_user_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '订货部门用户id',
  `nx_DU_department_id` int(20) DEFAULT NULL COMMENT '订货部门id',
  `nx_DU_wx_avartra_url` varchar(200) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订货部门用户微信头像',
  `nx_DU_wx_nick_name` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订货部门用户微信昵称',
  `nx_DU_wx_open_id` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订货部门用户微信openid',
  `nx_DU_wx_phone` varchar(15) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订货部门用户微信手机号码',
  `nx_DU_admin` tinyint(2) DEFAULT NULL COMMENT '订货部门用户是否是管理员',
  `nx_DU_distributer_id` int(20) DEFAULT NULL COMMENT '订货部门批发商id',
  `nx_DU_url_change` tinyint(2) DEFAULT NULL,
  `nx_DU_department_father_id` int(20) DEFAULT NULL,
  `nx_DU_join_date` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL,
  PRIMARY KEY (`nx_department_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_department_user
-- ----------------------------
BEGIN;
INSERT INTO `nx_department_user` VALUES (1, 1, 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJrPWubwbROMC55HdcicQicia2M7OvqibxBkD7FC0icTHV08UmUYIphSo03ZQdG52WDs1cCws1ADPoIeLA/132', '李君', 'ofoiw4v7UK6wVYTdDmEL4fMjG9ts', NULL, 1, 1, 0, 1, '2020-10-14');
INSERT INTO `nx_department_user` VALUES (2, 1, 'https://thirdwx.qlogo.cn/mmopen/vi_32/0Ds5EDzz2BFk2SiaaH5L2REHysxRUQPvLibWpjJx7v6PEP6aleKXzP1rtzXiaUQLVbqcdibGpea8Eu6cL8U1FIoLjg/132', '沛谊', 'ofoiw4jymo11t1boCKwp_JTuwu9U', NULL, 1, 1, 0, 1, '2020-10-14');
COMMIT;

-- ----------------------------
-- Table structure for nx_dis_user_role
-- ----------------------------
DROP TABLE IF EXISTS `nx_dis_user_role`;
CREATE TABLE `nx_dis_user_role` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` int(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of nx_dis_user_role
-- ----------------------------
BEGIN;
INSERT INTO `nx_dis_user_role` VALUES (2, 1, 3);
INSERT INTO `nx_dis_user_role` VALUES (3, 2, 3);
COMMIT;

-- ----------------------------
-- Table structure for nx_distributer
-- ----------------------------
DROP TABLE IF EXISTS `nx_distributer`;
CREATE TABLE `nx_distributer` (
  `nx_distributer_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '批发商id',
  `nx_distributer_name` varchar(50) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '批发商名称',
  `nx_distributer_lan` varchar(200) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '批发商位置经度',
  `nx_distributer_lun` varchar(200) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '批发商位置纬度',
  `nx_distributer_business_type` tinyint(2) DEFAULT NULL COMMENT '批发商商业类型',
  `nx_distributer_manager` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_distributer_phone` varchar(30) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_distributer_address` varchar(200) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_distributer_img` varchar(200) COLLATE utf16_czech_ci DEFAULT NULL,
  PRIMARY KEY (`nx_distributer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_distributer
-- ----------------------------
BEGIN;
INSERT INTO `nx_distributer` VALUES (1, '李树国配送', NULL, NULL, NULL, '李树国', '13910825707', '京贸物联批发市场D-102', 'uploadImage/r.jpg');
COMMIT;

-- ----------------------------
-- Table structure for nx_distributer_agent
-- ----------------------------
DROP TABLE IF EXISTS `nx_distributer_agent`;
CREATE TABLE `nx_distributer_agent` (
  `nx_dis_agent_id` int(20) NOT NULL AUTO_INCREMENT,
  `da_dis_id` int(20) DEFAULT NULL,
  `da_agent_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`nx_dis_agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Table structure for nx_distributer_alias
-- ----------------------------
DROP TABLE IF EXISTS `nx_distributer_alias`;
CREATE TABLE `nx_distributer_alias` (
  `nx_distributer_alias_id` int(20) NOT NULL AUTO_INCREMENT,
  `nx_DA_dis_goods_id` int(20) DEFAULT NULL,
  `nx_DA_alias_name` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL,
  PRIMARY KEY (`nx_distributer_alias_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_distributer_alias
-- ----------------------------
BEGIN;
INSERT INTO `nx_distributer_alias` VALUES (1, 3, '红萝卜');
INSERT INTO `nx_distributer_alias` VALUES (2, 4, '红苕');
INSERT INTO `nx_distributer_alias` VALUES (3, 4, '地瓜');
INSERT INTO `nx_distributer_alias` VALUES (4, 9, '莲菜');
INSERT INTO `nx_distributer_alias` VALUES (5, 10, '洋芋');
INSERT INTO `nx_distributer_alias` VALUES (6, 18, '豆角');
INSERT INTO `nx_distributer_alias` VALUES (7, 47, '圣女果');
COMMIT;

-- ----------------------------
-- Table structure for nx_distributer_community
-- ----------------------------
DROP TABLE IF EXISTS `nx_distributer_community`;
CREATE TABLE `nx_distributer_community` (
  `nx_DC_id` int(20) NOT NULL COMMENT '批发商社区id',
  `nx_DC_community_id` int(20) DEFAULT NULL,
  `nx_DC_distributer_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`nx_DC_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_distributer_community
-- ----------------------------
BEGIN;
INSERT INTO `nx_distributer_community` VALUES (1, 1, 1);
INSERT INTO `nx_distributer_community` VALUES (2, 2, 1);
INSERT INTO `nx_distributer_community` VALUES (3, 3, 1);
COMMIT;

-- ----------------------------
-- Table structure for nx_distributer_customer
-- ----------------------------
DROP TABLE IF EXISTS `nx_distributer_customer`;
CREATE TABLE `nx_distributer_customer` (
  `dist_cust_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '批发商客户id',
  `dc_dist_id` int(20) DEFAULT NULL COMMENT '批发商id',
  `dc_cust_id` int(20) DEFAULT NULL COMMENT '客户id',
  `dc_cust_type` tinyint(2) DEFAULT NULL COMMENT '客户类型',
  PRIMARY KEY (`dist_cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Table structure for nx_distributer_daytime
-- ----------------------------
DROP TABLE IF EXISTS `nx_distributer_daytime`;
CREATE TABLE `nx_distributer_daytime` (
  `nx_week_id` int(20) NOT NULL AUTO_INCREMENT,
  `nx_day_name` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_day_open` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_day_close` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_dis_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`nx_week_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Table structure for nx_distributer_department
-- ----------------------------
DROP TABLE IF EXISTS `nx_distributer_department`;
CREATE TABLE `nx_distributer_department` (
  `nx_distributer_dep_id` int(20) NOT NULL AUTO_INCREMENT,
  `nx_DD_distributer_id` int(20) DEFAULT NULL,
  `nx_DD_department_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`nx_distributer_dep_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_distributer_department
-- ----------------------------
BEGIN;
INSERT INTO `nx_distributer_department` VALUES (1, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for nx_distributer_e_commerce
-- ----------------------------
DROP TABLE IF EXISTS `nx_distributer_e_commerce`;
CREATE TABLE `nx_distributer_e_commerce` (
  `nx_DEC_id` int(20) NOT NULL COMMENT '批发商社区id',
  `nx_DEC_e_id` int(20) DEFAULT NULL,
  `nx_DEC_distributer_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`nx_DEC_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_distributer_e_commerce
-- ----------------------------
BEGIN;
INSERT INTO `nx_distributer_e_commerce` VALUES (1, 1, 1);
INSERT INTO `nx_distributer_e_commerce` VALUES (2, 2, 1);
INSERT INTO `nx_distributer_e_commerce` VALUES (3, 3, 1);
COMMIT;

-- ----------------------------
-- Table structure for nx_distributer_father_goods
-- ----------------------------
DROP TABLE IF EXISTS `nx_distributer_father_goods`;
CREATE TABLE `nx_distributer_father_goods` (
  `nx_distributer_father_goods_id` int(20) NOT NULL AUTO_INCREMENT,
  `nx_dfg_father_goods_name` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_dfg_father_goods_img` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_dfg_father_goods_sort` int(4) DEFAULT NULL,
  `nx_dfg_father_goods_color` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_dfg_fathers_father_id` int(20) DEFAULT NULL,
  `nx_dfg_father_goods_level` tinyint(2) DEFAULT NULL,
  `nx_dfg_distributer_id` int(20) DEFAULT NULL,
  `nx_dfg_goods_amount` int(4) DEFAULT NULL,
  PRIMARY KEY (`nx_distributer_father_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_distributer_father_goods
-- ----------------------------
BEGIN;
INSERT INTO `nx_distributer_father_goods` VALUES (1, '根茎类', NULL, NULL, '#20afb8', 2, 2, 1, 14);
INSERT INTO `nx_distributer_father_goods` VALUES (2, '新鲜蔬菜', NULL, NULL, NULL, 3, 1, 1, NULL);
INSERT INTO `nx_distributer_father_goods` VALUES (3, '生鲜', NULL, NULL, NULL, NULL, 0, 1, NULL);
INSERT INTO `nx_distributer_father_goods` VALUES (4, '茄果瓜类', NULL, NULL, '#20afb8', 2, 2, 1, 34);
INSERT INTO `nx_distributer_father_goods` VALUES (5, '叶菜类', NULL, NULL, '#20afb8', 2, 2, 1, 30);
INSERT INTO `nx_distributer_father_goods` VALUES (6, '葱姜蒜椒香料', NULL, NULL, '#20afb8', 2, 2, 1, 25);
INSERT INTO `nx_distributer_father_goods` VALUES (7, '鲜菌菇', NULL, NULL, '#20afb8', 2, 2, 1, 14);
INSERT INTO `nx_distributer_father_goods` VALUES (8, '国产水果', NULL, NULL, '#20afb8', 9, 2, 1, 55);
INSERT INTO `nx_distributer_father_goods` VALUES (9, '新鲜水果', NULL, NULL, NULL, 3, 1, 1, NULL);
INSERT INTO `nx_distributer_father_goods` VALUES (10, '进口水果', NULL, NULL, '#20afb8', 9, 2, 1, 1);
INSERT INTO `nx_distributer_father_goods` VALUES (11, '豆腐制品', NULL, NULL, '#20afb8', 12, 2, 1, 8);
INSERT INTO `nx_distributer_father_goods` VALUES (12, '豆腐制品咸菜', NULL, NULL, NULL, 3, 1, 1, NULL);
INSERT INTO `nx_distributer_father_goods` VALUES (13, '半加工豆制品', NULL, NULL, '#20afb8', 12, 2, 1, 5);
INSERT INTO `nx_distributer_father_goods` VALUES (14, '咸菜', NULL, NULL, '#20afb8', 12, 2, 1, 4);
INSERT INTO `nx_distributer_father_goods` VALUES (15, '熟食', NULL, NULL, '#20afb8', 12, 2, 1, 2);
INSERT INTO `nx_distributer_father_goods` VALUES (16, '猪肉', NULL, NULL, '#20afb8', 17, 2, 1, 28);
INSERT INTO `nx_distributer_father_goods` VALUES (17, '肉禽蛋', NULL, NULL, NULL, 3, 1, 1, NULL);
INSERT INTO `nx_distributer_father_goods` VALUES (18, '牛肉', NULL, NULL, '#20afb8', 17, 2, 1, 23);
INSERT INTO `nx_distributer_father_goods` VALUES (19, '羊肉', NULL, NULL, '#20afb8', 17, 2, 1, 18);
INSERT INTO `nx_distributer_father_goods` VALUES (20, '鸡鸭鸽', NULL, NULL, '#20afb8', 17, 2, 1, 31);
INSERT INTO `nx_distributer_father_goods` VALUES (21, '蛋', NULL, NULL, '#20afb8', 17, 2, 1, 10);
INSERT INTO `nx_distributer_father_goods` VALUES (22, '米', NULL, NULL, '#20afb8', 23, 2, 1, 2);
INSERT INTO `nx_distributer_father_goods` VALUES (23, '粮油调味', NULL, NULL, NULL, 3, 1, 1, NULL);
INSERT INTO `nx_distributer_father_goods` VALUES (24, '食用油', NULL, NULL, '#20afb8', 23, 2, 1, 6);
INSERT INTO `nx_distributer_father_goods` VALUES (25, '面', NULL, NULL, '#20afb8', 23, 2, 1, 2);
INSERT INTO `nx_distributer_father_goods` VALUES (26, '杂粮', NULL, NULL, '#20afb8', 23, 2, 1, 3);
INSERT INTO `nx_distributer_father_goods` VALUES (27, '调味品', NULL, NULL, '#20afb8', 23, 2, 1, 25);
INSERT INTO `nx_distributer_father_goods` VALUES (28, '南北干货', NULL, NULL, '#20afb8', 23, 2, 1, 12);
INSERT INTO `nx_distributer_father_goods` VALUES (29, '方便食品', NULL, NULL, '#20afb8', 23, 2, 1, 2);
INSERT INTO `nx_distributer_father_goods` VALUES (30, '烘培原料', NULL, NULL, '#20afb8', 23, 2, 1, 1);
INSERT INTO `nx_distributer_father_goods` VALUES (31, '鱼类', NULL, NULL, '#20afb8', 32, 2, 1, 23);
INSERT INTO `nx_distributer_father_goods` VALUES (32, '海鲜水产', NULL, NULL, NULL, 3, 1, 1, NULL);
INSERT INTO `nx_distributer_father_goods` VALUES (33, '虾类', NULL, NULL, '#20afb8', 32, 2, 1, 15);
INSERT INTO `nx_distributer_father_goods` VALUES (34, '主食', NULL, NULL, '#20afb8', 35, 2, 1, 6);
INSERT INTO `nx_distributer_father_goods` VALUES (35, '食品', NULL, NULL, NULL, 3, 1, 1, NULL);
INSERT INTO `nx_distributer_father_goods` VALUES (36, '干果食品', NULL, NULL, '#20afb8', 35, 2, 1, 4);
COMMIT;

-- ----------------------------
-- Table structure for nx_distributer_goods
-- ----------------------------
DROP TABLE IF EXISTS `nx_distributer_goods`;
CREATE TABLE `nx_distributer_goods` (
  `nx_distributer_goods_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '社区商品id',
  `nx_dg_dfg_goods_father_id` int(20) DEFAULT NULL COMMENT '批发商父类商品id',
  `nx_dg_distributer_id` int(20) DEFAULT NULL COMMENT '批发商id',
  `nx_dg_goods_status` tinyint(2) DEFAULT NULL COMMENT '商品状态',
  `nx_dg_goods_is_weight` tinyint(2) DEFAULT NULL COMMENT '是否称重',
  `nx_dg_goods_name` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '商品名称',
  `nx_dg_goods_detail` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '商品详细',
  `nx_dg_goods_standardname` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '商品规格',
  `nx_dg_goods_pinyin` varchar(200) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '社区商品拼音',
  `nx_dg_goods_py` varchar(50) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '社区商品拼音简拼',
  `nx_dg_nx_goods_id` int(10) DEFAULT NULL COMMENT 'nxGoodsId',
  `nx_dg_nx_father_img` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '进货方式',
  `nx_dg_nx_father_id` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT 'nxGoodsFatherId',
  `nx_dg_nx_grand_id` int(20) DEFAULT NULL COMMENT 'nxGoodsGrandid',
  `nx_dg_nx_great_grand_id` int(20) DEFAULT NULL COMMENT 'nxGreatGrandid',
  `nx_dg_pull_off` tinyint(2) DEFAULT NULL COMMENT '是否下架',
  `nx_dg_goods_brand` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_dg_goods_place` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_dg_nx_goods_father_color` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL,
  PRIMARY KEY (`nx_distributer_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=410 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_distributer_goods
-- ----------------------------
BEGIN;
INSERT INTO `nx_distributer_goods` VALUES (1, 1, 1, NULL, NULL, '白萝卜', '', '斤', 'bailuobu', 'blb', 45096, 'goodsImage/1.jpg', '111', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (2, 1, 1, NULL, NULL, '卞萝卜', '', '斤', 'bianluobu', 'blb', 45097, 'goodsImage/1.jpg', '111', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (3, 1, 1, NULL, NULL, '胡萝卜', '', '斤', 'huluobu', 'hlb', 45094, 'goodsImage/1.jpg', '111', 11, 1, 0, '', '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (4, 1, 1, NULL, NULL, '红薯', '普通', '斤', 'hongshu', 'hs', 45104, 'goodsImage/1.jpg', '111', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (5, 1, 1, NULL, NULL, '绿萝卜', NULL, '斤', 'lüluobu', 'llb', 45590, 'goodsImage/1.jpg', '111', 11, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (7, 1, 1, NULL, NULL, '蜜薯', '', '斤', 'mishu', 'ms', 45558, 'goodsImage/1.jpg', '111', 11, 1, 0, '', '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (8, 1, 1, NULL, NULL, '麻山药', '', '斤', 'mashanyao', 'msy', 45101, 'goodsImage/1.jpg', '111', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (9, 1, 1, NULL, NULL, '藕', '', '斤', 'ou', 'o', 45103, 'goodsImage/1.jpg', '111', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (10, 1, 1, NULL, NULL, '土豆', '', '斤', 'tudou', 'td', 44678, 'goodsImage/1.jpg', '111', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (11, 1, 1, NULL, NULL, '铁棍山药', NULL, '斤', 'tiegunshanyao', 'tgsy', 17600014, 'goodsImage/1.jpg', '111', 11, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (12, 1, 1, NULL, NULL, '莴笋', '', '斤', 'wosun', 'ws', 45100, 'goodsImage/1.jpg', '111', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (13, 1, 1, NULL, NULL, '心里美', '', '斤', 'xinlimei', 'xlm', 45095, 'goodsImage/1.jpg', '111', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (14, 1, 1, NULL, NULL, '新土豆', '', '斤', 'xintudou', 'xtd', 45093, 'goodsImage/1.jpg', '111', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (15, 1, 1, NULL, NULL, '芋头', '', '斤', 'yutou', 'yt', 45106, 'goodsImage/1.jpg', '111', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (16, 1, 1, NULL, NULL, '樱桃萝卜', '', '斤', 'yingtaoluobu', 'ytlb', 45109, 'goodsImage/1.jpg', '111', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (17, 4, 1, NULL, NULL, '白不老', '', '斤', 'baibulao', 'bbl', 45148, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (18, 4, 1, NULL, NULL, '扁豆', '', '斤', 'biandou', 'bd', 45146, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (19, 4, 1, NULL, NULL, '荸荠', '', '斤', 'biji', 'bj', 45160, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (20, 4, 1, NULL, NULL, '板栗南瓜', '', '斤', 'banlinangua', 'blng', 45159, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (21, 4, 1, NULL, NULL, '长茄子', '', '斤', 'changqiezi', 'cqz', 45135, 'goodsImage/3.jpg', '112', 11, 1, 0, '', '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (22, 4, 1, NULL, NULL, '冬春笋', '', '斤', 'dongchunsun', 'dcs', 45163, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (23, 4, 1, NULL, NULL, '吊冬瓜', '', '斤', 'diaodonggua', 'ddg', 45138, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (24, 4, 1, NULL, NULL, '地冬瓜', '', '斤', 'didonggua', 'ddg', 45139, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (25, 4, 1, NULL, NULL, '豆王', '', '斤', 'douwang', 'dw', 45145, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (26, 4, 1, NULL, NULL, '广茄', '', '斤', 'guangqie', 'gq', 45155, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (27, 4, 1, NULL, NULL, '黄瓜', '', '斤', 'huanggua', 'hg', 45132, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (28, 4, 1, NULL, NULL, '荷兰瓜', NULL, '斤', 'helangua', 'hlg', 45592, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (29, 4, 1, NULL, NULL, '花生', '', '斤', 'huasheng', 'hs', 45164, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (30, 4, 1, NULL, NULL, '菜花', '', '斤', 'caihua', 'ch', 45141, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (31, 4, 1, NULL, NULL, '架豆', '', '斤', 'jiadou', 'jd', 45137, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (32, 4, 1, NULL, NULL, '豇豆', '', '斤', 'jiangdou', 'jd', 45147, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (33, 4, 1, NULL, NULL, '金丝南瓜', '', '斤', 'jinsinangua', 'jsng', 45158, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (34, 4, 1, NULL, NULL, '苦瓜', '', '斤', 'kugua', 'kg', 45151, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (35, 4, 1, NULL, NULL, '毛豆', '', '斤', 'maodou', 'md', 45150, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (36, 4, 1, NULL, NULL, '南北瓜', '', '斤', 'nanbeigua', 'nbg', 45153, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (37, 4, 1, NULL, NULL, '秋葵', NULL, '斤', 'qiukui', 'qk', 45594, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (38, 4, 1, NULL, NULL, '丝瓜', '', '斤', 'sigua', 'sg', 45152, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (39, 4, 1, NULL, NULL, '散菜花', '', '斤', 'sancaihua', 'sch', 45142, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (40, 4, 1, NULL, NULL, '甜豆', NULL, '斤', 'tiandou', 'td', 45597, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (41, 4, 1, NULL, NULL, '豌豆', '', '斤', 'wandou', 'wd', 45162, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (42, 4, 1, NULL, NULL, '西胡芦', '', '斤', 'xihulu', 'xhl', 45140, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (43, 4, 1, NULL, NULL, '西红柿', '', '斤', 'xihongshi', 'xhs', 45130, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (44, 4, 1, NULL, NULL, '西兰花', NULL, '斤', 'xilanhua', 'xlh', 45599, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (45, 4, 1, NULL, NULL, '小毛冬瓜', '', '斤', 'xiaomaodonggua', 'xmdg', 45144, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (46, 4, 1, NULL, NULL, '线茄', '', '斤', 'xianqie', 'xq', 45156, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (47, 4, 1, NULL, NULL, '小西红柿', NULL, '斤', 'xiaoxihongshi', 'xxhs', 17600016, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (48, 4, 1, NULL, NULL, '油豆', '', '斤', 'youdou', 'yd', 45149, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (49, 4, 1, NULL, NULL, '玉米', '', '斤', 'yumi', 'ym', 45161, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (50, 4, 1, NULL, NULL, '圆茄子', '', '斤', 'yuanqiezi', 'yqz', 45136, 'goodsImage/3.jpg', '112', 11, 1, 0, '', '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (51, 5, 1, NULL, NULL, '菠菜', '', '斤', 'bocai', 'bc', 45168, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (52, 5, 1, NULL, NULL, '菜心', '', '斤', 'caixin', 'cx', 45197, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (53, 5, 1, NULL, NULL, '穿心莲', '', '斤', 'chuanxinlian', 'cxl', 45204, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (54, 5, 1, NULL, NULL, '大白菜', '', '斤', 'dabaicai', 'dbc', 45165, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (55, 5, 1, NULL, NULL, '盖菜', '', '斤', 'gaicai', 'gc', 45195, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (56, 5, 1, NULL, NULL, '甘蓝', '', '斤', 'ganlan', 'gl', 45171, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (57, 5, 1, NULL, NULL, '茴香', '', '斤', 'huixiang', 'hx', 45176, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (58, 5, 1, NULL, NULL, '黄心菜', '', '斤', 'huangxincai', 'hxc', 45181, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (59, 5, 1, NULL, NULL, '蒿子秆', '', '斤', 'haozigan', 'hzg', 45190, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (60, 5, 1, NULL, NULL, '荠菜', '', '斤', 'jicai', 'jc', 45200, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (61, 5, 1, NULL, NULL, '韭菜', '', '斤', 'jiucai', 'jc', 45174, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (62, 5, 1, NULL, NULL, '菊花菜', '', '斤', 'juhuacai', 'jhc', 45194, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (63, 5, 1, NULL, NULL, '芥兰', '', '斤', 'jielan', 'jl', 45196, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (64, 5, 1, NULL, NULL, '芥兰苗', NULL, '斤', 'jielanmiao', 'jlm', 45589, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (65, 5, 1, NULL, NULL, '鸡毛菜', '', '斤', 'jimaocai', 'jmc', 45199, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (66, 5, 1, NULL, NULL, '快菜', '', '斤', 'kuaicai', 'kc', 45202, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (67, 5, 1, NULL, NULL, '苦菊', '', '斤', 'kuju', 'kj', 45203, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (68, 5, 1, NULL, NULL, '空心菜', '', '斤', 'kongxincai', 'kxc', 45198, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (69, 5, 1, NULL, NULL, '落地球', NULL, '斤', 'luodiqiu', 'ldq', 45593, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (70, 5, 1, NULL, NULL, '兰花', NULL, '把', 'lanhua', 'lh', 45588, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (71, 5, 1, NULL, NULL, '罗马生菜', NULL, '斤', 'luomashengcai', 'lmsc', 45600, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (72, 5, 1, NULL, NULL, '木耳菜', '', '斤', 'muercai', 'mec', 45205, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (73, 5, 1, NULL, NULL, '奶白菜', '', '斤', 'naibaicai', 'nbc', 45187, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (74, 5, 1, NULL, NULL, '芹菜', '', '斤', 'qincai', 'qc', 45167, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (75, 5, 1, NULL, NULL, '叶生菜', '', '斤', 'sanshengcai', 'ssc', 45188, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (76, 5, 1, NULL, NULL, '茼蒿', '', '斤', 'tonghao', 'th', 45189, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (77, 5, 1, NULL, NULL, '豌豆苗', '', '斤', 'wandoumiao', 'wdm', 45201, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (78, 5, 1, NULL, NULL, '娃娃菜', NULL, '包', 'wawacai', 'wwc', 17600076, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (79, 5, 1, NULL, NULL, '娃娃菜', '', '斤', 'wawacai', 'wwc', 45166, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (80, 5, 1, NULL, NULL, '小白菜', '', '斤', 'xiaobaicai', 'xbc', 45185, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (81, 6, 1, NULL, NULL, '彩椒(红)', '', '斤', 'caijiao(hong)', 'cj(h)', 45126, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (82, 6, 1, NULL, NULL, '彩椒(黄)', NULL, '斤', 'caijiao(huang)', 'cj(h)', 45580, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (83, 6, 1, NULL, NULL, '大葱', '', '斤', 'dacong', 'dc', 45114, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (84, 6, 1, NULL, NULL, '大葱', NULL, '斤', 'dacong', 'dc', 17600011, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, '本地', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (85, 6, 1, NULL, NULL, '黄葱头', '', '斤', 'huangcongtou', 'hct', 45112, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (86, 6, 1, NULL, NULL, '杭椒', NULL, '斤', 'hangjiao', 'hj', 17600027, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (87, 6, 1, NULL, NULL, '红尖椒', NULL, '斤', 'hongjianjiao', 'hjj', 45582, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (88, 6, 1, NULL, NULL, '姜', '', '斤', 'jiang', 'j', 45116, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (89, 6, 1, NULL, NULL, '尖椒', '', '斤', 'jianjiao', 'jj', 45110, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (90, 6, 1, NULL, NULL, '螺丝椒', NULL, '斤', 'luosijiao', 'lsj', 45579, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (91, 6, 1, NULL, NULL, '毛葱', NULL, '斤', 'maocong', 'mc', 45560, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (92, 6, 1, NULL, NULL, '麻椒', NULL, '斤', 'majiao', 'mj', 45583, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (93, 6, 1, NULL, NULL, '美人椒', NULL, '斤', 'meirenjiao', 'mrj', 45581, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (94, 6, 1, NULL, NULL, '青椒', NULL, '斤', 'qingjiao', 'qj', 45566, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (95, 6, 1, NULL, NULL, '青蒜', '', '斤', 'qingsuan', 'qs', 45127, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (96, 6, 1, NULL, NULL, '蒜', '', '斤', 'suan', 's', 45117, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (97, 6, 1, NULL, NULL, '蒜黄', '', '斤', 'suanhuang', 'sh', 45121, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (98, 6, 1, NULL, NULL, '蒜米', NULL, '斤', 'suanmi', 'sm', 17600012, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (99, 6, 1, NULL, NULL, '蒜苗', '', '斤', 'suanmiao', 'sm', 45119, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (100, 6, 1, NULL, NULL, '香葱', '', '斤', 'xiangcong', 'xc', 45128, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (101, 6, 1, NULL, NULL, '小葱', '', '斤', 'xiaocong', 'xc', 45115, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (102, 6, 1, NULL, NULL, '线椒', '', '斤', 'xianjiao', 'xj', 45123, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (103, 6, 1, NULL, NULL, '小米椒', '', '斤', 'xiaomijiao', 'xmj', 45125, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (104, 6, 1, NULL, NULL, '新蒜', '', '斤', 'xinsuan', 'xs', 45118, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (105, 6, 1, NULL, NULL, '紫葱头', '', '斤', 'zicongtou', 'zct', 45113, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (106, 7, 1, NULL, NULL, '白玉菇', NULL, '50克/袋', 'baiyugu', 'byg', 17600022, 'goodsImage/logo.jpg', '115', 11, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (107, 7, 1, NULL, NULL, '白玉菇', '', '斤', 'baiyugu', 'byg', 45208, 'goodsImage/logo.jpg', '115', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (108, 7, 1, NULL, NULL, '海鲜菇', NULL, '4斤/包', 'haixiangu', 'hxg', 45584, 'goodsImage/logo.jpg', '115', 11, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (109, 7, 1, NULL, NULL, '海鲜菇', NULL, '50克/袋', 'haixiangu', 'hxg', 17600023, 'goodsImage/logo.jpg', '115', 11, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (110, 7, 1, NULL, NULL, '鸡腿菇', '', '斤', 'jituigu', 'jtg', 45211, 'goodsImage/logo.jpg', '115', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (111, 7, 1, NULL, NULL, '金针菇', '', '斤', 'jinzhengu', 'jzg', 45212, 'goodsImage/logo.jpg', '115', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (112, 7, 1, NULL, NULL, '金针菇', NULL, '50克/袋', 'jinzhengu', 'jzg', 17600019, 'goodsImage/logo.jpg', '115', 11, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (113, 7, 1, NULL, NULL, '金针菇', NULL, '5斤/包', 'jinzhengu', 'jzg', 17600020, 'goodsImage/logo.jpg', '115', 11, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (114, 7, 1, NULL, NULL, '口蘑', '', '斤', 'koumo', 'km', 45209, 'goodsImage/logo.jpg', '115', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (115, 7, 1, NULL, NULL, '平菇', '', '斤', 'pinggu', 'pg', 45206, 'goodsImage/logo.jpg', '115', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (116, 7, 1, NULL, NULL, '杏鲍菇', NULL, '5斤/包', 'xingbaogu', 'xbg', 17600021, 'goodsImage/logo.jpg', '115', 11, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (117, 7, 1, NULL, NULL, '杏鲍菇', '', '斤', 'xingbaogu', 'xbg', 45210, 'goodsImage/logo.jpg', '115', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (118, 7, 1, NULL, NULL, '香菇', '', '斤', 'xianggu', 'xg', 45207, 'goodsImage/logo.jpg', '115', 11, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (119, 7, 1, NULL, NULL, '蟹味菇', NULL, '斤', 'xieweigu', 'xwg', 45585, 'goodsImage/logo.jpg', '115', 11, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (120, 8, 1, NULL, NULL, '百香果', '', '斤', 'baixiangguo', 'bxg', 45217, 'goodsImage/logo.jpg', '121', 12, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (121, 8, 1, NULL, NULL, '草莓', '', '斤', 'caomei', 'cm', 45222, 'goodsImage/logo.jpg', '121', 12, 1, 0, '甜宝奶油', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (122, 8, 1, NULL, NULL, '橙子', '', '斤', 'chengzi', 'cz', 45258, 'goodsImage/logo.jpg', '121', 12, 1, 0, '伦晚', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (123, 8, 1, NULL, NULL, '贡梨', '', '斤', 'gongli', 'gl', 45237, 'goodsImage/logo.jpg', '121', 12, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (124, 8, 1, NULL, NULL, '皇冠梨', '', '斤', 'huangguanli', 'hgl', 45236, 'goodsImage/logo.jpg', '121', 12, 1, 0, '', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (125, 8, 1, NULL, NULL, '火龙果', '白心', '斤', 'huolongguo', 'hlg', 45226, 'goodsImage/logo.jpg', '121', 12, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (126, 8, 1, NULL, NULL, '火龙果', '红心', '斤', 'huolongguo', 'hlg', 45225, 'goodsImage/logo.jpg', '121', 12, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (127, 8, 1, NULL, NULL, '哈密瓜', '', '斤', 'hamigua', 'hmg', 45272, 'goodsImage/logo.jpg', '121', 12, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (128, 8, 1, NULL, NULL, '香梨', '', '斤', 'kuerlexiangli', 'kelxl', 45241, 'goodsImage/logo.jpg', '121', 12, 1, 0, '库尔勒', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (129, 8, 1, NULL, NULL, '芦柑', '', '斤', 'lugan', 'lg', 45252, 'goodsImage/logo.jpg', '121', 12, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (130, 8, 1, NULL, NULL, '芒果', '', '斤', 'mangguo', 'mg', 45301, 'goodsImage/logo.jpg', '121', 12, 1, 0, '红金龙', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (131, 8, 1, NULL, NULL, '芒果', '', '斤', 'mangguo', 'mg', 45302, 'goodsImage/logo.jpg', '121', 12, 1, 0, '高乐密', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (132, 8, 1, NULL, NULL, '芒果', '青皮', '斤', 'mangguo', 'mg', 45303, 'goodsImage/logo.jpg', '121', 12, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (133, 8, 1, NULL, NULL, '木瓜', '', '斤', 'mugua', 'mg', 45227, 'goodsImage/logo.jpg', '121', 12, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (134, 8, 1, NULL, NULL, '猕猴桃', '', '斤', 'mihoutao', 'mht', 45263, 'goodsImage/logo.jpg', '121', 12, 1, 0, '海沃德', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (135, 8, 1, NULL, NULL, '猕猴桃', '', '斤', 'mihoutao', 'mht', 45262, 'goodsImage/logo.jpg', '121', 12, 1, 0, '徐香', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (136, 8, 1, NULL, NULL, '柠檬', '', '斤', 'ningmeng', 'nm', 45230, 'goodsImage/logo.jpg', '121', 12, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (137, 8, 1, NULL, NULL, '苹果', '', '斤', 'pingguo', 'pg', 45284, 'goodsImage/logo.jpg', '121', 12, 1, 0, '富士', '烟台', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (138, 8, 1, NULL, NULL, '苹果', '', '斤', 'pingguo', 'pg', 45290, 'goodsImage/logo.jpg', '121', 12, 1, 0, '国光', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (139, 8, 1, NULL, NULL, '苹果', '辽宁寒富', '斤', 'pingguo', 'pg', 45291, 'goodsImage/logo.jpg', '121', 12, 1, 0, '', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (140, 8, 1, NULL, NULL, '苹果', '新疆阿克苏', '斤', 'pingguo', 'pg', 45289, 'goodsImage/logo.jpg', '121', 12, 1, 0, '冰糖心', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (141, 8, 1, NULL, NULL, '葡萄', '阳光玫瑰', '斤', 'putao', 'pt', 45293, 'goodsImage/logo.jpg', '121', 12, 1, 0, '', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (142, 8, 1, NULL, NULL, '葡萄', '玫瑰香', '斤', 'putao', 'pt', 45296, 'goodsImage/logo.jpg', '121', 12, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (143, 8, 1, NULL, NULL, '葡萄', '红宝石', '斤', 'putao', 'pt', 45297, 'goodsImage/logo.jpg', '121', 12, 1, 0, '', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (144, 8, 1, NULL, NULL, '青葡萄', '贵妃青', '斤', 'putao', 'pt', 45298, 'goodsImage/logo.jpg', '121', 12, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (145, 8, 1, NULL, NULL, '脐橙', '', '斤', 'qicheng', 'qc', 45248, 'goodsImage/logo.jpg', '121', 12, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (146, 8, 1, NULL, NULL, '柿饼', '', '斤', 'shibing', 'sb', 45228, 'goodsImage/logo.jpg', '121', 12, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (147, 8, 1, NULL, NULL, '桑葚', '', '斤', 'sangshen', 'ss', 45218, 'goodsImage/logo.jpg', '121', 12, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (148, 8, 1, NULL, NULL, '沙糖桔', '', '斤', 'shatangjie', 'stj', 45246, 'goodsImage/logo.jpg', '121', 12, 1, 0, '中果', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (149, 8, 1, NULL, NULL, '山楂', '', '斤', 'shanzha', 'sz', 45232, 'goodsImage/logo.jpg', '121', 12, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (150, 8, 1, NULL, NULL, '柿子', '', '斤', 'shizi', 'sz', 45224, 'goodsImage/logo.jpg', '121', 12, 1, 0, '磨盘', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (151, 8, 1, NULL, NULL, '桃', '', '斤', 'tao', 't', 45261, 'goodsImage/logo.jpg', '121', 12, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (152, 8, 1, NULL, NULL, '甜瓜', '', '斤', 'tiangua', 'tg', 45282, 'goodsImage/logo.jpg', '121', 12, 1, 0, '博阳九号', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (153, 8, 1, NULL, NULL, '甜瓜', '', '斤', 'tiangua', 'tg', 45274, 'goodsImage/logo.jpg', '121', 12, 1, 0, '黄金瓜', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (154, 8, 1, NULL, NULL, '甜瓜', '', '斤', 'tiangua', 'tg', 45283, 'goodsImage/logo.jpg', '121', 12, 1, 0, '白糖罐', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (155, 8, 1, NULL, NULL, '甜瓜', '', '斤', 'tiangua', 'tg', 45275, 'goodsImage/logo.jpg', '121', 12, 1, 0, '网纹', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (156, 8, 1, NULL, NULL, '甜瓜', '', '斤', 'tiangua', 'tg', 45278, 'goodsImage/logo.jpg', '121', 12, 1, 0, '羊角蜜', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (157, 8, 1, NULL, NULL, '甜瓜', '', '斤', 'tiangua', 'tg', 45276, 'goodsImage/logo.jpg', '121', 12, 1, 0, '长香玉', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (158, 8, 1, NULL, NULL, '甜瓜', '', '斤', 'tiangua', 'tg', 45277, 'goodsImage/logo.jpg', '121', 12, 1, 0, '玉姑', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (159, 8, 1, NULL, NULL, '甜瓜', '', '斤', 'tiangua', 'tg', 45279, 'goodsImage/logo.jpg', '121', 12, 1, 0, '花蕾', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (160, 8, 1, NULL, NULL, '甜瓜', '西州密', '斤', 'tiangua', 'tg', 45280, 'goodsImage/logo.jpg', '121', 12, 1, 0, '绿宝', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (161, 8, 1, NULL, NULL, '提子', '', '斤', 'tizi', 'tz', 45294, 'goodsImage/logo.jpg', '121', 12, 1, 0, '', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (162, 8, 1, NULL, NULL, '沃柑', '', '斤', 'wogan', 'wg', 45250, 'goodsImage/logo.jpg', '121', 12, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (163, 8, 1, NULL, NULL, '血橙', '', '斤', 'xuecheng', 'xc', 45249, 'goodsImage/logo.jpg', '121', 12, 1, 0, '二月红|中华红', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (164, 8, 1, NULL, NULL, '西瓜', '', '斤', 'xigua', 'xg', 45265, 'goodsImage/logo.jpg', '121', 12, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (165, 8, 1, NULL, NULL, '西瓜', '', '斤', 'xigua', 'xg', 45264, 'goodsImage/logo.jpg', '121', 12, 1, 0, '麒麟', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (166, 8, 1, NULL, NULL, '雪花梨', '', '斤', 'xuehuali', 'xhl', 45235, 'goodsImage/logo.jpg', '121', 12, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (167, 8, 1, NULL, NULL, '香蕉', '', '斤', 'xiangjiao', 'xj', 45269, 'goodsImage/logo.jpg', '121', 12, 1, 0, '', '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (168, 8, 1, NULL, NULL, '小金桔', '', '斤', 'xiaojinjie', 'xjj', 45254, 'goodsImage/logo.jpg', '121', 12, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (169, 8, 1, NULL, NULL, '雪梨', NULL, '斤', 'xueli', 'xl', 17600028, 'goodsImage/logo.jpg', '121', 12, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (170, 8, 1, NULL, NULL, '鸭梨', '', '斤', 'yali', 'yl', 45234, 'goodsImage/logo.jpg', '121', 12, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (171, 8, 1, NULL, NULL, '樱桃', '', '斤', 'yingtao', 'yt', 45306, 'goodsImage/logo.jpg', '121', 12, 1, 0, '美早', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (172, 8, 1, NULL, NULL, '油桃', '', '斤', 'youtao', 'yt', 45259, 'goodsImage/logo.jpg', '121', 12, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (173, 8, 1, NULL, NULL, '柚子', '红心', '斤', 'youzi', 'yz', 45255, 'goodsImage/logo.jpg', '121', 12, 1, 0, '', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (174, 8, 1, NULL, NULL, '柚子', '白心', '斤', 'youzi', 'yz', 45256, 'goodsImage/logo.jpg', '121', 12, 1, 0, '', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (175, 10, 1, NULL, NULL, '进口香蕉', NULL, '斤', 'jinkouxiangjiao', 'jkxj', 17600024, 'goodsImage/logo.jpg', '122', 12, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (176, 11, 1, NULL, NULL, '盒豆腐', '鲜豆腐', '盒', 'hedoufu', 'hdf', 17600004, 'goodsImage/logo.jpg', '131', 13, 1, 0, '白玉', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (177, 11, 1, NULL, NULL, '盒豆腐', '韧豆腐', '盒', 'hedoufu', 'hdf', 17600005, 'goodsImage/logo.jpg', '131', 13, 1, 0, '白玉', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (178, 11, 1, NULL, NULL, '盒豆腐', '北豆腐', '盒', 'hedoufu', 'hdf', 31116, 'goodsImage/logo.jpg', '131', 13, 1, 0, '白玉', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (179, 11, 1, NULL, NULL, '老豆腐', NULL, '斤', 'laodoufu', 'ldf', 31112, 'goodsImage/logo.jpg', '131', 13, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (180, 11, 1, NULL, NULL, '卤水豆腐', '', '斤', 'lushuidoufu', 'lsdf', 31111, 'goodsImage/logo.jpg', '131', 13, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (181, 11, 1, NULL, NULL, '嫩豆腐', NULL, '斤', 'nendoufu', 'ndf', 31113, 'goodsImage/logo.jpg', '131', 13, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (182, 11, 1, NULL, NULL, '鸭血', '火锅', '斤', 'yaxue', 'yx', 17600007, 'goodsImage/logo.jpg', '131', 13, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (183, 11, 1, NULL, NULL, '鸭血', NULL, '盒', 'yaxue', 'yx', 17600006, 'goodsImage/logo.jpg', '131', 13, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (184, 13, 1, NULL, NULL, '东北拉皮', NULL, '袋', 'dongbeilapi', 'dblp', 17600025, 'goodsImage/logo.jpg', '132', 13, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (185, 13, 1, NULL, NULL, '豆泡', NULL, '斤', 'doupao', 'dp', 31114, 'goodsImage/logo.jpg', '132', 13, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (186, 13, 1, NULL, NULL, '豆皮', NULL, '斤', 'doupi', 'dp', 31117, 'goodsImage/logo.jpg', '132', 13, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (187, 13, 1, NULL, NULL, '三河豆腐丝', NULL, '斤', 'sanhedoufusi', 'shdfs', 31115, 'goodsImage/logo.jpg', '132', 13, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (188, 13, 1, NULL, NULL, '熏干', NULL, '斤', 'xungan', 'xg', 31118, 'goodsImage/logo.jpg', '132', 13, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (189, 14, 1, NULL, NULL, '大头菜', NULL, '斤', 'datoucai', 'dtc', 17600008, 'goodsImage/logo.jpg', '133', 13, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (190, 14, 1, NULL, NULL, '芥菜丝', NULL, '斤', 'jiecaisi', 'jcs', 17600009, 'goodsImage/logo.jpg', '133', 13, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (191, 14, 1, NULL, NULL, '玫瑰咸菜', NULL, '斤', 'meiguixiancai', 'mgxc', 17600010, 'goodsImage/logo.jpg', '133', 13, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (192, 14, 1, NULL, NULL, '酸菜', NULL, '袋', 'suancai', 'sc', 17600100, 'goodsImage/logo.jpg', '133', 13, 1, 0, '刘', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (193, 15, 1, NULL, NULL, '灌肠', NULL, '斤', 'guanchang', 'gc', 17600026, 'goodsImage/logo.jpg', '134', 13, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (194, 15, 1, NULL, NULL, '哈尔滨红肠', NULL, '斤', 'haerbinhongchang', 'hebhc', 17600030, 'goodsImage/logo.jpg', '134', 13, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (195, 16, 1, NULL, NULL, '棒骨', '', '斤', 'banggu', 'bg', 45413, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (196, 16, 1, NULL, NULL, '纯排骨', '', '斤', 'chunpaigu', 'cpg', 45410, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (197, 16, 1, NULL, NULL, '纯腔骨', '', '斤', 'chunqianggu', 'cqg', 45411, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (198, 16, 1, NULL, NULL, '纯瘦肉', '', '斤', 'chunshourou', 'csr', 45405, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (199, 16, 1, NULL, NULL, '肥膘肉', '', '斤', 'feibiaorou', 'fbr', 45420, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (200, 16, 1, NULL, NULL, '后臀尖', '', '斤', 'houtunjian', 'htj', 45399, 'goodsImage/logo.jpg', '141', 14, 1, 0, '', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (201, 16, 1, NULL, NULL, '护心肉', '', '斤', 'huxinrou', 'hxr', 45422, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (202, 16, 1, NULL, NULL, '后肘', '', '斤', 'houzhou', 'hz', 45407, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (203, 16, 1, NULL, NULL, '腔排骨', '', '斤', 'qiangpaigu', 'qpg', 45412, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (204, 16, 1, NULL, NULL, '前臀尖', '', '斤', 'qiantunjian', 'qtj', 45397, 'goodsImage/logo.jpg', '141', 14, 1, 0, '', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (205, 16, 1, NULL, NULL, '前肘', '', '斤', 'qianzhou', 'qz', 45406, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (206, 16, 1, NULL, NULL, '通脊', '', '斤', 'tongji', 'tj', 45404, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (207, 16, 1, NULL, NULL, '五花肉', '', '斤', 'wuhuarou', 'whr', 45401, 'goodsImage/logo.jpg', '141', 14, 1, 0, '', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (208, 16, 1, NULL, NULL, '猪板油', '', '斤', 'zhubanyou', 'zby', 45419, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (209, 16, 1, NULL, NULL, '猪肠', '', '斤', 'zhuchang', 'zc', 45428, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (210, 16, 1, NULL, NULL, '猪肠头', '', '斤', 'zhuchangtou', 'zct', 45427, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (211, 16, 1, NULL, NULL, '猪肚', '', '斤', 'zhudu', 'zd', 45418, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (212, 16, 1, NULL, NULL, '猪耳', '', '斤', 'zhuer', 'ze', 45416, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (213, 16, 1, NULL, NULL, '猪肺', '', '斤', 'zhufei', 'zf', 45425, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (215, 16, 1, NULL, NULL, '猪肝', '', '斤', 'zhugan', 'zg', 45424, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (216, 16, 1, NULL, NULL, '猪口条', '', '斤', 'zhukoutiao', 'zkt', 45415, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (217, 16, 1, NULL, NULL, '猪脑', '', '斤', 'zhunao', 'zn', 45417, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (218, 16, 1, NULL, NULL, '猪皮', '', '斤', 'zhupi', 'zp', 45426, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (219, 16, 1, NULL, NULL, '猪蹄', '', '斤', 'zhuti', 'zt', 45409, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (220, 16, 1, NULL, NULL, '猪头', '', '斤', 'zhutou', 'zt', 45414, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (221, 16, 1, NULL, NULL, '猪尾巴', '', '斤', 'zhuweiba', 'zwb', 45408, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (222, 16, 1, NULL, NULL, '猪心', '', '斤', 'zhuxin', 'zx', 45423, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (223, 16, 1, NULL, NULL, '猪腰子', '', '斤', 'zhuyaozi', 'zyz', 45421, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (224, 18, 1, NULL, NULL, '肥牛', '', '斤', 'feiniu', 'fn', 45434, 'goodsImage/logo.jpg', '142', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (225, 18, 1, NULL, NULL, '精牛柳', '', '斤', 'jingniuliu', 'jnl', 45437, 'goodsImage/logo.jpg', '142', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (226, 18, 1, NULL, NULL, '牛鞭', '', '斤', 'niubian', 'nb', 45449, 'goodsImage/logo.jpg', '142', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (227, 18, 1, NULL, NULL, '精肥牛', '', '斤', 'jingfeiniu', 'jfn', 45435, 'goodsImage/logo.jpg', '142', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (228, 18, 1, NULL, NULL, '牛板筋', '', '斤', 'niubanjin', 'nbj', 45447, 'goodsImage/logo.jpg', '142', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (229, 18, 1, NULL, NULL, '牛百叶', '', '斤', 'niubaiye', 'nby', 45442, 'goodsImage/logo.jpg', '142', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (230, 18, 1, NULL, NULL, '牛肚', '', '斤', 'niudu', 'nd', 45441, 'goodsImage/logo.jpg', '142', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (231, 18, 1, NULL, NULL, '牛骨', '', '斤', 'niugu', 'ng', 45445, 'goodsImage/logo.jpg', '142', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (232, 18, 1, NULL, NULL, '牛黄喉', '', '斤', 'niuhuanghou', 'nhh', 45451, 'goodsImage/logo.jpg', '142', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (233, 18, 1, NULL, NULL, '牛后腱', '', '斤', 'niuhoujian', 'nhj', 45431, 'goodsImage/logo.jpg', '142', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (234, 18, 1, NULL, NULL, '牛后腿', '', '斤', 'niuhoutui', 'nht', 45433, 'goodsImage/logo.jpg', '142', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (235, 18, 1, NULL, NULL, '牛林', '', '斤', 'niulin', 'nl', 45439, 'goodsImage/logo.jpg', '142', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (236, 18, 1, NULL, NULL, '牛柳', '里脊', '斤', 'niuliu', 'nl', 45436, 'goodsImage/logo.jpg', '142', 14, 1, 0, '', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (237, 18, 1, NULL, NULL, '牛腩', '', '斤', 'niunan', 'nn', 45438, 'goodsImage/logo.jpg', '142', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (238, 18, 1, NULL, NULL, '牛排骨', '', '斤', 'niupaigu', 'npg', 45446, 'goodsImage/logo.jpg', '142', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (239, 18, 1, NULL, NULL, '牛前腱', '', '斤', 'niuqianjian', 'nqj', 45430, 'goodsImage/logo.jpg', '142', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (240, 18, 1, NULL, NULL, '牛前腿', '', '斤', 'niuqiantui', 'nqt', 45432, 'goodsImage/logo.jpg', '142', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (241, 18, 1, NULL, NULL, '牛舌', '', '斤', 'niushe', 'ns', 45444, 'goodsImage/logo.jpg', '142', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (242, 18, 1, NULL, NULL, '牛上脑', '', '斤', 'niushangnao', 'nsn', 45452, 'goodsImage/logo.jpg', '142', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (243, 18, 1, NULL, NULL, '牛蹄筋', '', '斤', 'niutijin', 'ntj', 45448, 'goodsImage/logo.jpg', '142', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (244, 18, 1, NULL, NULL, '牛尾', '', '斤', 'niuwei', 'nw', 45450, 'goodsImage/logo.jpg', '142', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (245, 18, 1, NULL, NULL, '牛心', '', '斤', 'niuxin', 'nx', 45443, 'goodsImage/logo.jpg', '142', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (246, 18, 1, NULL, NULL, '牛腰子', '', '斤', 'niuyaozi', 'nyz', 45440, 'goodsImage/logo.jpg', '142', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (247, 19, 1, NULL, NULL, '去骨羊后腿', '', '斤', 'quguyanghoutui', 'qgyht', 45455, 'goodsImage/logo.jpg', '143', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (248, 19, 1, NULL, NULL, '去骨羊前腿', '', '斤', 'quguyangqiantui', 'qgyqt', 45454, 'goodsImage/logo.jpg', '143', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (249, 19, 1, NULL, NULL, '羊宝', '', '斤', 'yangbao', 'yb', 45468, 'goodsImage/logo.jpg', '143', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (250, 19, 1, NULL, NULL, '羊鞭', '', '斤', 'yangbian', 'yb', 45466, 'goodsImage/logo.jpg', '143', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (251, 19, 1, NULL, NULL, '羊肠', '', '斤', 'yangchang', 'yc', 45464, 'goodsImage/logo.jpg', '143', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (252, 19, 1, NULL, NULL, '羊肚', '', '斤', 'yangdu', 'yd', 45471, 'goodsImage/logo.jpg', '143', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (253, 19, 1, NULL, NULL, '羊肺', '', '斤', 'yangfei', 'yf', 45467, 'goodsImage/logo.jpg', '143', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (254, 19, 1, NULL, NULL, '羊肝', '', '斤', 'yanggan', 'yg', 45465, 'goodsImage/logo.jpg', '143', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (255, 19, 1, NULL, NULL, '羊骨头', '', '斤', 'yanggutou', 'ygt', 45469, 'goodsImage/logo.jpg', '143', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (256, 19, 1, NULL, NULL, '羊里脊', '', '斤', 'yangliji', 'ylj', 45472, 'goodsImage/logo.jpg', '143', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (257, 19, 1, NULL, NULL, '羊腩', '', '斤', 'yangnan', 'yn', 45470, 'goodsImage/logo.jpg', '143', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (258, 19, 1, NULL, NULL, '羊排骨', '', '斤', 'yangpaigu', 'ypg', 45461, 'goodsImage/logo.jpg', '143', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (259, 19, 1, NULL, NULL, '羊肉片', '', '斤', 'yangroupian', 'yrp', 45457, 'goodsImage/logo.jpg', '143', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (260, 19, 1, NULL, NULL, '羊尾巴油', '', '斤', 'yangweibayou', 'ywby', 45462, 'goodsImage/logo.jpg', '143', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (261, 19, 1, NULL, NULL, '羊小腿', '羊棒', '斤', 'yangxiaotui', 'yxt', 45463, 'goodsImage/logo.jpg', '143', 14, 1, 0, '', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (262, 19, 1, NULL, NULL, '羊蝎子', '', '斤', 'yangxiezi', 'yxz', 45459, 'goodsImage/logo.jpg', '143', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (263, 19, 1, NULL, NULL, '羊腰窝', '', '斤', 'yangyaowo', 'yyw', 45456, 'goodsImage/logo.jpg', '143', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (264, 19, 1, NULL, NULL, '羊腰子', '挂油', '个', 'yangyaozi', 'yyz', 45458, 'goodsImage/logo.jpg', '143', 14, 1, 0, '', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (265, 20, 1, NULL, NULL, '鹌鹑', '', '斤', 'anchun', 'ac', 45505, 'goodsImage/logo.jpg', '144', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (266, 20, 1, NULL, NULL, '北京填鸭', '', '斤', 'beijingtianya', 'bjty', 45500, 'goodsImage/logo.jpg', '144', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (267, 20, 1, NULL, NULL, '冻琵琶腿', '', '斤', 'dongpipatui', 'dppt', 45482, 'goodsImage/logo.jpg', '144', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (268, 20, 1, NULL, NULL, '鹅', '', '斤', 'e', 'e', 45502, 'goodsImage/logo.jpg', '144', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (269, 20, 1, NULL, NULL, '湖鸭', '', '斤', 'huya', 'hy', 45501, 'goodsImage/logo.jpg', '144', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (270, 20, 1, NULL, NULL, '鸡边腿', '', '斤', 'jibiantui', 'jbt', 45480, 'goodsImage/logo.jpg', '144', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (271, 20, 1, NULL, NULL, '鸡脖子', '去皮', '斤', 'jibozi', 'jbz', 45488, 'goodsImage/logo.jpg', '144', 14, 1, 0, '', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (272, 20, 1, NULL, NULL, '鸡脖子', '带皮', '斤', 'jibozi', 'jbz', 45487, 'goodsImage/logo.jpg', '144', 14, 1, 0, '', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (273, 20, 1, NULL, NULL, '鸡翅', '', '斤', 'jichi', 'jc', 45478, 'goodsImage/logo.jpg', '144', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (274, 20, 1, NULL, NULL, '鸡翅根', '', '斤', 'jichigen', 'jcg', 45492, 'goodsImage/logo.jpg', '144', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (275, 20, 1, NULL, NULL, '鸡翅中', '', '斤', 'jichizhong', 'jcz', 45479, 'goodsImage/logo.jpg', '144', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (276, 20, 1, NULL, NULL, '鸡肝', '', '斤', 'jigan', 'jg', 45486, 'goodsImage/logo.jpg', '144', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (277, 20, 1, NULL, NULL, '鸡架子', '', '斤', 'jijiazi', 'jjz', 45490, 'goodsImage/logo.jpg', '144', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (278, 20, 1, NULL, NULL, '鸡排腿', '', '斤', 'jipaitui', 'jpt', 45481, 'goodsImage/logo.jpg', '144', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (279, 20, 1, NULL, NULL, '鸡头', '', '斤', 'jitou', 'jt', 45489, 'goodsImage/logo.jpg', '144', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (280, 20, 1, NULL, NULL, '鸡心', '', '斤', 'jixin', 'jx', 45485, 'goodsImage/logo.jpg', '144', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (281, 20, 1, NULL, NULL, '鸡胸', '', '斤', 'jixiong', 'jx', 45477, 'goodsImage/logo.jpg', '144', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (282, 20, 1, NULL, NULL, '鸡油', '', '斤', 'jiyou', 'jy', 45491, 'goodsImage/logo.jpg', '144', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (283, 20, 1, NULL, NULL, '鸡胗', '', '斤', 'jizhen', 'jz', 45483, 'goodsImage/logo.jpg', '144', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (284, 20, 1, NULL, NULL, '鸡爪', '', '斤', 'jizhua', 'jz', 45484, 'goodsImage/logo.jpg', '144', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (285, 20, 1, NULL, NULL, '乳鸽', '', '只', 'ruge', 'rg', 45503, 'goodsImage/logo.jpg', '144', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (286, 20, 1, NULL, NULL, '肉鸡', '', '斤', 'rouji', 'rj', 45476, 'goodsImage/logo.jpg', '144', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (287, 20, 1, NULL, NULL, '三黄鸡', '净膛', '斤', 'sanhuangji', 'shj', 45498, 'goodsImage/logo.jpg', '144', 14, 1, 0, '', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (288, 20, 1, NULL, NULL, '淘汰鸡', '', '斤', 'taotaiji', 'ttj', 45473, 'goodsImage/logo.jpg', '144', 14, 1, 0, '', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (289, 20, 1, NULL, NULL, '乌鸡', '净膛', '斤', 'wuji', 'wj', 45499, 'goodsImage/logo.jpg', '144', 14, 1, 0, '', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (290, 20, 1, NULL, NULL, '鸭肠', '', '斤', 'yachang', 'yc', 45493, 'goodsImage/logo.jpg', '144', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (291, 20, 1, NULL, NULL, '鸭肝', '', '斤', 'yagan', 'yg', 45494, 'goodsImage/logo.jpg', '144', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (292, 20, 1, NULL, NULL, '鸭头', '', '斤', 'yatou', 'yt', 45495, 'goodsImage/logo.jpg', '144', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (293, 20, 1, NULL, NULL, '鸭腿', '', '斤', 'yatui', 'yt', 45497, 'goodsImage/logo.jpg', '144', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (294, 20, 1, NULL, NULL, '鸭心', '', '斤', 'yaxin', 'yx', 45496, 'goodsImage/logo.jpg', '144', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (295, 20, 1, NULL, NULL, '仔鸡', '', '斤', 'ziji', 'zj', 45475, 'goodsImage/logo.jpg', '144', 14, 1, 0, '', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (296, 21, 1, NULL, NULL, '鹌鹑蛋', '', '斤', 'anchundan', 'acd', 45512, 'goodsImage/logo.jpg', '145', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (297, 21, 1, NULL, NULL, '柴鸡蛋', '', '斤', 'chaijidan', 'cjd', 45513, 'goodsImage/logo.jpg', '145', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (298, 21, 1, NULL, NULL, '鹅蛋', '', '斤', 'edan', 'ed', 45511, 'goodsImage/logo.jpg', '145', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (299, 21, 1, NULL, NULL, '鸽子蛋', '', '个', 'gezidan', 'gzd', 45516, 'goodsImage/logo.jpg', '145', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (300, 21, 1, NULL, NULL, '鸡蛋', '', '斤', 'jidan', 'jd', 45506, 'goodsImage/logo.jpg', '145', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (301, 21, 1, NULL, NULL, '松花蛋', '', '斤', 'songhuadan', 'shd', 45510, 'goodsImage/logo.jpg', '145', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (302, 21, 1, NULL, NULL, '生鸭蛋', '', '斤', 'shengyadan', 'syd', 45508, 'goodsImage/logo.jpg', '145', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (303, 21, 1, NULL, NULL, '熟鸭蛋', '', '斤', 'shuyadan', 'syd', 45509, 'goodsImage/logo.jpg', '145', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (304, 21, 1, NULL, NULL, '鸵鸟蛋', '', '个', 'tuoniaodan', 'tnd', 45515, 'goodsImage/logo.jpg', '145', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (305, 21, 1, NULL, NULL, '乌鸡蛋', '', '斤', 'wujidan', 'wjd', 45514, 'goodsImage/logo.jpg', '145', 14, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (306, 22, 1, NULL, NULL, '稻花香', NULL, '斤', 'daohuaxiang', 'dhx', 17600078, 'goodsImage/logo.jpg', '151', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (307, 22, 1, NULL, NULL, '长粒香', NULL, '斤', 'zhanglixiang', 'zlx', 17600077, 'goodsImage/logo.jpg', '151', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (308, 24, 1, NULL, NULL, '菜籽油', NULL, '桶', 'caiziyou', 'czy', 17600071, 'goodsImage/logo.jpg', '152', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (309, 24, 1, NULL, NULL, '花椒油', NULL, '瓶', 'huajiaoyou', 'hjy', 17600038, 'goodsImage/logo.jpg', '152', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (310, 24, 1, NULL, NULL, '蚝油', NULL, '瓶', 'haoyou', 'hy', 17600042, 'goodsImage/logo.jpg', '152', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (311, 24, 1, NULL, NULL, '色拉油', NULL, '桶', 'selayou', 'sly', 17600072, 'goodsImage/logo.jpg', '152', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (312, 24, 1, NULL, NULL, '香油', NULL, '瓶', 'xiangyou', 'xy', 17600037, 'goodsImage/logo.jpg', '152', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (313, 24, 1, NULL, NULL, '蒸鱼豉油', NULL, '瓶', 'zhengyuchiyou', 'zycy', 17600059, 'goodsImage/logo.jpg', '152', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (315, 25, 1, NULL, NULL, '五得利', '三星', '斤', 'wudeli', 'wdl', 17600080, 'goodsImage/logo.jpg', '153', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (317, 26, 1, NULL, NULL, '红豆', NULL, '斤', 'hongdou', 'hd', 17600074, 'goodsImage/logo.jpg', '154', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (318, 26, 1, NULL, NULL, '黑芝麻', NULL, '斤', 'heizhima', 'hzm', 17600075, 'goodsImage/logo.jpg', '154', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (319, 26, 1, NULL, NULL, '绿豆', NULL, '斤', 'lüdou', 'ld', 17600073, 'goodsImage/logo.jpg', '154', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (320, 27, 1, NULL, NULL, '奥尔良', NULL, '瓶', 'aoerliang', 'ael', 17600070, 'goodsImage/logo.jpg', '155', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (321, 27, 1, NULL, NULL, '白醋', NULL, '瓶', 'baicu', 'bc', 17600034, 'goodsImage/logo.jpg', '155', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (322, 27, 1, NULL, NULL, '白糖', NULL, '袋', 'baitang', 'bt', 17600044, 'goodsImage/logo.jpg', '155', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (323, 27, 1, NULL, NULL, '陈醋', NULL, '瓶', 'chencu', 'cc', 17600036, 'goodsImage/logo.jpg', '155', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (324, 27, 1, NULL, NULL, '淀粉', NULL, '袋', 'dianfen', 'df', 17600046, 'goodsImage/logo.jpg', '155', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (325, 27, 1, NULL, NULL, '东古', NULL, '瓶', 'donggu', 'dg', 17600033, 'goodsImage/logo.jpg', '155', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (326, 27, 1, NULL, NULL, '大料', NULL, '斤', 'daliao', 'dl', 17600062, 'goodsImage/logo.jpg', '155', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (327, 27, 1, NULL, NULL, '蕃茄酱', NULL, '瓶', 'fanqiejiang', 'fqj', 17600069, 'goodsImage/logo.jpg', '155', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (328, 27, 1, NULL, NULL, '干辣椒', NULL, '斤', 'ganlajiao', 'glj', 17600058, 'goodsImage/logo.jpg', '155', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (329, 27, 1, NULL, NULL, '桂皮', NULL, '斤', 'guipi', 'gp', 17600063, 'goodsImage/logo.jpg', '155', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (330, 27, 1, NULL, NULL, '红99', NULL, '袋', 'hong99', 'h99', 17600054, 'goodsImage/logo.jpg', '155', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (331, 27, 1, NULL, NULL, '黄豆酱', NULL, '瓶', 'huangdoujiang', 'hdj', 17600064, 'goodsImage/logo.jpg', '155', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (332, 27, 1, NULL, NULL, '鸡精', NULL, '袋', 'jijing', 'jj', 17600051, 'goodsImage/logo.jpg', '155', 15, 1, 0, '太太乐', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (333, 27, 1, NULL, NULL, '鸡精', NULL, '斤', 'jijing', 'jj', 17600052, 'goodsImage/logo.jpg', '155', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (334, 27, 1, NULL, NULL, '老抽', NULL, '500ml/瓶', 'laochou', 'lc', 17600032, 'goodsImage/logo.jpg', '155', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (335, 27, 1, NULL, NULL, '辣椒段', NULL, '斤', 'lajiaoduan', 'ljd', 17600055, 'goodsImage/logo.jpg', '155', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (336, 27, 1, NULL, NULL, '辣椒面', '细', '斤', 'lajiaomian', 'ljm', 17600057, 'goodsImage/logo.jpg', '155', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (337, 27, 1, NULL, NULL, '辣椒面', '粗', '斤', 'lajiaomian', 'ljm', 17600056, 'goodsImage/logo.jpg', '155', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (338, 27, 1, NULL, NULL, '米醋', NULL, '瓶', 'micu', 'mc', 17600035, 'goodsImage/logo.jpg', '155', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (339, 27, 1, NULL, NULL, '生抽', NULL, '500ml/瓶', 'shengchou', 'sc', 17600031, 'goodsImage/logo.jpg', '155', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (340, 27, 1, NULL, NULL, '生粉', NULL, '袋', 'shengfen', 'sf', 17600045, 'goodsImage/logo.jpg', '155', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (341, 27, 1, NULL, NULL, '蒜蓉酱', NULL, '袋', 'suanrongjiang', 'srj', 17600053, 'goodsImage/logo.jpg', '155', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (342, 27, 1, NULL, NULL, '十三香', NULL, '盒', 'shisanxiang', 'ssx', 17600040, 'goodsImage/logo.jpg', '155', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (343, 27, 1, NULL, NULL, '甜面酱', NULL, '袋', 'tianmianjiang', 'tmj', 17600050, 'goodsImage/logo.jpg', '155', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (344, 27, 1, NULL, NULL, '盐', NULL, '袋', 'yan', 'y', 17600041, 'goodsImage/logo.jpg', '155', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (345, 28, 1, NULL, NULL, '粉条', '', '100克/袋', 'fentiao', 'ft', 17600029, 'goodsImage/logo.jpg', '156', 15, 1, 0, '', '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (346, 28, 1, NULL, NULL, '粉条', NULL, '斤', 'fentiao', 'ft', 17600082, 'goodsImage/logo.jpg', '156', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (347, 28, 1, NULL, NULL, '枸杞子', NULL, '斤', 'gouqizi', 'gqz', 17600066, 'goodsImage/logo.jpg', '156', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (348, 28, 1, NULL, NULL, '枸杞子', NULL, '500克/袋', 'gouqizi', 'gqz', 17600083, 'goodsImage/logo.jpg', '156', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (349, 28, 1, NULL, NULL, '花生米', '', '斤', 'huashengmi', 'hsm', 17600047, 'goodsImage/logo.jpg', '156', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (350, 28, 1, NULL, NULL, '花生米', '小颗', '斤', 'huashengmi', 'hsm', 17600048, 'goodsImage/logo.jpg', '156', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (351, 28, 1, NULL, NULL, '花生米', '红皮', '斤', 'huashengmi', 'hsm', 17600049, 'goodsImage/logo.jpg', '156', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (352, 28, 1, NULL, NULL, '红枣', NULL, '斤', 'hongzao', 'hz', 17600067, 'goodsImage/logo.jpg', '156', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (353, 28, 1, NULL, NULL, '红枣', NULL, '斤', 'hongzao', 'hz', 17600068, 'goodsImage/logo.jpg', '156', 15, 1, 0, '灰枣', NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (354, 28, 1, NULL, NULL, '红枣', NULL, '1000克/袋', 'hongzao', 'hz', 17600084, 'goodsImage/logo.jpg', '156', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (355, 28, 1, NULL, NULL, '木耳', NULL, '斤', 'muer', 'me', 17600043, 'goodsImage/logo.jpg', '156', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (356, 28, 1, NULL, NULL, '银耳', NULL, '斤', 'yiner', 'ye', 17600065, 'goodsImage/logo.jpg', '156', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (357, 29, 1, NULL, NULL, '臭豆腐', NULL, '瓶', 'choudoufu', 'cdf', 17600061, 'goodsImage/logo.jpg', '157', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (358, 29, 1, NULL, NULL, '豆腐乳', NULL, '瓶', 'doufuru', 'dfr', 17600060, 'goodsImage/logo.jpg', '157', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (359, 30, 1, NULL, NULL, '安琪', NULL, '大包', 'anqi', 'aq', 17600039, 'goodsImage/logo.jpg', '158', 15, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (360, 31, 1, NULL, NULL, '草鱼', '', '斤', 'caoyu', 'cy', 45325, 'goodsImage/logo.jpg', '161', 16, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (361, 31, 1, NULL, NULL, '多宝鱼', '', '斤', 'duobaoyu', 'dby', 45351, 'goodsImage/logo.jpg', '161', 16, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (362, 31, 1, NULL, NULL, '淡水鲈鱼', '', '斤', 'danshuiluyu', 'dsly', 45341, 'goodsImage/logo.jpg', '161', 16, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (363, 31, 1, NULL, NULL, '带鱼', '进口', '斤', 'daiyu', 'dy', 45356, 'goodsImage/logo.jpg', '161', 16, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (364, 31, 1, NULL, NULL, '带鱼', '国产', '斤', 'daiyu', 'dy', 45353, 'goodsImage/logo.jpg', '161', 16, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (365, 31, 1, NULL, NULL, '国产白鲴鱼', '', '斤', 'guochanbaiguyu', 'gcbgy', 45343, 'goodsImage/logo.jpg', '161', 16, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (366, 31, 1, NULL, NULL, '嘎鱼', '', '斤', 'gayu', 'gy', 45339, 'goodsImage/logo.jpg', '161', 16, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (367, 31, 1, NULL, NULL, '桂鱼', '', '斤', 'guiyu', 'gy', 45338, 'goodsImage/logo.jpg', '161', 16, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (368, 31, 1, NULL, NULL, '黑鱼', '', '斤', 'heiyu', 'hy', 45337, 'goodsImage/logo.jpg', '161', 16, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (369, 31, 1, NULL, NULL, '黄鱼', '', '斤', 'huangyu', 'hy', 45357, 'goodsImage/logo.jpg', '161', 16, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (370, 31, 1, NULL, NULL, '鲫鱼', '', '斤', 'jiyu', 'jy', 45328, 'goodsImage/logo.jpg', '161', 16, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (371, 31, 1, NULL, NULL, '罗非鱼', '', '斤', 'luofeiyu', 'lfy', 45336, 'goodsImage/logo.jpg', '161', 16, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (372, 31, 1, NULL, NULL, '鲢鱼', '', '斤', 'lianyu', 'ly', 45334, 'goodsImage/logo.jpg', '161', 16, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (373, 31, 1, NULL, NULL, '鲤鱼', '', '斤', 'liyu', 'ly', 45322, 'goodsImage/logo.jpg', '161', 16, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (374, 31, 1, NULL, NULL, '胖头鱼', '', '斤', 'pangtouyu', 'pty', 45331, 'goodsImage/logo.jpg', '161', 16, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (375, 31, 1, NULL, NULL, '平鱼', '', '斤', 'pingyu', 'py', 45364, 'goodsImage/logo.jpg', '161', 16, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (376, 31, 1, NULL, NULL, '青石斑鱼', '', '斤', 'qingshibanyu', 'qsby', 45352, 'goodsImage/logo.jpg', '161', 16, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (377, 31, 1, NULL, NULL, '鲐鲅', '', '斤', 'taiba', 'tb', 45346, 'goodsImage/logo.jpg', '161', 16, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (378, 31, 1, NULL, NULL, '鳎目鱼', '', '斤', 'tamuyu', 'tmy', 45348, 'goodsImage/logo.jpg', '161', 16, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (379, 31, 1, NULL, NULL, '武昌鱼', '', '斤', 'wuchangyu', 'wcy', 45333, 'goodsImage/logo.jpg', '161', 16, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (380, 31, 1, NULL, NULL, '鲟鱼', '', '斤', 'xunyu', 'xy', 45342, 'goodsImage/logo.jpg', '161', 16, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (381, 31, 1, NULL, NULL, '燕鲅', '', '斤', 'yanba', 'yb', 45345, 'goodsImage/logo.jpg', '161', 16, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (382, 31, 1, NULL, NULL, '左偏口鱼', '', '斤', 'zuopiankouyu', 'zpky', 45347, 'goodsImage/logo.jpg', '161', 16, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (383, 33, 1, NULL, NULL, '澳洲龙虾', '', '斤', 'aozhoulongxia', 'azlx', 45320, 'goodsImage/logo.jpg', '162', 16, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (384, 33, 1, NULL, NULL, '澳洲龙虾', '', '斤', 'aozhoulongxia', 'azlx', 45321, 'goodsImage/logo.jpg', '162', 16, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (385, 33, 1, NULL, NULL, '斑节虾', '冻', '斤', 'banjiexia', 'bjx', 45317, 'goodsImage/logo.jpg', '162', 16, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (386, 33, 1, NULL, NULL, '北极虾', '>100头|风冷', '斤', 'beijixia', 'bjx', 45315, 'goodsImage/logo.jpg', '162', 16, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (387, 33, 1, NULL, NULL, '北极虾', '<100头|风冷', '斤', 'beijixia', 'bjx', 45316, 'goodsImage/logo.jpg', '162', 16, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (388, 33, 1, NULL, NULL, '波士顿青龙虾', '活', '斤', 'boshidunqinglongxia', 'bsdqlx', 45313, 'goodsImage/logo.jpg', '162', 16, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (389, 33, 1, NULL, NULL, '冰鲜白虾', '45-60头', '斤', 'bingxianbaixia', 'bxbx', 45309, 'goodsImage/logo.jpg', '162', 16, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (390, 33, 1, NULL, NULL, '冰鲜白虾', '30-45头', '斤', 'bingxianbaixia', 'bxbx', 45308, 'goodsImage/logo.jpg', '162', 16, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (391, 33, 1, NULL, NULL, '草虾', '', '斤', 'caoxia', 'cx', 45318, 'goodsImage/logo.jpg', '162', 16, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (392, 33, 1, NULL, NULL, '活白虾', '45-60头', '斤', 'huobaixia', 'hbx', 45307, 'goodsImage/logo.jpg', '162', 16, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (393, 33, 1, NULL, NULL, '基围虾', '40-60头', '斤', 'jiweixia', 'jwx', 45312, 'goodsImage/logo.jpg', '162', 16, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (394, 33, 1, NULL, NULL, '基围虾', '20-40头', '斤', 'jiweixia', 'jwx', 45311, 'goodsImage/logo.jpg', '162', 16, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (395, 33, 1, NULL, NULL, '明对虾', '', '斤', 'mingduixia', 'mdx', 45319, 'goodsImage/logo.jpg', '162', 16, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (396, 33, 1, NULL, NULL, '琵琶虾', '活', '斤', 'pipaxia', 'ppx', 45310, 'goodsImage/logo.jpg', '162', 16, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (397, 33, 1, NULL, NULL, '小青龙虾', '活', '斤', 'xiaoqinglongxia', 'xqlx', 45314, 'goodsImage/logo.jpg', '162', 16, 1, 0, NULL, '', '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (398, 34, 1, NULL, NULL, '大饼', NULL, '张', 'dabing', 'db', 17600089, 'goodsImage/logo.jpg', '181', 18, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (399, 34, 1, NULL, NULL, '刀削面', NULL, '斤', 'daoxuemian', 'dxm', 17600087, 'goodsImage/logo.jpg', '181', 18, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (400, 34, 1, NULL, NULL, '馒头', NULL, '个', 'mantou', 'mt', 17600088, 'goodsImage/logo.jpg', '181', 18, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (401, 34, 1, NULL, NULL, '面条', '粗', '斤', 'miantiao', 'mt', 17600085, 'goodsImage/logo.jpg', '181', 18, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (402, 34, 1, NULL, NULL, '面条', '细', '斤', 'miantiao', 'mt', 17600086, 'goodsImage/logo.jpg', '181', 18, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (403, 34, 1, NULL, NULL, '烧饼', NULL, '个', 'shaobing', 'sb', 17600090, 'goodsImage/logo.jpg', '181', 18, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (404, 36, 1, NULL, NULL, '酒鬼花生', '五香', '5斤/袋', 'jiuguihuasheng', 'jghs', 17600093, 'goodsImage/logo.jpg', '183', 18, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (405, 36, 1, NULL, NULL, '酒鬼花生', '麻辣', '5斤/袋', 'jiuguihuasheng', 'jghs', 17600094, 'goodsImage/logo.jpg', '183', 18, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (406, 36, 1, NULL, NULL, '腰果', '生', '斤', 'yaoguo', 'yg', 17600091, 'goodsImage/logo.jpg', '183', 18, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (407, 36, 1, NULL, NULL, '腰果', '熟', '斤', 'yaoguo', 'yg', 17600092, 'goodsImage/logo.jpg', '183', 18, 1, 0, NULL, NULL, '#20afb8');
INSERT INTO `nx_distributer_goods` VALUES (409, 25, 1, NULL, NULL, '面粉', NULL, '袋', 'mianfen', 'mf', 17600101, 'goodsImage/logo.jpg', '153', 15, 1, 0, '金沙河', NULL, '#20afb8');
COMMIT;

-- ----------------------------
-- Table structure for nx_distributer_purchase_batch
-- ----------------------------
DROP TABLE IF EXISTS `nx_distributer_purchase_batch`;
CREATE TABLE `nx_distributer_purchase_batch` (
  `nx_distributer_purchase_batch_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '批发商进货批次id',
  `nx_DPB_status` tinyint(2) DEFAULT NULL COMMENT '批发商进货批次状态',
  `nx_DPB_type` tinyint(2) DEFAULT NULL COMMENT '批发商进货批次类型',
  `nx_DPB_time` varchar(12) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '批发商进货批次时间',
  `nx_DPB_pur_user_id` int(20) DEFAULT NULL COMMENT '批发商进货采购员id',
  `nx_DPB_distributer_id` int(20) DEFAULT NULL COMMENT '批发商id',
  `nx_DPB_date` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DPB_hour` varchar(4) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DPB_minute` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  PRIMARY KEY (`nx_distributer_purchase_batch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Table structure for nx_distributer_purchase_goods
-- ----------------------------
DROP TABLE IF EXISTS `nx_distributer_purchase_goods`;
CREATE TABLE `nx_distributer_purchase_goods` (
  `nx_distributer_purchase_goods_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '批发商采购商品id',
  `nx_DPG_dis_goods_id` int(20) DEFAULT NULL COMMENT '采购商品id',
  `nx_DPG_dis_goods_father_id` int(20) DEFAULT NULL COMMENT '采购父级商品id',
  `nx_DPG_quantity` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '采购数量',
  `nx_DPG_standard` varchar(6) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '采购规格',
  `nx_DPG_status` tinyint(2) DEFAULT NULL COMMENT '采购状态',
  `nx_DPG_distributer_id` int(20) DEFAULT NULL COMMENT '采购批发商id',
  `nx_DPG_purchase_type` tinyint(2) DEFAULT NULL COMMENT '采购方式：“1 订单采购”“2 添加采购”',
  `nx_DPG_time` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '采购时间',
  `nx_DPG_batch_id` int(20) DEFAULT NULL COMMENT '采购批次号',
  `nx_DPG_buy_user_id` int(20) DEFAULT NULL COMMENT '采购方式为“采购”的采购员id',
  `nx_DPG_buy_price` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '采购单价',
  `nx_DPG_buy_quantity` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '采购数量',
  `nx_DPG_orders_amount` int(10) DEFAULT NULL COMMENT '订单采购的订单数量',
  `nx_DPG_type_add_user_id` int(11) DEFAULT NULL COMMENT '添加采购用户id',
  `nx_DPG_apply_date` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL,
  PRIMARY KEY (`nx_distributer_purchase_goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Table structure for nx_distributer_standard
-- ----------------------------
DROP TABLE IF EXISTS `nx_distributer_standard`;
CREATE TABLE `nx_distributer_standard` (
  `nx_distributer_standard_id` int(20) NOT NULL AUTO_INCREMENT,
  `nx_DS_dis_goods_id` int(20) DEFAULT NULL,
  `nx_DS_standard_name` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DS_standard_file_path` varchar(200) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DS_standard_scale` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DS_standard_error` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DS_standard_sort` int(10) DEFAULT NULL,
  PRIMARY KEY (`nx_distributer_standard_id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_distributer_standard
-- ----------------------------
BEGIN;
INSERT INTO `nx_distributer_standard` VALUES (1, 1, '根', 'uploadImage/wxbc686226ccc443f1.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.0r30bxBpTNcFbabac3529edec5e2c86ba0c548932af5.jpg', NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (2, 2, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (3, 3, '根', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (4, 4, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (5, 5, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (7, 7, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (8, 8, '根', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (9, 9, '节', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (10, 9, '根', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (11, 10, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (12, 11, '根', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (13, 12, '根', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (14, 13, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (15, 14, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (16, 15, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (17, 16, '把', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (18, 20, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (19, 21, '根', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (20, 22, '根', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (21, 23, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (22, 24, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (23, 26, '根', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (24, 27, '根', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (25, 28, '根', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (26, 30, '颗', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (27, 33, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (28, 34, '根', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (29, 36, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (30, 38, '根', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (31, 39, '颗', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (32, 42, '根', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (33, 43, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (34, 44, '颗', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (35, 45, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (36, 46, '根', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (37, 49, '根', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (38, 50, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (39, 51, '捆', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (40, 54, '颗', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (41, 57, '把', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (42, 59, '把', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (43, 61, '捆', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (44, 62, '颗', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (45, 68, '把', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (46, 69, '颗', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (47, 71, '颗', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (48, 73, '颗', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (49, 75, '颗', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (50, 76, '把', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (51, 80, '颗', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (52, 81, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (53, 82, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (54, 83, '根', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (55, 85, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (56, 92, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (57, 94, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (58, 97, '捆', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (59, 99, '把', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (60, 105, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (61, 120, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (62, 122, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (63, 123, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (64, 124, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (65, 125, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (66, 126, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (67, 127, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (68, 128, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (69, 129, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (70, 130, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (71, 131, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (72, 132, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (73, 133, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (74, 134, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (75, 135, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (76, 136, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (77, 137, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (78, 138, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (79, 139, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (80, 140, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (81, 145, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (82, 150, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (83, 151, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (84, 152, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (85, 153, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (86, 154, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (87, 155, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (88, 156, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (89, 157, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (90, 158, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (91, 159, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (92, 160, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (93, 162, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (94, 163, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (95, 164, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (96, 165, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (97, 166, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (98, 169, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (99, 170, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (100, 172, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (101, 173, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (102, 174, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (103, 186, '张', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (104, 188, '块', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (105, 189, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (106, 191, '块', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (107, 193, '根', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (108, 194, '根', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (109, 195, '根', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (110, 202, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (111, 209, '根', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (112, 210, '根', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (113, 211, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (114, 212, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (115, 213, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (117, 215, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (118, 216, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (119, 217, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (120, 219, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (121, 220, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (122, 221, '根', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (123, 222, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (124, 223, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (125, 226, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (126, 230, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (127, 231, '根', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (128, 241, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (129, 244, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (130, 245, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (131, 246, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (132, 247, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (133, 248, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (134, 249, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (135, 250, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (136, 251, '根', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (137, 252, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (138, 253, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (139, 254, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (140, 255, '根', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (141, 261, '根', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (142, 263, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (143, 265, '只', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (144, 266, '只', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (145, 267, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (146, 268, '只', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (147, 269, '只', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (148, 270, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (149, 271, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (150, 272, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (151, 273, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (152, 274, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (153, 275, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (154, 276, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (155, 277, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (156, 278, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (157, 279, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (158, 281, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (159, 284, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (160, 286, '只', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (161, 287, '只', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (162, 288, '只', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (163, 289, '只', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (164, 291, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (165, 292, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (166, 293, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (167, 294, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (168, 295, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (169, 298, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (170, 300, '箱', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (171, 300, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (172, 301, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (173, 302, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (174, 303, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (175, 305, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (176, 306, '袋', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (177, 307, '袋', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (178, 356, '个', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (179, 360, '条', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (180, 361, '条', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (181, 362, '条', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (182, 363, '条', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (183, 364, '条', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (184, 365, '条', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (185, 366, '条', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (186, 367, '条', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (187, 368, '条', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (188, 369, '条', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (189, 370, '条', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (190, 371, '条', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (191, 372, '条', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (192, 373, '条', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (193, 375, '条', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (194, 376, '条', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (195, 377, '条', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (196, 378, '条', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (197, 379, '条', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (198, 380, '条', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (199, 381, '条', NULL, NULL, NULL, NULL);
INSERT INTO `nx_distributer_standard` VALUES (200, 382, '条', NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for nx_distributer_supplier
-- ----------------------------
DROP TABLE IF EXISTS `nx_distributer_supplier`;
CREATE TABLE `nx_distributer_supplier` (
  `nx_distributer_supplier_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '批发商供货商id',
  `nx_DS_distributer_id` int(20) DEFAULT NULL COMMENT '批发商id',
  `nx_DS_supplier_id` int(20) DEFAULT NULL COMMENT '供货商id',
  PRIMARY KEY (`nx_distributer_supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_distributer_supplier
-- ----------------------------
BEGIN;
INSERT INTO `nx_distributer_supplier` VALUES (1, 1, 1);
INSERT INTO `nx_distributer_supplier` VALUES (2, 1, 2);
COMMIT;

-- ----------------------------
-- Table structure for nx_distributer_user
-- ----------------------------
DROP TABLE IF EXISTS `nx_distributer_user`;
CREATE TABLE `nx_distributer_user` (
  `nx_distributer_user_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '批发商用户id',
  `nx_DIU_wx_avartra_url` varchar(200) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '用户名',
  `nx_DIU_wx_nick_name` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '登陆密码',
  `nx_DIU_wx_open_id` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DIU_wx_phone` varchar(15) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DIU_distributer_id` int(20) DEFAULT NULL,
  `nx_DIU_admin` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`nx_distributer_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_distributer_user
-- ----------------------------
BEGIN;
INSERT INTO `nx_distributer_user` VALUES (1, 'https://thirdwx.qlogo.cn/mmopen/vi_32/A6HnsicWX5AqTPibokqX0mv49otOSQOejxnkRFyMl9xtjRhAnv4KeH6oiaHf7Qxv8k0rt0xdgrUBNjCXfWV2Lpxng/132', '李树国配送💐 🌸 🐟 🍏', 'oX2485P8vz6TSn0mB9Ld4HJJt4nU', NULL, 1, 1);
INSERT INTO `nx_distributer_user` VALUES (2, 'https://thirdwx.qlogo.cn/mmopen/vi_32/WY0NbVkYibXWooQSAoyAbUIbTudycp5YKoibAuQL1hmichDJ1axA5FVwOnIkknSyVDlNXteUZBUWwY86uyXLK9CGw/132', '知心爱人', 'oX2485BKhfwzWc9pevBqC71Oe2U8', NULL, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for nx_distributer_user_role
-- ----------------------------
DROP TABLE IF EXISTS `nx_distributer_user_role`;
CREATE TABLE `nx_distributer_user_role` (
  `nx_distributer_user_role_id` int(20) NOT NULL AUTO_INCREMENT,
  `nx_DUR_user_id` int(20) DEFAULT NULL COMMENT '用户ID',
  `nx_DUR_role_id` int(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`nx_distributer_user_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of nx_distributer_user_role
-- ----------------------------
BEGIN;
INSERT INTO `nx_distributer_user_role` VALUES (1, 1, 0);
INSERT INTO `nx_distributer_user_role` VALUES (2, 2, 0);
COMMIT;

-- ----------------------------
-- Table structure for nx_e_commerce
-- ----------------------------
DROP TABLE IF EXISTS `nx_e_commerce`;
CREATE TABLE `nx_e_commerce` (
  `nx_e_commerce_id` int(20) NOT NULL AUTO_INCREMENT,
  `nx_e_commerce_name` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_e_commerce_img` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL,
  PRIMARY KEY (`nx_e_commerce_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_e_commerce
-- ----------------------------
BEGIN;
INSERT INTO `nx_e_commerce` VALUES (1, '华联生鲜', NULL);
COMMIT;

-- ----------------------------
-- Table structure for nx_e_commerce_community
-- ----------------------------
DROP TABLE IF EXISTS `nx_e_commerce_community`;
CREATE TABLE `nx_e_commerce_community` (
  `nx_ECC_id` int(20) NOT NULL COMMENT '批发商社区id',
  `nx_ECC_e_id` int(20) DEFAULT NULL,
  `nx_ECC_community_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`nx_ECC_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_e_commerce_community
-- ----------------------------
BEGIN;
INSERT INTO `nx_e_commerce_community` VALUES (1, 1, 1);
INSERT INTO `nx_e_commerce_community` VALUES (2, 1, 2);
INSERT INTO `nx_e_commerce_community` VALUES (3, 1, 3);
COMMIT;

-- ----------------------------
-- Table structure for nx_e_commerce_supplier
-- ----------------------------
DROP TABLE IF EXISTS `nx_e_commerce_supplier`;
CREATE TABLE `nx_e_commerce_supplier` (
  `nx_distributer_supplier_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '批发商供货商id',
  `nx_DS_distributer_id` int(20) DEFAULT NULL COMMENT '批发商id',
  `nx_DS_supplier_id` int(20) DEFAULT NULL COMMENT '供货商id',
  PRIMARY KEY (`nx_distributer_supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_e_commerce_supplier
-- ----------------------------
BEGIN;
INSERT INTO `nx_e_commerce_supplier` VALUES (1, 1, 1);
INSERT INTO `nx_e_commerce_supplier` VALUES (2, 1, 2);
COMMIT;

-- ----------------------------
-- Table structure for nx_goods
-- ----------------------------
DROP TABLE IF EXISTS `nx_goods`;
CREATE TABLE `nx_goods` (
  `nx_goods_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `nx_goods_name` varchar(50) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '商品名称',
  `nx_goods_standardname` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '商品规格',
  `nx_goods_detail` varchar(200) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '商品描述',
  `nx_goods_brand` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '商品品牌',
  `nx_goods_place` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '商品产地',
  `nx_goods_pinyin` varchar(200) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '拼音',
  `nx_goods_py` varchar(50) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '简拼',
  `nx_goods_father_id` int(20) DEFAULT NULL COMMENT '父级id',
  `nx_goods_sort` int(10) DEFAULT NULL COMMENT '商品排序',
  `nx_goods_file` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '图片',
  `nx_goods_standard_amount` int(2) DEFAULT NULL COMMENT '销售规格数量',
  PRIMARY KEY (`nx_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17600102 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_goods
-- ----------------------------
BEGIN;
INSERT INTO `nx_goods` VALUES (1, '生鲜', '', '', NULL, NULL, NULL, NULL, 0, 1, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (2, '酒店用品', '', '', NULL, NULL, NULL, NULL, 0, 2, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (8, '会员美食吧', '', '', NULL, NULL, NULL, NULL, -1, 8, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (11, '新鲜蔬菜', '', '', NULL, NULL, NULL, NULL, 1, 1, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (12, '新鲜水果', '', '', NULL, NULL, NULL, NULL, 1, 2, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (13, '豆腐制品咸菜', '', '', NULL, NULL, NULL, NULL, 1, 5, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (14, '肉禽蛋', '', '', NULL, NULL, NULL, NULL, 1, 4, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (15, '粮油调味', '', '', NULL, NULL, NULL, NULL, 1, 2, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (16, '海鲜水产', '', '', NULL, NULL, NULL, NULL, 1, 3, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (17, '冷饮冻食', '', '', NULL, NULL, NULL, NULL, 1, 4, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (18, '食品', '', '', NULL, NULL, NULL, NULL, 1, 3, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (19, '酒类', '', '', NULL, NULL, NULL, NULL, 1, 5, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (21, '服装厨具', '', '', NULL, NULL, NULL, NULL, 2, 6, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (22, '一次性用品', '', '', NULL, NULL, NULL, NULL, 2, 7, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (81, '火锅', '', '', NULL, NULL, NULL, NULL, 8, 8, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (82, '水果拼箱', '', '', NULL, NULL, NULL, NULL, 8, 8, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (83, '喝点小食', NULL, '', NULL, NULL, NULL, NULL, 8, NULL, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (111, '根茎类', '', '', NULL, NULL, NULL, NULL, 11, 1, 'goodsImage/1.jpg', 0);
INSERT INTO `nx_goods` VALUES (112, '茄果瓜类', '', '', NULL, NULL, NULL, NULL, 11, 3, 'goodsImage/3.jpg', 0);
INSERT INTO `nx_goods` VALUES (113, '叶菜类', '', '', NULL, NULL, NULL, NULL, 11, 4, 'goodsImage/4.jpg', 0);
INSERT INTO `nx_goods` VALUES (114, '葱姜蒜椒香料', '', '', NULL, NULL, NULL, NULL, 11, 2, 'goodsImage/2.jpg', 0);
INSERT INTO `nx_goods` VALUES (115, '鲜菌菇', '', '', NULL, NULL, NULL, NULL, 11, 5, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (121, '国产水果', NULL, '', NULL, NULL, NULL, NULL, 12, 1, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (122, '进口水果', NULL, '', NULL, NULL, NULL, NULL, 12, 2, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (131, '豆腐制品', NULL, NULL, NULL, NULL, NULL, NULL, 13, 1, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (132, '半加工豆制品', NULL, NULL, NULL, NULL, NULL, NULL, 13, 1, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (133, '咸菜', NULL, NULL, NULL, NULL, NULL, NULL, 13, 2, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (134, '熟食', NULL, NULL, NULL, NULL, NULL, NULL, 13, 2, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (141, '猪肉', NULL, '', NULL, NULL, NULL, NULL, 14, 1, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (142, '牛肉', '', '', NULL, NULL, NULL, NULL, 14, 2, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (143, '羊肉', '', '', NULL, NULL, NULL, NULL, 14, 3, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (144, '鸡鸭鸽', NULL, '', NULL, NULL, NULL, NULL, 14, 4, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (145, '蛋', NULL, '', NULL, NULL, NULL, NULL, 14, 5, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (151, '米', '', '', NULL, NULL, NULL, NULL, 15, 8, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (152, '食用油', '', '', NULL, NULL, NULL, NULL, 15, 8, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (153, '面', '', '', NULL, NULL, NULL, NULL, 15, 8, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (154, '杂粮', '', '', NULL, NULL, NULL, NULL, 15, 8, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (155, '调味品', '', '', NULL, NULL, NULL, NULL, 15, 8, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (156, '南北干货', '', '', NULL, NULL, NULL, NULL, 15, 8, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (157, '方便食品', '', '', NULL, NULL, NULL, NULL, 15, 8, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (158, '烘培原料', '', '', NULL, NULL, NULL, NULL, 15, 8, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (159, '有机食品', '', '', NULL, NULL, NULL, NULL, 15, 8, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (161, '鱼类', NULL, '', NULL, NULL, NULL, NULL, 16, NULL, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (162, '虾类', NULL, '', NULL, NULL, NULL, NULL, 16, 2, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (163, '蟹类', NULL, '', NULL, NULL, NULL, NULL, 16, NULL, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (164, '贝罗类', NULL, '', NULL, NULL, NULL, NULL, 16, NULL, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (165, '海参', NULL, '', NULL, NULL, NULL, NULL, 16, NULL, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (166, '海鲜加工品', NULL, '', NULL, NULL, NULL, NULL, 16, NULL, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (167, '海产干货', NULL, '', NULL, NULL, NULL, NULL, 16, NULL, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (171, '火锅丸串', NULL, '', NULL, NULL, NULL, NULL, 17, NULL, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (172, '水饺/馄饨', NULL, '', NULL, NULL, NULL, NULL, 17, NULL, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (173, '汤圆/元宵', NULL, '', NULL, NULL, NULL, NULL, 17, NULL, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (174, '面点', NULL, '', NULL, NULL, NULL, NULL, 17, NULL, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (175, '烘培半成品', NULL, '', NULL, NULL, NULL, NULL, 17, NULL, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (176, '奶酪/黄油', NULL, '', NULL, NULL, NULL, NULL, 17, NULL, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (177, '方便速食', NULL, '', NULL, NULL, NULL, NULL, 17, NULL, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (178, '冷藏饮料/低温奶', NULL, '', NULL, NULL, NULL, NULL, 17, NULL, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (181, '主食', '', '', NULL, NULL, NULL, NULL, 18, 6, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (182, '半加工食品', NULL, '', NULL, NULL, NULL, NULL, 18, 3, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (183, '干果食品', '', '', NULL, NULL, NULL, NULL, 18, 8, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (184, '进口食品', '', '', NULL, NULL, NULL, NULL, 18, 5, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (185, '休闲食品', '', '', NULL, NULL, NULL, NULL, 18, 6, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (191, '白酒', NULL, '', NULL, NULL, NULL, NULL, 19, NULL, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (192, '葡萄酒', NULL, '', NULL, NULL, NULL, NULL, 19, NULL, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (193, '啤酒', NULL, '', NULL, NULL, NULL, NULL, 19, NULL, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (194, '洋酒', NULL, '', NULL, NULL, NULL, NULL, 19, NULL, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (195, '黄酒/养生酒', NULL, '', NULL, NULL, NULL, NULL, 19, NULL, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (211, '鞋帽', '', '', NULL, NULL, NULL, NULL, 21, 1, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (212, '厨具', '', '', NULL, NULL, NULL, NULL, 21, 1, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (221, '清洁用品', '', '', NULL, NULL, NULL, NULL, 22, 1, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (222, '包装', '', '', NULL, NULL, NULL, NULL, 22, 1, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (31111, '卤水豆腐', '斤', '', NULL, NULL, 'lushuidoufu', 'lsdf', 131, 1, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (31112, '老豆腐', '斤', NULL, NULL, NULL, 'laodoufu', 'ldf', 131, 2, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (31113, '嫩豆腐', '斤', NULL, NULL, NULL, 'nendoufu', 'ndf', 131, NULL, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (31114, '豆泡', '斤', NULL, NULL, NULL, 'doupao', 'dp', 132, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (31115, '三河豆腐丝', '斤', NULL, NULL, NULL, 'sanhedoufusi', 'shdfs', 132, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (31116, '盒豆腐', '盒', '北豆腐', '白玉', NULL, 'hedoufu', 'hdf', 131, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (31117, '豆皮', '斤', NULL, NULL, NULL, 'doupi', 'dp', 132, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (31118, '熏干', '斤', NULL, NULL, NULL, 'xungan', 'xg', 132, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (44678, '土豆', '斤', '', NULL, '', 'tudou', 'td', 111, 1, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45093, '新土豆', '斤', '', NULL, '', 'xintudou', 'xtd', 111, 2, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45094, '胡萝卜', '斤', '', '', '', 'huluobu', 'hlb', 111, 3, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45095, '心里美', '斤', '', NULL, '', 'xinlimei', 'xlm', 111, 5, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45096, '白萝卜', '斤', '', NULL, '', 'bailuobu', 'blb', 111, 6, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45097, '卞萝卜', '斤', '', NULL, '', 'bianluobu', 'blb', 111, 7, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45100, '莴笋', '斤', '', NULL, '', 'wosun', 'ws', 111, 10, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45101, '麻山药', '斤', '', NULL, '', 'mashanyao', 'msy', 111, 11, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45103, '藕', '斤', '', NULL, '', 'ou', 'o', 111, 13, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45104, '红薯', '斤', '普通', NULL, '', 'hongshu', 'hs', 111, 14, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45106, '芋头', '斤', '', NULL, '', 'yutou', 'yt', 111, 16, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45107, '凉薯', '斤', '', NULL, '', 'liangshu', 'ls', 111, 17, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45109, '樱桃萝卜', '斤', '', NULL, '', 'yingtaoluobu', 'ytlb', 111, 19, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45110, '尖椒', '斤', '', NULL, '', 'jianjiao', 'jj', 114, 1, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45112, '黄葱头', '斤', '', NULL, '', 'huangcongtou', 'hct', 114, 3, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45113, '紫葱头', '斤', '', NULL, '', 'zicongtou', 'zct', 114, 4, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45114, '大葱', '斤', '', NULL, '', 'dacong', 'dc', 114, 5, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45115, '小葱', '斤', '', NULL, '', 'xiaocong', 'xc', 114, 6, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45116, '姜', '斤', '', NULL, '', 'jiang', 'j', 114, 7, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45117, '蒜', '斤', '', NULL, '', 'suan', 's', 114, 8, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45118, '新蒜', '斤', '', NULL, '', 'xinsuan', 'xs', 114, 9, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45119, '蒜苗', '斤', '', NULL, '', 'suanmiao', 'sm', 114, 10, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45121, '蒜黄', '斤', '', NULL, '', 'suanhuang', 'sh', 114, 12, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45123, '线椒', '斤', '', NULL, '', 'xianjiao', 'xj', 114, 14, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45125, '小米椒', '斤', '', NULL, '', 'xiaomijiao', 'xmj', 114, 16, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45126, '彩椒(红)', '斤', '', NULL, '', 'caijiao(hong)', 'cj(h)', 114, 17, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45127, '青蒜', '斤', '', NULL, '', 'qingsuan', 'qs', 114, 18, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45128, '香葱', '斤', '', NULL, '', 'xiangcong', 'xc', 114, 19, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45130, '西红柿', '斤', '', NULL, '', 'xihongshi', 'xhs', 112, 1, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45132, '黄瓜', '斤', '', NULL, '', 'huanggua', 'hg', 112, 3, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45135, '长茄子', '斤', '', '', '', 'changqiezi', 'cqz', 112, 7, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45136, '圆茄子', '斤', '', '', '', 'yuanqiezi', 'yqz', 112, 7, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45137, '架豆', '斤', '', NULL, '', 'jiadou', 'jd', 112, 8, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45138, '吊冬瓜', '斤', '', NULL, '', 'diaodonggua', 'ddg', 112, 9, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45139, '地冬瓜', '斤', '', NULL, '', 'didonggua', 'ddg', 112, 10, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45140, '西胡芦', '斤', '', NULL, '', 'xihulu', 'xhl', 112, 11, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45141, '菜花', '斤', '', NULL, '', 'caihua', 'ch', 112, 12, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45142, '散菜花', '斤', '', NULL, '', 'sancaihua', 'sch', 112, 13, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45144, '小毛冬瓜', '斤', '', NULL, '', 'xiaomaodonggua', 'xmdg', 112, 15, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45145, '豆王', '斤', '', NULL, '', 'douwang', 'dw', 112, 16, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45146, '扁豆', '斤', '', NULL, '', 'biandou', 'bd', 112, 17, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45147, '豇豆', '斤', '', NULL, '', 'jiangdou', 'jd', 112, 18, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45148, '白不老', '斤', '', NULL, '', 'baibulao', 'bbl', 112, 19, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45149, '油豆', '斤', '', NULL, '', 'youdou', 'yd', 112, 20, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45150, '毛豆', '斤', '', NULL, '', 'maodou', 'md', 112, 21, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45151, '苦瓜', '斤', '', NULL, '', 'kugua', 'kg', 112, 22, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45152, '丝瓜', '斤', '', NULL, '', 'sigua', 'sg', 112, 23, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45153, '南北瓜', '斤', '', NULL, '', 'nanbeigua', 'nbg', 112, 24, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45155, '广茄', '斤', '', NULL, '', 'guangqie', 'gq', 112, 26, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45156, '线茄', '斤', '', NULL, '', 'xianqie', 'xq', 112, 27, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45158, '金丝南瓜', '斤', '', NULL, '', 'jinsinangua', 'jsng', 112, 29, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45159, '板栗南瓜', '斤', '', NULL, '', 'banlinangua', 'blng', 112, 30, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45160, '荸荠', '斤', '', NULL, '', 'biji', 'bj', 112, 31, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45161, '玉米', '斤', '', NULL, '', 'yumi', 'ym', 112, 32, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45162, '豌豆', '斤', '', NULL, '', 'wandou', 'wd', 112, 33, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45163, '冬春笋', '斤', '', NULL, '', 'dongchunsun', 'dcs', 112, 34, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45164, '花生', '斤', '', NULL, '', 'huasheng', 'hs', 112, 35, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45165, '大白菜', '斤', '', NULL, '', 'dabaicai', 'dbc', 113, 1, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45166, '娃娃菜', '斤', '', NULL, '', 'wawacai', 'wwc', 113, 2, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45167, '芹菜', '斤', '', NULL, '', 'qincai', 'qc', 113, 3, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45168, '菠菜', '斤', '', NULL, '', 'bocai', 'bc', 113, 4, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45170, '圆白菜', '斤', '', NULL, '', 'yuanbaicai', 'ybc', 113, 6, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45171, '甘蓝', '斤', '', NULL, '', 'ganlan', 'gl', 113, 7, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45172, '油菜', '斤', '', NULL, '', 'youcai', 'yc', 113, 8, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45173, '香菜', '斤', '', NULL, '', 'xiangcai', 'xc', 113, 9, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45174, '韭菜', '斤', '', NULL, '', 'jiucai', 'jc', 113, 10, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45176, '茴香', '斤', '', NULL, '', 'huixiang', 'hx', 113, 12, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45180, '油麦菜', '斤', '', NULL, '', 'youmaicai', 'ymc', 113, 16, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45181, '黄心菜', '斤', '', NULL, '', 'huangxincai', 'hxc', 113, 17, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45182, '西芹', '斤', '', NULL, '', 'xiqin', 'xq', 113, 18, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45185, '小白菜', '斤', '', NULL, '', 'xiaobaicai', 'xbc', 113, 21, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45187, '奶白菜', '斤', '', NULL, '', 'naibaicai', 'nbc', 113, 23, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45188, '叶生菜', '斤', '', NULL, '', 'sanshengcai', 'ssc', 113, 24, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45189, '茼蒿', '斤', '', NULL, '', 'tonghao', 'th', 113, 25, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45190, '蒿子秆', '斤', '', NULL, '', 'haozigan', 'hzg', 113, 26, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45191, '香芹', '斤', '', NULL, '', 'xiangqin', 'xq', 113, 27, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45193, '苋菜', '斤', '', NULL, '', 'xiancai', 'xc', 113, 29, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45194, '菊花菜', '斤', '', NULL, '', 'juhuacai', 'jhc', 113, 30, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45195, '盖菜', '斤', '', NULL, '', 'gaicai', 'gc', 113, 31, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45196, '芥兰', '斤', '', NULL, '', 'jielan', 'jl', 113, 32, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45197, '菜心', '斤', '', NULL, '', 'caixin', 'cx', 113, 33, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45198, '空心菜', '斤', '', NULL, '', 'kongxincai', 'kxc', 113, 34, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45199, '鸡毛菜', '斤', '', NULL, '', 'jimaocai', 'jmc', 113, 35, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45200, '荠菜', '斤', '', NULL, '', 'jicai', 'jc', 113, 36, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45201, '豌豆苗', '斤', '', NULL, '', 'wandoumiao', 'wdm', 113, 37, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45202, '快菜', '斤', '', NULL, '', 'kuaicai', 'kc', 113, 38, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45203, '苦菊', '斤', '', NULL, '', 'kuju', 'kj', 113, 39, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45204, '穿心莲', '斤', '', NULL, '', 'chuanxinlian', 'cxl', 113, 40, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45205, '木耳菜', '斤', '', NULL, '', 'muercai', 'mec', 113, 41, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45206, '平菇', '斤', '', NULL, '', 'pinggu', 'pg', 115, 1, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45207, '香菇', '斤', '', NULL, '', 'xianggu', 'xg', 115, 2, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45208, '白玉菇', '斤', '', NULL, '', 'baiyugu', 'byg', 115, 3, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45209, '口蘑', '斤', '', NULL, '', 'koumo', 'km', 115, 4, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45210, '杏鲍菇', '斤', '', NULL, '', 'xingbaogu', 'xbg', 115, 5, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45211, '鸡腿菇', '斤', '', NULL, '', 'jituigu', 'jtg', 115, 6, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45212, '金针菇', '斤', '', NULL, '', 'jinzhengu', 'jzg', 115, 7, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45217, '百香果', '斤', '', NULL, NULL, 'baixiangguo', 'bxg', 121, 5, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45218, '桑葚', '斤', '', NULL, NULL, 'sangshen', 'ss', 121, 6, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45219, '白草莓', '斤', '', '日本淡雪', NULL, 'baicaomei', 'bcm', 121, 7, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45221, '草莓', '斤', '', '丹东九九', NULL, 'caomei', 'cm', 121, 9, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45222, '草莓', '斤', '', '甜宝奶油', NULL, 'caomei', 'cm', 121, 10, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45223, '草莓', '斤', '', '巧克力', NULL, 'caomei', 'cm', 121, 11, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45224, '柿子', '斤', '', '磨盘', NULL, 'shizi', 'sz', 121, 12, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45225, '火龙果', '斤', '红心', NULL, NULL, 'huolongguo', 'hlg', 121, 13, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45226, '火龙果', '斤', '白心', NULL, NULL, 'huolongguo', 'hlg', 121, 13, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45227, '木瓜', '斤', '', NULL, NULL, 'mugua', 'mg', 121, 15, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45228, '柿饼', '斤', '', NULL, NULL, 'shibing', 'sb', 121, 16, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45229, '甘蔗', '斤', '', NULL, NULL, 'ganzhe', 'gz', 121, 17, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45230, '柠檬', '斤', '', NULL, NULL, 'ningmeng', 'nm', 121, 18, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45231, '黑枣', '斤', '', NULL, NULL, 'heizao', 'hz', 121, 19, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45232, '山楂', '斤', '', NULL, NULL, 'shanzha', 'sz', 121, 20, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45233, '灯笼果', '斤', '', '姑娘果', NULL, 'denglongguo', 'dlg', 121, 21, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45234, '鸭梨', '斤', '', NULL, NULL, 'yali', 'yl', 121, 22, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45235, '雪花梨', '斤', '', NULL, NULL, 'xuehuali', 'xhl', 121, 23, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45236, '皇冠梨', '斤', '', '', NULL, 'huangguanli', 'hgl', 121, 24, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45237, '贡梨', '斤', '', NULL, NULL, 'gongli', 'gl', 121, 25, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45238, '南果梨', '斤', '', NULL, NULL, 'nanguoli', 'ngl', 121, 26, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45239, '丰水梨', '斤', '', NULL, NULL, 'fengshuili', 'fsl', 121, 27, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45240, '红霄梨', '斤', '', NULL, NULL, 'hongxiaoli', 'hxl', 121, 28, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45241, '香梨', '斤', '', '库尔勒', NULL, 'kuerlexiangli', 'kelxl', 121, 29, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45243, '红皮梨', '斤', '', NULL, NULL, 'hongpili', 'hpl', 121, 31, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45246, '沙糖桔', '斤', '', '中果', NULL, 'shatangjie', 'stj', 121, 34, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45247, '丑橘', '斤', '', NULL, NULL, 'chouju', 'cj', 121, 35, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45248, '脐橙', '斤', '', NULL, '', 'qicheng', 'qc', 121, 36, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45249, '血橙', '斤', '', '二月红|中华红', NULL, 'xuecheng', 'xc', 121, 37, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45250, '沃柑', '斤', '', NULL, NULL, 'wogan', 'wg', 121, 38, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45251, '马水桔', '斤', '', NULL, NULL, 'mashuijie', 'msj', 121, 39, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45252, '芦柑', '斤', '', NULL, NULL, 'lugan', 'lg', 121, 40, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45253, '茂谷柑', '斤', '', NULL, NULL, 'maogugan', 'mgg', 121, 41, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45254, '小金桔', '斤', '', NULL, NULL, 'xiaojinjie', 'xjj', 121, 42, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45255, '柚子', '斤', '红心', '', NULL, 'youzi', 'yz', 121, 43, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45256, '柚子', '斤', '白心', '', NULL, 'youzi', 'yz', 121, 44, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45258, '橙子', '斤', '', '伦晚', NULL, 'chengzi', 'cz', 121, 46, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45259, '油桃', '斤', '', NULL, NULL, 'youtao', 'yt', 121, 47, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45261, '桃', '斤', '', NULL, NULL, 'tao', 't', 121, 49, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45262, '猕猴桃', '斤', '', '徐香', NULL, 'mihoutao', 'mht', 121, 50, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45263, '猕猴桃', '斤', '', '海沃德', NULL, 'mihoutao', 'mht', 121, 51, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45264, '西瓜', '斤', '', '麒麟', NULL, 'xigua', 'xg', 121, 52, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45265, '西瓜', '斤', '', NULL, NULL, 'xigua', 'xg', 121, 53, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45269, '香蕉', '斤', '', '', '', 'xiangjiao', 'xj', 121, 57, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45272, '哈密瓜', '斤', '', NULL, NULL, 'hamigua', 'hmg', 121, 60, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45274, '甜瓜', '斤', '', '黄金瓜', NULL, 'tiangua', 'tg', 121, 62, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45275, '甜瓜', '斤', '', '网纹', NULL, 'tiangua', 'tg', 121, 63, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45276, '甜瓜', '斤', '', '长香玉', NULL, 'tiangua', 'tg', 121, 64, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45277, '甜瓜', '斤', '', '玉姑', NULL, 'tiangua', 'tg', 121, 65, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45278, '甜瓜', '斤', '', '羊角蜜', NULL, 'tiangua', 'tg', 121, 66, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45279, '甜瓜', '斤', '', '花蕾', NULL, 'tiangua', 'tg', 121, 67, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45280, '甜瓜', '斤', '西州密', '绿宝', NULL, 'tiangua', 'tg', 121, 68, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45282, '甜瓜', '斤', '', '博阳九号', NULL, 'tiangua', 'tg', 121, 70, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45283, '甜瓜', '斤', '', '白糖罐', NULL, 'tiangua', 'tg', 121, 71, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45284, '苹果', '斤', '', '富士', '烟台', 'pingguo', 'pg', 121, 72, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45287, '苹果', '斤', '', '黄元帅', NULL, 'pingguo', 'pg', 121, 75, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45288, '苹果', '斤', '', '花牛', NULL, 'pingguo', 'pg', 121, 76, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45289, '苹果', '斤', '新疆阿克苏', '冰糖心', NULL, 'pingguo', 'pg', 121, 77, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45290, '苹果', '斤', '', '国光', NULL, 'pingguo', 'pg', 121, 78, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45291, '苹果', '斤', '辽宁寒富', '', NULL, 'pingguo', 'pg', 121, 79, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45293, '葡萄', '斤', '阳光玫瑰', '', NULL, 'putao', 'pt', 121, 81, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45294, '提子', '斤', '', '', NULL, 'tizi', 'tz', 121, 82, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45295, '葡萄', '斤', '夏黑', '', NULL, 'putao', 'pt', 121, 83, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45296, '葡萄', '斤', '玫瑰香', NULL, NULL, 'putao', 'pt', 121, 84, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45297, '葡萄', '斤', '红宝石', '', NULL, 'putao', 'pt', 121, 85, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45298, '青葡萄', '斤', '贵妃青', NULL, NULL, 'putao', 'pt', 121, 86, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45299, '芒果', '斤', '小', '生台农', NULL, 'mangguo', 'mg', 121, 87, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45300, '芒果', '斤', '大', '生台农', NULL, 'mangguo', 'mg', 121, 88, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45301, '芒果', '斤', '', '红金龙', NULL, 'mangguo', 'mg', 121, 89, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45302, '芒果', '斤', '', '高乐密', NULL, 'mangguo', 'mg', 121, 90, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45303, '芒果', '斤', '青皮', NULL, NULL, 'mangguo', 'mg', 121, 91, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45305, '芒果', '斤', '', '水仙', NULL, 'mangguo', 'mg', 121, 93, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45306, '樱桃', '斤', '', '美早', NULL, 'yingtao', 'yt', 121, 94, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45307, '活白虾', '斤', '45-60头', NULL, '', 'huobaixia', 'hbx', 162, 1, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45308, '冰鲜白虾', '斤', '30-45头', NULL, '', 'bingxianbaixia', 'bxbx', 162, 2, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45309, '冰鲜白虾', '斤', '45-60头', NULL, '', 'bingxianbaixia', 'bxbx', 162, 3, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45310, '琵琶虾', '斤', '活', NULL, '', 'pipaxia', 'ppx', 162, 4, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45311, '基围虾', '斤', '20-40头', NULL, '', 'jiweixia', 'jwx', 162, 5, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45312, '基围虾', '斤', '40-60头', NULL, '', 'jiweixia', 'jwx', 162, 6, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45313, '波士顿青龙虾', '斤', '活', NULL, '', 'boshidunqinglongxia', 'bsdqlx', 162, 7, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45314, '小青龙虾', '斤', '活', NULL, '', 'xiaoqinglongxia', 'xqlx', 162, 8, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45315, '北极虾', '斤', '>100头|风冷', NULL, '', 'beijixia', 'bjx', 162, 9, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45316, '北极虾', '斤', '<100头|风冷', NULL, '', 'beijixia', 'bjx', 162, 10, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45317, '斑节虾', '斤', '冻', NULL, '', 'banjiexia', 'bjx', 162, 11, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45318, '草虾', '斤', '', NULL, '', 'caoxia', 'cx', 162, 12, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45319, '明对虾', '斤', '', NULL, '', 'mingduixia', 'mdx', 162, 13, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45320, '澳洲龙虾', '斤', '', NULL, '', 'aozhoulongxia', 'azlx', 162, 14, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45321, '澳洲龙虾', '斤', '', NULL, '', 'aozhoulongxia', 'azlx', 162, 15, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45322, '鲤鱼', '斤', '', NULL, '', 'liyu', 'ly', 161, 1, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45325, '草鱼', '斤', '', NULL, '', 'caoyu', 'cy', 161, 4, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45328, '鲫鱼', '斤', '', NULL, '', 'jiyu', 'jy', 161, 7, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45331, '胖头鱼', '斤', '', NULL, '', 'pangtouyu', 'pty', 161, 10, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45333, '武昌鱼', '斤', '', NULL, '', 'wuchangyu', 'wcy', 161, 12, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45334, '鲢鱼', '斤', '', NULL, '', 'lianyu', 'ly', 161, 13, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45336, '罗非鱼', '斤', '', NULL, '', 'luofeiyu', 'lfy', 161, 15, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45337, '黑鱼', '斤', '', NULL, '', 'heiyu', 'hy', 161, 16, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45338, '桂鱼', '斤', '', NULL, '', 'guiyu', 'gy', 161, 17, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45339, '嘎鱼', '斤', '', NULL, '', 'gayu', 'gy', 161, 18, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45341, '淡水鲈鱼', '斤', '', NULL, '', 'danshuiluyu', 'dsly', 161, 20, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45342, '鲟鱼', '斤', '', NULL, '', 'xunyu', 'xy', 161, 21, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45343, '国产白鲴鱼', '斤', '', NULL, '', 'guochanbaiguyu', 'gcbgy', 161, 22, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45345, '燕鲅', '斤', '', NULL, '', 'yanba', 'yb', 161, 24, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45346, '鲐鲅', '斤', '', NULL, '', 'taiba', 'tb', 161, 25, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45347, '左偏口鱼', '斤', '', NULL, '', 'zuopiankouyu', 'zpky', 161, 26, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45348, '鳎目鱼', '斤', '', NULL, '', 'tamuyu', 'tmy', 161, 27, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45351, '多宝鱼', '斤', '', NULL, '', 'duobaoyu', 'dby', 161, 30, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45352, '青石斑鱼', '斤', '', NULL, '', 'qingshibanyu', 'qsby', 161, 31, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45353, '带鱼', '斤', '国产', NULL, '', 'daiyu', 'dy', 161, 32, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45356, '带鱼', '斤', '进口', NULL, '', 'daiyu', 'dy', 161, 35, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45357, '黄鱼', '斤', '', NULL, '', 'huangyu', 'hy', 161, 36, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45364, '平鱼', '斤', '', NULL, '', 'pingyu', 'py', 161, 43, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45372, '扇贝', '斤', '', 'null', '', 'shanbei', 'sb', 164, 1, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45374, '大香螺', '斤', '', NULL, '', 'daxiangluo', 'dxl', 164, 3, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45375, '角螺', '斤', '', NULL, '', 'jiaoluo', 'jl', 164, 4, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45376, '钉螺', '斤', '', NULL, '', 'dingluo', 'dl', 164, 5, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45377, '海螺丝', '斤', '', NULL, '', 'hailuosi', 'hls', 164, 6, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45378, '大海螺', '斤', '', NULL, '', 'dahailuo', 'dhl', 164, 7, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45379, '大蛏子', '斤', '', NULL, '', 'dachengzi', 'dcz', 164, 8, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45397, '前臀尖', '斤', '', '', NULL, 'qiantunjian', 'qtj', 141, 3, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45399, '后臀尖', '斤', '', '', NULL, 'houtunjian', 'htj', 141, 5, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45401, '五花肉', '斤', '', '', NULL, 'wuhuarou', 'whr', 141, 7, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45404, '通脊', '斤', '', NULL, NULL, 'tongji', 'tj', 141, 10, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45405, '纯瘦肉', '斤', '', NULL, NULL, 'chunshourou', 'csr', 141, 11, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45406, '前肘', '斤', '', NULL, NULL, 'qianzhou', 'qz', 141, 12, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45407, '后肘', '斤', '', NULL, NULL, 'houzhou', 'hz', 141, 13, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45408, '猪尾巴', '斤', '', NULL, NULL, 'zhuweiba', 'zwb', 141, 14, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45409, '猪蹄', '斤', '', NULL, NULL, 'zhuti', 'zt', 141, 15, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45410, '纯排骨', '斤', '', NULL, NULL, 'chunpaigu', 'cpg', 141, 16, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45411, '纯腔骨', '斤', '', NULL, NULL, 'chunqianggu', 'cqg', 141, 17, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45412, '腔排骨', '斤', '', NULL, NULL, 'qiangpaigu', 'qpg', 141, 18, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45413, '棒骨', '斤', '', NULL, NULL, 'banggu', 'bg', 141, 19, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45414, '猪头', '斤', '', NULL, NULL, 'zhutou', 'zt', 141, 20, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45415, '猪口条', '斤', '', NULL, NULL, 'zhukoutiao', 'zkt', 141, 21, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45416, '猪耳', '斤', '', NULL, NULL, 'zhuer', 'ze', 141, 22, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45417, '猪脑', '斤', '', NULL, NULL, 'zhunao', 'zn', 141, 23, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45418, '猪肚', '斤', '', NULL, NULL, 'zhudu', 'zd', 141, 24, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45419, '猪板油', '斤', '', NULL, NULL, 'zhubanyou', 'zby', 141, 25, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45420, '肥膘肉', '斤', '', NULL, NULL, 'feibiaorou', 'fbr', 141, 26, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45421, '猪腰子', '斤', '', NULL, NULL, 'zhuyaozi', 'zyz', 141, 27, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45422, '护心肉', '斤', '', NULL, NULL, 'huxinrou', 'hxr', 141, 28, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45423, '猪心', '斤', '', NULL, NULL, 'zhuxin', 'zx', 141, 29, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45424, '猪肝', '斤', '', NULL, NULL, 'zhugan', 'zg', 141, 30, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45425, '猪肺', '斤', '', NULL, NULL, 'zhufei', 'zf', 141, 31, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45426, '猪皮', '斤', '', NULL, NULL, 'zhupi', 'zp', 141, 32, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45427, '猪肠头', '斤', '', NULL, NULL, 'zhuchangtou', 'zct', 141, 33, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45428, '猪肠', '斤', '', NULL, NULL, 'zhuchang', 'zc', 141, 34, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45430, '牛前腱', '斤', '', NULL, NULL, 'niuqianjian', 'nqj', 142, 2, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45431, '牛后腱', '斤', '', NULL, NULL, 'niuhoujian', 'nhj', 142, 3, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45432, '牛前腿', '斤', '', NULL, NULL, 'niuqiantui', 'nqt', 142, 4, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45433, '牛后腿', '斤', '', NULL, NULL, 'niuhoutui', 'nht', 142, 5, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45434, '肥牛', '斤', '', NULL, NULL, 'feiniu', 'fn', 142, 6, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45435, '精肥牛', '斤', '', NULL, NULL, 'jingfeiniu', 'jfn', 142, 7, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45436, '牛柳', '斤', '里脊', '', NULL, 'niuliu', 'nl', 142, 8, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45437, '精牛柳', '斤', '', NULL, NULL, 'jingniuliu', 'jnl', 142, 9, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45438, '牛腩', '斤', '', NULL, NULL, 'niunan', 'nn', 142, 10, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45439, '牛林', '斤', '', NULL, NULL, 'niulin', 'nl', 142, 11, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45440, '牛腰子', '斤', '', NULL, NULL, 'niuyaozi', 'nyz', 142, 12, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45441, '牛肚', '斤', '', NULL, NULL, 'niudu', 'nd', 142, 13, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45442, '牛百叶', '斤', '', NULL, NULL, 'niubaiye', 'nby', 142, 14, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45443, '牛心', '斤', '', NULL, NULL, 'niuxin', 'nx', 142, 15, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45444, '牛舌', '斤', '', NULL, NULL, 'niushe', 'ns', 142, 16, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45445, '牛骨', '斤', '', NULL, NULL, 'niugu', 'ng', 142, 17, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45446, '牛排骨', '斤', '', NULL, NULL, 'niupaigu', 'npg', 142, 18, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45447, '牛板筋', '斤', '', NULL, NULL, 'niubanjin', 'nbj', 142, 19, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45448, '牛蹄筋', '斤', '', NULL, NULL, 'niutijin', 'ntj', 142, 20, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45449, '牛鞭', '斤', '', NULL, NULL, 'niubian', 'nb', 142, 21, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45450, '牛尾', '斤', '', NULL, NULL, 'niuwei', 'nw', 142, 22, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45451, '牛黄喉', '斤', '', NULL, NULL, 'niuhuanghou', 'nhh', 142, 23, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45452, '牛上脑', '斤', '', NULL, NULL, 'niushangnao', 'nsn', 142, 24, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45454, '去骨羊前腿', '斤', '', NULL, NULL, 'quguyangqiantui', 'qgyqt', 143, 2, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45455, '去骨羊后腿', '斤', '', NULL, NULL, 'quguyanghoutui', 'qgyht', 143, 3, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45456, '羊腰窝', '斤', '', NULL, NULL, 'yangyaowo', 'yyw', 143, 4, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45457, '羊肉片', '斤', '', NULL, NULL, 'yangroupian', 'yrp', 143, 5, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45458, '羊腰子', '个', '挂油', '', NULL, 'yangyaozi', 'yyz', 143, 6, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45459, '羊蝎子', '斤', '', NULL, NULL, 'yangxiezi', 'yxz', 143, 7, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45461, '羊排骨', '斤', '', NULL, NULL, 'yangpaigu', 'ypg', 143, 9, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45462, '羊尾巴油', '斤', '', NULL, NULL, 'yangweibayou', 'ywby', 143, 10, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45463, '羊小腿', '斤', '羊棒', '', NULL, 'yangxiaotui', 'yxt', 143, 11, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45464, '羊肠', '斤', '', NULL, NULL, 'yangchang', 'yc', 143, 12, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45465, '羊肝', '斤', '', NULL, NULL, 'yanggan', 'yg', 143, 13, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45466, '羊鞭', '斤', '', NULL, NULL, 'yangbian', 'yb', 143, 14, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45467, '羊肺', '斤', '', NULL, NULL, 'yangfei', 'yf', 143, 15, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45468, '羊宝', '斤', '', NULL, NULL, 'yangbao', 'yb', 143, 16, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45469, '羊骨头', '斤', '', NULL, NULL, 'yanggutou', 'ygt', 143, 17, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45470, '羊腩', '斤', '', NULL, NULL, 'yangnan', 'yn', 143, 18, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45471, '羊肚', '斤', '', NULL, NULL, 'yangdu', 'yd', 143, 19, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45472, '羊里脊', '斤', '', NULL, NULL, 'yangliji', 'ylj', 143, 20, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45473, '淘汰鸡', '斤', '', '', NULL, 'taotaiji', 'ttj', 144, 1, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45475, '仔鸡', '斤', '', '', NULL, 'ziji', 'zj', 144, 3, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45476, '肉鸡', '斤', '', NULL, NULL, 'rouji', 'rj', 144, 4, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45477, '鸡胸', '斤', '', NULL, NULL, 'jixiong', 'jx', 144, 5, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45478, '鸡翅', '斤', '', NULL, NULL, 'jichi', 'jc', 144, 6, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45479, '鸡翅中', '斤', '', NULL, NULL, 'jichizhong', 'jcz', 144, 7, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45480, '鸡边腿', '斤', '', NULL, NULL, 'jibiantui', 'jbt', 144, 8, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45481, '鸡排腿', '斤', '', NULL, NULL, 'jipaitui', 'jpt', 144, 9, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45482, '冻琵琶腿', '斤', '', NULL, NULL, 'dongpipatui', 'dppt', 144, 10, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45483, '鸡胗', '斤', '', NULL, NULL, 'jizhen', 'jz', 144, 11, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45484, '鸡爪', '斤', '', NULL, NULL, 'jizhua', 'jz', 144, 12, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45485, '鸡心', '斤', '', NULL, NULL, 'jixin', 'jx', 144, 13, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45486, '鸡肝', '斤', '', NULL, NULL, 'jigan', 'jg', 144, 14, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45487, '鸡脖子', '斤', '带皮', '', NULL, 'jibozi', 'jbz', 144, 15, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45488, '鸡脖子', '斤', '去皮', '', NULL, 'jibozi', 'jbz', 144, 16, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45489, '鸡头', '斤', '', NULL, NULL, 'jitou', 'jt', 144, 17, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45490, '鸡架子', '斤', '', NULL, NULL, 'jijiazi', 'jjz', 144, 18, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45491, '鸡油', '斤', '', NULL, NULL, 'jiyou', 'jy', 144, 19, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45492, '鸡翅根', '斤', '', NULL, NULL, 'jichigen', 'jcg', 144, 20, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45493, '鸭肠', '斤', '', NULL, NULL, 'yachang', 'yc', 144, 21, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45494, '鸭肝', '斤', '', NULL, NULL, 'yagan', 'yg', 144, 22, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45495, '鸭头', '斤', '', NULL, NULL, 'yatou', 'yt', 144, 23, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45496, '鸭心', '斤', '', NULL, NULL, 'yaxin', 'yx', 144, 24, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45497, '鸭腿', '斤', '', NULL, NULL, 'yatui', 'yt', 144, 25, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45498, '三黄鸡', '斤', '净膛', '', NULL, 'sanhuangji', 'shj', 144, 26, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45499, '乌鸡', '斤', '净膛', '', NULL, 'wuji', 'wj', 144, 27, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45500, '北京填鸭', '斤', '', NULL, NULL, 'beijingtianya', 'bjty', 144, 28, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45501, '湖鸭', '斤', '', NULL, NULL, 'huya', 'hy', 144, 29, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45502, '鹅', '斤', '', NULL, NULL, 'e', 'e', 144, 30, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45503, '乳鸽', '只', '', NULL, NULL, 'ruge', 'rg', 144, 31, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45505, '鹌鹑', '斤', '', NULL, NULL, 'anchun', 'ac', 144, 33, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45506, '鸡蛋', '斤', '', NULL, NULL, 'jidan', 'jd', 145, 1, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45508, '生鸭蛋', '斤', '', NULL, NULL, 'shengyadan', 'syd', 145, 3, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45509, '熟鸭蛋', '斤', '', NULL, NULL, 'shuyadan', 'syd', 145, 4, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45510, '松花蛋', '斤', '', NULL, NULL, 'songhuadan', 'shd', 145, 5, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45511, '鹅蛋', '斤', '', NULL, NULL, 'edan', 'ed', 145, 6, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45512, '鹌鹑蛋', '斤', '', NULL, NULL, 'anchundan', 'acd', 145, 7, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45513, '柴鸡蛋', '斤', '', NULL, NULL, 'chaijidan', 'cjd', 145, 8, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45514, '乌鸡蛋', '斤', '', NULL, NULL, 'wujidan', 'wjd', 145, 9, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45515, '鸵鸟蛋', '个', '', NULL, NULL, 'tuoniaodan', 'tnd', 145, 10, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45516, '鸽子蛋', '个', '', NULL, NULL, 'gezidan', 'gzd', 145, 11, 'goodsImage/logo.jpg', 0);
INSERT INTO `nx_goods` VALUES (45558, '蜜薯', '斤', '', '', '', 'mishu', 'ms', 111, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (45560, '毛葱', '斤', NULL, NULL, NULL, 'maocong', 'mc', 114, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (45563, '圆生菜', '斤', NULL, NULL, NULL, 'yuanshengcai', 'ysc', 113, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (45566, '青椒', '斤', NULL, NULL, NULL, 'qingjiao', 'qj', 114, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (45569, '绿豆芽', '斤', NULL, NULL, NULL, 'lüdouya', 'ldy', 312, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (45570, '绿豆', '斤', NULL, NULL, NULL, 'lüdou', 'ld', 312, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (45579, '螺丝椒', '斤', NULL, NULL, NULL, 'luosijiao', 'lsj', 114, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (45580, '彩椒(黄)', '斤', NULL, NULL, NULL, 'caijiao(huang)', 'cj(h)', 114, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (45581, '美人椒', '斤', NULL, NULL, NULL, 'meirenjiao', 'mrj', 114, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (45582, '红尖椒', '斤', NULL, NULL, NULL, 'hongjianjiao', 'hjj', 114, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (45583, '麻椒', '斤', NULL, NULL, NULL, 'majiao', 'mj', 114, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (45584, '海鲜菇', '4斤/包', NULL, NULL, NULL, 'haixiangu', 'hxg', 115, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (45585, '蟹味菇', '斤', NULL, NULL, NULL, 'xieweigu', 'xwg', 115, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (45588, '兰花', '把', NULL, NULL, NULL, 'lanhua', 'lh', 113, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (45589, '芥兰苗', '斤', NULL, NULL, NULL, 'jielanmiao', 'jlm', 113, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (45590, '绿萝卜', '斤', NULL, NULL, NULL, 'lüluobu', 'llb', 111, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (45591, '芝麻菜', '斤', NULL, NULL, NULL, 'zhimacai', 'zmc', 113, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (45592, '荷兰瓜', '斤', NULL, NULL, NULL, 'helangua', 'hlg', 112, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (45593, '落地球', '斤', NULL, NULL, NULL, 'luodiqiu', 'ldq', 113, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (45594, '秋葵', '斤', NULL, NULL, NULL, 'qiukui', 'qk', 112, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (45597, '甜豆', '斤', NULL, NULL, NULL, 'tiandou', 'td', 112, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (45598, '香椿苗', '斤', NULL, NULL, NULL, 'xiangchunmiao', 'xcm', 113, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (45599, '西兰花', '斤', NULL, NULL, NULL, 'xilanhua', 'xlh', 112, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (45600, '罗马生菜', '斤', NULL, NULL, NULL, 'luomashengcai', 'lmsc', 113, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600004, '盒豆腐', '盒', '鲜豆腐', '白玉', NULL, 'hedoufu', 'hdf', 131, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600005, '盒豆腐', '盒', '韧豆腐', '白玉', NULL, 'hedoufu', 'hdf', 131, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600006, '鸭血', '盒', NULL, NULL, NULL, 'yaxue', 'yx', 131, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600007, '鸭血', '斤', '火锅', NULL, NULL, 'yaxue', 'yx', 131, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600008, '大头菜', '斤', NULL, NULL, NULL, 'datoucai', 'dtc', 133, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600009, '芥菜丝', '斤', NULL, NULL, NULL, 'jiecaisi', 'jcs', 133, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600010, '玫瑰咸菜', '斤', NULL, NULL, NULL, 'meiguixiancai', 'mgxc', 133, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600011, '大葱', '斤', NULL, NULL, '本地', 'dacong', 'dc', 114, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600012, '蒜米', '斤', NULL, NULL, NULL, 'suanmi', 'sm', 114, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600014, '铁棍山药', '斤', NULL, NULL, NULL, 'tiegunshanyao', 'tgsy', 111, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600015, '紫甘蓝', '斤', NULL, NULL, NULL, 'ziganlan', 'zgl', 113, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600016, '小西红柿', '斤', NULL, NULL, NULL, 'xiaoxihongshi', 'xxhs', 112, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600019, '金针菇', '50克/袋', NULL, NULL, NULL, 'jinzhengu', 'jzg', 115, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600020, '金针菇', '5斤/包', NULL, NULL, NULL, 'jinzhengu', 'jzg', 115, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600021, '杏鲍菇', '5斤/包', NULL, NULL, NULL, 'xingbaogu', 'xbg', 115, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600022, '白玉菇', '50克/袋', NULL, NULL, NULL, 'baiyugu', 'byg', 115, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600023, '海鲜菇', '50克/袋', NULL, NULL, NULL, 'haixiangu', 'hxg', 115, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600024, '进口香蕉', '斤', NULL, NULL, NULL, 'jinkouxiangjiao', 'jkxj', 122, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600025, '东北拉皮', '袋', NULL, NULL, NULL, 'dongbeilapi', 'dblp', 132, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600026, '灌肠', '斤', NULL, NULL, NULL, 'guanchang', 'gc', 134, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600027, '杭椒', '斤', NULL, NULL, NULL, 'hangjiao', 'hj', 114, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600028, '雪梨', '斤', NULL, NULL, NULL, 'xueli', 'xl', 121, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600029, '粉条', '100克/袋', '', '', '', 'fentiao', 'ft', 156, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600030, '哈尔滨红肠', '斤', NULL, NULL, NULL, 'haerbinhongchang', 'hebhc', 134, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600031, '生抽', '500ml/瓶', NULL, NULL, NULL, 'shengchou', 'sc', 155, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600032, '老抽', '500ml/瓶', NULL, NULL, NULL, 'laochou', 'lc', 155, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600033, '东古', '瓶', NULL, NULL, NULL, 'donggu', 'dg', 155, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600034, '白醋', '瓶', NULL, NULL, NULL, 'baicu', 'bc', 155, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600035, '米醋', '瓶', NULL, NULL, NULL, 'micu', 'mc', 155, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600036, '陈醋', '瓶', NULL, NULL, NULL, 'chencu', 'cc', 155, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600037, '香油', '瓶', NULL, NULL, NULL, 'xiangyou', 'xy', 152, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600038, '花椒油', '瓶', NULL, NULL, NULL, 'huajiaoyou', 'hjy', 152, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600039, '安琪', '大包', NULL, NULL, NULL, 'anqi', 'aq', 158, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600040, '十三香', '盒', NULL, NULL, NULL, 'shisanxiang', 'ssx', 155, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600041, '盐', '袋', NULL, NULL, NULL, 'yan', 'y', 155, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600042, '蚝油', '瓶', NULL, NULL, NULL, 'haoyou', 'hy', 152, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600043, '木耳', '斤', NULL, NULL, NULL, 'muer', 'me', 156, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600044, '白糖', '袋', NULL, NULL, NULL, 'baitang', 'bt', 155, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600045, '生粉', '袋', NULL, NULL, NULL, 'shengfen', 'sf', 155, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600046, '淀粉', '袋', NULL, NULL, NULL, 'dianfen', 'df', 155, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600047, '花生米', '斤', '', NULL, NULL, 'huashengmi', 'hsm', 156, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600048, '花生米', '斤', '小颗', NULL, NULL, 'huashengmi', 'hsm', 156, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600049, '花生米', '斤', '红皮', NULL, NULL, 'huashengmi', 'hsm', 156, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600050, '甜面酱', '袋', NULL, NULL, NULL, 'tianmianjiang', 'tmj', 155, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600051, '鸡精', '袋', NULL, '太太乐', NULL, 'jijing', 'jj', 155, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600052, '鸡精', '斤', NULL, NULL, NULL, 'jijing', 'jj', 155, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600053, '蒜蓉酱', '袋', NULL, NULL, NULL, 'suanrongjiang', 'srj', 155, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600054, '红99', '袋', NULL, NULL, NULL, 'hong99', 'h99', 155, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600055, '辣椒段', '斤', NULL, NULL, NULL, 'lajiaoduan', 'ljd', 155, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600056, '辣椒面', '斤', '粗', NULL, NULL, 'lajiaomian', 'ljm', 155, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600057, '辣椒面', '斤', '细', NULL, NULL, 'lajiaomian', 'ljm', 155, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600058, '干辣椒', '斤', NULL, NULL, NULL, 'ganlajiao', 'glj', 155, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600059, '蒸鱼豉油', '瓶', NULL, NULL, NULL, 'zhengyuchiyou', 'zycy', 152, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600060, '豆腐乳', '瓶', NULL, NULL, NULL, 'doufuru', 'dfr', 157, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600061, '臭豆腐', '瓶', NULL, NULL, NULL, 'choudoufu', 'cdf', 157, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600062, '大料', '斤', NULL, NULL, NULL, 'daliao', 'dl', 155, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600063, '桂皮', '斤', NULL, NULL, NULL, 'guipi', 'gp', 155, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600064, '黄豆酱', '瓶', NULL, NULL, NULL, 'huangdoujiang', 'hdj', 155, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600065, '银耳', '斤', NULL, NULL, NULL, 'yiner', 'ye', 156, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600066, '枸杞子', '斤', NULL, NULL, NULL, 'gouqizi', 'gqz', 156, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600067, '红枣', '斤', NULL, NULL, NULL, 'hongzao', 'hz', 156, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600068, '红枣', '斤', NULL, '灰枣', NULL, 'hongzao', 'hz', 156, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600069, '蕃茄酱', '瓶', NULL, NULL, NULL, 'fanqiejiang', 'fqj', 155, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600070, '奥尔良', '瓶', NULL, NULL, NULL, 'aoerliang', 'ael', 155, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600071, '菜籽油', '桶', NULL, NULL, NULL, 'caiziyou', 'czy', 152, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600072, '色拉油', '桶', NULL, NULL, NULL, 'selayou', 'sly', 152, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600073, '绿豆', '斤', NULL, NULL, NULL, 'lüdou', 'ld', 154, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600074, '红豆', '斤', NULL, NULL, NULL, 'hongdou', 'hd', 154, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600075, '黑芝麻', '斤', NULL, NULL, NULL, 'heizhima', 'hzm', 154, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600076, '娃娃菜', '包', NULL, NULL, NULL, 'wawacai', 'wwc', 113, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600077, '长粒香', '斤', NULL, NULL, NULL, 'zhanglixiang', 'zlx', 151, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600078, '稻花香', '斤', NULL, NULL, NULL, 'daohuaxiang', 'dhx', 151, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600079, '五得利', '斤', '五星', NULL, NULL, 'wudeli', 'wdl', 153, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600080, '五得利', '斤', '三星', NULL, NULL, 'wudeli', 'wdl', 153, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600081, '五得利', '斤', '七星', NULL, NULL, 'wudeli', 'wdl', 153, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600082, '粉条', '斤', NULL, NULL, NULL, 'fentiao', 'ft', 156, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600083, '枸杞子', '500克/袋', NULL, NULL, NULL, 'gouqizi', 'gqz', 156, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600084, '红枣', '1000克/袋', NULL, NULL, NULL, 'hongzao', 'hz', 156, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600085, '面条', '斤', '粗', NULL, NULL, 'miantiao', 'mt', 181, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600086, '面条', '斤', '细', NULL, NULL, 'miantiao', 'mt', 181, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600087, '刀削面', '斤', NULL, NULL, NULL, 'daoxuemian', 'dxm', 181, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600088, '馒头', '个', NULL, NULL, NULL, 'mantou', 'mt', 181, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600089, '大饼', '张', NULL, NULL, NULL, 'dabing', 'db', 181, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600090, '烧饼', '个', NULL, NULL, NULL, 'shaobing', 'sb', 181, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600091, '腰果', '斤', '生', NULL, NULL, 'yaoguo', 'yg', 183, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600092, '腰果', '斤', '熟', NULL, NULL, 'yaoguo', 'yg', 183, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600093, '酒鬼花生', '5斤/袋', '五香', NULL, NULL, 'jiuguihuasheng', 'jghs', 183, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600094, '酒鬼花生', '5斤/袋', '麻辣', NULL, NULL, 'jiuguihuasheng', 'jghs', 183, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600096, '餐巾纸', '包', NULL, NULL, NULL, 'canjinzhi', 'cjz', 221, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600097, '钢丝球', '包', NULL, NULL, NULL, 'gangsiqiu', 'gsq', 221, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600098, '百洁布', '包', NULL, NULL, NULL, 'baijiebu', 'bjb', 221, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600099, '洗洁精', '桶', NULL, NULL, NULL, 'xijiejing', 'xjj', 221, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600100, '酸菜', '袋', NULL, '刘', NULL, 'suancai', 'sc', 133, NULL, NULL, NULL);
INSERT INTO `nx_goods` VALUES (17600101, '面粉', '袋', NULL, '金沙河', NULL, 'mianfen', 'mf', 153, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for nx_label
-- ----------------------------
DROP TABLE IF EXISTS `nx_label`;
CREATE TABLE `nx_label` (
  `nx_label_id` int(20) NOT NULL AUTO_INCREMENT,
  `nx_label_name` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_label_hot` int(10) DEFAULT NULL,
  `nx_label_type_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`nx_label_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_label
-- ----------------------------
BEGIN;
INSERT INTO `nx_label` VALUES (1, '麻辣', 10, 1);
INSERT INTO `nx_label` VALUES (2, '酸辣', 9, 1);
INSERT INTO `nx_label` VALUES (3, '香辣', 8, 1);
INSERT INTO `nx_label` VALUES (4, '五香', 7, 1);
INSERT INTO `nx_label` VALUES (5, '海鲜', 6, 1);
INSERT INTO `nx_label` VALUES (6, '香甜', 5, 1);
INSERT INTO `nx_label` VALUES (7, '节假日', 2, 3);
INSERT INTO `nx_label` VALUES (8, '日常', 1, 3);
INSERT INTO `nx_label` VALUES (9, '减肥', 2, 5);
INSERT INTO `nx_label` VALUES (10, '解馋', 3, 5);
INSERT INTO `nx_label` VALUES (11, '尝鲜', 6, 5);
INSERT INTO `nx_label` VALUES (12, '聚餐', 3, 5);
INSERT INTO `nx_label` VALUES (13, '宵夜', 3, 3);
INSERT INTO `nx_label` VALUES (14, '高蛋白', 1, 2);
INSERT INTO `nx_label` VALUES (15, '维生素', 2, 2);
INSERT INTO `nx_label` VALUES (16, '高热量', 3, 2);
INSERT INTO `nx_label` VALUES (17, '塑形', 4, 5);
INSERT INTO `nx_label` VALUES (18, '长个子', 5, 5);
COMMIT;

-- ----------------------------
-- Table structure for nx_label_type
-- ----------------------------
DROP TABLE IF EXISTS `nx_label_type`;
CREATE TABLE `nx_label_type` (
  `nx_label_type_id` int(20) NOT NULL AUTO_INCREMENT,
  `nx_label_type_name` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_label_amount` int(20) DEFAULT NULL,
  `nx_label_type_sort` int(10) DEFAULT NULL,
  PRIMARY KEY (`nx_label_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_label_type
-- ----------------------------
BEGIN;
INSERT INTO `nx_label_type` VALUES (1, '味道', NULL, 1);
INSERT INTO `nx_label_type` VALUES (2, '营养', NULL, 2);
INSERT INTO `nx_label_type` VALUES (3, '时间', NULL, 5);
INSERT INTO `nx_label_type` VALUES (5, '目的', NULL, 3);
COMMIT;

-- ----------------------------
-- Table structure for nx_order_template
-- ----------------------------
DROP TABLE IF EXISTS `nx_order_template`;
CREATE TABLE `nx_order_template` (
  `nx_order_template_id` int(20) NOT NULL AUTO_INCREMENT,
  `nx_OD_file_path` varchar(300) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_OD_name` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_OD_customer_user_id` int(20) DEFAULT NULL,
  `nx_OD_item_amount` int(6) DEFAULT NULL,
  PRIMARY KEY (`nx_order_template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_order_template
-- ----------------------------
BEGIN;
INSERT INTO `nx_order_template` VALUES (1, 'uploadImage/jia.jpg', '家庭', 1, 0);
INSERT INTO `nx_order_template` VALUES (2, 'uploadImage/pengyou.jpg', '朋友', 1, 0);
INSERT INTO `nx_order_template` VALUES (3, 'uploadImage/wx87baf9dcf935518a.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.b5Oq18tooORK153295726607118a6686f1da322cdfb2.jpg', '健身', 76, 2);
INSERT INTO `nx_order_template` VALUES (4, 'uploadImage/tmp_d699a76d4e0ffd27171a574ae1bf947e.jpg', '维生素', 94, 0);
INSERT INTO `nx_order_template` VALUES (5, 'uploadImage/wx87baf9dcf935518a.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.z04ThuxEOBe374a54b647239227c46f0d1cf6f25fa05.jpg', 'd', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for nx_order_template_item
-- ----------------------------
DROP TABLE IF EXISTS `nx_order_template_item`;
CREATE TABLE `nx_order_template_item` (
  `nx_OT_item_id` int(20) NOT NULL AUTO_INCREMENT,
  `nx_OT_dis_goods_id` int(20) DEFAULT NULL,
  `nx_OT_amount` float(4,1) DEFAULT NULL,
  `nx_OT_order_template_id` int(20) DEFAULT NULL,
  `nx_OT_customer_user_id` int(20) DEFAULT NULL,
  `nx_OT_dis_goods_color` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  PRIMARY KEY (`nx_OT_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_order_template_item
-- ----------------------------
BEGIN;
INSERT INTO `nx_order_template_item` VALUES (1, 285, NULL, 3, 76, '#20afb8');
INSERT INTO `nx_order_template_item` VALUES (2, 73, NULL, 3, 76, '#20afb8');
INSERT INTO `nx_order_template_item` VALUES (3, 76, NULL, 3, 76, '#3cc36e');
INSERT INTO `nx_order_template_item` VALUES (4, 77, NULL, 3, 76, '#3cc36e');
COMMIT;

-- ----------------------------
-- Table structure for nx_orders
-- ----------------------------
DROP TABLE IF EXISTS `nx_orders`;
CREATE TABLE `nx_orders` (
  `nx_orders_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `nx_orders_distributer_id` int(20) DEFAULT NULL COMMENT '批发商id',
  `nx_orders_community_id` int(20) DEFAULT NULL COMMENT '订单社区id',
  `nx_orders_customer_id` int(20) DEFAULT NULL COMMENT '订单客户id',
  `nx_orders_user_id` int(20) DEFAULT NULL COMMENT '订单用户id',
  `nx_orders_date` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订单日期',
  `nx_orders_status` tinyint(2) DEFAULT NULL COMMENT '订单状态',
  `nx_orders_service` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订单送达时间',
  `nx_orders_amount` float(10,0) DEFAULT NULL COMMENT '订单总金额',
  `nx_orders_service_date` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订单送到日期',
  `nx_orders_service_time` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订单送到时间',
  `nx_orders_weigh_user_id` int(20) DEFAULT NULL COMMENT '订单称重用户id',
  `nx_orders_delivery_user_id` int(20) DEFAULT NULL COMMENT '订单配送员工id',
  `nx_orders_sub_amount` int(10) DEFAULT NULL COMMENT '订单子商品数量',
  `nx_orders_sub_finished` int(10) DEFAULT NULL COMMENT '订单子商品完成数量',
  `nx_orders_weigh_number` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订单称重订单号',
  `nx_orders_payment_status` tinyint(2) DEFAULT NULL COMMENT '订单支付状态',
  `nx_orders_payment_send_time` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订单支付发送时间',
  `nx_orders_payment_time` varchar(0) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订单支付时间',
  `nx_orders_type` tinyint(2) DEFAULT NULL COMMENT '订单类型 0先付款1后付款',
  PRIMARY KEY (`nx_orders_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Table structure for nx_orders_sub
-- ----------------------------
DROP TABLE IF EXISTS `nx_orders_sub`;
CREATE TABLE `nx_orders_sub` (
  `nx_orders_sub_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '子订单id',
  `nx_OS_orders_id` int(11) DEFAULT NULL COMMENT '订单id',
  `nx_OS_nx_goods_id` int(20) DEFAULT NULL COMMENT '子订单nx商品id',
  `nx_OS_community_goods_id` int(20) DEFAULT NULL COMMENT '子订单社区商品id',
  `nx_OS_community_goods_father_id` int(20) DEFAULT NULL COMMENT '子订单商品父id',
  `nx_OS_quantity` float(10,1) DEFAULT NULL COMMENT '子订单申请数量',
  `nx_OS_standard` varchar(4) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '子订单申请规格',
  `nx_OS_price` float(10,1) DEFAULT NULL COMMENT '子订单申请商品单价',
  `nx_OS_remark` varchar(200) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '子订单申请备注',
  `nx_OS_weight` float(10,1) DEFAULT NULL COMMENT '子订单申请商品称重',
  `nx_OS_subtotal` float(10,1) DEFAULT NULL COMMENT '子订单申请商品小计',
  `nx_OS_status` tinyint(2) DEFAULT NULL COMMENT '子订单申请商品状态',
  `nx_OS_weigh_user_id` int(20) DEFAULT NULL COMMENT '子订单商品称重用户id',
  `nx_OS_account_user_id` int(20) DEFAULT NULL COMMENT '子订单商品输入单价用户id',
  `nx_OS_purchase_user_id` int(20) DEFAULT NULL COMMENT '子商品采购元id',
  `nx_OS_distributer_id` int(20) DEFAULT NULL COMMENT '子订单批发商id',
  `nx_OS_buy_status` tinyint(2) DEFAULT NULL COMMENT '子订单商品进货状态',
  `nx_OS_order_user_id` int(20) DEFAULT NULL COMMENT '子订单订货用户id',
  `nx_OS_sub_weight` float(4,1) DEFAULT NULL COMMENT '子订单重量',
  `nx_OS_sub_supplier_id` int(20) DEFAULT NULL COMMENT '子订单商品供货商id',
  `nx_OS_community_id` int(20) DEFAULT NULL COMMENT '子订单社区id',
  `nx_Os_goods_type` tinyint(2) DEFAULT NULL COMMENT '子订单社区商品类型',
  PRIMARY KEY (`nx_orders_sub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Table structure for nx_promote
-- ----------------------------
DROP TABLE IF EXISTS `nx_promote`;
CREATE TABLE `nx_promote` (
  `nx_promote_id` int(20) NOT NULL AUTO_INCREMENT,
  `nx_promote_cg_id` int(20) DEFAULT NULL,
  `nx_orignal_price` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_promote_price` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_promote_standard` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_promote_weight` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_promote_expired` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_promote_storage` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_promote_words` varchar(1000) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_promote_recommand_goods` varchar(1000) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_promote_file_path` varchar(200) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_promote_community_id` int(20) DEFAULT NULL,
  `nx_promote_cg_father_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`nx_promote_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Table structure for nx_purchase_standard
-- ----------------------------
DROP TABLE IF EXISTS `nx_purchase_standard`;
CREATE TABLE `nx_purchase_standard` (
  `nx_purchase_standard_id` int(20) NOT NULL,
  `nx_PS_name` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_PS_nx_goods_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`nx_purchase_standard_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Table structure for nx_route
-- ----------------------------
DROP TABLE IF EXISTS `nx_route`;
CREATE TABLE `nx_route` (
  `nx_route_id` int(20) NOT NULL COMMENT '线路id',
  `nx_route_name` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '线路名称',
  PRIMARY KEY (`nx_route_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_route
-- ----------------------------
BEGIN;
INSERT INTO `nx_route` VALUES (1, '燕郊南线');
INSERT INTO `nx_route` VALUES (2, '测试线');
COMMIT;

-- ----------------------------
-- Table structure for nx_standard
-- ----------------------------
DROP TABLE IF EXISTS `nx_standard`;
CREATE TABLE `nx_standard` (
  `nx_standard_id` int(20) NOT NULL AUTO_INCREMENT,
  `nx_standard_name` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_s_goods_id` int(20) DEFAULT NULL,
  `nx_standard_file_path` varchar(200) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_standard_scale` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_standard_error` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_standard_sort` int(10) DEFAULT NULL,
  PRIMARY KEY (`nx_standard_id`)
) ENGINE=InnoDB AUTO_INCREMENT=392 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_standard
-- ----------------------------
BEGIN;
INSERT INTO `nx_standard` VALUES (1, '根', 45096, 'uploadImage/wxbc686226ccc443f1.o6zAJsw3k3_I4jY0lYtqK1TqmM_c.0r30bxBpTNcFbabac3529edec5e2c86ba0c548932af5.jpg', '1.3', '0', NULL);
INSERT INTO `nx_standard` VALUES (158, '个', 45559, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (159, '箱', 45506, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (160, '个', 45126, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (161, '个', 45580, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (162, '根', 45114, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (164, '把', 45176, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (165, '捆', 45174, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (166, '把', 45198, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (167, '颗', 45188, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (168, '把', 45189, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (169, '把', 45191, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (170, '个', 45563, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (171, '颗', 45182, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (172, '个', 45106, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (173, '根', 45094, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (174, '个', 45139, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (180, '个', 45217, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (181, '个', 45247, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (182, '个', 45258, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (183, '个', 45239, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (184, '个', 45284, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (185, '个', 45285, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (186, '个', 45286, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (187, '个', 45237, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (188, '个', 45236, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (189, '个', 45226, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (190, '个', 45225, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (191, '个', 45272, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (192, '个', 45265, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (193, '个', 45288, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (194, '个', 45243, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (195, '个', 45240, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (196, '个', 45287, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (197, '个', 45241, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (198, '个', 45252, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (199, '个', 45301, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (200, '个', 45302, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (201, '个', 45303, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (202, '个', 45305, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (203, '个', 45227, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (204, '个', 45253, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (205, '个', 45262, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (206, '个', 45263, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (207, '个', 45224, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (208, '个', 45251, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (209, '个', 45238, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (210, '个', 45230, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (211, '个', 45289, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (212, '个', 45290, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (213, '个', 45291, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (214, '个', 45248, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (215, '个', 45300, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (216, '个', 45299, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (217, '个', 45261, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (218, '个', 45274, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (219, '个', 45275, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (220, '个', 45276, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (221, '个', 45277, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (222, '个', 45279, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (223, '个', 45280, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (224, '个', 45282, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (225, '个', 45283, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (226, '个', 45278, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (227, '个', 45250, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (228, '个', 45249, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (229, '个', 45264, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (230, '个', 45235, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (231, '个', 17600028, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (232, '个', 45234, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (233, '个', 45259, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (234, '个', 45255, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (235, '个', 45256, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (236, '条', 45325, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (237, '条', 45351, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (238, '条', 45341, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (239, '条', 45343, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (240, '条', 45353, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (241, '条', 45364, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (242, '条', 45357, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (243, '条', 45339, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (244, '条', 45338, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (245, '条', 45337, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (246, '条', 45356, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (247, '条', 45328, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (248, '条', 45336, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (249, '条', 45334, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (250, '条', 45322, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (251, '条', 45352, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (252, '条', 45346, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (253, '条', 45348, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (254, '条', 45333, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (255, '条', 45342, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (256, '条', 45345, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (257, '条', 45347, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (258, '个', 45379, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (259, '个', 45378, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (260, '个', 45376, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (261, '个', 45374, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (262, '个', 45372, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (263, '张', 31117, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (264, '块', 31118, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (265, '个', 17600008, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (266, '块', 17600010, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (267, '根', 17600026, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (269, '个', 45097, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (270, '个', 45104, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (271, '个', 45590, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (272, '个', 45107, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (273, '个', 45558, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (274, '根', 45101, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (275, '节', 45103, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (276, '根', 45103, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (277, '个', 44678, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (278, '根', 17600014, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (279, '根', 45100, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (280, '个', 45095, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (281, '个', 45093, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (282, '把', 45109, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (283, '个', 45159, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (284, '根', 45135, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (285, '根', 45163, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (286, '个', 45138, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (287, '根', 45155, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (288, '根', 45132, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (289, '根', 45592, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (290, '颗', 45141, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (291, '个', 45158, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (292, '根', 45151, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (293, '个', 45153, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (294, '根', 45152, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (295, '颗', 45142, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (296, '根', 45140, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (297, '个', 45130, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (298, '颗', 45599, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (299, '个', 45144, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (300, '根', 45156, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (301, '根', 45161, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (302, '个', 45136, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (303, '捆', 45168, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (304, '颗', 45165, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (305, '把', 45190, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (306, '颗', 45194, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (307, '颗', 45593, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (308, '颗', 45600, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (309, '颗', 45187, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (310, '颗', 45185, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (311, '捆', 45173, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (312, '盒', 45598, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (313, '个', 45170, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (314, '个', 17600015, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (315, '个', 45112, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (316, '个', 45583, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (317, '个', 45566, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (318, '捆', 45121, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (319, '把', 45119, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (320, '个', 45113, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (321, '根', 45229, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (322, '根', 17600030, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (323, '根', 45413, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (324, '个', 45407, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (325, '根', 45428, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (326, '根', 45427, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (327, '个', 45418, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (328, '个', 45416, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (329, '个', 45425, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (330, '个', 45424, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (331, '个', 45414, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (332, '根', 45408, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (333, '个', 45423, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (334, '个', 45421, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (335, '个', 45409, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (336, '个', 45417, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (337, '个', 45415, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (338, '个', 45449, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (339, '个', 45441, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (340, '根', 45445, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (341, '个', 45444, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (342, '个', 45450, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (343, '个', 45443, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (344, '个', 45440, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (345, '个', 45455, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (346, '个', 45454, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (347, '个', 45468, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (348, '个', 45466, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (349, '根', 45464, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (350, '个', 45471, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (351, '个', 45467, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (352, '个', 45465, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (353, '根', 45469, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (354, '根', 45463, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (355, '个', 45456, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (356, '只', 45505, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (357, '只', 45500, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (358, '个', 45482, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (359, '只', 45502, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (360, '只', 45501, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (361, '个', 45480, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (362, '个', 45487, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (363, '个', 45488, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (365, '个', 45492, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (366, '个', 45478, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (367, '个', 45479, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (368, '个', 45486, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (369, '个', 45490, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (370, '个', 45481, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (371, '个', 45489, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (372, '个', 45477, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (373, '个', 45484, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (374, '只', 45476, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (375, '只', 45498, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (376, '只', 45473, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (377, '只', 45499, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (378, '个', 45494, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (379, '个', 45495, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (380, '个', 45497, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (381, '个', 45496, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (382, '个', 45475, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (383, '个', 45511, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (384, '个', 45506, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (385, '个', 45510, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (386, '个', 45508, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (387, '个', 45509, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (388, '个', 45514, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (389, '袋', 17600078, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (390, '袋', 17600077, NULL, NULL, NULL, NULL);
INSERT INTO `nx_standard` VALUES (391, '个', 17600065, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for nx_supplier
-- ----------------------------
DROP TABLE IF EXISTS `nx_supplier`;
CREATE TABLE `nx_supplier` (
  `nx_supplier_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '供货商id',
  `nx_supplier_name` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '供货商名称',
  `nx_supplier_father_goods_id` int(20) DEFAULT NULL COMMENT '供货商商品类别id',
  `nx_supplier_payment_type` tinyint(2) DEFAULT NULL COMMENT '供货商结算类别1现金，2记账',
  `nx_supplier_date` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '供货商加入时间',
  PRIMARY KEY (`nx_supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_supplier
-- ----------------------------
BEGIN;
INSERT INTO `nx_supplier` VALUES (1, '蔬菜李国树', NULL, NULL, NULL);
INSERT INTO `nx_supplier` VALUES (2, '牛肉张', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for nx_wx_orders
-- ----------------------------
DROP TABLE IF EXISTS `nx_wx_orders`;
CREATE TABLE `nx_wx_orders` (
  `nx_wx_orders_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '微信支付订单id',
  `nx_wx_orders_out_trade_no` varchar(32) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '随机字符串32位',
  `nx_wx_orders_body` varchar(128) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订单主体',
  `nx_wx_orders_detail` varchar(6000) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订单详细',
  `nx_wx_orders_attach` varchar(127) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '附加数据，如“深圳分店”',
  `nx_wx_orders_total_fee` int(88) DEFAULT NULL COMMENT '支付金额单位“分”',
  `nx_wx_orders_spbill_create_ip` varchar(64) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '支付api的机器ip',
  PRIMARY KEY (`nx_wx_orders_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) DEFAULT NULL COMMENT 'key',
  `value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', NULL, NULL, 0, 'fa fa-cog', 9);
INSERT INTO `sys_menu` VALUES (2, 1, '员工列表', 'sys/user.html', NULL, 1, 'fa fa-user', 1);
INSERT INTO `sys_menu` VALUES (3, 1, '角色管理', 'sys/role.html', NULL, 1, 'fa fa-user-secret', 2);
INSERT INTO `sys_menu` VALUES (4, 1, '菜单管理', 'sys/menu.html', 'sys:menu:list', 1, 'fa fa-th-list', 3);
INSERT INTO `sys_menu` VALUES (5, 1, 'SQL监控', 'druid/sql.html', NULL, 1, 'fa fa-bug', 4);
INSERT INTO `sys_menu` VALUES (6, 1, '定时任务', 'sys/schedule.html', NULL, 1, 'fa fa-tasks', 5);
INSERT INTO `sys_menu` VALUES (7, 6, '查看', NULL, 'sys:schedule:list,sys:schedule:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (8, 6, '新增', NULL, 'sys:schedule:save', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (9, 6, '修改', NULL, 'sys:schedule:update', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (10, 6, '删除', NULL, 'sys:schedule:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (11, 6, '暂停', NULL, 'sys:schedule:pause', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (12, 6, '恢复', NULL, 'sys:schedule:resume', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (13, 6, '立即执行', NULL, 'sys:schedule:run', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (14, 6, '日志列表', NULL, 'sys:schedule:log', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (15, 2, '查看', NULL, 'sys:user:list,sys:user:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (16, 2, '新增', NULL, 'sys:user:save,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (17, 2, '修改', NULL, 'sys:user:update,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (18, 2, '删除', NULL, 'sys:user:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (19, 3, '查看', NULL, 'sys:role:list,sys:role:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20, 3, '新增', NULL, 'sys:role:save,sys:menu:perms', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (21, 3, '修改', NULL, 'sys:role:update,sys:menu:perms', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (22, 3, '删除', NULL, 'sys:role:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (23, 4, '查看', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (24, 4, '新增', NULL, 'sys:menu:save,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (25, 4, '修改', NULL, 'sys:menu:update,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (26, 4, '删除', NULL, 'sys:menu:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (27, 1, '参数管理', 'sys/config.html', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', 1, 'fa fa-sun-o', 6);
INSERT INTO `sys_menu` VALUES (28, 1, '代码生成器', 'sys/generator.html', 'sys:generator:list,sys:generator:code', 1, 'fa fa-rocket', 7);
INSERT INTO `sys_menu` VALUES (29, -1, '今日出货', NULL, NULL, 0, 'fa fa-cog', 3);
INSERT INTO `sys_menu` VALUES (30, 29, '订货申请', 'orderApplication', 'ckapplys:list, ckapplys:info, ckapplys:save, ckapplys:update, ckapplys:delete', 1, NULL, 1);
INSERT INTO `sys_menu` VALUES (31, 29, '出货单', 'deliveryOrder', 'ckapplys:list, ckapplys:info, ckapplys:save, ckapplys:update, ckapplys:delete', 1, NULL, 3);
INSERT INTO `sys_menu` VALUES (32, 29, '送货', 'so_deliver', NULL, 1, NULL, 3);
INSERT INTO `sys_menu` VALUES (38, 37, '店铺销售', '/point', NULL, 1, NULL, 2);
INSERT INTO `sys_menu` VALUES (39, 37, '产品销售', '/sellProducts', NULL, 1, NULL, 30);
INSERT INTO `sys_menu` VALUES (40, 0, '系统数据', NULL, NULL, 0, 'fa fa-cog', 7);
INSERT INTO `sys_menu` VALUES (41, 40, '员工', 'ckUser', 'ckuser:list, ckuser:info, ckuser:save, ckuser:update, ckuser:delete', 1, 'fa fa-user', 7);
INSERT INTO `sys_menu` VALUES (42, 40, '硬件设备', '/printer', NULL, 1, 'fa fa-user', 8);
INSERT INTO `sys_menu` VALUES (51, 37, '集团销售', '/groupSales', NULL, 1, 'fa fa-user', 0);
INSERT INTO `sys_menu` VALUES (52, 0, '次日达社区', NULL, NULL, 0, 'fa fa-cog', 0);
INSERT INTO `sys_menu` VALUES (53, 0, '供货商', NULL, NULL, 0, 'fa fa-cog', 6);
INSERT INTO `sys_menu` VALUES (56, 52, '商品管理', 'communityGoodsData', NULL, 1, 'fa fa-user', 2);
INSERT INTO `sys_menu` VALUES (57, 52, '订单', 'costControl', NULL, 1, 'fa fa-user', 2);
INSERT INTO `sys_menu` VALUES (62, 53, '供应商品', 'supplier', 'cksupplier:list, cksupplier:info, cksupplier:save, cksupplier:update, cksupplier:delete', 1, 'fa fa-cog', 1);
INSERT INTO `sys_menu` VALUES (63, 40, '订单', 'storeList', 'ckstore:list, ckstore:info, ckstore:save, ckstore:update, ckstore:delete', 1, 'fa fa-cog', 3);
INSERT INTO `sys_menu` VALUES (64, 40, '送货路线', 'ckLine', 'ckline:list, ckline:info, ckline:save, ckline:update, ckline:delete', 1, 'fa fa-cog', 6);
INSERT INTO `sys_menu` VALUES (65, 40, '商品', 'goods', 'ckgoods:list, ckgoods:info, ckgoods:save, ckgoods:update, ckgoods:delete', 1, 'fa fa-cog', 1);
INSERT INTO `sys_menu` VALUES (66, 40, '部门', 'ckDep', 'ckdep:list, ckdep:info, ckdep:save, ckdep:update, ckdep:delete', 1, 'fa fa-user', 5);
INSERT INTO `sys_menu` VALUES (67, 65, 'btn1', NULL, 'ckgoods:save', 2, '', 0);
INSERT INTO `sys_menu` VALUES (69, 0, '今日订单', NULL, '', 0, 'fa fa-cog', 1);
INSERT INTO `sys_menu` VALUES (71, 69, '库存商品', 'inventory', 'ckinbill:list, ckinbill:info, ckinbill:save, ckinbill:update, ckinbill:delete', 1, 'fa fa-user', 2);
INSERT INTO `sys_menu` VALUES (72, -1, '采购分析', 'anlysise', NULL, 1, 'fa fa-user', 4);
INSERT INTO `sys_menu` VALUES (73, 52, '销售分析', 'ckStore', NULL, 1, 'fa fa-user', 3);
INSERT INTO `sys_menu` VALUES (74, 69, '加工商品', 'handling', 'ckinbill:list, ckinbill:info, ckinbill:save, ckinbill:update, ckinbill:delete', 1, 'fa fa-user', 3);
INSERT INTO `sys_menu` VALUES (75, 69, '日采商品', 'daily', 'ckinbill:list, ckinbill:info, ckinbill:save, ckinbill:update, ckinbill:delete', 1, 'fa fa-user', 2);
INSERT INTO `sys_menu` VALUES (76, 29, '拣货单录入', 'enterOutStock', 'ckstockrecord:list, ckstockrecord:info, ckstockrecord:save, ckstockrecord:update, ckapplys:delete', 1, NULL, 2);
INSERT INTO `sys_menu` VALUES (77, -1, '出货', 'outGoods', NULL, 1, 'fa fa-user', 1);
INSERT INTO `sys_menu` VALUES (78, 69, '订货', 'todayOrder', NULL, 1, 'fa fa-user', 0);
INSERT INTO `sys_menu` VALUES (79, 53, '未付货款', 'supplier', 'cksupplier:list, cksupplier:info, cksupplier:save, cksupplier:update, cksupplier:delete', 1, 'fa fa-cog', 1);
INSERT INTO `sys_menu` VALUES (80, 53, '已付货款', 'supplier', 'cksupplier:list, cksupplier:info, cksupplier:save, cksupplier:update, cksupplier:delete', 1, 'fa fa-cog', 1);
INSERT INTO `sys_menu` VALUES (81, 52, '配送', 'communityDelivery', NULL, 1, 'fa fa-user', 3);
INSERT INTO `sys_menu` VALUES (82, 69, '供货商商品', 'outGoods', 'ckinbill:list, ckinbill:info, ckinbill:save, ckinbill:update, ckinbill:delete', 1, 'fa fa-user', 1);
INSERT INTO `sys_menu` VALUES (83, 52, '库存商品', 'communityStock', NULL, 1, 'fa fa-user', 2);
INSERT INTO `sys_menu` VALUES (84, 0, '超市社区', NULL, NULL, 0, 'fa fa-cog', 0);
INSERT INTO `sys_menu` VALUES (85, 84, '商品管理', 'communityGoodsData', NULL, 1, 'fa fa-user', 2);
INSERT INTO `sys_menu` VALUES (86, 84, '订单', 'costControl', NULL, 1, 'fa fa-user', 2);
INSERT INTO `sys_menu` VALUES (87, 84, '销售分析', 'ckStore', NULL, 1, 'fa fa-user', 3);
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '司机', '', '2019-09-20 21:12:18');
INSERT INTO `sys_role` VALUES (2, '售货员', NULL, '2019-09-20 21:13:00');
INSERT INTO `sys_role` VALUES (3, '分拣员', NULL, '2019-09-20 21:13:58');
INSERT INTO `sys_role` VALUES (4, '文员', NULL, '2019-09-20 21:15:08');
INSERT INTO `sys_role` VALUES (5, '采购员', NULL, '2019-09-20 21:15:21');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES (1, 1, 29);
INSERT INTO `sys_role_menu` VALUES (2, 1, 32);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', NULL, NULL, 1, '2020-02-10 18:48:37');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES (1, 2, 1);
COMMIT;

-- ----------------------------
-- Table structure for zznx_department_nx_goods
-- ----------------------------
DROP TABLE IF EXISTS `zznx_department_nx_goods`;
CREATE TABLE `zznx_department_nx_goods` (
  `nx_department_nx_goods_id` int(20) NOT NULL AUTO_INCREMENT,
  `nx_DNG_department_father_id` int(20) DEFAULT NULL,
  `nx_DNG_department_id` int(20) DEFAULT NULL,
  `nx_DNG_nx_goods_id` int(20) DEFAULT NULL,
  `nx_DNG_nx_goods_name` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DNG_nx_goods_pinyin` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DNG_nx_goods_py` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DNG_nx_goods_sort` int(20) DEFAULT NULL,
  `nx_DNG_nx_goods_standardname` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DNG_nx_goods_detail` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DNG_alarm_rate` int(2) DEFAULT NULL,
  PRIMARY KEY (`nx_department_nx_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of zznx_department_nx_goods
-- ----------------------------
BEGIN;
INSERT INTO `zznx_department_nx_goods` VALUES (9, 0, 7, 45097, '卞萝卜', 'bianluobu', 'blb', NULL, '斤', '', NULL);
INSERT INTO `zznx_department_nx_goods` VALUES (10, 0, 7, 45105, '红薯', 'hongshu', 'hs', NULL, '斤', '', NULL);
INSERT INTO `zznx_department_nx_goods` VALUES (11, 0, 7, 45103, '藕', 'ou', 'o', NULL, '斤', '', NULL);
INSERT INTO `zznx_department_nx_goods` VALUES (12, 0, 7, 45092, '土豆', 'tudou', 'td', NULL, '斤', '大个头', NULL);
INSERT INTO `zznx_department_nx_goods` VALUES (13, 0, 7, 45095, '心里美', 'xinlimei', 'xlm', NULL, '斤', '', NULL);
INSERT INTO `zznx_department_nx_goods` VALUES (14, 0, 7, 45114, '葱', 'cong', 'c', NULL, '斤', '', NULL);
INSERT INTO `zznx_department_nx_goods` VALUES (15, 0, 7, 45126, '彩椒', 'caijiao', 'cj', NULL, '斤', '红,黄', NULL);
INSERT INTO `zznx_department_nx_goods` VALUES (16, 0, 7, 45112, '黄葱头', 'huangcongtou', 'hct', NULL, '斤', '', NULL);
INSERT INTO `zznx_department_nx_goods` VALUES (17, 0, 7, 45116, '姜', 'jiang', 'j', NULL, '斤', '', NULL);
INSERT INTO `zznx_department_nx_goods` VALUES (18, 0, 7, 45124, '杭椒', 'hangjiao', 'hj', NULL, '斤', '', NULL);
INSERT INTO `zznx_department_nx_goods` VALUES (19, 0, 7, 45115, '小葱', 'xiaocong', 'xc', NULL, '斤', '', NULL);
INSERT INTO `zznx_department_nx_goods` VALUES (20, 0, 7, 45128, '香葱', 'xiangcong', 'xc', NULL, '斤', '水菜', NULL);
INSERT INTO `zznx_department_nx_goods` VALUES (21, 0, 7, 45125, '小米椒', 'xiaomijiao', 'xmj', NULL, '斤', '', NULL);
INSERT INTO `zznx_department_nx_goods` VALUES (22, 0, 7, 45283, '白糖罐甜瓜', 'baitangguantiangua', 'btgtg', NULL, '斤', '', NULL);
INSERT INTO `zznx_department_nx_goods` VALUES (23, 0, 7, 45217, '百香果', 'baixiangguo', 'bxg', NULL, '斤', '', NULL);
INSERT INTO `zznx_department_nx_goods` VALUES (24, 0, 7, 45247, '丑橘', 'chouju', 'cj', NULL, '斤', '', NULL);
INSERT INTO `zznx_department_nx_goods` VALUES (25, 0, 7, 45298, '贵妃青葡萄', 'guifeiqingputao', 'gfqpt', NULL, '斤', '', NULL);
INSERT INTO `zznx_department_nx_goods` VALUES (26, 0, 7, 45290, '国光苹果', 'guoguangpingguo', 'ggpg', NULL, '斤', '', NULL);
INSERT INTO `zznx_department_nx_goods` VALUES (27, 0, 7, 45110, '尖椒', 'jianjiao', 'jj', NULL, '斤', '四川,广东', NULL);
COMMIT;

-- ----------------------------
-- Table structure for zzz_nx_supplier
-- ----------------------------
DROP TABLE IF EXISTS `zzz_nx_supplier`;
CREATE TABLE `zzz_nx_supplier` (
  `nx_supplier_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '供货商id',
  `nx_supplier_name` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '供货商名称',
  `nx_supplier_father_goods_id` int(20) DEFAULT NULL COMMENT '供货商商品类别id',
  `nx_supplier_payment_type` tinyint(2) DEFAULT NULL COMMENT '供货商结算类别1现金，2记账',
  `nx_supplier_date` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '供货商加入时间',
  PRIMARY KEY (`nx_supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of zzz_nx_supplier
-- ----------------------------
BEGIN;
INSERT INTO `zzz_nx_supplier` VALUES (1, '蔬菜李国树', NULL, NULL, NULL);
INSERT INTO `zzz_nx_supplier` VALUES (2, '牛肉张', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for zzznx_department_goods
-- ----------------------------
DROP TABLE IF EXISTS `zzznx_department_goods`;
CREATE TABLE `zzznx_department_goods` (
  `nx_department_goods_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '部门商品id',
  `nx_dg_department_id` int(20) DEFAULT NULL COMMENT '部门id',
  `nx_dg_department_father_id` int(20) DEFAULT NULL COMMENT '父级部门id',
  `nx_dg_nx_goods_id` int(10) DEFAULT NULL COMMENT 'nx商品id',
  `nx_dg_nx_goods_father_id` int(20) DEFAULT NULL COMMENT 'nx商品父类id',
  `nx_dg_goods_is_weight` tinyint(2) DEFAULT NULL COMMENT '是否称重',
  `nx_dg_goods_status` tinyint(2) DEFAULT NULL COMMENT '商品状态',
  `nx_dg_goods_price` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '部门商品价格',
  `nx_dg_price_date` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '部门商品价格更新日期',
  `nx_dg_distribute_id` int(20) DEFAULT NULL COMMENT '批发商id',
  `nx_dg_order_quantity` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_dg_order_standard` varchar(4) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_dg_order_time` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_dg_order_only_date` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_dg_order_only_time` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  PRIMARY KEY (`nx_department_goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Table structure for zzznx_department_independent_order
-- ----------------------------
DROP TABLE IF EXISTS `zzznx_department_independent_order`;
CREATE TABLE `zzznx_department_independent_order` (
  `nx_dep_independent_order_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '部门订自采购订单id',
  `nx_DIO_department_id` int(20) DEFAULT NULL COMMENT '订货部门id',
  `nx_DIO_department_father_id` int(20) DEFAULT NULL COMMENT '订货父级部门id',
  `nx_DIO_apply_user_id` int(20) DEFAULT NULL COMMENT '订货用户id',
  `nx_DIO_apply_time` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订货时间',
  `nx_DIO_apply_date` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订货日期',
  `nx_DIO_apply_status` tinyint(2) DEFAULT NULL COMMENT '订单状态',
  `nx_DIO_apply_quantity` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订货数量',
  `nx_DIO_apply_standard` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订货规格',
  `nx_DIO_apply_remark` varchar(200) COLLATE utf16_czech_ci DEFAULT NULL COMMENT '订货备注',
  `nx_DIO_independent_goods_id` int(20) DEFAULT NULL,
  `nx_DIO_operation_time` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL,
  PRIMARY KEY (`nx_dep_independent_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Table structure for zzznx_department_nx_goods
-- ----------------------------
DROP TABLE IF EXISTS `zzznx_department_nx_goods`;
CREATE TABLE `zzznx_department_nx_goods` (
  `nx_department_nx_goods_id` int(20) NOT NULL AUTO_INCREMENT,
  `nx_DNG_department_father_id` int(20) DEFAULT NULL,
  `nx_DNG_department_id` int(20) DEFAULT NULL,
  `nx_DNG_nx_goods_id` int(20) DEFAULT NULL,
  `nx_DNG_nx_goods_name` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DNG_nx_goods_pinyin` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DNG_nx_goods_py` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DNG_nx_goods_sort` int(20) DEFAULT NULL,
  `nx_DNG_nx_goods_standardname` varchar(10) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DNG_nx_goods_detail` varchar(20) COLLATE utf16_czech_ci DEFAULT NULL,
  `nx_DNG_alarm_rate` int(2) DEFAULT NULL,
  PRIMARY KEY (`nx_department_nx_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

SET FOREIGN_KEY_CHECKS = 1;
