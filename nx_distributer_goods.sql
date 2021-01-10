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

 Date: 21/11/2020 19:37:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
  `nx_dg_goods_standard_weight` varchar(100) COLLATE utf16_czech_ci DEFAULT NULL,
  PRIMARY KEY (`nx_distributer_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=263 DEFAULT CHARSET=utf16 COLLATE=utf16_czech_ci;

-- ----------------------------
-- Records of nx_distributer_goods
-- ----------------------------
BEGIN;
INSERT INTO `nx_distributer_goods` VALUES (1, 1, 1, NULL, NULL, '白萝卜', '', '斤', 'bailuobu', 'blb', 45096, 'goodsImage/1.jpg', '111', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (2, 1, 1, NULL, NULL, '卞萝卜', '', '斤', 'bianluobu', 'blb', 45097, 'goodsImage/1.jpg', '111', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (3, 1, 1, NULL, NULL, '胡萝卜', '', '斤', 'huluobu', 'hlb', 45094, 'goodsImage/1.jpg', '111', 11, 1, 0, '', '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (4, 1, 1, NULL, NULL, '红薯', '普通', '斤', 'hongshu', 'hs', 45104, 'goodsImage/1.jpg', '111', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (5, 1, 1, NULL, NULL, '绿萝卜', NULL, '斤', 'lüluobu', 'llb', 45590, 'goodsImage/1.jpg', '111', 11, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (6, 1, 1, NULL, NULL, '凉薯', '', '斤', 'liangshu', 'ls', 45107, 'goodsImage/1.jpg', '111', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (7, 1, 1, NULL, NULL, '蜜薯', '', '斤', 'mishu', 'ms', 45558, 'goodsImage/1.jpg', '111', 11, 1, 0, '', '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (8, 1, 1, NULL, NULL, '麻山药', '', '斤', 'mashanyao', 'msy', 45101, 'goodsImage/1.jpg', '111', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (9, 1, 1, NULL, NULL, '藕', '', '斤', 'ou', 'o', 45103, 'goodsImage/1.jpg', '111', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (10, 1, 1, NULL, NULL, '土豆', '', '斤', 'tudou', 'td', 44678, 'goodsImage/1.jpg', '111', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (11, 1, 1, NULL, NULL, '新土豆', '', '斤', 'xintudou', 'xtd', 45093, 'goodsImage/1.jpg', '111', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (12, 1, 1, NULL, NULL, '心里美', '', '斤', 'xinlimei', 'xlm', 45095, 'goodsImage/1.jpg', '111', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (13, 1, 1, NULL, NULL, '莴笋', '', '斤', 'wosun', 'ws', 45100, 'goodsImage/1.jpg', '111', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (14, 1, 1, NULL, NULL, '铁棍山药', NULL, '斤', 'tiegunshanyao', 'tgsy', 17600014, 'goodsImage/1.jpg', '111', 11, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (15, 1, 1, NULL, NULL, '芋头', '', '斤', 'yutou', 'yt', 45106, 'goodsImage/1.jpg', '111', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (16, 1, 1, NULL, NULL, '樱桃萝卜', '', '斤', 'yingtaoluobu', 'ytlb', 45109, 'goodsImage/1.jpg', '111', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (17, 4, 1, NULL, NULL, '白不老', '', '斤', 'baibulao', 'bbl', 45148, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (18, 4, 1, NULL, NULL, '扁豆', '', '斤', 'biandou', 'bd', 45146, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (19, 4, 1, NULL, NULL, '荸荠', '', '斤', 'biji', 'bj', 45160, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (20, 4, 1, NULL, NULL, '板栗南瓜', '', '斤', 'banlinangua', 'blng', 45159, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (21, 4, 1, NULL, NULL, '长茄子', '', '斤', 'changqiezi', 'cqz', 45135, 'goodsImage/3.jpg', '112', 11, 1, 0, '', '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (22, 4, 1, NULL, NULL, '冬春笋', '', '斤', 'dongchunsun', 'dcs', 45163, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (23, 4, 1, NULL, NULL, '吊冬瓜', '', '斤', 'diaodonggua', 'ddg', 45138, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (24, 4, 1, NULL, NULL, '地冬瓜', '', '斤', 'didonggua', 'ddg', 45139, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (25, 4, 1, NULL, NULL, '豆王', '', '斤', 'douwang', 'dw', 45145, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (26, 4, 1, NULL, NULL, '广茄', '', '斤', 'guangqie', 'gq', 45155, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (27, 4, 1, NULL, NULL, '黄瓜', '', '斤', 'huanggua', 'hg', 45132, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (28, 4, 1, NULL, NULL, '荷兰瓜', NULL, '斤', 'helangua', 'hlg', 45592, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (29, 4, 1, NULL, NULL, '花生', '', '斤', 'huasheng', 'hs', 45164, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (30, 4, 1, NULL, NULL, '菜花', '', '斤', 'caihua', 'ch', 45141, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (31, 4, 1, NULL, NULL, '豇豆', '', '斤', 'jiangdou', 'jd', 45147, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (32, 4, 1, NULL, NULL, '金丝南瓜', '', '斤', 'jinsinangua', 'jsng', 45158, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (33, 4, 1, NULL, NULL, '苦瓜', '', '斤', 'kugua', 'kg', 45151, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (34, 4, 1, NULL, NULL, '毛豆', '', '斤', 'maodou', 'md', 45150, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (35, 4, 1, NULL, NULL, '南北瓜', '', '斤', 'nanbeigua', 'nbg', 45153, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (36, 4, 1, NULL, NULL, '南瓜', NULL, '斤', 'nangua', 'ng', 17600114, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (37, 4, 1, NULL, NULL, '秋葵', NULL, '斤', 'qiukui', 'qk', 45594, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (38, 4, 1, NULL, NULL, '丝瓜', '', '斤', 'sigua', 'sg', 45152, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (39, 4, 1, NULL, NULL, '散菜花', '', '斤', 'sancaihua', 'sch', 45142, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (40, 4, 1, NULL, NULL, '甜豆', NULL, '斤', 'tiandou', 'td', 45597, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (41, 4, 1, NULL, NULL, '豌豆', '', '斤', 'wandou', 'wd', 45162, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (42, 4, 1, NULL, NULL, '西胡芦', '', '斤', 'xihulu', 'xhl', 45140, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (43, 4, 1, NULL, NULL, '西红柿', '', '斤', 'xihongshi', 'xhs', 45130, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (44, 4, 1, NULL, NULL, '西兰花', NULL, '斤', 'xilanhua', 'xlh', 45599, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (45, 4, 1, NULL, NULL, '小毛冬瓜', '', '斤', 'xiaomaodonggua', 'xmdg', 45144, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (46, 4, 1, NULL, NULL, '线茄', '', '斤', 'xianqie', 'xq', 45156, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (47, 4, 1, NULL, NULL, '小西红柿', NULL, '斤', 'xiaoxihongshi', 'xxhs', 17600016, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (48, 4, 1, NULL, NULL, '油豆', '', '斤', 'youdou', 'yd', 45149, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (49, 4, 1, NULL, NULL, '玉米', '', '斤', 'yumi', 'ym', 45161, 'goodsImage/3.jpg', '112', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (50, 4, 1, NULL, NULL, '圆茄子', '', '斤', 'yuanqiezi', 'yqz', 45136, 'goodsImage/3.jpg', '112', 11, 1, 0, '', '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (51, 5, 1, NULL, NULL, '菠菜', '', '斤', 'bocai', 'bc', 45168, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (52, 5, 1, NULL, NULL, '菜心', '', '斤', 'caixin', 'cx', 45197, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (53, 5, 1, NULL, NULL, '穿心莲', '', '斤', 'chuanxinlian', 'cxl', 45204, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (54, 5, 1, NULL, NULL, '大白菜', '', '斤', 'dabaicai', 'dbc', 45165, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (55, 5, 1, NULL, NULL, '豆苗', NULL, '盒', 'doumiao', 'dm', 17600103, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (56, 5, 1, NULL, NULL, '豆苗', NULL, '板', 'doumiao', 'dm', 17600104, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (57, 5, 1, NULL, NULL, '盖菜', '', '斤', 'gaicai', 'gc', 45195, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (58, 5, 1, NULL, NULL, '甘蓝', '', '斤', 'ganlan', 'gl', 45171, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (59, 5, 1, NULL, NULL, '茴香', '', '斤', 'huixiang', 'hx', 45176, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (60, 5, 1, NULL, NULL, '黄心菜', '', '斤', 'huangxincai', 'hxc', 45181, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (61, 5, 1, NULL, NULL, '蒿子秆', '', '斤', 'haozigan', 'hzg', 45190, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (62, 5, 1, NULL, NULL, '荠菜', '', '斤', 'jicai', 'jc', 45200, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (63, 5, 1, NULL, NULL, '韭菜', '', '斤', 'jiucai', 'jc', 45174, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (64, 5, 1, NULL, NULL, '菊花菜', '', '斤', 'juhuacai', 'jhc', 45194, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (65, 5, 1, NULL, NULL, '芥兰', '', '斤', 'jielan', 'jl', 45196, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (66, 5, 1, NULL, NULL, '芥兰苗', NULL, '斤', 'jielanmiao', 'jlm', 45589, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (67, 5, 1, NULL, NULL, '鸡毛菜', '', '斤', 'jimaocai', 'jmc', 45199, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (68, 5, 1, NULL, NULL, '快菜', '', '斤', 'kuaicai', 'kc', 45202, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (69, 5, 1, NULL, NULL, '苦菊', '', '斤', 'kuju', 'kj', 45203, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (71, 5, 1, NULL, NULL, '空心菜', '', '斤', 'kongxincai', 'kxc', 45198, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (72, 5, 1, NULL, NULL, '落地球', NULL, '斤', 'luodiqiu', 'ldq', 45593, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (73, 5, 1, NULL, NULL, '兰花', NULL, '把', 'lanhua', 'lh', 45588, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (74, 5, 1, NULL, NULL, '罗马生菜', NULL, '斤', 'luomashengcai', 'lmsc', 45600, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (75, 5, 1, NULL, NULL, '木耳菜', '', '斤', 'muercai', 'mec', 45205, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (76, 5, 1, NULL, NULL, '奶白菜', '', '斤', 'naibaicai', 'nbc', 45187, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (77, 5, 1, NULL, NULL, '芹菜', '', '斤', 'qincai', 'qc', 45167, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (78, 5, 1, NULL, NULL, '叶生菜', '', '斤', 'sanshengcai', 'ssc', 45188, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (79, 5, 1, NULL, NULL, '茼蒿', '', '斤', 'tonghao', 'th', 45189, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (80, 5, 1, NULL, NULL, '豌豆苗', '', '斤', 'wandoumiao', 'wdm', 45201, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (81, 5, 1, NULL, NULL, '娃娃菜', NULL, '包', 'wawacai', 'wwc', 17600076, 'goodsImage/4.jpg', '113', 11, 1, 0, '董记', NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (82, 5, 1, NULL, NULL, '娃娃菜', '', '斤', 'wawacai', 'wwc', 45166, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (83, 5, 1, NULL, NULL, '小白菜', '', '斤', 'xiaobaicai', 'xbc', 45185, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (84, 5, 1, NULL, NULL, '苋菜', '', '斤', 'xiancai', 'xc', 45193, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (85, 5, 1, NULL, NULL, '香菜', '', '斤', 'xiangcai', 'xc', 45173, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (86, 5, 1, NULL, NULL, '香椿苗', NULL, '斤', 'xiangchunmiao', 'xcm', 45598, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (87, 5, 1, NULL, NULL, '香芹', '', '斤', 'xiangqin', 'xq', 45191, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (88, 5, 1, NULL, NULL, '西芹', '', '斤', 'xiqin', 'xq', 45182, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (89, 5, 1, NULL, NULL, '圆白菜', '', '斤', 'yuanbaicai', 'ybc', 45170, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (90, 5, 1, NULL, NULL, '油菜', '', '斤', 'youcai', 'yc', 45172, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (91, 5, 1, NULL, NULL, '油麦菜', '', '斤', 'youmaicai', 'ymc', 45180, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (92, 5, 1, NULL, NULL, '圆生菜', NULL, '斤', 'yuanshengcai', 'ysc', 45563, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (93, 5, 1, NULL, NULL, '紫甘蓝', NULL, '斤', 'ziganlan', 'zgl', 17600015, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (94, 5, 1, NULL, NULL, '芝麻菜', NULL, '斤', 'zhimacai', 'zmc', 45591, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (95, 5, 1, NULL, NULL, '紫叶生菜', NULL, '斤', 'ziyeshengcai', 'zysc', 17600116, 'goodsImage/4.jpg', '113', 11, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (96, 6, 1, NULL, NULL, '彩椒(红)', '', '斤', 'caijiao(hong)', 'cj(h)', 45126, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (97, 6, 1, NULL, NULL, '彩椒(黄)', NULL, '斤', 'caijiao(huang)', 'cj(h)', 45580, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (98, 6, 1, NULL, NULL, '大葱', '', '斤', 'dacong', 'dc', 45114, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (99, 6, 1, NULL, NULL, '大葱', NULL, '斤', 'dacong', 'dc', 17600011, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, '本地', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (100, 6, 1, NULL, NULL, '法香', NULL, '斤', 'faxiang', 'fx', 17600121, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (101, 6, 1, NULL, NULL, '黄葱头', '', '斤', 'huangcongtou', 'hct', 45112, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (102, 6, 1, NULL, NULL, '杭椒', NULL, '斤', 'hangjiao', 'hj', 17600027, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (103, 6, 1, NULL, NULL, '红尖椒', NULL, '斤', 'hongjianjiao', 'hjj', 45582, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (104, 6, 1, NULL, NULL, '姜', '', '斤', 'jiang', 'j', 45116, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (105, 6, 1, NULL, NULL, '尖椒', '', '斤', 'jianjiao', 'jj', 45110, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (106, 6, 1, NULL, NULL, '螺丝椒', NULL, '斤', 'luosijiao', 'lsj', 45579, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (107, 6, 1, NULL, NULL, '毛葱', NULL, '斤', 'maocong', 'mc', 45560, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (108, 6, 1, NULL, NULL, '麻椒', NULL, '斤', 'majiao', 'mj', 45583, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (109, 6, 1, NULL, NULL, '美人椒', NULL, '斤', 'meirenjiao', 'mrj', 45581, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (110, 6, 1, NULL, NULL, '青椒', NULL, '斤', 'qingjiao', 'qj', 45566, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (111, 6, 1, NULL, NULL, '青蒜', '', '斤', 'qingsuan', 'qs', 45127, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (112, 6, 1, NULL, NULL, '蒜', '', '斤', 'suan', 's', 45117, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (113, 6, 1, NULL, NULL, '蒜黄', '', '斤', 'suanhuang', 'sh', 45121, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (114, 6, 1, NULL, NULL, '蒜米', NULL, '斤', 'suanmi', 'sm', 17600012, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (115, 6, 1, NULL, NULL, '蒜苗', '', '斤', 'suanmiao', 'sm', 45119, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (116, 6, 1, NULL, NULL, '香葱', '', '斤', 'xiangcong', 'xc', 45128, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (117, 6, 1, NULL, NULL, '小葱', '', '斤', 'xiaocong', 'xc', 45115, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (118, 6, 1, NULL, NULL, '线椒', '', '斤', 'xianjiao', 'xj', 45123, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (119, 6, 1, NULL, NULL, '小米椒', '', '斤', 'xiaomijiao', 'xmj', 45125, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (120, 6, 1, NULL, NULL, '新蒜', '', '斤', 'xinsuan', 'xs', 45118, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (121, 6, 1, NULL, NULL, '紫葱头', '', '斤', 'zicongtou', 'zct', 45113, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (122, 7, 1, NULL, NULL, '白玉菇', '', '斤', 'baiyugu', 'byg', 45208, 'goodsImage/logo.jpg', '115', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (123, 7, 1, NULL, NULL, '白玉菇', NULL, '袋', 'baiyugu', 'byg', 17600022, 'goodsImage/logo.jpg', '115', 11, 1, 0, NULL, NULL, '#20afb8', '50克');
INSERT INTO `nx_distributer_goods` VALUES (124, 7, 1, NULL, NULL, '海鲜菇', '', '包', 'haixiangu', 'hxg', 45584, 'goodsImage/logo.jpg', '115', 11, 1, 0, '', '', '#20afb8', '4斤');
INSERT INTO `nx_distributer_goods` VALUES (125, 7, 1, NULL, NULL, '海鲜菇', NULL, '袋', 'haixiangu', 'hxg', 17600023, 'goodsImage/logo.jpg', '115', 11, 1, 0, NULL, NULL, '#20afb8', '50克');
INSERT INTO `nx_distributer_goods` VALUES (126, 7, 1, NULL, NULL, '鸡腿菇', '', '斤', 'jituigu', 'jtg', 45211, 'goodsImage/logo.jpg', '115', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (127, 7, 1, NULL, NULL, '金针菇', '', '斤', 'jinzhengu', 'jzg', 45212, 'goodsImage/logo.jpg', '115', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (128, 7, 1, NULL, NULL, '金针菇', NULL, '袋', 'jinzhengu', 'jzg', 17600019, 'goodsImage/logo.jpg', '115', 11, 1, 0, NULL, NULL, '#20afb8', '50克');
INSERT INTO `nx_distributer_goods` VALUES (129, 7, 1, NULL, NULL, '金针菇', NULL, '包', 'jinzhengu', 'jzg', 17600020, 'goodsImage/logo.jpg', '115', 11, 1, 0, NULL, NULL, '#20afb8', '5斤');
INSERT INTO `nx_distributer_goods` VALUES (130, 7, 1, NULL, NULL, '口蘑', '', '斤', 'koumo', 'km', 45209, 'goodsImage/logo.jpg', '115', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (131, 7, 1, NULL, NULL, '平菇', '', '斤', 'pinggu', 'pg', 45206, 'goodsImage/logo.jpg', '115', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (132, 7, 1, NULL, NULL, '杏鲍菇', '', '斤', 'xingbaogu', 'xbg', 45210, 'goodsImage/logo.jpg', '115', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (133, 7, 1, NULL, NULL, '杏鲍菇', NULL, '包', 'xingbaogu', 'xbg', 17600021, 'goodsImage/logo.jpg', '115', 11, 1, 0, NULL, NULL, '#20afb8', '5斤');
INSERT INTO `nx_distributer_goods` VALUES (134, 7, 1, NULL, NULL, '香菇', '', '斤', 'xianggu', 'xg', 45207, 'goodsImage/logo.jpg', '115', 11, 1, 0, NULL, '', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (135, 7, 1, NULL, NULL, '蟹味菇', NULL, '斤', 'xieweigu', 'xwg', 45585, 'goodsImage/logo.jpg', '115', 11, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (136, 8, 1, NULL, NULL, '百香果', '', '斤', 'baixiangguo', 'bxg', 45217, 'goodsImage/logo.jpg', '121', 12, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (137, 8, 1, NULL, NULL, '丑橘', '', '斤', 'chouju', 'cj', 45247, 'goodsImage/logo.jpg', '121', 12, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (138, 8, 1, NULL, NULL, '草莓', '', '斤', 'caomei', 'cm', 45221, 'goodsImage/logo.jpg', '121', 12, 1, 0, '丹东九九', NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (139, 8, 1, NULL, NULL, '草莓', '', '斤', 'caomei', 'cm', 45222, 'goodsImage/logo.jpg', '121', 12, 1, 0, '甜宝奶油', NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (140, 8, 1, NULL, NULL, '草莓', '', '斤', 'caomei', 'cm', 45223, 'goodsImage/logo.jpg', '121', 12, 1, 0, '巧克力', NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (141, 8, 1, NULL, NULL, '橙子', '', '斤', 'chengzi', 'cz', 45258, 'goodsImage/logo.jpg', '121', 12, 1, 0, '伦晚', NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (142, 8, 1, NULL, NULL, '灯笼果', '', '斤', 'denglongguo', 'dlg', 45233, 'goodsImage/logo.jpg', '121', 12, 1, 0, '姑娘果', NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (143, 8, 1, NULL, NULL, '丰水梨', '', '斤', 'fengshuili', 'fsl', 45239, 'goodsImage/logo.jpg', '121', 12, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (144, 8, 1, NULL, NULL, '贡梨', '', '斤', 'gongli', 'gl', 45237, 'goodsImage/logo.jpg', '121', 12, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (145, 8, 1, NULL, NULL, '甘蔗', '', '斤', 'ganzhe', 'gz', 45229, 'goodsImage/logo.jpg', '121', 12, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (146, 8, 1, NULL, NULL, '皇冠梨', '', '斤', 'huangguanli', 'hgl', 45236, 'goodsImage/logo.jpg', '121', 12, 1, 0, '', NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (147, 8, 1, NULL, NULL, '火龙果', '红心', '斤', 'huolongguo', 'hlg', 45225, 'goodsImage/logo.jpg', '121', 12, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (148, 8, 1, NULL, NULL, '火龙果', '白心', '斤', 'huolongguo', 'hlg', 45226, 'goodsImage/logo.jpg', '121', 12, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (149, 8, 1, NULL, NULL, '哈密瓜', '', '斤', 'hamigua', 'hmg', 45272, 'goodsImage/logo.jpg', '121', 12, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (150, 8, 1, NULL, NULL, '红皮梨', '', '斤', 'hongpili', 'hpl', 45243, 'goodsImage/logo.jpg', '121', 12, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (151, 8, 1, NULL, NULL, '红霄梨', '', '斤', 'hongxiaoli', 'hxl', 45240, 'goodsImage/logo.jpg', '121', 12, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (152, 8, 1, NULL, NULL, '黑枣', '', '斤', 'heizao', 'hz', 45231, 'goodsImage/logo.jpg', '121', 12, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (153, 8, 1, NULL, NULL, '香梨', '', '斤', 'kuerlexiangli', 'kelxl', 45241, 'goodsImage/logo.jpg', '121', 12, 1, 0, '库尔勒', NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (154, 8, 1, NULL, NULL, '芦柑', '', '斤', 'lugan', 'lg', 45252, 'goodsImage/logo.jpg', '121', 12, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (155, 8, 1, NULL, NULL, '芒果', '小', '斤', 'mangguo', 'mg', 45299, 'goodsImage/logo.jpg', '121', 12, 1, 0, '生台农', NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (156, 8, 1, NULL, NULL, '芒果', '大', '斤', 'mangguo', 'mg', 45300, 'goodsImage/logo.jpg', '121', 12, 1, 0, '生台农', NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (157, 8, 1, NULL, NULL, '芒果', '', '斤', 'mangguo', 'mg', 45301, 'goodsImage/logo.jpg', '121', 12, 1, 0, '红金龙', NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (158, 8, 1, NULL, NULL, '芒果', '', '斤', 'mangguo', 'mg', 45302, 'goodsImage/logo.jpg', '121', 12, 1, 0, '高乐密', NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (159, 8, 1, NULL, NULL, '芒果', '青皮', '斤', 'mangguo', 'mg', 45303, 'goodsImage/logo.jpg', '121', 12, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (160, 8, 1, NULL, NULL, '芒果', '', '斤', 'mangguo', 'mg', 45305, 'goodsImage/logo.jpg', '121', 12, 1, 0, '水仙', NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (161, 8, 1, NULL, NULL, '木瓜', '', '斤', 'mugua', 'mg', 45227, 'goodsImage/logo.jpg', '121', 12, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (162, 8, 1, NULL, NULL, '茂谷柑', '', '斤', 'maogugan', 'mgg', 45253, 'goodsImage/logo.jpg', '121', 12, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (163, 8, 1, NULL, NULL, '猕猴桃', '', '斤', 'mihoutao', 'mht', 45262, 'goodsImage/logo.jpg', '121', 12, 1, 0, '徐香', NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (164, 8, 1, NULL, NULL, '猕猴桃', '', '斤', 'mihoutao', 'mht', 45263, 'goodsImage/logo.jpg', '121', 12, 1, 0, '海沃德', NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (165, 8, 1, NULL, NULL, '马水桔', '', '斤', 'mashuijie', 'msj', 45251, 'goodsImage/logo.jpg', '121', 12, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (166, 8, 1, NULL, NULL, '南果梨', '', '斤', 'nanguoli', 'ngl', 45238, 'goodsImage/logo.jpg', '121', 12, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (167, 8, 1, NULL, NULL, '柠檬', '', '斤', 'ningmeng', 'nm', 45230, 'goodsImage/logo.jpg', '121', 12, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (168, 8, 1, NULL, NULL, '苹果', '', '斤', 'pingguo', 'pg', 45284, 'goodsImage/logo.jpg', '121', 12, 1, 0, '富士', '烟台', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (170, 8, 1, NULL, NULL, '苹果', '', '斤', 'pingguo', 'pg', 45287, 'goodsImage/logo.jpg', '121', 12, 1, 0, '黄元帅', NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (171, 8, 1, NULL, NULL, '苹果', '', '斤', 'pingguo', 'pg', 45288, 'goodsImage/logo.jpg', '121', 12, 1, 0, '花牛', NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (172, 8, 1, NULL, NULL, '苹果', '新疆阿克苏gkgjkadkjfa', '斤', 'pingguo', 'pg', 45289, 'goodsImage/logo.jpg', '121', 12, 1, 0, '冰糖心', '河北', '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (173, 10, 1, NULL, NULL, '盒豆腐', '北豆腐', '盒', 'hedoufu', 'hdf', 31116, 'goodsImage/logo.jpg', '131', 13, 1, 0, '白玉', NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (174, 10, 1, NULL, NULL, '盒豆腐', '鲜豆腐', '盒', 'hedoufu', 'hdf', 17600004, 'goodsImage/logo.jpg', '131', 13, 1, 0, '白玉', NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (175, 10, 1, NULL, NULL, '盒豆腐', '内酯豆腐', '盒', 'hedoufu', 'hdf', 17600117, 'goodsImage/logo.jpg', '131', 13, 1, 0, '白玉', NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (176, 10, 1, NULL, NULL, '盒豆腐', '韧豆腐', '盒', 'hedoufu', 'hdf', 17600005, 'goodsImage/logo.jpg', '131', 13, 1, 0, '白玉', NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (177, 10, 1, NULL, NULL, '老豆腐', NULL, '斤', 'laodoufu', 'ldf', 31112, 'goodsImage/logo.jpg', '131', 13, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (178, 10, 1, NULL, NULL, '卤水豆腐', '', '斤', 'lushuidoufu', 'lsdf', 31111, 'goodsImage/logo.jpg', '131', 13, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (179, 10, 1, NULL, NULL, '嫩豆腐', NULL, '斤', 'nendoufu', 'ndf', 31113, 'goodsImage/logo.jpg', '131', 13, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (180, 10, 1, NULL, NULL, '鸭血', NULL, '盒', 'yaxue', 'yx', 17600006, 'goodsImage/logo.jpg', '131', 13, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (181, 10, 1, NULL, NULL, '鸭血', '火锅', '斤', 'yaxue', 'yx', 17600007, 'goodsImage/logo.jpg', '131', 13, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (182, 12, 1, NULL, NULL, '笨豆芽', NULL, '斤', 'bendouya', 'bdy', 17600112, 'goodsImage/logo.jpg', '132', 13, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (183, 12, 1, NULL, NULL, '东北拉皮', NULL, '袋', 'dongbeilapi', 'dblp', 17600025, 'goodsImage/logo.jpg', '132', 13, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (184, 12, 1, NULL, NULL, '豆泡', NULL, '斤', 'doupao', 'dp', 31114, 'goodsImage/logo.jpg', '132', 13, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (185, 12, 1, NULL, NULL, '豆皮', NULL, '斤', 'doupi', 'dp', 31117, 'goodsImage/logo.jpg', '132', 13, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (186, 12, 1, NULL, NULL, '黄豆芽', NULL, '斤', 'huangdouya', 'hdy', 17600110, 'goodsImage/logo.jpg', '132', 13, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (187, 12, 1, NULL, NULL, '绿豆芽', NULL, '斤', 'lüdouya', 'ldy', 17600111, 'goodsImage/logo.jpg', '132', 13, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (188, 12, 1, NULL, NULL, '三河豆腐丝', NULL, '斤', 'sanhedoufusi', 'shdfs', 31115, 'goodsImage/logo.jpg', '132', 13, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (189, 12, 1, NULL, NULL, '熏干', NULL, '斤', 'xungan', 'xg', 31118, 'goodsImage/logo.jpg', '132', 13, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (190, 13, 1, NULL, NULL, '大头菜', NULL, '斤', 'datoucai', 'dtc', 17600008, 'goodsImage/logo.jpg', '133', 13, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (191, 13, 1, NULL, NULL, '芥菜丝', NULL, '斤', 'jiecaisi', 'jcs', 17600009, 'goodsImage/logo.jpg', '133', 13, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (192, 13, 1, NULL, NULL, '玫瑰咸菜', NULL, '斤', 'meiguixiancai', 'mgxc', 17600010, 'goodsImage/logo.jpg', '133', 13, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (193, 13, 1, NULL, NULL, '酸菜', NULL, '袋', 'suancai', 'sc', 17600100, 'goodsImage/logo.jpg', '133', 13, 1, 0, '刘', NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (194, 14, 1, NULL, NULL, '棒骨', '', '斤', 'banggu', 'bg', 45413, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (195, 14, 1, NULL, NULL, '纯排骨', '', '斤', 'chunpaigu', 'cpg', 45410, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (196, 14, 1, NULL, NULL, '纯腔骨', '', '斤', 'chunqianggu', 'cqg', 45411, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (197, 14, 1, NULL, NULL, '纯瘦肉', '', '斤', 'chunshourou', 'csr', 45405, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (198, 14, 1, NULL, NULL, '肥膘肉', '', '斤', 'feibiaorou', 'fbr', 45420, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (199, 14, 1, NULL, NULL, '后臀尖', '', '斤', 'houtunjian', 'htj', 45399, 'goodsImage/logo.jpg', '141', 14, 1, 0, '', NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (200, 14, 1, NULL, NULL, '护心肉', '', '斤', 'huxinrou', 'hxr', 45422, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (201, 14, 1, NULL, NULL, '后肘', '', '斤', 'houzhou', 'hz', 45407, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (202, 14, 1, NULL, NULL, '腔排骨', '', '斤', 'qiangpaigu', 'qpg', 45412, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (203, 14, 1, NULL, NULL, '前臀尖', '', '斤', 'qiantunjian', 'qtj', 45397, 'goodsImage/logo.jpg', '141', 14, 1, 0, '', NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (204, 14, 1, NULL, NULL, '前肘', '', '斤', 'qianzhou', 'qz', 45406, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (205, 14, 1, NULL, NULL, '通脊', '', '斤', 'tongji', 'tj', 45404, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (206, 14, 1, NULL, NULL, '五花肉', '', '斤', 'wuhuarou', 'whr', 45401, 'goodsImage/logo.jpg', '141', 14, 1, 0, '', NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (207, 14, 1, NULL, NULL, '猪板油', '', '斤', 'zhubanyou', 'zby', 45419, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (208, 14, 1, NULL, NULL, '猪肠', '', '斤', 'zhuchang', 'zc', 45428, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (209, 14, 1, NULL, NULL, '猪肠头', '', '斤', 'zhuchangtou', 'zct', 45427, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (210, 14, 1, NULL, NULL, '猪肚', '', '斤', 'zhudu', 'zd', 45418, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (211, 14, 1, NULL, NULL, '猪耳', '', '斤', 'zhuer', 'ze', 45416, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (212, 14, 1, NULL, NULL, '猪肺', '', '斤', 'zhufei', 'zf', 45425, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (213, 14, 1, NULL, NULL, '猪肝', '', '斤', 'zhugan', 'zg', 45424, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (214, 14, 1, NULL, NULL, '猪口条', '', '斤', 'zhukoutiao', 'zkt', 45415, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (215, 14, 1, NULL, NULL, '猪脑', '', '斤', 'zhunao', 'zn', 45417, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (216, 14, 1, NULL, NULL, '猪皮', '', '斤', 'zhupi', 'zp', 45426, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (217, 14, 1, NULL, NULL, '猪蹄', '', '斤', 'zhuti', 'zt', 45409, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (218, 14, 1, NULL, NULL, '猪头', '', '斤', 'zhutou', 'zt', 45414, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (219, 14, 1, NULL, NULL, '猪尾巴', '', '斤', 'zhuweiba', 'zwb', 45408, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (220, 14, 1, NULL, NULL, '猪心', '', '斤', 'zhuxin', 'zx', 45423, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (221, 14, 1, NULL, NULL, '猪腰子', '', '斤', 'zhuyaozi', 'zyz', 45421, 'goodsImage/logo.jpg', '141', 14, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (222, 16, 1, NULL, NULL, '大饼', NULL, '张', 'dabing', 'db', 17600089, 'goodsImage/logo.jpg', '181', 18, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (223, 16, 1, NULL, NULL, '刀削面', NULL, '斤', 'daoxuemian', 'dxm', 17600087, 'goodsImage/logo.jpg', '181', 18, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (224, 16, 1, NULL, NULL, '开花馒头', NULL, '个', 'kaihuamantou', 'khmt', 17600113, 'goodsImage/logo.jpg', '181', 18, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (225, 16, 1, NULL, NULL, '馒头', NULL, '个', 'mantou', 'mt', 17600088, 'goodsImage/logo.jpg', '181', 18, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (226, 16, 1, NULL, NULL, '面条', '细', '斤', 'miantiao', 'mt', 17600086, 'goodsImage/logo.jpg', '181', 18, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (227, 16, 1, NULL, NULL, '面条', '粗', '斤', 'miantiao', 'mt', 17600085, 'goodsImage/logo.jpg', '181', 18, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (228, 16, 1, NULL, NULL, '烧饼', NULL, '个', 'shaobing', 'sb', 17600090, 'goodsImage/logo.jpg', '181', 18, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (229, 16, 1, NULL, NULL, '玉米饼', NULL, '个', 'yumibing', 'ymb', 17600118, 'goodsImage/logo.jpg', '181', 18, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (230, 12, 1, NULL, NULL, '海带丝', NULL, '斤', 'haidaisi', 'hds', 17600122, 'goodsImage/logo.jpg', '132', 13, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (231, 12, 1, NULL, NULL, '海带结', NULL, '斤', 'haidaijie', 'hdj', 17600123, 'goodsImage/logo.jpg', '132', 13, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (232, 18, 1, NULL, NULL, '培根', NULL, '袋', 'peigen', 'pg', 17600133, 'goodsImage/logo.jpg', '175', 17, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (233, 20, 1, NULL, NULL, '鸡肉丸', NULL, '袋', 'jirouwan', 'jrw', 17600132, 'goodsImage/logo.jpg', '171', 17, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (234, 20, 1, NULL, NULL, '蟹棒', NULL, '袋', 'xiebang', 'xb', 17600131, 'goodsImage/logo.jpg', '171', 17, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (235, 20, 1, NULL, NULL, '鱼豆腐', NULL, '袋', 'yudoufu', 'ydf', 17600124, 'goodsImage/logo.jpg', '171', 17, 1, 0, '安井', NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (236, 20, 1, NULL, NULL, '鱼丸', NULL, '袋', 'yuwan', 'yw', 17600130, 'goodsImage/logo.jpg', '171', 17, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (237, 12, 1, NULL, NULL, '黄豆芽', '细', '斤', 'huangdouya', 'hdy', 17600135, 'goodsImage/logo.jpg', '132', 13, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (239, 6, 1, NULL, NULL, '中葱', NULL, '斤', 'zhongcong', 'zc', 17600137, 'goodsImage/2.jpg', '114', 11, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (240, 12, 1, NULL, NULL, '土豆粉', NULL, '袋', 'tudoufen', 'tdf', 17600138, 'goodsImage/logo.jpg', '132', 13, 1, 0, '和鑫源', NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (241, 10, 1, NULL, NULL, '香干', NULL, '斤', 'xianggan', 'xg', 17600139, 'goodsImage/logo.jpg', '131', 13, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (242, 16, 1, NULL, NULL, '麻酱烧饼', '大', '个', 'majiangshaobing', 'mjsb', 17600140, 'goodsImage/logo.jpg', '181', 18, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (243, 16, 1, NULL, NULL, '麻酱烧饼', '小', '个', 'majiangshaobing', 'mjsb', 17600141, 'goodsImage/logo.jpg', '181', 18, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (244, 16, 1, NULL, NULL, '糖烧饼', '大', '个', 'tangshaobing', 'tsb', 17600142, 'goodsImage/logo.jpg', '181', 18, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (245, 16, 1, NULL, NULL, '糖烧饼', '小', '个', 'tangshaobing', 'tsb', 17600143, 'goodsImage/logo.jpg', '181', 18, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (246, 21, 1, NULL, NULL, '冻琵琶腿', '', '斤', 'dongpipatui', 'dppt', 45482, 'goodsImage/logo.jpg', '144', 14, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (248, 21, 1, NULL, NULL, '鸡脖子', '带皮', '斤', 'jibozi', 'jbz', 45487, 'goodsImage/logo.jpg', '144', 14, 1, 0, '', NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (250, 21, 1, NULL, NULL, '鲜鸡块', '黄焖鸡专用', '斤', 'xianjikuai', 'xjk', 17600144, 'goodsImage/logo.jpg', '144', 14, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (251, 22, 1, NULL, NULL, '香醋', NULL, '桶', 'xiangcu', 'xc', 17600146, 'goodsImage/logo.jpg', '155', 15, 1, 0, '南士居', NULL, '#20afb8', '4.5L');
INSERT INTO `nx_distributer_goods` VALUES (252, 22, 1, NULL, NULL, '老干妈', '豆豉', '瓶', 'laoganma', 'lgm', 17600145, 'goodsImage/logo.jpg', '155', 15, 1, 0, '', NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (253, 24, 1, NULL, NULL, '柴鸡蛋', '', '斤', 'chaijidan', 'cjd', 45513, 'goodsImage/logo.jpg', '145', 14, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (254, 24, 1, NULL, NULL, '鹌鹑蛋', '', '斤', 'anchundan', 'acd', 45512, 'goodsImage/logo.jpg', '145', 14, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (255, 24, 1, NULL, NULL, '鹅蛋', '', '斤', 'edan', 'ed', 45511, 'goodsImage/logo.jpg', '145', 14, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (256, 24, 1, NULL, NULL, '鸽子蛋', '', '个', 'gezidan', 'gzd', 45516, 'goodsImage/logo.jpg', '145', 14, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (257, 24, 1, NULL, NULL, '鸡蛋', '', '斤', 'jidan', 'jd', 45506, 'goodsImage/logo.jpg', '145', 14, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (258, 24, 1, NULL, NULL, '松花蛋', '', '斤', 'songhuadan', 'shd', 45510, 'goodsImage/logo.jpg', '145', 14, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (259, 24, 1, NULL, NULL, '生鸭蛋', '', '斤', 'shengyadan', 'syd', 45508, 'goodsImage/logo.jpg', '145', 14, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (260, 24, 1, NULL, NULL, '熟鸭蛋', '', '斤', 'shuyadan', 'syd', 45509, 'goodsImage/logo.jpg', '145', 14, 1, 0, NULL, NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (261, 5, 1, NULL, NULL, '娃娃菜', NULL, '包', 'wawacai', 'wwc', 17600147, 'goodsImage/4.jpg', '113', 11, 1, 0, '绿源', NULL, '#20afb8', NULL);
INSERT INTO `nx_distributer_goods` VALUES (262, 25, 1, NULL, NULL, '切片年糕', NULL, '袋', 'qiepianniangao', 'qpng', 17600148, 'goodsImage/logo.jpg', '182', 18, 1, 0, '食之铺', NULL, '#20afb8', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
