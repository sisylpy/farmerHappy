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

 Date: 18/11/2020 03:32:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_department_dis_goods
-- ----------------------------
BEGIN;
INSERT INTO `nx_department_dis_goods` VALUES (1, 28, 28, 51, 5, '菠菜', 'bocai', 'bc', '斤', NULL, NULL, NULL, '1.5', '2020-11-15');
INSERT INTO `nx_department_dis_goods` VALUES (2, 28, 28, 90, 5, '油菜', 'youcai', 'yc', '斤', NULL, NULL, NULL, '1.2', '2020-11-16');
INSERT INTO `nx_department_dis_goods` VALUES (3, 28, 28, 91, 5, '油麦菜', 'youmaicai', 'ymc', '斤', NULL, NULL, NULL, '2.0', '2020-11-16');
INSERT INTO `nx_department_dis_goods` VALUES (4, 28, 28, 129, 7, '金针菇', 'jinzhengu', 'jzg', '包', NULL, NULL, NULL, '12.0', '2020-11-15');
INSERT INTO `nx_department_dis_goods` VALUES (5, 28, 28, 185, 12, '豆皮', 'doupi', 'dp', '斤', NULL, NULL, NULL, '4.2', '2020-11-16');
INSERT INTO `nx_department_dis_goods` VALUES (6, 28, 28, 225, 16, '馒头', 'mantou', 'mt', '个', NULL, NULL, NULL, '0.5', '2020-11-15');
INSERT INTO `nx_department_dis_goods` VALUES (7, 28, 28, 89, 5, '圆白菜', 'yuanbaicai', 'ybc', '斤', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (8, 28, 28, 58, 5, '甘蓝', 'ganlan', 'gl', '斤', NULL, NULL, NULL, '1.5', '2020-11-16');
INSERT INTO `nx_department_dis_goods` VALUES (9, 28, 28, 114, 6, '蒜米', 'suanmi', 'sm', '斤', NULL, NULL, NULL, '3.5', '2020-11-16');
INSERT INTO `nx_department_dis_goods` VALUES (10, 28, 28, 98, 6, '大葱', 'dacong', 'dc', '斤', NULL, NULL, NULL, '2.7', '2020-11-15');
INSERT INTO `nx_department_dis_goods` VALUES (11, 28, 28, 92, 5, '圆生菜', 'yuanshengcai', 'ysc', '斤', NULL, NULL, NULL, '2.2', '2020-11-15');
INSERT INTO `nx_department_dis_goods` VALUES (12, 28, 28, 27, 4, '黄瓜', 'huanggua', 'hg', '斤', NULL, NULL, NULL, '2.0', '2020-11-16');
INSERT INTO `nx_department_dis_goods` VALUES (13, 28, 28, 39, 4, '散菜花', 'sancaihua', 'sch', '斤', NULL, NULL, NULL, '2.0', '2020-11-15');
INSERT INTO `nx_department_dis_goods` VALUES (14, 29, 29, 187, 12, '绿豆芽', 'lüdouya', 'ldy', '斤', NULL, NULL, NULL, '132.0', '2020-11-15');
INSERT INTO `nx_department_dis_goods` VALUES (15, 26, 26, 1, 1, '白萝卜', 'bailuobu', 'blb', '斤', NULL, NULL, NULL, '2.2', '2020-11-15');
INSERT INTO `nx_department_dis_goods` VALUES (16, 28, 28, 43, 4, '西红柿', 'xihongshi', 'xhs', '斤', NULL, NULL, NULL, '2.5', '2020-11-16');
INSERT INTO `nx_department_dis_goods` VALUES (17, 28, 28, 111, 6, '青蒜', 'qingsuan', 'qs', '斤', NULL, NULL, NULL, '4.0', '2020-11-16');
INSERT INTO `nx_department_dis_goods` VALUES (18, 28, 28, 112, 6, '蒜', 'suan', 's', '斤', NULL, NULL, NULL, '4.0', '2020-11-16');
INSERT INTO `nx_department_dis_goods` VALUES (19, 28, 28, 121, 6, '紫葱头', 'zicongtou', 'zct', '斤', NULL, NULL, NULL, '1.5', '2020-11-16');
INSERT INTO `nx_department_dis_goods` VALUES (20, 28, 28, 237, 12, '黄豆芽', 'huangdouya', 'hdy', '斤', NULL, NULL, NULL, '1.7', '2020-11-16');
INSERT INTO `nx_department_dis_goods` VALUES (21, 28, 28, 81, 5, '娃娃菜', 'wawacai', 'wwc', '包', NULL, NULL, NULL, '2.5', '2020-11-16');
INSERT INTO `nx_department_dis_goods` VALUES (22, 28, 28, 85, 5, '香菜', 'xiangcai', 'xc', '斤', NULL, NULL, NULL, '2.8', '2020-11-16');
INSERT INTO `nx_department_dis_goods` VALUES (23, 28, 28, 77, 5, '芹菜', 'qincai', 'qc', '斤', NULL, NULL, NULL, '1.8', '2020-11-16');
INSERT INTO `nx_department_dis_goods` VALUES (24, 28, 28, 3, 1, '胡萝卜', 'huluobu', 'hlb', '斤', NULL, NULL, NULL, '1.4', '2020-11-16');
INSERT INTO `nx_department_dis_goods` VALUES (25, 28, 28, 105, 6, '尖椒', 'jianjiao', 'jj', '斤', NULL, NULL, NULL, '3.3', '2020-11-16');
INSERT INTO `nx_department_dis_goods` VALUES (26, 28, 28, 189, 12, '熏干', 'xungan', 'xg', '斤', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (27, 28, 28, 240, 12, '土豆粉', 'tudoufen', 'tdf', '袋', NULL, NULL, NULL, '1.2', '2020-11-16');
INSERT INTO `nx_department_dis_goods` VALUES (28, 28, 28, 241, 10, '香干', 'xianggan', 'xg', '斤', NULL, NULL, NULL, '3.5', '2020-11-16');
INSERT INTO `nx_department_dis_goods` VALUES (29, 29, 29, 228, 16, '烧饼', 'shaobing', 'sb', '个', NULL, NULL, NULL, '1.0', '2020-11-17');
INSERT INTO `nx_department_dis_goods` VALUES (30, 29, 29, 90, 5, '油菜', 'youcai', 'yc', '斤', NULL, NULL, NULL, '1.2', '2020-11-17');
INSERT INTO `nx_department_dis_goods` VALUES (31, 29, 29, 116, 6, '香葱', 'xiangcong', 'xc', '斤', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (32, 29, 29, 242, 16, '麻酱烧饼', 'majiangshaobing', 'mjsb', '个', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (33, 29, 29, 244, 16, '糖烧饼', 'tangshaobing', 'tsb', '个', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (34, 28, 28, 188, 12, '三河豆腐丝', 'sanhedoufusi', 'shdfs', '斤', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (35, 27, 27, 51, 5, '菠菜', 'bocai', 'bc', '斤', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (36, 27, 27, 85, 5, '香菜', 'xiangcai', 'xc', '斤', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (37, 27, 27, 91, 5, '油麦菜', 'youmaicai', 'ymc', '斤', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (38, 27, 27, 61, 5, '蒿子秆', 'haozigan', 'hzg', '斤', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (39, 27, 27, 129, 7, '金针菇', 'jinzhengu', 'jzg', '包', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `nx_department_dis_goods` VALUES (40, 27, 27, 125, 7, '海鲜菇', 'haixiangu', 'hxg', '袋', NULL, NULL, NULL, NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
