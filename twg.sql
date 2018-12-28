/*
 Navicat Premium Data Transfer

 Source Server         : RooT
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost:3306
 Source Schema         : twg

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 23/12/2018 20:01:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admainuser
-- ----------------------------
DROP TABLE IF EXISTS `admainuser`;
CREATE TABLE `admainuser`  (
  `id` int(64) NOT NULL AUTO_INCREMENT,
  `AdmainName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admainuser
-- ----------------------------
INSERT INTO `admainuser` VALUES (1, 'TWG', '654321', '', NULL);
INSERT INTO `admainuser` VALUES (2, 'T', '654321', NULL, NULL);
INSERT INTO `admainuser` VALUES (3, 'W', '654321', NULL, NULL);
INSERT INTO `admainuser` VALUES (4, 'G', '654321', NULL, NULL);
INSERT INTO `admainuser` VALUES (5, '唐微港', '654321', NULL, NULL);

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `textArea` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `Fabulous` int(255) DEFAULT NULL,
  `uoloadTime` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `artieimg` varchar(124) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `firstartic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `smalltitle` varchar(72) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `userid` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `textArea` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `Fabulous` int(255) DEFAULT NULL,
  `uoloadTime` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `artieimg` varchar(124) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `firstartic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `smalltitle` varchar(72) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `userid` int(255) DEFAULT NULL,
  `articleid` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commention` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `articleid` int(255) DEFAULT NULL,
  `username` varchar(72) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `commenttime` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 289 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for largecategory
-- ----------------------------
DROP TABLE IF EXISTS `largecategory`;
CREATE TABLE `largecategory`  (
  `id` int(24) NOT NULL AUTO_INCREMENT,
  `largecategoryname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of largecategory
-- ----------------------------
INSERT INTO `largecategory` VALUES (1, 'Girl');
INSERT INTO `largecategory` VALUES (2, 'Handsome');
INSERT INTO `largecategory` VALUES (3, 'Dog');
INSERT INTO `largecategory` VALUES (4, 'Cat');
INSERT INTO `largecategory` VALUES (5, 'FlowerAGrass');
INSERT INTO `largecategory` VALUES (6, 'Scenery');
INSERT INTO `largecategory` VALUES (7, 'Island');
INSERT INTO `largecategory` VALUES (8, 'Car');
INSERT INTO `largecategory` VALUES (9, 'Cartoon');
INSERT INTO `largecategory` VALUES (10, 'EA');
INSERT INTO `largecategory` VALUES (11, 'City');

-- ----------------------------
-- Table structure for middlecategory
-- ----------------------------
DROP TABLE IF EXISTS `middlecategory`;
CREATE TABLE `middlecategory`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `middlename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `largeCategoryId` int(255) DEFAULT NULL,
  `middleimg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `uploaddate` datetime DEFAULT NULL,
  `uploader` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of middlecategory
-- ----------------------------
INSERT INTO `middlecategory` VALUES (1, '可爱', 1, '../../static/MiddleCategory/imgs/girl1.jpg', '2018-11-25 18:28:22', 'Mr Tang');
INSERT INTO `middlecategory` VALUES (2, '小清新', 1, '../../static/MiddleCategory/imgs/girl2.jpg', '2018-11-25 18:28:30', 'Mr Tang');
INSERT INTO `middlecategory` VALUES (3, '萝莉', 1, '../../static/MiddleCategory/imgs/girl3.jpg', '2018-11-25 18:28:33', 'Mr Tang');
INSERT INTO `middlecategory` VALUES (4, '御姐', 1, '../../static/MiddleCategory/imgs/girl4.jpg', '2018-11-25 18:28:37', 'Mr Tang');
INSERT INTO `middlecategory` VALUES (7, '欧洲风格', 1, '../../static/MiddleCategory/imgs/girl7.jpg', '2018-11-25 18:28:40', 'Mr Tang');
INSERT INTO `middlecategory` VALUES (8, '校园', 1, '../../static/MiddleCategory/imgs/girl8.jpg', '2018-11-25 18:28:43', 'Mr Tang');
INSERT INTO `middlecategory` VALUES (9, '清纯', 1, '../../static/MiddleCategory/imgs/girl9.jpg', '2018-11-25 18:28:46', 'Mr Tang');
INSERT INTO `middlecategory` VALUES (10, '校园', 1, '../../static/MiddleCategory/imgs/girl8.jpg', '2018-11-25 18:28:43', 'Mr Tang');
INSERT INTO `middlecategory` VALUES (11, '校园', 1, '../../static/MiddleCategory/imgs/girl8.jpg', '2018-11-25 18:28:43', 'Mr Tang');
INSERT INTO `middlecategory` VALUES (12, '迪罗猫', 4, '../../static/MiddleCategory/imgs/cat1.jpg', '2018-11-25 18:28:43', 'Mr Tang');
INSERT INTO `middlecategory` VALUES (13, '迪罗猫', 4, '../../static/MiddleCategory/imgs/cat1.jpg', '2018-11-25 18:28:43', 'Mr Tang');
INSERT INTO `middlecategory` VALUES (14, '迪罗猫', 4, '../../static/MiddleCategory/imgs/cat1.jpg', '2018-11-25 18:28:43', 'Mr Tang');
INSERT INTO `middlecategory` VALUES (15, '迪罗猫', 4, '../../static/MiddleCategory/imgs/cat2.jpg', '2018-11-25 18:28:43', 'Mr Tang');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userid` int(255) DEFAULT NULL,
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 89 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (0, 22, 'zns', '123', '15107793356', '11@163.com');
INSERT INTO `user` VALUES (0, 23, 'fdf', '123', '15654576654', 'll@l123.com');
INSERT INTO `user` VALUES (0, 25, 'LKOIJF', '123456', '15107793356', 'TOIPODS@163.com');
INSERT INTO `user` VALUES (0, 27, 'LOIUI', '123', '15107793356', 'TTETT@163.com');
INSERT INTO `user` VALUES (0, 30, 'POPI', '769{}()', '15159879866', 'etrest@110.cn');
INSERT INTO `user` VALUES (0, 32, '唐微港', '123456', '15107793356', 'll@163.com');
INSERT INTO `user` VALUES (0, 35, 'GGB', '123', '15107793356', 'T@163.com');
INSERT INTO `user` VALUES (0, 36, 'MMJ', '123', '15107793356', 'T@163.com');
INSERT INTO `user` VALUES (0, 37, 'KLK', '123', '15107793356', 'T@163.com');
INSERT INTO `user` VALUES (0, 39, 'HIL', '132465', '15107793356', 'T@163.com');
INSERT INTO `user` VALUES (0, 40, '48546', '123', '13458897900', 'T@163.com');
INSERT INTO `user` VALUES (0, 41, '48546', '123', '13458897900', 'T@163.com');
INSERT INTO `user` VALUES (0, 42, '48546', '123', '13458897900', 'T@163.com');
INSERT INTO `user` VALUES (0, 43, 'OIU', '123', '13458856566', 'W@163.com');
INSERT INTO `user` VALUES (0, 44, 'OIU', '123', '13458856566', 'W@163.com');
INSERT INTO `user` VALUES (0, 45, 'OIU', '123', '13458856566', 'W@163.com');
INSERT INTO `user` VALUES (0, 46, 'OIU', '123', '13458856566', 'W@163.com');
INSERT INTO `user` VALUES (0, 47, 'JL', '123', '15107793356', 'W@163.com');
INSERT INTO `user` VALUES (0, 48, '唐微港465', '1345654', '15107793356', 'T@163.com');
INSERT INTO `user` VALUES (0, 49, 'ready', '456', '15107793356', 'T@163.com');
INSERT INTO `user` VALUES (0, 50, '你的喵', '111', '15107793356', 'fdsd@163.cn');
INSERT INTO `user` VALUES (0, 51, '米兔', '321', '13458897900', 'll@163.com');
INSERT INTO `user` VALUES (0, 52, '我是小哥哥', '6987', '13458897900', 'T@163.com');
INSERT INTO `user` VALUES (0, 53, 'hah', '123', '15107793356', 'T@163.com');
INSERT INTO `user` VALUES (0, 54, 'kkl', '456', '15107793356', 'W@163.com');
INSERT INTO `user` VALUES (0, 55, 'TS', '132', '15107793356', 'T@163.com');
INSERT INTO `user` VALUES (0, 56, '小了白了兔', '123465', '15107793356', 'T@163.com');
INSERT INTO `user` VALUES (NULL, 57, 'KD', '132', '15107793356', 'T@163.com');
INSERT INTO `user` VALUES (NULL, 58, 'OPO', '123', '15107793356', 'T@163.com');
INSERT INTO `user` VALUES (NULL, 59, 'll', '123', '15107793356', 'll@163.com');
INSERT INTO `user` VALUES (NULL, 60, 'TWG', '123456', '15107793356', '163@163.com');
INSERT INTO `user` VALUES (NULL, 61, '【】', '123', '15107793356', 'T@163.com');
INSERT INTO `user` VALUES (NULL, 62, 'PIO', '{}+', '15107793356', 'T@163.com');
INSERT INTO `user` VALUES (NULL, 63, 'POJO', '123', '15107793356', 'T@163.com');
INSERT INTO `user` VALUES (NULL, 64, '123', '123', '15107793356', 'T@163.com');
INSERT INTO `user` VALUES (NULL, 65, '455', '123', '15107753255', 'fghg@42.com');
INSERT INTO `user` VALUES (NULL, 66, 'IOUI', '123', '15107793356', 'T@163.com');
INSERT INTO `user` VALUES (NULL, 67, '唐we', '123', '15107793356', 'T@163.com');
INSERT INTO `user` VALUES (NULL, 68, 'ppps', '111', '15107793356', 'T@163.com');
INSERT INTO `user` VALUES (NULL, 69, 'XNG', '123', '15107793356', 'T@163.com');
INSERT INTO `user` VALUES (NULL, 82, '', '', 'dfs', 'sdfs');
INSERT INTO `user` VALUES (NULL, 84, '+P', '123', '15107793356', 'T@163.com');
INSERT INTO `user` VALUES (NULL, 85, 'kjlkf', '123', '15107793356', 'T@163.com');
INSERT INTO `user` VALUES (NULL, 86, '+_', '123', '15107793356', 'T@163.com');
INSERT INTO `user` VALUES (NULL, 87, '小喵喵', '123456', '15107793356', '1109599916@qq.com');
INSERT INTO `user` VALUES (NULL, 88, '我可爱', '123', '15107793356', 'T@163.com');

SET FOREIGN_KEY_CHECKS = 1;
