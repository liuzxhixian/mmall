/*
 Navicat Premium Data Transfer

 Source Server         : xymall
 Source Server Type    : MySQL
 Source Server Version : 50712
 Source Host           : localhost:3306
 Source Schema         : mmall

 Target Server Type    : MySQL
 Target Server Version : 50712
 File Encoding         : 65001

 Date: 15/03/2022 20:04:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `cost` float NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `productId`(`product_id`) USING BTREE,
  INDEX `userId`(`user_id`) USING BTREE,
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` int(11) NOT NULL COMMENT '订单主键',
  `product_id` int(11) NOT NULL COMMENT '商品主键',
  `quantity` int(11) NOT NULL COMMENT '数量',
  `cost` float NOT NULL COMMENT '消费',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `PK__EASYBUY___66E1BD8E2F10007B`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 194 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (178, 178, 778, 1, 111);
INSERT INTO `order_detail` VALUES (179, 179, 778, 1, 111);
INSERT INTO `order_detail` VALUES (180, 180, 778, 1, 111);
INSERT INTO `order_detail` VALUES (181, 181, 734, 1, 153);
INSERT INTO `order_detail` VALUES (182, 182, 733, 1, 152);
INSERT INTO `order_detail` VALUES (183, 183, 733, 1, 152);
INSERT INTO `order_detail` VALUES (184, 184, 734, 1, 153);
INSERT INTO `order_detail` VALUES (185, 185, 734, 1, 153);
INSERT INTO `order_detail` VALUES (186, 185, 778, 1, 111);
INSERT INTO `order_detail` VALUES (187, 186, 734, 1, 153);
INSERT INTO `order_detail` VALUES (188, 187, 735, 6, 912);
INSERT INTO `order_detail` VALUES (189, 187, 777, 1, 100);
INSERT INTO `order_detail` VALUES (190, 187, 734, 6, 918);
INSERT INTO `order_detail` VALUES (191, 188, 734, 1, 153);
INSERT INTO `order_detail` VALUES (192, 189, 734, 1, 153);
INSERT INTO `order_detail` VALUES (193, 190, 734, 1, 153);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户主键',
  `login_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `user_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户地址',
  `cost` float NULL DEFAULT NULL COMMENT '总金额',
  `serialnumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 191 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (178, 60, '123', '123', 111, 'BFBB7E064FC199CD5F17082BF6D1B835', '2021-12-27 14:50:33', '2021-12-27 14:50:33');
INSERT INTO `orders` VALUES (179, 60, '123', '123', 111, 'C5DA827E522D0AD76DF4C4812587125E', '2021-12-27 14:51:26', '2021-12-27 14:51:26');
INSERT INTO `orders` VALUES (180, 63, 'hh', '华夏理工', 111, 'E26FCC541C94E58AC97C18DF817947FD', '2021-12-28 14:14:08', '2021-12-28 14:14:08');
INSERT INTO `orders` VALUES (181, 63, 'hh', '华夏理工', 153, '5DD809019B40ABD551514DE967227963', '2021-12-28 14:22:22', '2021-12-28 14:22:22');
INSERT INTO `orders` VALUES (182, 60, '123', '123', 152, '5E31FCDFABF6885790F9A52CDC11C6C8', '2021-12-29 10:18:42', '2021-12-29 10:18:42');
INSERT INTO `orders` VALUES (183, 60, '123', '123', 152, '1C366A88A3F4934A37EC2AB52BC907FA', '2021-12-29 10:19:16', '2021-12-29 10:19:16');
INSERT INTO `orders` VALUES (184, 60, '123', '123', 153, '0AE6DA3DB174365BFEA12FC73BD00600', '2021-12-29 14:18:44', '2021-12-29 14:18:44');
INSERT INTO `orders` VALUES (185, 60, '123', '123', 264, '141C735CDD4723D7DAAA10CD5365CE2F', '2021-12-29 18:23:53', '2021-12-29 18:23:53');
INSERT INTO `orders` VALUES (186, 60, '123', '123', 153, 'D0E526287D05682D424563BEEB94D89A', '2021-12-30 13:16:05', '2021-12-30 13:16:05');
INSERT INTO `orders` VALUES (187, 60, '123', '华夏理工', 1930, 'CB59DA966EFFE040A7CB6501BE5CBBC9', '2021-12-30 15:25:42', '2021-12-30 15:25:42');
INSERT INTO `orders` VALUES (188, 60, '123', '华夏理工', 153, 'BE635EF1AD98DEF89F5BD9729FA9B9DC', '2022-01-08 14:00:35', '2022-01-08 14:00:35');
INSERT INTO `orders` VALUES (189, 60, '123', '华夏理工', 153, 'CC56A9A1371527DB57A819D5DD8237FC', '2022-02-22 14:12:49', '2022-02-22 14:12:49');
INSERT INTO `orders` VALUES (190, 60, '123', '华夏理工', 153, 'A2E22D85E1D7879470C6CB4A64FEC890', '2022-03-15 16:04:16', '2022-03-15 16:04:16');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `price` float NOT NULL COMMENT '价格',
  `stock` int(11) NOT NULL COMMENT '库存',
  `categorylevelone_id` int(11) NULL DEFAULT NULL COMMENT '分类1',
  `categoryleveltwo_id` int(11) NULL DEFAULT NULL COMMENT '分类2',
  `categorylevelthree_id` int(11) NULL DEFAULT NULL COMMENT '分类3',
  `file_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `PK__EASYBUY___94F6E55132E0915F`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 783 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (733, '巫蛮儿', '巫蛮儿', 152, 0, 548, 654, 655, 'wme_1.jpg');
INSERT INTO `product` VALUES (734, '飞燕女', '', 153, 62, 548, 654, 703, 'fyn_1.jpg');
INSERT INTO `product` VALUES (735, '英女侠', '', 152, 942, 548, 654, 704, 'ynx_1.jpg');
INSERT INTO `product` VALUES (736, '剑侠客', '', 152, 984, 548, 654, 705, 'jxk_1.jpg');
INSERT INTO `product` VALUES (737, '逍遥生', '', 152, 111, 548, 654, 706, 'xys_1.jpg');
INSERT INTO `product` VALUES (738, '偃无师', '', 45, 99, 548, 654, 707, 'yws_1.jpg');
INSERT INTO `product` VALUES (777, '狐美人', NULL, 100, 0, 548, 701, 708, 'hmr_1.jpg');
INSERT INTO `product` VALUES (778, '骨精灵', NULL, 111, 18, 548, 701, 709, 'gjl_1.jpg');
INSERT INTO `product` VALUES (779, '杀破狼', NULL, 1111, 22, 548, 701, 710, 'spl_1.jpg');
INSERT INTO `product` VALUES (780, '虎头怪', NULL, 111, 22, 548, 701, 711, 'htg_1.jpg');
INSERT INTO `product` VALUES (781, '巨魔王', NULL, 112, 22, 548, 701, 712, 'jmw_1.jpg');
INSERT INTO `product` VALUES (782, '鬼潇潇', NULL, 113, 22, 548, 701, 713, 'gxx_1.jpg');

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `parent_id` int(11) NOT NULL COMMENT '父级目录id',
  `type` int(11) NULL DEFAULT NULL COMMENT '级别(1:一级 2：二级 3：三级)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `PK__EASYBUY___9EC2A4E236B12243`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 732 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO `product_category` VALUES (548, '角色', 0, 1);
INSERT INTO `product_category` VALUES (628, '召唤兽', 0, 1);
INSERT INTO `product_category` VALUES (654, '人族', 548, 2);
INSERT INTO `product_category` VALUES (655, '巫蛮儿', 654, 3);
INSERT INTO `product_category` VALUES (656, '泡泡灵仙', 628, 2);
INSERT INTO `product_category` VALUES (657, '神兽', 628, 2);
INSERT INTO `product_category` VALUES (660, '材料', 0, 1);
INSERT INTO `product_category` VALUES (661, '宝石/玛瑙/宝珠', 660, 2);
INSERT INTO `product_category` VALUES (662, '宝石', 661, 3);
INSERT INTO `product_category` VALUES (663, '宝珠', 661, 3);
INSERT INTO `product_category` VALUES (670, '道具类', 0, 1);
INSERT INTO `product_category` VALUES (671, '武器', 670, 2);
INSERT INTO `product_category` VALUES (672, '剑', 671, 3);
INSERT INTO `product_category` VALUES (673, '枪矛', 671, 3);
INSERT INTO `product_category` VALUES (674, '防具', 670, 2);
INSERT INTO `product_category` VALUES (675, '饰物', 674, 3);
INSERT INTO `product_category` VALUES (676, '个性宠', 0, 1);
INSERT INTO `product_category` VALUES (681, '梦幻币', 0, 1);
INSERT INTO `product_category` VALUES (690, '灵饰', 670, 2);
INSERT INTO `product_category` VALUES (696, '参战45-65', 628, 2);
INSERT INTO `product_category` VALUES (697, '参战75-105', 628, 2);
INSERT INTO `product_category` VALUES (698, '参战125-145', 628, 2);
INSERT INTO `product_category` VALUES (699, '飞升120-155', 628, 2);
INSERT INTO `product_category` VALUES (700, '渡劫155-175', 628, 2);
INSERT INTO `product_category` VALUES (701, '魔族', 548, 2);
INSERT INTO `product_category` VALUES (702, '仙族', 548, 2);
INSERT INTO `product_category` VALUES (703, '飞燕女', 654, 3);
INSERT INTO `product_category` VALUES (704, '英女侠', 654, 3);
INSERT INTO `product_category` VALUES (705, '剑侠客', 654, 3);
INSERT INTO `product_category` VALUES (706, '逍遥生', 654, 3);
INSERT INTO `product_category` VALUES (707, '偃无师', 654, 3);
INSERT INTO `product_category` VALUES (708, '狐美人', 701, 3);
INSERT INTO `product_category` VALUES (709, '骨精灵', 701, 3);
INSERT INTO `product_category` VALUES (710, '杀破狼', 701, 3);
INSERT INTO `product_category` VALUES (711, '虎头怪', 701, 3);
INSERT INTO `product_category` VALUES (712, '巨魔王', 701, 3);
INSERT INTO `product_category` VALUES (713, '鬼潇潇', 701, 3);
INSERT INTO `product_category` VALUES (714, '舞天姬', 702, 3);
INSERT INTO `product_category` VALUES (715, '玄彩娥', 702, 3);
INSERT INTO `product_category` VALUES (716, '羽灵神', 702, 3);
INSERT INTO `product_category` VALUES (717, '龙太子', 702, 3);
INSERT INTO `product_category` VALUES (718, '神天兵', 702, 3);
INSERT INTO `product_category` VALUES (719, '桃夭夭', 702, 3);
INSERT INTO `product_category` VALUES (720, '扇', 671, 3);
INSERT INTO `product_category` VALUES (721, '刀', 671, 3);
INSERT INTO `product_category` VALUES (722, '斧', 671, 3);
INSERT INTO `product_category` VALUES (723, '腰带', 674, 3);
INSERT INTO `product_category` VALUES (724, '鞋子', 674, 3);
INSERT INTO `product_category` VALUES (725, '头盔', 674, 3);
INSERT INTO `product_category` VALUES (726, '铠甲', 674, 3);
INSERT INTO `product_category` VALUES (727, '女衣', 674, 3);
INSERT INTO `product_category` VALUES (728, '戒指', 690, 3);
INSERT INTO `product_category` VALUES (729, '手镯', 690, 3);
INSERT INTO `product_category` VALUES (730, '耳饰', 690, 3);
INSERT INTO `product_category` VALUES (731, '佩饰', 690, 3);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `login_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录名',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `gender` int(11) NOT NULL DEFAULT 1 COMMENT '性别(1:男 0：女)',
  `email` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `PK__EASYBUY___C96109CC3A81B327`(`login_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (58, 'test', '张三', 'b3472e734711122a5c892c3a93705ed11d1513d59b107d57', 1, '123@test.com', '13312345678', NULL, '2021-11-18 12:55:37', '2021-11-18 12:55:37');
INSERT INTO `user` VALUES (59, 'test2', '张三', 'f1bc53d58d67b98a3d41a247a94f5b11de5aa2bc61596723', 1, '123@test.com', '13312345678', NULL, '2021-11-18 13:00:07', '2021-11-18 13:00:07');
INSERT INTO `user` VALUES (60, '123', '陶子', 'd8c15440512b590854251d5b73052da6348d92dd18369536', 1, '1244015810@qq.com', '15327776904', NULL, '2021-12-22 17:57:03', '2021-12-22 17:57:03');
INSERT INTO `user` VALUES (61, 'h111222', '藏宝阁', 'b9e15b925c4f070e96a8f43b13375ea5ec91f3c880a7e51b', 1, 'qiuci1102@163.com', '15327776904', NULL, '2021-12-23 17:13:13', '2021-12-23 17:13:13');
INSERT INTO `user` VALUES (62, '111444', '中', '44dc8fa5a969e29a0fd68c74876f4f85411fb2e798364804', 1, '1244015810@qq.com', '15327776904', NULL, '2021-12-23 17:16:21', '2021-12-23 17:16:21');
INSERT INTO `user` VALUES (63, 'hh', '梦幻', '54f04ac6537cc79768d1b49ae40e7b75431e248a8657f140', 0, '1244015810@qq.com', '15327776904', NULL, '2021-12-28 14:13:37', '2021-12-28 14:13:37');

-- ----------------------------
-- Table structure for user_address
-- ----------------------------
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户主键',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `isdefault` int(11) NULL DEFAULT 0 COMMENT '是否是默认地址（1:是 0否）',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_address
-- ----------------------------
INSERT INTO `user_address` VALUES (49, 56, 'IT园', '公司', 0, '2020-05-21 15:55:24', '2020-07-29 11:22:13');
INSERT INTO `user_address` VALUES (50, 56, '软件园', '公司', 0, '2020-05-22 15:11:07', '2020-07-25 09:14:19');
INSERT INTO `user_address` VALUES (57, 56, '测试', '测试', 0, '2021-11-17 18:04:49', '2021-11-17 18:04:49');
INSERT INTO `user_address` VALUES (59, 59, '软件园', '公司', 0, '2021-11-18 13:01:19', '2021-11-18 13:01:19');
INSERT INTO `user_address` VALUES (60, 60, '123', '', 0, '2021-12-27 14:50:33', '2021-12-27 14:50:33');
INSERT INTO `user_address` VALUES (61, 63, '华夏理工', '', 0, '2021-12-28 14:14:08', '2021-12-28 14:14:08');
INSERT INTO `user_address` VALUES (62, 60, '华夏理工', '', 1, '2021-12-30 15:25:42', '2021-12-30 15:25:42');

SET FOREIGN_KEY_CHECKS = 1;
