/*
 Navicat Premium Data Transfer

 Source Server         : luyue
 Source Server Type    : MySQL
 Source Server Version : 80039 (8.0.39)
 Source Host           : localhost:3306
 Source Schema         : flaskhousesystem

 Target Server Type    : MySQL
 Target Server Version : 80039 (8.0.39)
 File Encoding         : 65001

 Date: 20/06/2025 09:52:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for appointment
-- ----------------------------
DROP TABLE IF EXISTS `appointment`;
CREATE TABLE `appointment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `property` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `time` datetime NOT NULL COMMENT '预约时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of appointment
-- ----------------------------
INSERT INTO `appointment` VALUES (1, 'a', 'a', '2025-05-15 20:15:11');
INSERT INTO `appointment` VALUES (2, 'aaaa', '万科魅力之城武广新城', '2025-05-18 16:00:00');
INSERT INTO `appointment` VALUES (3, 'aaaa', '万科魅力之城武广新城', '2025-04-30 16:00:00');
INSERT INTO `appointment` VALUES (4, 'aaaa', '万科魅力之城武广新城', '2025-05-29 16:00:00');
INSERT INTO `appointment` VALUES (5, 'aaaa', '万科魅力之城武广新城', '2025-05-29 16:00:00');
INSERT INTO `appointment` VALUES (6, 'aaaa', '万科魅力之城武广新城', '2025-05-20 16:00:00');
INSERT INTO `appointment` VALUES (7, 'aaaa', '万科魅力之城武广新城', '2025-05-29 16:00:00');
INSERT INTO `appointment` VALUES (8, 'aaaa', '万科魅力之城武广新城', '2025-05-25 16:00:00');
INSERT INTO `appointment` VALUES (9, 'aaaa', '万科魅力之城武广新城', '2025-05-01 16:00:00');
INSERT INTO `appointment` VALUES (10, 'aaaa', '万科魅力之城武广新城', '2025-05-20 16:00:00');

-- ----------------------------
-- Table structure for channel
-- ----------------------------
DROP TABLE IF EXISTS `channel`;
CREATE TABLE `channel`  (
  `channel_id` int NOT NULL AUTO_INCREMENT,
  `tenant_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '租客用户名',
  `landlord_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '房东用户名',
  `timestamp` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`channel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of channel
-- ----------------------------
INSERT INTO `channel` VALUES (1, 'Andy', 'Lu', '2025-05-21 19:25:54');
INSERT INTO `channel` VALUES (2, '陆岳', '陈先生', '2025-06-01 20:34:15');
INSERT INTO `channel` VALUES (3, 'Ylfmoonn', '陆岳', '2025-06-03 20:20:15');
INSERT INTO `channel` VALUES (4, 'Lappand', '陆岳', '2025-06-03 20:33:24');
INSERT INTO `channel` VALUES (5, 'Lappand', '张女士', '2025-06-03 20:59:45');
INSERT INTO `channel` VALUES (6, '忧郁的令家人', '张先生', '2025-06-12 21:11:19');
INSERT INTO `channel` VALUES (7, '陆岳', '张先生', '2025-06-12 21:18:20');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `house_id` int NOT NULL COMMENT '房屋的id',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '留言人名字',
  `type` int NOT NULL COMMENT '留言人类型,1:租客，2:房东',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '留言内容',
  `at` int NULL DEFAULT NULL COMMENT '@哪条留言，前端显示为@谁，选填',
  `time` datetime NOT NULL COMMENT '留言时间',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 139 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (13, 10, '租客1', 1, '这是第1条留言，房东房东C你好！', NULL, '2025-04-26 17:39:14');
INSERT INTO `comment` VALUES (14, 10, '租客2', 1, '这是第2条留言，房东房东C你好！', NULL, '2025-04-25 17:39:14');
INSERT INTO `comment` VALUES (15, 10, '租客3', 1, '这是第3条留言，房东房东C你好！', NULL, '2025-04-24 17:39:14');
INSERT INTO `comment` VALUES (16, 10, '租客4', 1, '这是第4条留言，房东房东C你好！', NULL, '2025-04-23 17:39:14');
INSERT INTO `comment` VALUES (17, 10, '租客5', 1, '这是第5条留言，房东房东C你好！', NULL, '2025-04-22 17:39:14');
INSERT INTO `comment` VALUES (18, 10, '租客6', 1, '这是第6条留言，房东房东C你好！', NULL, '2025-04-21 17:39:14');
INSERT INTO `comment` VALUES (19, 10, '租客7', 1, '这是第7条留言，房东房东C你好！', NULL, '2025-04-20 17:39:14');
INSERT INTO `comment` VALUES (20, 10, '租客8', 1, '这是第8条留言，房东房东C你好！', NULL, '2025-04-19 17:39:14');
INSERT INTO `comment` VALUES (21, 10, '租客9', 1, '这是第9条留言，房东房东C你好！', NULL, '2025-04-18 17:39:14');
INSERT INTO `comment` VALUES (22, 10, '租客10', 1, '这是第10条留言，房东房东C你好！', NULL, '2025-04-17 17:39:14');
INSERT INTO `comment` VALUES (23, 9, '租客1', 1, '这是第1条留言，房东房东B你好！', NULL, '2025-04-26 17:39:14');
INSERT INTO `comment` VALUES (24, 9, '租客2', 1, '这是第2条留言，房东房东B你好！', NULL, '2025-04-25 17:39:14');
INSERT INTO `comment` VALUES (25, 9, '租客3', 1, '这是第3条留言，房东房东B你好！', NULL, '2025-04-24 17:39:14');
INSERT INTO `comment` VALUES (26, 9, '租客4', 1, '这是第4条留言，房东房东B你好！', NULL, '2025-04-23 17:39:14');
INSERT INTO `comment` VALUES (27, 9, '租客5', 1, '这是第5条留言，房东房东B你好！', NULL, '2025-04-22 17:39:14');
INSERT INTO `comment` VALUES (28, 9, '租客6', 1, '这是第6条留言，房东房东B你好！', NULL, '2025-04-21 17:39:14');
INSERT INTO `comment` VALUES (29, 9, '租客7', 1, '这是第7条留言，房东房东B你好！', NULL, '2025-04-20 17:39:14');
INSERT INTO `comment` VALUES (30, 9, '租客8', 1, '这是第8条留言，房东房东B你好！', NULL, '2025-04-19 17:39:14');
INSERT INTO `comment` VALUES (31, 9, '租客9', 1, '这是第9条留言，房东房东B你好！', NULL, '2025-04-18 17:39:14');
INSERT INTO `comment` VALUES (32, 9, '租客10', 1, '这是第10条留言，房东房东B你好！', NULL, '2025-04-17 17:39:14');
INSERT INTO `comment` VALUES (33, 8, '租客1', 1, '这是第1条留言，房东landlord3你好！', NULL, '2025-04-26 17:39:14');
INSERT INTO `comment` VALUES (34, 8, '租客2', 1, '这是第2条留言，房东landlord3你好！', NULL, '2025-04-25 17:39:14');
INSERT INTO `comment` VALUES (35, 8, '租客3', 1, '这是第3条留言，房东landlord3你好！', NULL, '2025-04-24 17:39:14');
INSERT INTO `comment` VALUES (36, 8, '租客4', 1, '这是第4条留言，房东landlord3你好！', NULL, '2025-04-23 17:39:14');
INSERT INTO `comment` VALUES (37, 8, '租客5', 1, '这是第5条留言，房东landlord3你好！', NULL, '2025-04-22 17:39:14');
INSERT INTO `comment` VALUES (38, 8, '租客6', 1, '这是第6条留言，房东landlord3你好！', NULL, '2025-04-21 17:39:14');
INSERT INTO `comment` VALUES (39, 8, '租客7', 1, '这是第7条留言，房东landlord3你好！', NULL, '2025-04-20 17:39:14');
INSERT INTO `comment` VALUES (40, 8, '租客8', 1, '这是第8条留言，房东landlord3你好！', NULL, '2025-04-19 17:39:14');
INSERT INTO `comment` VALUES (41, 8, '租客9', 1, '这是第9条留言，房东landlord3你好！', NULL, '2025-04-18 17:39:14');
INSERT INTO `comment` VALUES (42, 8, '租客10', 1, '这是第10条留言，房东landlord3你好！', NULL, '2025-04-17 17:39:14');
INSERT INTO `comment` VALUES (43, 7, '租客1', 1, '这是第1条留言，房东landlord你好！', NULL, '2025-04-26 17:39:14');
INSERT INTO `comment` VALUES (44, 7, '租客2', 1, '这是第2条留言，房东landlord你好！', NULL, '2025-04-25 17:39:14');
INSERT INTO `comment` VALUES (45, 7, '租客3', 1, '这是第3条留言，房东landlord你好！', NULL, '2025-04-24 17:39:14');
INSERT INTO `comment` VALUES (46, 7, '租客4', 1, '这是第4条留言，房东landlord你好！', NULL, '2025-04-23 17:39:14');
INSERT INTO `comment` VALUES (47, 7, '租客5', 1, '这是第5条留言，房东landlord你好！', NULL, '2025-04-22 17:39:14');
INSERT INTO `comment` VALUES (48, 7, '租客6', 1, '这是第6条留言，房东landlord你好！', NULL, '2025-04-21 17:39:14');
INSERT INTO `comment` VALUES (49, 7, '租客7', 1, '这是第7条留言，房东landlord你好！', NULL, '2025-04-20 17:39:14');
INSERT INTO `comment` VALUES (50, 7, '租客8', 1, '这是第8条留言，房东landlord你好！', NULL, '2025-04-19 17:39:14');
INSERT INTO `comment` VALUES (51, 7, '租客9', 1, '这是第9条留言，房东landlord你好！', NULL, '2025-04-18 17:39:14');
INSERT INTO `comment` VALUES (52, 7, '租客10', 1, '这是第10条留言，房东landlord你好！', NULL, '2025-04-17 17:39:14');
INSERT INTO `comment` VALUES (53, 6, '租客1', 1, '这是第1条留言，房东landlord你好！', NULL, '2025-04-26 17:39:14');
INSERT INTO `comment` VALUES (54, 6, '租客2', 1, '这是第2条留言，房东landlord你好！', NULL, '2025-04-25 17:39:14');
INSERT INTO `comment` VALUES (55, 6, '租客3', 1, '这是第3条留言，房东landlord你好！', NULL, '2025-04-24 17:39:14');
INSERT INTO `comment` VALUES (56, 6, '租客4', 1, '这是第4条留言，房东landlord你好！', NULL, '2025-04-23 17:39:14');
INSERT INTO `comment` VALUES (57, 6, '租客5', 1, '这是第5条留言，房东landlord你好！', NULL, '2025-04-22 17:39:14');
INSERT INTO `comment` VALUES (58, 6, '租客6', 1, '这是第6条留言，房东landlord你好！', NULL, '2025-04-21 17:39:14');
INSERT INTO `comment` VALUES (59, 6, '租客7', 1, '这是第7条留言，房东landlord你好！', NULL, '2025-04-20 17:39:14');
INSERT INTO `comment` VALUES (60, 6, '租客8', 1, '这是第8条留言，房东landlord你好！', NULL, '2025-04-19 17:39:14');
INSERT INTO `comment` VALUES (61, 6, '租客9', 1, '这是第9条留言，房东landlord你好！', NULL, '2025-04-18 17:39:14');
INSERT INTO `comment` VALUES (62, 6, '租客10', 1, '这是第10条留言，房东landlord你好！', NULL, '2025-04-17 17:39:14');
INSERT INTO `comment` VALUES (63, 5, '租客1', 1, '这是第1条留言，房东landlord你好！', NULL, '2025-04-26 17:39:14');
INSERT INTO `comment` VALUES (64, 5, '租客2', 1, '这是第2条留言，房东landlord你好！', NULL, '2025-04-25 17:39:14');
INSERT INTO `comment` VALUES (65, 5, '租客3', 1, '这是第3条留言，房东landlord你好！', NULL, '2025-04-24 17:39:14');
INSERT INTO `comment` VALUES (66, 5, '租客4', 1, '这是第4条留言，房东landlord你好！', NULL, '2025-04-23 17:39:14');
INSERT INTO `comment` VALUES (67, 5, '租客5', 1, '这是第5条留言，房东landlord你好！', NULL, '2025-04-22 17:39:14');
INSERT INTO `comment` VALUES (68, 5, '租客6', 1, '这是第6条留言，房东landlord你好！', NULL, '2025-04-21 17:39:14');
INSERT INTO `comment` VALUES (69, 5, '租客7', 1, '这是第7条留言，房东landlord你好！', NULL, '2025-04-20 17:39:14');
INSERT INTO `comment` VALUES (70, 5, '租客8', 1, '这是第8条留言，房东landlord你好！', NULL, '2025-04-19 17:39:14');
INSERT INTO `comment` VALUES (71, 5, '租客9', 1, '这是第9条留言，房东landlord你好！', NULL, '2025-04-18 17:39:14');
INSERT INTO `comment` VALUES (72, 5, '租客10', 1, '这是第10条留言，房东landlord你好！', NULL, '2025-04-17 17:39:14');
INSERT INTO `comment` VALUES (73, 10, '租客1', 1, '这是第1条留言，房东房东C你好！', NULL, '2025-04-26 17:46:06');
INSERT INTO `comment` VALUES (74, 10, '租客2', 1, '这是第2条留言，房东房东C你好！', NULL, '2025-04-25 17:46:06');
INSERT INTO `comment` VALUES (75, 10, '租客3', 1, '这是第3条留言，房东房东C你好！', NULL, '2025-04-24 17:46:06');
INSERT INTO `comment` VALUES (76, 10, '租客4', 1, '这是第4条留言，房东房东C你好！', NULL, '2025-04-23 17:46:06');
INSERT INTO `comment` VALUES (77, 10, '租客5', 1, '这是第5条留言，房东房东C你好！', NULL, '2025-04-22 17:46:06');
INSERT INTO `comment` VALUES (78, 10, '租客6', 1, '这是第6条留言，房东房东C你好！', NULL, '2025-04-21 17:46:06');
INSERT INTO `comment` VALUES (79, 10, '租客7', 1, '这是第7条留言，房东房东C你好！', NULL, '2025-04-20 17:46:06');
INSERT INTO `comment` VALUES (80, 10, '租客8', 1, '这是第8条留言，房东房东C你好！', NULL, '2025-04-19 17:46:06');
INSERT INTO `comment` VALUES (81, 10, '租客9', 1, '这是第9条留言，房东房东C你好！', NULL, '2025-04-18 17:46:06');
INSERT INTO `comment` VALUES (82, 10, '租客10', 1, '这是第10条留言，房东房东C你好！', NULL, '2025-04-17 17:46:06');
INSERT INTO `comment` VALUES (83, 9, '租客1', 1, '这是第1条留言，房东房东B你好！', NULL, '2025-04-26 17:46:06');
INSERT INTO `comment` VALUES (84, 9, '租客2', 1, '这是第2条留言，房东房东B你好！', NULL, '2025-04-25 17:46:06');
INSERT INTO `comment` VALUES (85, 9, '租客3', 1, '这是第3条留言，房东房东B你好！', NULL, '2025-04-24 17:46:06');
INSERT INTO `comment` VALUES (86, 9, '租客4', 1, '这是第4条留言，房东房东B你好！', NULL, '2025-04-23 17:46:06');
INSERT INTO `comment` VALUES (87, 9, '租客5', 1, '这是第5条留言，房东房东B你好！', NULL, '2025-04-22 17:46:06');
INSERT INTO `comment` VALUES (88, 9, '租客6', 1, '这是第6条留言，房东房东B你好！', NULL, '2025-04-21 17:46:06');
INSERT INTO `comment` VALUES (89, 9, '租客7', 1, '这是第7条留言，房东房东B你好！', NULL, '2025-04-20 17:46:06');
INSERT INTO `comment` VALUES (90, 9, '租客8', 1, '这是第8条留言，房东房东B你好！', NULL, '2025-04-19 17:46:06');
INSERT INTO `comment` VALUES (91, 9, '租客9', 1, '这是第9条留言，房东房东B你好！', NULL, '2025-04-18 17:46:06');
INSERT INTO `comment` VALUES (92, 9, '租客10', 1, '这是第10条留言，房东房东B你好！', NULL, '2025-04-17 17:46:06');
INSERT INTO `comment` VALUES (93, 8, '租客1', 1, '这是第1条留言，房东landlord3你好！', NULL, '2025-04-26 17:46:06');
INSERT INTO `comment` VALUES (94, 8, '租客2', 1, '这是第2条留言，房东landlord3你好！', NULL, '2025-04-25 17:46:06');
INSERT INTO `comment` VALUES (95, 8, '租客3', 1, '这是第3条留言，房东landlord3你好！', NULL, '2025-04-24 17:46:06');
INSERT INTO `comment` VALUES (96, 8, '租客4', 1, '这是第4条留言，房东landlord3你好！', NULL, '2025-04-23 17:46:06');
INSERT INTO `comment` VALUES (97, 8, '租客5', 1, '这是第5条留言，房东landlord3你好！', NULL, '2025-04-22 17:46:06');
INSERT INTO `comment` VALUES (98, 8, '租客6', 1, '这是第6条留言，房东landlord3你好！', NULL, '2025-04-21 17:46:06');
INSERT INTO `comment` VALUES (99, 8, '租客7', 1, '这是第7条留言，房东landlord3你好！', NULL, '2025-04-20 17:46:06');
INSERT INTO `comment` VALUES (100, 8, '租客8', 1, '这是第8条留言，房东landlord3你好！', NULL, '2025-04-19 17:46:06');
INSERT INTO `comment` VALUES (101, 8, '租客9', 1, '这是第9条留言，房东landlord3你好！', NULL, '2025-04-18 17:46:06');
INSERT INTO `comment` VALUES (102, 8, '租客10', 1, '这是第10条留言，房东landlord3你好！', NULL, '2025-04-17 17:46:06');
INSERT INTO `comment` VALUES (103, 7, '租客1', 1, '这是第1条留言，房东landlord你好！', NULL, '2025-04-26 17:46:06');
INSERT INTO `comment` VALUES (104, 7, '租客2', 1, '这是第2条留言，房东landlord你好！', NULL, '2025-04-25 17:46:06');
INSERT INTO `comment` VALUES (105, 7, '租客3', 1, '这是第3条留言，房东landlord你好！', NULL, '2025-04-24 17:46:06');
INSERT INTO `comment` VALUES (106, 7, '租客4', 1, '这是第4条留言，房东landlord你好！', NULL, '2025-04-23 17:46:06');
INSERT INTO `comment` VALUES (107, 7, '租客5', 1, '这是第5条留言，房东landlord你好！', NULL, '2025-04-22 17:46:06');
INSERT INTO `comment` VALUES (108, 7, '租客6', 1, '这是第6条留言，房东landlord你好！', NULL, '2025-04-21 17:46:06');
INSERT INTO `comment` VALUES (109, 7, '租客7', 1, '这是第7条留言，房东landlord你好！', NULL, '2025-04-20 17:46:06');
INSERT INTO `comment` VALUES (110, 7, '租客8', 1, '这是第8条留言，房东landlord你好！', NULL, '2025-04-19 17:46:06');
INSERT INTO `comment` VALUES (111, 7, '租客9', 1, '这是第9条留言，房东landlord你好！', NULL, '2025-04-18 17:46:06');
INSERT INTO `comment` VALUES (112, 7, '租客10', 1, '这是第10条留言，房东landlord你好！', NULL, '2025-04-17 17:46:06');
INSERT INTO `comment` VALUES (113, 6, '租客1', 1, '这是第1条留言，房东landlord你好！', NULL, '2025-04-26 17:46:06');
INSERT INTO `comment` VALUES (114, 6, '租客2', 1, '这是第2条留言，房东landlord你好！', NULL, '2025-04-25 17:46:06');
INSERT INTO `comment` VALUES (115, 6, '租客3', 1, '这是第3条留言，房东landlord你好！', NULL, '2025-04-24 17:46:06');
INSERT INTO `comment` VALUES (116, 6, '租客4', 1, '这是第4条留言，房东landlord你好！', NULL, '2025-04-23 17:46:06');
INSERT INTO `comment` VALUES (117, 6, '租客5', 1, '这是第5条留言，房东landlord你好！', NULL, '2025-04-22 17:46:06');
INSERT INTO `comment` VALUES (118, 6, '租客6', 1, '这是第6条留言，房东landlord你好！', NULL, '2025-04-21 17:46:06');
INSERT INTO `comment` VALUES (119, 6, '租客7', 1, '这是第7条留言，房东landlord你好！', NULL, '2025-04-20 17:46:06');
INSERT INTO `comment` VALUES (120, 6, '租客8', 1, '这是第8条留言，房东landlord你好！', NULL, '2025-04-19 17:46:06');
INSERT INTO `comment` VALUES (121, 6, '租客9', 1, '这是第9条留言，房东landlord你好！', NULL, '2025-04-18 17:46:06');
INSERT INTO `comment` VALUES (122, 6, '租客10', 1, '这是第10条留言，房东landlord你好！', NULL, '2025-04-17 17:46:06');
INSERT INTO `comment` VALUES (123, 5, '租客1', 1, '这是第1条留言，房东landlord你好！', NULL, '2025-04-26 17:46:06');
INSERT INTO `comment` VALUES (124, 5, '租客2', 1, '这是第2条留言，房东landlord你好！', NULL, '2025-04-25 17:46:06');
INSERT INTO `comment` VALUES (125, 5, '租客3', 1, '这是第3条留言，房东landlord你好！', NULL, '2025-04-24 17:46:06');
INSERT INTO `comment` VALUES (126, 5, '租客4', 1, '这是第4条留言，房东landlord你好！', NULL, '2025-04-23 17:46:06');
INSERT INTO `comment` VALUES (127, 5, '租客5', 1, '这是第5条留言，房东landlord你好！', NULL, '2025-04-22 17:46:06');
INSERT INTO `comment` VALUES (128, 5, '租客6', 1, '这是第6条留言，房东landlord你好！', NULL, '2025-04-21 17:46:06');
INSERT INTO `comment` VALUES (129, 5, '租客7', 1, '这是第7条留言，房东landlord你好！', NULL, '2025-04-20 17:46:06');
INSERT INTO `comment` VALUES (130, 5, '租客8', 1, '这是第8条留言，房东landlord你好！', NULL, '2025-04-19 17:46:06');
INSERT INTO `comment` VALUES (131, 5, '租客9', 1, '这是第9条留言，房东landlord你好！', NULL, '2025-04-18 17:46:06');
INSERT INTO `comment` VALUES (132, 5, '租客10', 1, '这是第10条留言，房东landlord你好！', NULL, '2025-04-17 17:46:06');
INSERT INTO `comment` VALUES (133, 6, 'qwe', 1, 'ggg', NULL, '2025-04-26 18:55:38');
INSERT INTO `comment` VALUES (134, 5, 'qwe', 1, 'ya', NULL, '2025-04-26 19:03:47');
INSERT INTO `comment` VALUES (135, 5, 'qwe', 1, 'zg', NULL, '2025-04-26 19:14:14');
INSERT INTO `comment` VALUES (136, 5, 'qwe', 1, 'fff', NULL, '2025-04-26 19:16:53');
INSERT INTO `comment` VALUES (137, 5, 'qwe', 1, 'www', NULL, '2025-04-26 19:17:00');
INSERT INTO `comment` VALUES (138, 10, 'man', 1, 'hello', NULL, '2025-05-18 17:23:38');

-- ----------------------------
-- Table structure for contract
-- ----------------------------
DROP TABLE IF EXISTS `contract`;
CREATE TABLE `contract`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `rentValue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `purpose` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `startDate` datetime NULL DEFAULT NULL,
  `endDate` datetime NULL DEFAULT NULL,
  `landlordName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `landlordId` int NULL DEFAULT NULL,
  `landlordPhone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tenantName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tenantId` int NULL DEFAULT NULL,
  `tenantPhone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `formattedRent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `currentDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of contract
-- ----------------------------
INSERT INTO `contract` VALUES (1, '10251', '居住', '2025-04-30 16:00:00', '2025-05-30 16:00:00', '', NULL, '', '', NULL, '', '壹万零仟贰佰伍拾壹元整', '2025-05-18 00:00:00');
INSERT INTO `contract` VALUES (2, '3200', '办公', '2025-04-30 16:00:00', '2025-05-01 16:00:00', '', NULL, '', '', NULL, '', '叁仟贰佰零拾零元整', '2025-05-23 00:00:00');
INSERT INTO `contract` VALUES (3, '3200', '居住', '2025-05-29 16:00:00', '2025-05-30 16:00:00', '张先生', NULL, '13800001234', '', NULL, '', '叁仟贰佰零拾零元整', '2025-05-23 00:00:00');
INSERT INTO `contract` VALUES (4, '3200', '居住', '2025-05-08 16:00:00', '2025-05-30 16:00:00', '张先生', NULL, '13800001234', '', NULL, '', '叁仟贰佰零拾零元整', '2025-05-23 00:00:00');
INSERT INTO `contract` VALUES (5, '3200', '居住', '2025-05-22 16:00:00', '2025-05-30 16:00:00', '张先生', NULL, '13800001234', '', NULL, '', '叁仟贰佰零拾零元整', '2025-05-23 00:00:00');
INSERT INTO `contract` VALUES (6, '3200', '居住', '2025-04-30 16:00:00', '2025-05-30 16:00:00', '张先生', NULL, '13800001234', '', NULL, '', '叁仟贰佰零拾零元整', '2025-05-23 00:00:00');
INSERT INTO `contract` VALUES (7, '3200', '居住', '2025-05-29 16:00:00', '2025-08-14 16:00:00', '龟壳公寓', NULL, '13800005678', '', NULL, '', '叁仟贰佰零拾零元整', '2025-05-26 00:00:00');
INSERT INTO `contract` VALUES (8, '3200', '办公', '2025-05-23 16:00:00', '2025-05-30 16:00:00', '龟壳公寓', NULL, '13800005678', '', NULL, '', '叁仟贰佰零拾零元整', '2025-05-26 00:00:00');
INSERT INTO `contract` VALUES (9, '3200', '办公', '2025-04-30 16:00:00', '2025-05-01 16:00:00', '张先生', NULL, '13800001234', '', NULL, '', '叁仟贰佰零拾零元整', '2025-05-26 00:00:00');
INSERT INTO `contract` VALUES (10, '3200', '居住', '2025-05-08 16:00:00', '2025-05-01 16:00:00', '丁先生', NULL, '15612340015', '', NULL, '', '叁仟贰佰零拾零元整', '2025-05-29 00:00:00');
INSERT INTO `contract` VALUES (11, '3200', '居住', '2025-05-08 16:00:00', '2025-05-01 16:00:00', '丁先生', NULL, '15612340015', '', NULL, '', '叁仟贰佰零拾零元整', '2025-05-29 00:00:00');
INSERT INTO `contract` VALUES (12, '3200', '居住', '2025-05-08 16:00:00', '2025-05-29 16:00:00', '张先生', NULL, '13800001234', '', NULL, '', '叁仟贰佰零拾零元整', '2025-05-29 00:00:00');
INSERT INTO `contract` VALUES (13, '3200', '居住', '2025-05-09 16:00:00', '2025-05-23 16:00:00', '刘先生', NULL, '13612340005', '', NULL, '', '叁仟贰佰零拾零元整', '2025-05-30 00:00:00');
INSERT INTO `contract` VALUES (14, '3200', '居住', '2025-06-30 16:00:00', '2025-07-30 16:00:00', '陈先生', NULL, '18712340025', '', NULL, '', '叁仟贰佰零拾零元整', '2025-05-31 00:00:00');
INSERT INTO `contract` VALUES (15, '3200', '居住', '2025-06-30 16:00:00', '2025-07-30 16:00:00', '陈先生', NULL, '18712340025', '', NULL, '', '叁仟贰佰零拾零元整', '2025-05-31 00:00:00');
INSERT INTO `contract` VALUES (16, '3200', '居住', '2025-06-30 16:00:00', '2025-07-30 16:00:00', '陈先生', NULL, '18712340025', '', NULL, '', '叁仟贰佰零拾零元整', '2025-05-31 00:00:00');
INSERT INTO `contract` VALUES (18, '3200', '居住', '2025-06-30 16:00:00', '2025-07-30 16:00:00', '陈先生', 1, '18712340025', 'Ylfmoonn', NULL, '', '叁仟贰佰零拾零元整', '2025-05-31 00:00:00');
INSERT INTO `contract` VALUES (19, '3200', '办公', '2025-06-30 16:00:00', '2025-07-30 16:00:00', '张女士', 2, '18212340021', 'Ylfmoonn', NULL, '', '叁仟贰佰零拾零元整', '2025-05-31 00:00:00');
INSERT INTO `contract` VALUES (20, '3200', '居住', '2025-07-31 16:00:00', '2025-08-30 16:00:00', '刘先生', 3, '13612340005', 'Ylfmoonn', NULL, '', '叁仟贰佰零拾零元整', '2025-05-31 00:00:00');
INSERT INTO `contract` VALUES (21, '3200', '居住', '2025-05-31 16:00:00', '2025-06-29 16:00:00', '张先生', 37, '13800001234', 'Ylfmoonn', NULL, '', '叁仟贰佰零拾零元整', '2025-06-20 00:00:00');

-- ----------------------------
-- Table structure for house_detail
-- ----------------------------
DROP TABLE IF EXISTS `house_detail`;
CREATE TABLE `house_detail`  (
  `detail_id` int NOT NULL AUTO_INCREMENT COMMENT '详情表主键ID',
  `house_info_id` int UNSIGNED NOT NULL COMMENT '关联的 house_info 表主键ID',
  `photos` json NULL COMMENT '房源详情图片URL列表 (JSON格式, 例如: [\"url1.jpg\", \"url2.png\"])',
  `facilities` json NULL COMMENT '配套设施 (JSON格式, 例如: {\"wifi\": true, \"tv\": true, \"washer\": \"洗衣机\"})',
  `map_coordinates` json NULL COMMENT '地图坐标 (JSON格式, 例如: {\"latitude\": 30.123456, \"longitude\": 120.654321, \"address\": \"详细地址\"})',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`detail_id`) USING BTREE,
  UNIQUE INDEX `house_info_id`(`house_info_id` ASC) USING BTREE,
  CONSTRAINT `fk_house_detail_to_house_info` FOREIGN KEY (`house_info_id`) REFERENCES `house_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '房源详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of house_detail
-- ----------------------------
INSERT INTO `house_detail` VALUES (1, 1, '[\"https://images.unsplash.com/photo-1506744038136-46273834b3fb\", \"https://images.unsplash.com/photo-1494526585095-c41746248156\", \"https://images.unsplash.com/photo-1470770841072-f978cf4d019e\"]', '{\"tv\": true, \"wifi\": true, \"washer\": \"洗衣机\"}', '222', '2025-05-22 21:32:16', '2025-05-22 21:34:28');
INSERT INTO `house_detail` VALUES (2, 2, '[\"https://flaskhousesystem.oss-cn-hangzhou.aliyuncs.com/house_images/3/82d3513094144b92abfe5a20419d82e9.png\", \"https://flaskhousesystem.oss-cn-hangzhou.aliyuncs.com/house_images/4/a1e68eda3df44341b55a3beea55dda84.png\", \"https://i.pinimg.com/736x/f4/2c/7b/f42c7b16d92dab70ff7af2b59d02fdb5.jpg\"]', '{\"tv\": true, \"wifi\": true, \"washer\": true}', '222', '2025-05-22 23:37:15', '2025-05-22 23:37:33');

-- ----------------------------
-- Table structure for house_info
-- ----------------------------
DROP TABLE IF EXISTS `house_info`;
CREATE TABLE `house_info`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题，如：整租·锦源小区 2室1厅 南',
  `region` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '区，如：雨花',
  `block` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '街道，如：树木岭',
  `community` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '小区，如：锦源小区',
  `area` float NULL DEFAULT NULL COMMENT '面积，单位㎡',
  `direction` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '朝向，如：南',
  `rooms` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '几室几厅，如：2室1厅1卫',
  `price` int NULL DEFAULT NULL COMMENT '价格，单位：元/月',
  `rent_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '租赁方式，如：整租、合租',
  `decoration` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '装修情况，如：精装',
  `subway` tinyint(1) NULL DEFAULT 0 COMMENT '是否近地铁',
  `available` tinyint(1) NULL DEFAULT 1 COMMENT '是否随时看房',
  `tag_new` tinyint(1) NULL DEFAULT 0 COMMENT '是否新上',
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '房源图片',
  `publish_time` date NULL DEFAULT NULL COMMENT '发布时间，如：2天前',
  `page_views` int NULL DEFAULT NULL COMMENT '浏览量',
  `landlord` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '房东',
  `phone_num` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '房东电话',
  `house_num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '房源编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of house_info
-- ----------------------------
INSERT INTO `house_info` VALUES (1, '整租·锦源小区 2室1厅 南', '雨花', '树木岭', '锦源小区', 73, '南', '2室1厅1卫', 1600, '整租', '精装', 1, 1, 1, 'https://i.pinimg.com/736x/c4/3a/90/c43a90fcf336e05d7f849b527f067464.jpg', '2025-05-15', 110, '张先生', '13800001234', '10001');
INSERT INTO `house_info` VALUES (2, '合租·泰时新雅园 4居室 南卧', '芙蓉', '晚报', '泰时新雅园', 18, '南', '4室2厅2卫', 580, '合租', '精装', 1, 1, 0, 'https://i.pinimg.com/736x/f4/2c/7b/f42c7b16d92dab70ff7af2b59d02fdb5.jpg', '2025-05-14', 899, '龟壳公寓', '13800005678', '10002');
INSERT INTO `house_info` VALUES (3, '整租·星宇V立方 1室0厅 南', '天心', '金盆岭', '星宇V立方', 29.14, '南', '1室0厅1卫', 1280, '整租', '精装', 1, 1, 1, 'https://flaskhousesystem.oss-cn-hangzhou.aliyuncs.com/house_images/3/82d3513094144b92abfe5a20419d82e9.png', '2025-05-15', 72, '李女士', '13800007890', '10003');
INSERT INTO `house_info` VALUES (4, '合租·长远华樟名府 5居室 南卧', '雨花', '尚东', '长远华樟名府', 25, '南', '5室1厅3卫', 540, '合租', '精装', 1, 1, 1, 'https://flaskhousesystem.oss-cn-hangzhou.aliyuncs.com/house_images/4/a1e68eda3df44341b55a3beea55dda84.png', '2025-05-14', 61, '包租婆宿懒公寓', '13800009876', '10004');
INSERT INTO `house_info` VALUES (5, '整租·长大彩虹都 3室2厅 南/北', '天心', '铁道学院', '长大彩虹都', 90, '南/北', '3室2厅1卫', 1900, '整租', '精装', 1, 1, 0, 'https://flaskhousesystem.oss-cn-hangzhou.aliyuncs.com/house_images/5/f670c3336dce42a7b1a12850e4948a6f.png', '2025-05-17', 0, '房东直租', '18800000005', '10005');
INSERT INTO `house_info` VALUES (6, '合租·山水华景 5居室 南卧', '芙蓉', '马王堆', '山水华景', 25, '南', '5室1厅2卫', 849, '合租', '精装', 0, 1, 0, 'https://ke-image.ljcdn.com/wanjia/885e92fd2470add49f2c29ce7824562c-1743474437330/458004f9fa46b67b17d8e69c543c97e5.jpg.250x182.jpg', '2025-05-15', 0, '长沙鸿威公寓', '18800000006', '10006');
INSERT INTO `house_info` VALUES (7, '整租·国税局 3室2厅 南', '天心', '书院路', '国税局', 120, '南', '3室2厅2卫', 2600, '整租', '精装', 1, 1, 1, 'https://ke-image.ljcdn.com/110000-inspection/pc1_FDoD4Qv0H.jpg!m_fill,w_250,h_182,l_fbk,o_auto', '2025-05-17', 0, '房东直租', '18800000007', '10007');
INSERT INTO `house_info` VALUES (8, '合租·运通尊苑 5居室 南卧', '芙蓉', '马王堆', '运通尊苑', 22, '南', '5室1厅2卫', 499, '合租', '精装', 1, 1, 0, 'https://ke-image.ljcdn.com/wanjia/885e92fd2470add49f2c29ce7824562c-1744075290085/1ae441cdb24ea2e1337c8d898dadd212.jpg.250x182.jpg', '2025-05-15', 0, '长沙鸿威公寓', '18800000008', '10008');
INSERT INTO `house_info` VALUES (17, '整租·星城国际 2室1厅 南', '长沙县', '泉塘', '星城国际', 94, '南', '2室1厅', 1300, '整租', '精装', 0, 1, 1, 'https://ke-image.ljcdn.com/110000-inspection/pc1_uDfVpz1x0.jpg!m_fill,w_250,h_182,l_fbk,o_auto', '2025-05-18', 345, '李公寓', '13812340001', '2034863457987198976');
INSERT INTO `house_info` VALUES (18, '独栋·冠寓 长沙大王山二店 端午节假特惠长租首月温馨单间/无中介/押一付一/学生特惠/拎包入住 1室1厅', NULL, NULL, NULL, 25, NULL, '1室1厅', 1082, '整租', '精装', 1, 1, 0, 'https://ke-image.ljcdn.com/wanjia/a2725a504f8355b0dc85a1a5f063dd14-1730705081114/7faa52b57e5b39bc5b683179bb40dc94.jpg.250x182.jpg', '2025-05-07', 762, '冠寓', '15012340002', '81148');
INSERT INTO `house_info` VALUES (19, '整租·星语林名园 4室2厅 南/北', '雨花', '铁道学院', '星语林名园', 161, '南/北', '4室2厅', 2400, '整租', '精装', 0, 1, 1, 'https://ke-image.ljcdn.com/110000-inspection/pc1_3zywCsF31.jpg!m_fill,w_250,h_182,l_fbk,o_auto', '2025-05-18', 189, '张之家', '13912340003', '2034860054812819456');
INSERT INTO `house_info` VALUES (20, '独栋·长鸿公寓 袁家岭火车站店 袁家岭 火车站 精装公寓 （不短租） 1室1厅', NULL, NULL, NULL, 30, NULL, '1室1厅', 1280, '整租', '精装', 1, 1, 0, 'https://ke-image.ljcdn.com/wanjia/d39c5e560eeab606c45f04f631121b29-1700222454743/7c243ce3a83b979fea41c96a4f928366.jpg.250x182.jpg', '2025-05-09', 488, '长鸿公寓', '13712340004', '70636');
INSERT INTO `house_info` VALUES (21, '整租·2076至高点 1室1厅 东', '雨花', '左家塘', '2076至高点', 41, '东', '1室1厅', 1100, '整租', '精装', 0, 1, 1, 'https://ke-image.ljcdn.com/110000-inspection/pc1_5rbWll83U.jpg!m_fill,w_250,h_182,l_fbk,o_auto', '2025-05-19', 972, '刘先生', '13612340005', '2024412686569177088');
INSERT INTO `house_info` VALUES (22, '独栋·原宿奢宅 北辰定江洋 定江洋2-2007 3室2厅', NULL, NULL, NULL, 200, NULL, '3室2厅', 15800, '整租', '精装', 0, 1, 1, 'https://ke-image.ljcdn.com/wanjia/970ac731d8b27629750e6bbe1321eaf8-1747299807893/b534223a79a3f52a05fc48b95d65531b.jpg.250x182.jpg', '2025-05-16', 1503, '原宿奢宅', '13512340006', '92368');
INSERT INTO `house_info` VALUES (23, '整租·中海阅溪府 3室2厅 南', '岳麓', '东方红', '中海阅溪府', 112, '南', '3室2厅', 3200, '整租', '精装', 1, 1, 1, 'https://ke-image.ljcdn.com/110000-inspection/pc1_a9nlH8ZdH.jpg!m_fill,w_250,h_182,l_fbk,o_auto', '2025-05-18', 622, '杨女士', '13412340007', '2034617752949358592');
INSERT INTO `house_info` VALUES (24, '独栋·包租婆HOUSE 名富公寓 无中介 开福寺地铁口 华创 湘雅附一 名富公寓 押一付一 1室1厅', NULL, NULL, NULL, 33, NULL, '1室1厅', 1450, '整租', '精装', 1, 1, 1, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-14', 881, '包租婆HOUSE', '13312340008', '91901');
INSERT INTO `house_info` VALUES (25, '整租·黄金一区 1室1厅 南', '望城', '望城区', '黄金一区', 47, '南', '1室1厅', 1100, '整租', '精装', 0, 1, 1, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-19', 205, '赵租房', '13212340009', '2033823854522007552');
INSERT INTO `house_info` VALUES (26, '独栋·包租婆宿懒公寓 保利天禧 不短租 无中介可月付 六沟垅地铁万达广场 山姆超市 1室1厅', NULL, NULL, NULL, 35, NULL, '1室1厅', 1801, '整租', '精装', 1, 1, 0, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-17', 1130, '包租婆宿懒公寓', '13112340010', '89307');
INSERT INTO `house_info` VALUES (27, '整租·楚天世纪城 3室2厅 南', '长沙县', '泉塘', '楚天世纪城', 92, '南', '3室2厅', 1950, '整租', '精装', 0, 1, 0, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-19', 450, '吴先生', '15112340011', '2025545561456771072');
INSERT INTO `house_info` VALUES (28, '独栋·包租婆宿懒公寓 保利天禧 一线江景 不短租 近六沟垅地铁 山姆超市 万象城 可月付无中介 2室1厅', NULL, NULL, NULL, 38, NULL, '2室1厅', 2750, '整租', '精装', 1, 1, 0, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-17', 1302, '包租婆宿懒公寓', '15212340012', '89307');
INSERT INTO `house_info` VALUES (29, '整租·泊富骊庭 3室1厅 南', '天心', '铁道学院', '泊富骊庭', 95, '南', '3室1厅', 2400, '整租', '精装', 0, 1, 0, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-18', 693, '周公寓', '15312340013', '2010950629303779328');
INSERT INTO `house_info` VALUES (30, '独栋·穗露公寓 湘江悦城 无中介费 湘江悦城精装四房 全长沙整租房源 4室2厅', NULL, NULL, NULL, 140, NULL, '4室2厅', 3000, '整租', '精装', 1, 1, 0, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-13', 1008, '穗露公寓', '15512340014', '70270');
INSERT INTO `house_info` VALUES (31, '整租·尚鑫海悦 1室0厅 南/北', '长沙县', '开元路', '尚鑫海悦', 28, '南/北', '1室0厅', 1200, '整租', '简装', 1, 1, 0, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-18', 312, '丁先生', '15612340015', '1936725279640649728');
INSERT INTO `house_info` VALUES (32, '整租·润和湘江天地 1室1厅 南', '望城', '金星北', '润和湘江天地', 109, '南', '1室1厅', 1500, '整租', '精装', 1, 1, 0, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-19', 560, '孙女士', '15712340016', '2004420834805940224');
INSERT INTO `house_info` VALUES (33, '整租·公交金盆小区 2室2厅 南', '天心', '金盆岭', '公交金盆小区', 70, '南', '2室2厅', 1560, '整租', '精装', 0, 1, 1, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-14', 788, '朱公寓', '15812340017', '2028676655848882176');
INSERT INTO `house_info` VALUES (34, '独栋·穗露公寓 润和天地印湘江 整租 越秀湘江星汇城豪装大平层 全长沙都有房源 4室2厅', NULL, NULL, NULL, 186, NULL, '4室2厅', 6600, '整租', '精装', 1, 1, 0, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-18', 1403, '穗露公寓', '15912340018', '53017');
INSERT INTO `house_info` VALUES (35, '整租·旺德府恺悦国际 3室2厅 东', '长沙县', '月湖', '旺德府恺悦国际', 99, '东', '3室2厅', 2200, '整租', '精装', 0, 1, 0, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-17', 821, '何之家', '18012340019', '1982314656307347456');
INSERT INTO `house_info` VALUES (36, '整租·桂芳家园 3室2厅 东南', '望城', '望城区', '桂芳家园', 110, '东南', '3室2厅', 1600, '整租', '精装', 0, 1, 1, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-16', 670, '王先生', '18112340020', '2033406282563584000');
INSERT INTO `house_info` VALUES (37, '整租·世锦家和院 3室2厅 南', '长沙县', '开元路', '世锦家和院', 80, '南', '3室2厅', 1800, '整租', '精装', 1, 1, 1, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-17', 906, '张女士', '18212340021', '2034515051976589312');
INSERT INTO `house_info` VALUES (38, '合租·保利麓谷林语D区 4居室 南卧', '岳麓', '麓谷西', '保利麓谷林语D区', 28, '南卧', '4居室', 799, '合租', '精装', 1, 1, 1, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-18', 455, '美美公寓', '18312340022', '2034904158825349120');
INSERT INTO `house_info` VALUES (39, '整租·名都花园 3室2厅 南', '雨花', '赤岗冲', '名都花园', 141, '南', '3室2厅', 2700, '整租', '精装', 0, 1, 1, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-17', 1029, '刘公寓', '18512340023', '2032671830451421184');
INSERT INTO `house_info` VALUES (40, '合租·博林金谷 4居室 南卧', '天心', '新开铺', '博林金谷', 28, '南卧', '4居室', 1150, '合租', '精装', 1, 1, 0, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-16', 723, '快聚租公寓', '18612340024', '2026514311534346240');
INSERT INTO `house_info` VALUES (41, '整租·碧桂园翘楚棠 4室2厅 南', '长沙县', '万家丽北', '碧桂园翘楚棠', 138.9, '南', '4室2厅', 2750, '整租', '精装', 1, 1, 0, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-19', 999, '陈先生', '18712340025', '2009581722345144320');
INSERT INTO `house_info` VALUES (42, '合租·东方新城 5居室 南卧', '芙蓉', '德政园', '东方新城', 18, '南卧', '5居室', 599, '合租', '毛坯', 1, 1, 0, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-19', 302, '长沙鸿威公寓', '18812340026', '2004451401635201024');
INSERT INTO `house_info` VALUES (43, '整租·北辰中央公园(慧辰园) 2室2厅 南', '天心', '省政府', '北辰中央公园(慧辰园)', 95, '南', '2室2厅', 3000, '整租', '精装', 0, 1, 1, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-19', 1201, '杨公寓', '18912340027', '2010951165017063424');
INSERT INTO `house_info` VALUES (44, '独栋·湘江悦家 麓隐桐溪·大王山店 3号线大王山正地铁口/开业特惠95折/无中介/无服务费A 开间', NULL, NULL, NULL, 37.28, NULL, '1室0厅1卫', 1220, '整租', '精装', 1, 1, 0, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-01', 805, '湘江悦家', '19012340028', '84585');
INSERT INTO `house_info` VALUES (45, '整租·融城花苑 3室2厅 南', '雨花', '井湾子', '融城花苑', 99, '南', '3室2厅', 1300, '整租', '精装', 0, 1, 0, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-19', 500, '赵先生', '19112340029', '1884114366576459776');
INSERT INTO `house_info` VALUES (46, '独栋·华佑e家 万国城店 无中介费可月付 润和珠江星环马厂地铁站 万国城两室 2室2厅', NULL, NULL, '楚天世纪城', 76, NULL, '2室2厅', 2208, '整租', '精装', 1, 1, 1, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-19', 1152, '华佑e家', '19212340030', '92145');

-- ----------------------------
-- Table structure for log_entries
-- ----------------------------
DROP TABLE IF EXISTS `log_entries`;
CREATE TABLE `log_entries`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NULL DEFAULT NULL,
  `level` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `module` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `func_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `line_no` int NULL DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `traceback` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1132 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of log_entries
-- ----------------------------
INSERT INTO `log_entries` VALUES (1, '2025-05-09 14:29:19', '3', '4', '5', 7, '9', '0');
INSERT INTO `log_entries` VALUES (2, '2025-05-30 06:40:50', 'WARNING', '_internal', '_log', 97, 'Werkzeug appears to be used in a production deployment. Consider switching to a production web server instead.', NULL);
INSERT INTO `log_entries` VALUES (3, '2025-05-30 06:40:50', 'INFO', '_internal', '_log', 97, '[31m[1mWARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.[0m\n * Running on http://127.0.0.1:5000', NULL);
INSERT INTO `log_entries` VALUES (4, '2025-05-30 06:40:50', 'INFO', '_internal', '_log', 97, '[33mPress CTRL+C to quit[0m', NULL);
INSERT INTO `log_entries` VALUES (5, '2025-05-30 06:40:50', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (6, '2025-05-30 06:40:51', 'WARNING', '_internal', '_log', 97, 'Werkzeug appears to be used in a production deployment. Consider switching to a production web server instead.', NULL);
INSERT INTO `log_entries` VALUES (7, '2025-05-30 06:40:51', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (8, '2025-05-30 06:40:51', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 126-592-097', NULL);
INSERT INTO `log_entries` VALUES (9, '2025-05-30 06:42:05', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 14:42:05] \"[32mGET /admin/logs HTTP/1.1[0m\" 308 -', NULL);
INSERT INTO `log_entries` VALUES (10, '2025-05-30 06:42:05', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 14:42:05] \"GET /admin/logs/ HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (11, '2025-05-30 06:42:45', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 14:42:44] \"GET /housedetail/2 HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (12, '2025-05-30 06:43:50', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 14:43:49] \"GET /houseinfo/hotLists HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (13, '2025-05-30 06:43:50', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 14:43:49] \"GET /houseinfo/newLists HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (14, '2025-05-30 06:43:50', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 14:43:50] \"GET /complaint-persons HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (15, '2025-05-30 06:45:11', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 14:45:11] \"GET /houseinfo/ HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (16, '2025-05-30 06:45:30', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 14:45:29] \"GET /news HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (17, '2025-05-30 06:46:03', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 14:46:02] \"OPTIONS /news HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (18, '2025-05-30 06:46:03', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 14:46:03] \"[35m[1mPOST /news HTTP/1.1[0m\" 201 -', NULL);
INSERT INTO `log_entries` VALUES (19, '2025-05-30 06:46:21', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 14:46:20] \"GET /houseinfo/piedata HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (20, '2025-05-30 06:46:22', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 14:46:22] \"GET /houseinfo/columndata HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (21, '2025-05-30 06:47:19', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 14:47:18] \"[32mGET /admin/logs HTTP/1.1[0m\" 308 -', NULL);
INSERT INTO `log_entries` VALUES (22, '2025-05-30 06:47:19', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 14:47:18] \"GET /admin/logs/ HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (23, '2025-05-30 06:53:39', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 14:53:39] \"GET /complaint-persons HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (24, '2025-05-30 06:53:50', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 14:53:49] \"GET /complaint-persons HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (25, '2025-05-30 06:53:51', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 14:53:51] \"GET /complaint-persons HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (26, '2025-05-30 06:53:52', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 14:53:51] \"[32mGET /admin/logs HTTP/1.1[0m\" 308 -', NULL);
INSERT INTO `log_entries` VALUES (27, '2025-05-30 06:53:52', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 14:53:51] \"GET /houseinfo/piedata HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (28, '2025-05-30 06:53:52', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 14:53:51] \"GET /admin/logs/ HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (29, '2025-05-30 06:53:53', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 14:53:52] \"GET /houseinfo/columndata HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (30, '2025-05-30 06:54:11', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 14:54:11] \"GET /admin/logs/ HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (31, '2025-05-30 06:54:32', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 14:54:32] \"GET /admin/logs/ HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (32, '2025-05-30 06:56:32', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 14:56:32] \"GET /admin/logs/ HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (33, '2025-05-30 06:56:42', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 14:56:42] \"GET /complaint-persons HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (34, '2025-05-30 06:56:43', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 14:56:42] \"GET /houseinfo/piedata HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (35, '2025-05-30 06:56:43', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 14:56:42] \"GET /admin/logs/ HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (36, '2025-05-30 06:56:43', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 14:56:43] \"GET /houseinfo/columndata HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (37, '2025-05-30 06:57:59', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 14:57:58] \"GET /complaint-persons HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (38, '2025-05-30 06:57:59', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 14:57:58] \"GET /houseinfo/piedata HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (39, '2025-05-30 06:57:59', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 14:57:58] \"GET /admin/logs/ HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (40, '2025-05-30 06:58:00', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 14:57:59] \"GET /houseinfo/columndata HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (41, '2025-05-30 07:02:49', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 15:02:49] \"[32mGET /admin/logs HTTP/1.1[0m\" 308 -', NULL);
INSERT INTO `log_entries` VALUES (42, '2025-05-30 07:02:49', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 15:02:49] \"GET /admin/logs/ HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (43, '2025-05-30 07:07:48', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 15:07:48] \"GET /admin/logs/ HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (44, '2025-05-30 07:08:11', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 15:08:10] \"GET /complaint-persons HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (45, '2025-05-30 07:08:11', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 15:08:11] \"GET /houseinfo/piedata HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (46, '2025-05-30 07:08:12', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 15:08:11] \"GET /admin/logs/ HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (47, '2025-05-30 07:08:12', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 15:08:12] \"GET /houseinfo/columndata HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (48, '2025-05-30 07:08:22', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 15:08:22] \"GET /admin/logs/ HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (49, '2025-05-30 07:08:50', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 15:08:50] \"GET /complaint-persons HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (50, '2025-05-30 07:08:51', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 15:08:50] \"GET /houseinfo/piedata HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (51, '2025-05-30 07:08:51', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 15:08:50] \"GET /admin/logs/ HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (52, '2025-05-30 07:08:51', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 15:08:51] \"GET /houseinfo/columndata HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (53, '2025-05-30 07:09:23', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 15:09:23] \"GET /complaint-persons HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (54, '2025-05-30 07:09:23', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 15:09:23] \"GET /houseinfo/piedata HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (55, '2025-05-30 07:09:23', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 15:09:23] \"GET /admin/logs/ HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (56, '2025-05-30 07:09:24', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 15:09:24] \"GET /houseinfo/columndata HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (57, '2025-05-30 07:10:31', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 15:10:30] \"GET /admin/logs/ HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (58, '2025-05-30 07:10:37', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 15:10:37] \"GET /admin/logs/ HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (59, '2025-05-30 07:16:46', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 15:16:45] \"GET /admin/logs/ HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (60, '2025-05-30 07:16:47', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 15:16:47] \"GET /admin/logs/ HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (61, '2025-05-30 07:16:49', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 15:16:48] \"GET /admin/logs/ HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (62, '2025-05-30 07:18:07', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 15:18:07] \"GET /admin/logs/ HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (63, '2025-05-30 07:18:13', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 15:18:12] \"GET /admin/logs/ HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (64, '2025-05-30 07:28:08', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 15:28:08] \"GET /complaint-persons HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (65, '2025-05-30 07:28:09', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 15:28:08] \"GET /houseinfo/piedata HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (66, '2025-05-30 07:28:09', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 15:28:08] \"GET /admin/logs/ HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (67, '2025-05-30 07:28:09', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 15:28:09] \"GET /houseinfo/columndata HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (68, '2025-05-30 07:28:26', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 15:28:26] \"GET /admin/logs/ HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (69, '2025-05-30 07:28:29', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 15:28:29] \"GET /complaint-persons HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (70, '2025-05-30 07:28:30', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 15:28:29] \"GET /houseinfo/piedata HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (71, '2025-05-30 07:28:30', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 15:28:29] \"GET /admin/logs/ HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (72, '2025-05-30 07:28:30', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 15:28:30] \"GET /houseinfo/columndata HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (73, '2025-05-30 07:30:34', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 15:30:33] \"GET /admin/logs/ HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (74, '2025-05-30 07:37:47', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 15:37:46] \"GET /admin/logs/ HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (75, '2025-05-30 07:37:50', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 15:37:50] \"GET /admin/logs/ HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (76, '2025-05-30 07:39:32', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 15:39:32] \"GET /complaint-persons HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (77, '2025-05-30 07:39:33', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 15:39:32] \"GET /houseinfo/piedata HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (78, '2025-05-30 07:39:33', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 15:39:32] \"GET /admin/logs/ HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (79, '2025-05-30 07:39:33', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 15:39:33] \"GET /houseinfo/columndata HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (80, '2025-05-30 07:40:50', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 15:40:49] \"GET /admin/logs/ HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (81, '2025-05-30 07:41:21', 'INFO', '_internal', '_log', 97, '127.0.0.1 - - [30/May/2025 15:41:21] \"GET /admin/logs/ HTTP/1.1\" 200 -', NULL);
INSERT INTO `log_entries` VALUES (82, '2025-05-30 14:10:31', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (83, '2025-05-30 14:10:32', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (84, '2025-05-30 14:10:32', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (85, '2025-05-30 14:10:52', 'ERROR', 'houseinfo', 'get_all_house_infos', 281, '查询房源时发生未知错误: Client sent AUTH, but no password is set', NULL);
INSERT INTO `log_entries` VALUES (86, '2025-05-30 14:12:22', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (87, '2025-05-30 14:12:23', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (88, '2025-05-30 14:12:23', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (89, '2025-05-30 14:12:37', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (90, '2025-05-30 14:12:38', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (91, '2025-05-30 14:12:38', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (92, '2025-05-30 14:12:50', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (93, '2025-05-30 14:12:51', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (94, '2025-05-30 14:12:51', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (95, '2025-05-30 14:12:55', 'ERROR', 'houseinfo', 'get_all_house_infos', 281, '查询房源时发生未知错误: Client sent AUTH, but no password is set', NULL);
INSERT INTO `log_entries` VALUES (96, '2025-05-30 14:16:25', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (97, '2025-05-30 14:16:26', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (98, '2025-05-30 14:16:26', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (99, '2025-05-30 14:19:34', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (100, '2025-05-30 14:19:35', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (101, '2025-05-30 14:19:35', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (102, '2025-05-30 14:21:40', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (103, '2025-05-30 14:21:41', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (104, '2025-05-30 14:21:41', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (105, '2025-05-30 14:24:00', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack1\\\\exts\\\\cors.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (106, '2025-05-30 14:24:00', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (107, '2025-05-30 14:24:02', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (108, '2025-05-30 14:24:02', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (109, '2025-05-30 14:35:58', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (110, '2025-05-30 14:35:59', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (111, '2025-05-30 14:35:59', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (112, '2025-05-31 04:18:03', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (113, '2025-05-31 04:18:05', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (114, '2025-05-31 04:18:05', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (115, '2025-05-31 04:21:13', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (116, '2025-05-31 04:21:15', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (117, '2025-05-31 04:21:15', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (118, '2025-05-31 04:27:52', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (119, '2025-05-31 04:27:53', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (120, '2025-05-31 04:27:53', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (121, '2025-05-31 04:28:00', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (122, '2025-05-31 04:28:01', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (123, '2025-05-31 04:28:01', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (124, '2025-05-31 04:32:23', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (125, '2025-05-31 04:32:24', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (126, '2025-05-31 04:32:24', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (127, '2025-05-31 04:36:37', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\services\\\\rental_service.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (128, '2025-05-31 04:36:37', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (129, '2025-05-31 04:36:38', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (130, '2025-05-31 04:36:38', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (131, '2025-05-31 04:37:40', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\models\\\\models.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (132, '2025-05-31 04:37:40', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (133, '2025-05-31 04:37:41', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (134, '2025-05-31 04:37:41', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (135, '2025-05-31 04:38:44', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (136, '2025-05-31 04:38:45', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (137, '2025-05-31 04:38:45', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (138, '2025-05-31 04:42:13', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (139, '2025-05-31 04:42:14', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (140, '2025-05-31 04:42:14', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (141, '2025-05-31 04:52:27', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (142, '2025-05-31 04:52:29', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (143, '2025-05-31 04:52:29', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (144, '2025-05-31 07:00:10', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (145, '2025-05-31 07:00:11', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (146, '2025-05-31 07:00:11', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (147, '2025-05-31 07:02:05', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (148, '2025-05-31 07:02:06', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (149, '2025-05-31 07:02:06', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (150, '2025-05-31 07:07:43', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\services\\\\house_info_service.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (151, '2025-05-31 07:07:43', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (152, '2025-05-31 07:07:44', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (153, '2025-05-31 07:07:44', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (154, '2025-05-31 07:19:03', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (155, '2025-05-31 07:19:04', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (156, '2025-05-31 07:19:04', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (157, '2025-05-31 07:52:21', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (158, '2025-05-31 07:52:22', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (159, '2025-05-31 07:52:22', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (160, '2025-05-31 07:53:21', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\blueprints\\\\rental.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (161, '2025-05-31 07:53:21', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (162, '2025-05-31 07:53:22', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (163, '2025-05-31 07:53:22', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (164, '2025-05-31 07:54:43', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (165, '2025-05-31 07:54:44', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (166, '2025-05-31 07:54:44', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (167, '2025-05-31 07:55:11', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (168, '2025-05-31 07:55:12', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (169, '2025-05-31 07:55:12', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (170, '2025-05-31 07:56:01', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (171, '2025-05-31 07:56:02', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (172, '2025-05-31 07:56:02', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (173, '2025-05-31 07:56:17', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (174, '2025-05-31 07:56:18', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (175, '2025-05-31 07:56:18', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (176, '2025-05-31 07:57:39', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (177, '2025-05-31 07:57:40', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (178, '2025-05-31 07:57:40', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (179, '2025-05-31 07:58:11', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (180, '2025-05-31 07:58:12', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (181, '2025-05-31 07:58:12', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (182, '2025-05-31 07:58:52', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (183, '2025-05-31 07:58:53', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (184, '2025-05-31 07:58:53', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (185, '2025-05-31 07:59:52', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (186, '2025-05-31 07:59:53', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (187, '2025-05-31 07:59:53', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (188, '2025-05-31 08:00:11', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (189, '2025-05-31 08:00:12', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (190, '2025-05-31 08:00:12', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (191, '2025-05-31 08:01:18', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\blueprints\\\\rental.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (192, '2025-05-31 08:01:18', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (193, '2025-05-31 08:01:20', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (194, '2025-05-31 08:01:20', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (195, '2025-05-31 08:02:30', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\blueprints\\\\rental.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (196, '2025-05-31 08:02:30', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (197, '2025-05-31 08:03:01', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (198, '2025-05-31 08:03:02', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (199, '2025-05-31 08:03:02', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (200, '2025-05-31 08:03:45', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (201, '2025-05-31 08:03:46', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (202, '2025-05-31 08:03:46', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (203, '2025-05-31 08:04:48', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (204, '2025-05-31 08:04:49', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (205, '2025-05-31 08:04:49', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (206, '2025-05-31 08:05:06', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (207, '2025-05-31 08:05:07', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (208, '2025-05-31 08:05:07', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (209, '2025-05-31 08:05:43', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\blueprints\\\\rental.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (210, '2025-05-31 08:05:43', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (211, '2025-05-31 08:06:50', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (212, '2025-05-31 08:06:51', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (213, '2025-05-31 08:06:51', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (214, '2025-05-31 08:08:19', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\blueprints\\\\rental.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (215, '2025-05-31 08:08:19', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (216, '2025-05-31 08:08:21', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (217, '2025-05-31 08:08:21', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (218, '2025-05-31 08:08:37', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (219, '2025-05-31 08:08:38', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (220, '2025-05-31 08:08:38', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (221, '2025-05-31 08:09:22', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\blueprints\\\\rental.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (222, '2025-05-31 08:09:23', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (223, '2025-05-31 08:09:24', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (224, '2025-05-31 08:09:24', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (225, '2025-05-31 08:32:51', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\services\\\\contract_service.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (226, '2025-05-31 08:32:51', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (227, '2025-05-31 08:37:44', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (228, '2025-05-31 08:37:45', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (229, '2025-05-31 08:37:45', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (230, '2025-05-31 08:38:52', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (231, '2025-05-31 08:38:53', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (232, '2025-05-31 08:38:53', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (233, '2025-05-31 08:44:00', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (234, '2025-05-31 08:44:01', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (235, '2025-05-31 08:44:01', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (236, '2025-05-31 08:44:27', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (237, '2025-05-31 08:44:28', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (238, '2025-05-31 08:44:28', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (239, '2025-05-31 08:48:18', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (240, '2025-05-31 08:48:19', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (241, '2025-05-31 08:48:19', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (242, '2025-05-31 08:50:35', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\blueprints\\\\contract.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (243, '2025-05-31 08:50:35', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (244, '2025-05-31 08:50:36', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (245, '2025-05-31 08:50:36', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (246, '2025-05-31 08:51:04', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (247, '2025-05-31 08:51:05', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (248, '2025-05-31 08:51:05', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (249, '2025-05-31 08:53:00', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (250, '2025-05-31 08:53:02', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (251, '2025-05-31 08:53:02', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (252, '2025-05-31 08:53:24', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (253, '2025-05-31 08:53:25', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (254, '2025-05-31 08:53:25', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (255, '2025-05-31 08:53:33', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (256, '2025-05-31 08:53:34', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (257, '2025-05-31 08:53:34', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (258, '2025-05-31 09:01:45', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\blueprints\\\\rental.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (259, '2025-05-31 09:01:45', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (260, '2025-05-31 09:01:47', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (261, '2025-05-31 09:01:47', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (262, '2025-06-01 07:27:53', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (263, '2025-06-01 07:27:54', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (264, '2025-06-01 07:27:54', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (265, '2025-06-01 08:04:52', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (266, '2025-06-01 08:04:54', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (267, '2025-06-01 08:04:54', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (268, '2025-06-01 08:07:47', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (269, '2025-06-01 08:07:48', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (270, '2025-06-01 08:07:48', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (271, '2025-06-01 08:10:14', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (272, '2025-06-01 08:10:15', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (273, '2025-06-01 08:10:15', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (274, '2025-06-01 08:12:55', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (275, '2025-06-01 08:12:56', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (276, '2025-06-01 08:12:56', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (277, '2025-06-01 08:13:19', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (278, '2025-06-01 08:13:20', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (279, '2025-06-01 08:13:20', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (280, '2025-06-01 08:14:07', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\blueprints\\\\user.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (281, '2025-06-01 08:14:07', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (282, '2025-06-01 08:14:08', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (283, '2025-06-01 08:14:08', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (284, '2025-06-01 08:16:50', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (285, '2025-06-01 08:16:51', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (286, '2025-06-01 08:16:51', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (287, '2025-06-01 08:50:25', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (288, '2025-06-01 08:50:27', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (289, '2025-06-01 08:50:27', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (290, '2025-06-01 08:50:55', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (291, '2025-06-01 08:50:56', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (292, '2025-06-01 08:50:56', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (293, '2025-06-01 09:00:49', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (294, '2025-06-01 09:00:50', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (295, '2025-06-01 09:00:50', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (296, '2025-06-01 09:05:41', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (297, '2025-06-01 09:05:42', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (298, '2025-06-01 09:05:42', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (299, '2025-06-01 09:06:53', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (300, '2025-06-01 09:06:54', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (301, '2025-06-01 09:06:54', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (302, '2025-06-01 09:07:41', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (303, '2025-06-01 09:07:43', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (304, '2025-06-01 09:07:43', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (305, '2025-06-01 09:09:26', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\app.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (306, '2025-06-01 09:09:26', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (307, '2025-06-01 09:09:28', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (308, '2025-06-01 09:09:28', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (309, '2025-06-01 09:12:58', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (310, '2025-06-01 09:13:00', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (311, '2025-06-01 09:13:00', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (312, '2025-06-01 09:20:13', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (313, '2025-06-01 09:20:15', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (314, '2025-06-01 09:20:15', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (315, '2025-06-01 09:23:50', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\celery_test.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (316, '2025-06-01 09:23:53', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (317, '2025-06-01 09:23:54', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (318, '2025-06-01 09:23:54', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (319, '2025-06-01 09:24:35', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\celery_test.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (320, '2025-06-01 09:24:35', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (321, '2025-06-01 09:24:36', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (322, '2025-06-01 09:24:36', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (323, '2025-06-01 09:38:51', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (324, '2025-06-01 09:38:53', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (325, '2025-06-01 09:38:53', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (326, '2025-06-01 11:22:46', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (327, '2025-06-01 11:22:48', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (328, '2025-06-01 11:22:48', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (329, '2025-06-01 11:24:01', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\exts\\\\celery.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (330, '2025-06-01 11:24:02', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (331, '2025-06-01 11:26:49', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (332, '2025-06-01 11:26:51', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (333, '2025-06-01 11:26:51', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (334, '2025-06-01 11:34:58', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (335, '2025-06-01 11:35:01', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (336, '2025-06-01 11:35:01', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (337, '2025-06-01 11:35:40', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (338, '2025-06-01 11:35:42', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (339, '2025-06-01 11:35:42', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (340, '2025-06-01 11:53:31', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (341, '2025-06-01 11:53:33', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (342, '2025-06-01 11:53:33', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (343, '2025-06-01 11:54:08', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (344, '2025-06-01 11:54:10', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (345, '2025-06-01 11:54:10', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (346, '2025-06-01 11:59:03', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (347, '2025-06-01 11:59:05', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (348, '2025-06-01 11:59:05', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (349, '2025-06-01 11:59:57', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (350, '2025-06-01 11:59:59', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (351, '2025-06-01 11:59:59', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (352, '2025-06-01 12:26:58', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (353, '2025-06-01 12:27:00', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (354, '2025-06-01 12:27:00', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (355, '2025-06-01 12:31:27', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (356, '2025-06-01 12:31:29', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (357, '2025-06-01 12:31:29', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (358, '2025-06-01 12:32:02', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (359, '2025-06-01 12:32:03', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (360, '2025-06-01 12:32:03', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (361, '2025-06-01 12:35:48', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (362, '2025-06-01 12:35:50', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (363, '2025-06-01 12:35:50', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (364, '2025-06-01 12:49:06', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\blueprints\\\\user.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (365, '2025-06-01 12:49:06', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (366, '2025-06-01 13:07:36', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (367, '2025-06-01 13:07:38', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (368, '2025-06-01 13:07:38', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (369, '2025-06-01 13:11:04', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\blueprints\\\\user.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (370, '2025-06-01 13:11:05', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (371, '2025-06-01 13:11:06', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (372, '2025-06-01 13:11:06', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (373, '2025-06-01 13:11:21', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (374, '2025-06-01 13:11:23', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (375, '2025-06-01 13:11:23', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (376, '2025-06-01 13:13:41', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (377, '2025-06-01 13:13:42', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (378, '2025-06-01 13:13:42', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (379, '2025-06-01 13:14:03', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (380, '2025-06-01 13:14:04', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (381, '2025-06-01 13:14:04', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (382, '2025-06-01 13:14:40', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (383, '2025-06-01 13:14:41', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (384, '2025-06-01 13:14:41', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (385, '2025-06-01 13:17:04', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (386, '2025-06-01 13:17:05', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (387, '2025-06-01 13:17:05', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (388, '2025-06-01 13:19:18', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (389, '2025-06-01 13:19:19', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (390, '2025-06-01 13:19:19', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (391, '2025-06-02 03:09:39', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (392, '2025-06-02 03:09:40', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (393, '2025-06-02 03:09:40', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (394, '2025-06-02 03:19:42', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (395, '2025-06-02 03:19:43', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (396, '2025-06-02 03:19:43', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (397, '2025-06-02 03:20:30', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\blueprints\\\\user.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (398, '2025-06-02 03:20:31', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (399, '2025-06-02 03:20:32', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (400, '2025-06-02 03:20:32', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (401, '2025-06-02 03:21:33', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\config.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (402, '2025-06-02 03:21:33', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (403, '2025-06-02 03:21:34', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (404, '2025-06-02 03:21:34', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (405, '2025-06-02 03:27:00', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (406, '2025-06-02 03:27:01', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (407, '2025-06-02 03:27:01', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (408, '2025-06-02 03:28:25', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (409, '2025-06-02 03:28:26', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (410, '2025-06-02 03:28:26', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (411, '2025-06-02 03:28:28', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (412, '2025-06-02 03:30:01', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (413, '2025-06-02 03:30:02', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (414, '2025-06-02 03:30:02', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (415, '2025-06-02 03:30:17', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (416, '2025-06-02 03:30:18', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (417, '2025-06-02 03:30:18', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (418, '2025-06-02 03:30:21', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (419, '2025-06-02 03:33:12', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (420, '2025-06-02 03:33:13', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (421, '2025-06-02 03:33:13', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (422, '2025-06-02 03:33:18', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (423, '2025-06-02 03:34:13', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (424, '2025-06-02 03:34:14', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (425, '2025-06-02 03:34:14', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (426, '2025-06-02 03:34:23', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (427, '2025-06-02 03:39:35', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (428, '2025-06-02 03:39:36', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (429, '2025-06-02 03:39:36', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (430, '2025-06-02 03:40:39', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\app.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (431, '2025-06-02 03:40:39', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (432, '2025-06-02 03:40:41', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (433, '2025-06-02 03:40:41', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (434, '2025-06-02 03:45:09', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\config.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (435, '2025-06-02 03:45:09', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (436, '2025-06-02 03:45:10', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (437, '2025-06-02 03:45:10', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (438, '2025-06-02 03:46:34', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (439, '2025-06-02 03:46:36', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (440, '2025-06-02 03:46:36', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (441, '2025-06-02 03:48:12', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (442, '2025-06-02 03:48:13', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (443, '2025-06-02 03:48:13', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (444, '2025-06-02 06:42:55', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (445, '2025-06-02 06:42:56', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (446, '2025-06-02 06:42:57', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (447, '2025-06-02 06:43:30', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (448, '2025-06-02 06:43:31', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (449, '2025-06-02 06:43:31', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (450, '2025-06-02 06:44:29', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\services\\\\house_info_service.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (451, '2025-06-02 06:44:29', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (452, '2025-06-02 06:45:11', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (453, '2025-06-02 06:45:12', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (454, '2025-06-02 06:45:12', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (455, '2025-06-02 06:48:06', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (456, '2025-06-02 06:48:08', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (457, '2025-06-02 06:48:08', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (458, '2025-06-02 06:48:33', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (459, '2025-06-02 06:48:35', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (460, '2025-06-02 06:48:35', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (461, '2025-06-02 06:49:04', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (462, '2025-06-02 06:49:05', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (463, '2025-06-02 06:49:05', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (464, '2025-06-02 06:50:32', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (465, '2025-06-02 06:50:33', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (466, '2025-06-02 06:50:33', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (467, '2025-06-02 06:51:17', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (468, '2025-06-02 06:51:18', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (469, '2025-06-02 06:51:18', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (470, '2025-06-02 07:10:33', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\services\\\\house_info_service.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (471, '2025-06-02 07:10:33', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (472, '2025-06-02 07:10:35', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (473, '2025-06-02 07:10:35', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (474, '2025-06-02 07:10:58', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\services\\\\house_info_service.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (475, '2025-06-02 07:10:58', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (476, '2025-06-02 07:11:00', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (477, '2025-06-02 07:11:00', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (478, '2025-06-02 07:15:26', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (479, '2025-06-02 07:15:27', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (480, '2025-06-02 07:15:27', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (481, '2025-06-02 07:16:37', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (482, '2025-06-02 07:16:38', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (483, '2025-06-02 07:16:38', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (484, '2025-06-02 07:19:55', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (485, '2025-06-02 07:19:56', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (486, '2025-06-02 07:19:56', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (487, '2025-06-02 07:22:48', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (488, '2025-06-02 07:22:49', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (489, '2025-06-02 07:22:49', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (490, '2025-06-02 07:25:19', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (491, '2025-06-02 07:25:20', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (492, '2025-06-02 07:25:20', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (493, '2025-06-02 07:25:37', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (494, '2025-06-02 07:25:38', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (495, '2025-06-02 07:25:38', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (496, '2025-06-02 07:33:38', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\services\\\\house_info_service.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (497, '2025-06-02 07:33:39', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (498, '2025-06-02 07:33:40', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (499, '2025-06-02 07:33:40', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (500, '2025-06-02 08:17:01', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (501, '2025-06-02 08:17:03', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (502, '2025-06-02 08:17:03', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (503, '2025-06-02 08:19:39', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\config.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (504, '2025-06-02 08:19:39', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (505, '2025-06-02 08:19:41', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (506, '2025-06-02 08:19:41', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (507, '2025-06-02 08:19:57', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (508, '2025-06-02 08:19:58', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (509, '2025-06-02 08:19:58', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (510, '2025-06-02 08:22:01', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (511, '2025-06-02 08:22:02', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (512, '2025-06-02 08:22:02', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (513, '2025-06-02 08:22:45', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (514, '2025-06-02 08:22:46', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (515, '2025-06-02 08:22:46', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (516, '2025-06-02 08:23:34', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (517, '2025-06-02 08:23:36', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (518, '2025-06-02 08:23:36', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (519, '2025-06-02 08:24:04', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (520, '2025-06-02 08:24:05', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (521, '2025-06-02 08:24:05', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (522, '2025-06-02 08:24:22', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\blueprints\\\\github.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (523, '2025-06-02 08:24:22', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (524, '2025-06-02 08:24:24', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (525, '2025-06-02 08:24:24', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (526, '2025-06-02 08:26:03', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (527, '2025-06-02 08:26:05', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (528, '2025-06-02 08:26:05', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (529, '2025-06-02 08:26:47', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (530, '2025-06-02 08:26:48', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (531, '2025-06-02 08:26:48', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (532, '2025-06-02 08:28:31', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (533, '2025-06-02 08:28:32', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (534, '2025-06-02 08:28:32', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (535, '2025-06-02 08:29:59', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\config.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (536, '2025-06-02 08:30:00', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (537, '2025-06-02 08:30:01', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (538, '2025-06-02 08:30:01', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (539, '2025-06-02 08:30:19', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (540, '2025-06-02 08:30:21', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (541, '2025-06-02 08:30:21', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (542, '2025-06-02 08:30:47', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (543, '2025-06-02 08:30:48', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (544, '2025-06-02 08:30:48', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (545, '2025-06-02 08:32:26', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (546, '2025-06-02 08:32:27', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (547, '2025-06-02 08:32:27', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (548, '2025-06-02 08:32:46', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (549, '2025-06-02 08:32:47', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (550, '2025-06-02 08:32:47', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (551, '2025-06-02 08:33:25', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (552, '2025-06-02 08:33:27', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (553, '2025-06-02 08:33:27', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (554, '2025-06-02 08:33:44', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (555, '2025-06-02 08:33:46', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (556, '2025-06-02 08:33:46', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (557, '2025-06-02 08:34:08', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (558, '2025-06-02 08:34:09', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (559, '2025-06-02 08:34:09', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (560, '2025-06-02 08:34:46', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (561, '2025-06-02 08:34:47', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (562, '2025-06-02 08:34:47', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (563, '2025-06-02 08:35:37', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (564, '2025-06-02 08:35:38', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (565, '2025-06-02 08:35:38', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (566, '2025-06-02 08:39:37', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (567, '2025-06-02 08:39:39', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (568, '2025-06-02 08:39:39', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (569, '2025-06-02 08:40:50', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\config.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (570, '2025-06-02 08:40:50', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (571, '2025-06-02 08:40:52', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (572, '2025-06-02 08:40:52', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (573, '2025-06-02 08:41:01', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (574, '2025-06-02 08:41:02', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (575, '2025-06-02 08:41:02', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (576, '2025-06-02 08:41:08', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (577, '2025-06-02 08:41:09', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (578, '2025-06-02 08:41:10', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (579, '2025-06-02 08:41:11', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (580, '2025-06-02 08:41:14', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (581, '2025-06-02 08:41:15', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (582, '2025-06-02 08:41:16', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (583, '2025-06-02 08:41:27', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (584, '2025-06-02 08:41:28', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (585, '2025-06-02 08:41:29', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (586, '2025-06-02 08:41:30', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (587, '2025-06-02 08:41:31', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (588, '2025-06-02 08:41:34', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (589, '2025-06-02 08:41:36', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (590, '2025-06-02 08:41:37', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (591, '2025-06-02 08:41:39', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (592, '2025-06-02 08:41:44', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (593, '2025-06-02 08:41:45', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (594, '2025-06-02 08:41:46', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (595, '2025-06-02 08:41:47', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (596, '2025-06-02 08:41:48', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (597, '2025-06-02 08:41:51', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (598, '2025-06-02 08:41:53', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (599, '2025-06-02 08:41:54', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (600, '2025-06-02 08:41:55', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (601, '2025-06-02 08:43:52', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\blueprints\\\\github.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (602, '2025-06-02 08:43:53', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (603, '2025-06-02 08:43:54', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (604, '2025-06-02 08:43:54', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (605, '2025-06-02 08:44:07', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (606, '2025-06-02 08:44:09', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (607, '2025-06-02 08:44:09', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (608, '2025-06-02 08:44:15', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (609, '2025-06-02 08:44:17', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (610, '2025-06-02 08:44:17', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (611, '2025-06-02 08:44:30', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (612, '2025-06-02 08:44:32', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (613, '2025-06-02 08:44:33', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (614, '2025-06-02 08:44:34', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (615, '2025-06-02 08:44:36', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (616, '2025-06-02 08:44:40', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (617, '2025-06-02 08:44:41', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (618, '2025-06-02 08:44:42', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (619, '2025-06-02 08:44:43', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (620, '2025-06-02 08:47:53', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\blueprints\\\\github.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (621, '2025-06-02 08:47:53', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (622, '2025-06-02 08:47:55', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (623, '2025-06-02 08:47:55', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (624, '2025-06-02 08:48:06', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (625, '2025-06-02 08:48:07', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (626, '2025-06-02 08:48:07', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (627, '2025-06-02 08:51:33', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (628, '2025-06-02 08:51:34', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (629, '2025-06-02 08:51:34', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (630, '2025-06-02 09:32:11', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (631, '2025-06-02 09:32:13', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (632, '2025-06-02 09:32:13', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (633, '2025-06-02 09:32:54', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (634, '2025-06-02 09:32:55', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (635, '2025-06-02 09:32:55', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (636, '2025-06-02 09:33:30', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (637, '2025-06-02 09:33:32', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (638, '2025-06-02 09:33:32', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (639, '2025-06-02 09:34:05', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (640, '2025-06-02 09:34:06', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (641, '2025-06-02 09:34:06', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (642, '2025-06-02 09:34:58', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (643, '2025-06-02 09:34:59', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (644, '2025-06-02 09:34:59', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (645, '2025-06-02 09:35:20', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (646, '2025-06-02 09:35:21', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (647, '2025-06-02 09:35:21', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (648, '2025-06-02 09:35:40', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\blueprints\\\\user.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (649, '2025-06-02 09:35:41', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (650, '2025-06-02 09:35:42', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (651, '2025-06-02 09:35:42', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (652, '2025-06-02 09:36:04', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (653, '2025-06-02 09:36:05', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (654, '2025-06-02 09:36:05', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (655, '2025-06-02 09:36:13', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\blueprints\\\\user.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (656, '2025-06-02 09:36:14', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (657, '2025-06-02 09:36:15', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (658, '2025-06-02 09:36:15', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (659, '2025-06-02 09:37:40', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\blueprints\\\\user.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (660, '2025-06-02 09:37:40', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (661, '2025-06-02 09:37:41', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (662, '2025-06-02 09:37:41', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (663, '2025-06-02 09:44:31', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\blueprints\\\\user.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (664, '2025-06-02 09:44:31', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (665, '2025-06-02 09:44:33', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (666, '2025-06-02 09:44:33', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (667, '2025-06-02 09:45:03', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (668, '2025-06-02 09:45:04', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (669, '2025-06-02 09:45:04', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (670, '2025-06-02 09:45:32', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (671, '2025-06-02 09:45:34', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (672, '2025-06-02 09:45:34', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (673, '2025-06-02 10:43:00', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (674, '2025-06-02 10:43:01', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (675, '2025-06-02 10:43:01', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (676, '2025-06-02 10:44:02', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\blueprints\\\\user.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (677, '2025-06-02 10:44:02', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (678, '2025-06-02 10:44:03', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (679, '2025-06-02 10:44:03', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (680, '2025-06-02 10:44:49', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (681, '2025-06-02 10:44:51', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (682, '2025-06-02 10:44:51', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (683, '2025-06-02 10:45:55', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (684, '2025-06-02 10:45:57', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (685, '2025-06-02 10:45:57', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (686, '2025-06-02 10:50:49', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (687, '2025-06-02 10:50:50', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (688, '2025-06-02 10:50:50', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (689, '2025-06-02 10:51:26', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (690, '2025-06-02 10:51:27', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (691, '2025-06-02 10:51:29', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (692, '2025-06-02 10:51:30', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (693, '2025-06-02 10:51:31', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (694, '2025-06-02 10:51:33', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (695, '2025-06-02 11:01:21', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (696, '2025-06-02 11:01:22', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (697, '2025-06-02 11:01:22', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (698, '2025-06-02 11:01:26', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (699, '2025-06-02 11:01:30', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (700, '2025-06-02 11:01:31', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (701, '2025-06-02 11:01:32', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (702, '2025-06-02 11:01:33', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (703, '2025-06-02 11:01:34', 'INFO', 'oauth2', 'authorized', 279, 'state not found, redirecting user to login', NULL);
INSERT INTO `log_entries` VALUES (704, '2025-06-02 11:07:38', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\blueprints\\\\github.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (705, '2025-06-02 11:07:38', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (706, '2025-06-02 11:07:40', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (707, '2025-06-02 11:07:40', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (708, '2025-06-02 11:17:05', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\app.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (709, '2025-06-02 11:17:06', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (710, '2025-06-02 11:17:07', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (711, '2025-06-02 11:17:07', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (712, '2025-06-02 11:19:19', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\blueprints\\\\github.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (713, '2025-06-02 11:19:19', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (714, '2025-06-02 11:19:20', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (715, '2025-06-02 11:19:20', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (716, '2025-06-02 13:15:09', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\blueprints\\\\github.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (717, '2025-06-02 13:15:10', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (718, '2025-06-02 13:15:11', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (719, '2025-06-02 13:15:11', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (720, '2025-06-02 13:15:35', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\config.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (721, '2025-06-02 13:15:35', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (722, '2025-06-02 13:15:36', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (723, '2025-06-02 13:15:36', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (724, '2025-06-02 13:16:43', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (725, '2025-06-02 13:16:44', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (726, '2025-06-02 13:16:44', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (727, '2025-06-02 13:17:12', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\blueprints\\\\github.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (728, '2025-06-02 13:17:13', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (729, '2025-06-02 13:17:14', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (730, '2025-06-02 13:17:14', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (731, '2025-06-02 13:33:47', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (732, '2025-06-02 13:33:49', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (733, '2025-06-02 13:33:49', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (734, '2025-06-02 13:34:15', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (735, '2025-06-02 13:34:16', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (736, '2025-06-02 13:34:16', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (737, '2025-06-02 13:36:10', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (738, '2025-06-02 13:36:11', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (739, '2025-06-02 13:36:11', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (740, '2025-06-02 13:36:57', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (741, '2025-06-02 13:36:59', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (742, '2025-06-02 13:36:59', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (743, '2025-06-02 13:40:33', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (744, '2025-06-02 13:40:34', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (745, '2025-06-02 13:40:34', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (746, '2025-06-02 13:41:31', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\blueprints\\\\github.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (747, '2025-06-02 13:41:31', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (748, '2025-06-02 13:41:32', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (749, '2025-06-02 13:41:32', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (750, '2025-06-02 13:43:12', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (751, '2025-06-02 13:43:14', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (752, '2025-06-02 13:43:14', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (753, '2025-06-02 13:52:38', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (754, '2025-06-02 13:52:39', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (755, '2025-06-02 13:52:39', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (756, '2025-06-02 14:12:29', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (757, '2025-06-02 14:12:30', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (758, '2025-06-02 14:12:30', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (759, '2025-06-02 15:02:47', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (760, '2025-06-02 15:02:49', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (761, '2025-06-02 15:02:49', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (762, '2025-06-02 15:36:09', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\blueprints\\\\user.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (763, '2025-06-02 15:36:09', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (764, '2025-06-02 15:36:11', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (765, '2025-06-02 15:36:11', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (766, '2025-06-02 15:36:20', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (767, '2025-06-02 15:36:22', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (768, '2025-06-02 15:36:22', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (769, '2025-06-02 15:36:59', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (770, '2025-06-02 15:37:00', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (771, '2025-06-02 15:37:00', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (772, '2025-06-02 15:41:08', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\blueprints\\\\user.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (773, '2025-06-02 15:41:08', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (774, '2025-06-02 15:41:10', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (775, '2025-06-02 15:41:10', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (776, '2025-06-02 15:49:14', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (777, '2025-06-02 15:49:16', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (778, '2025-06-02 15:49:16', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (779, '2025-06-03 11:43:01', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (780, '2025-06-03 11:43:02', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (781, '2025-06-03 11:43:02', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (782, '2025-06-03 11:49:00', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (783, '2025-06-03 11:49:02', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (784, '2025-06-03 11:49:02', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (785, '2025-06-03 12:00:26', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (786, '2025-06-03 12:00:27', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (787, '2025-06-03 12:00:27', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (788, '2025-06-03 12:05:24', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (789, '2025-06-03 12:05:25', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (790, '2025-06-03 12:05:25', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (791, '2025-06-03 12:06:25', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (792, '2025-06-03 12:06:27', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (793, '2025-06-03 12:06:27', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (794, '2025-06-03 12:06:33', 'INFO', 'trace', 'info', 128, 'Task blueprints.celery.github_login_task[0806a064-6df3-449d-8465-e0ae27e5531d] succeeded in 1.6160060999973211s: {\'token\': \'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxMywiZW1haWwiOiIyNzc5OTAyNzA3QHFxLmNvbSIsImV4cCI6MTc0OTAzODc5Mn0.NbOgv968586j0IHJAPzvFkbKCz1Z3PkqIVbzGyuAwFQ\'}', NULL);
INSERT INTO `log_entries` VALUES (795, '2025-06-03 12:07:04', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\blueprints\\\\github.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (796, '2025-06-03 12:07:04', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (797, '2025-06-03 12:07:06', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (798, '2025-06-03 12:07:06', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (799, '2025-06-03 12:10:42', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\blueprints\\\\github.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (800, '2025-06-03 12:10:42', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (801, '2025-06-03 12:10:44', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (802, '2025-06-03 12:10:44', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (803, '2025-06-03 12:11:23', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\blueprints\\\\github.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (804, '2025-06-03 12:11:23', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (805, '2025-06-03 12:11:25', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (806, '2025-06-03 12:11:25', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (807, '2025-06-03 12:11:35', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\blueprints\\\\github.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (808, '2025-06-03 12:11:35', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (809, '2025-06-03 12:11:36', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (810, '2025-06-03 12:11:36', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (811, '2025-06-03 12:12:05', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (812, '2025-06-03 12:12:06', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (813, '2025-06-03 12:12:06', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (814, '2025-06-03 12:12:17', 'INFO', 'trace', 'info', 128, 'Task blueprints.celery.fetch_github_user_data[d06ab586-76a5-4e71-b284-865ba2809999] succeeded in 1.7119680999894626s: {\'email\': \'2779902707@qq.com\'}', NULL);
INSERT INTO `log_entries` VALUES (815, '2025-06-03 12:18:58', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (816, '2025-06-03 12:18:59', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (817, '2025-06-03 12:18:59', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (818, '2025-06-03 12:20:47', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (819, '2025-06-03 12:20:49', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (820, '2025-06-03 12:20:49', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (821, '2025-06-03 12:25:59', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\blueprints\\\\message.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (822, '2025-06-03 12:25:59', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (823, '2025-06-03 12:26:01', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (824, '2025-06-03 12:26:01', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (825, '2025-06-03 12:32:37', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\blueprints\\\\message.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (826, '2025-06-03 12:32:37', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (827, '2025-06-03 12:32:38', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (828, '2025-06-03 12:32:38', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (829, '2025-06-03 12:51:14', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (830, '2025-06-03 12:51:15', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (831, '2025-06-03 12:51:15', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (832, '2025-06-03 12:55:28', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\models\\\\models.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (833, '2025-06-03 12:55:29', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (834, '2025-06-03 12:55:30', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (835, '2025-06-03 12:55:30', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (836, '2025-06-03 12:57:22', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\models\\\\models.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (837, '2025-06-03 12:57:22', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (838, '2025-06-03 12:57:23', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (839, '2025-06-03 12:57:23', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (840, '2025-06-03 13:18:03', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (841, '2025-06-03 13:18:05', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (842, '2025-06-03 13:18:05', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (843, '2025-06-03 13:22:13', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (844, '2025-06-03 13:22:15', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (845, '2025-06-03 13:22:15', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (846, '2025-06-03 13:22:53', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (847, '2025-06-03 13:22:55', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (848, '2025-06-03 13:22:55', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (849, '2025-06-03 13:23:52', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (850, '2025-06-03 13:23:54', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (851, '2025-06-03 13:23:54', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (852, '2025-06-03 13:27:06', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\blueprints\\\\user.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (853, '2025-06-03 13:27:06', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (854, '2025-06-03 13:27:08', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (855, '2025-06-03 13:27:08', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (856, '2025-06-03 13:28:25', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (857, '2025-06-03 13:28:26', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (858, '2025-06-03 13:28:26', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (859, '2025-06-03 13:32:40', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (860, '2025-06-03 13:32:42', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (861, '2025-06-03 13:32:42', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (862, '2025-06-09 02:59:00', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (863, '2025-06-09 02:59:01', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (864, '2025-06-09 02:59:01', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (865, '2025-06-11 08:30:21', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (866, '2025-06-11 08:30:23', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (867, '2025-06-11 08:30:23', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (868, '2025-06-11 13:10:48', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (869, '2025-06-11 13:10:49', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (870, '2025-06-11 13:10:49', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (871, '2025-06-11 13:14:42', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\exts\\\\alipay_client.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (872, '2025-06-11 13:14:42', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (873, '2025-06-11 13:14:44', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (874, '2025-06-11 13:14:44', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (875, '2025-06-11 13:17:23', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (876, '2025-06-11 13:17:25', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (877, '2025-06-11 13:17:25', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (878, '2025-06-11 13:17:28', 'ERROR', 'alipay', 'pay', 28, '\'dict\' object has no attribute \'get_params\'', 'Traceback (most recent call last):\n  File \"D:\\PycharmProjects\\houseSystemBack\\blueprints\\alipay.py\", line 21, in pay\n    pay_url = client.generate_payment_url(\n        out_trade_no=out_trade_no,\n        total_amount=total_amount,\n        subject=subject\n    )\n  File \"D:\\PycharmProjects\\houseSystemBack\\exts\\alipay_client.py\", line 34, in generate_payment_url\n    return self.client.page_execute(request, http_method=\"GET\")\n           ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 322, in page_execute\n    query_string, params = self.__prepare_request(request)\n                           ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 89, in __prepare_request\n    common_params, params = self.__prepare_request_params(request)\n                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 109, in __prepare_request_params\n    params = request.get_params()\n             ^^^^^^^^^^^^^^^^^^\nAttributeError: \'dict\' object has no attribute \'get_params\'');
INSERT INTO `log_entries` VALUES (879, '2025-06-11 13:18:40', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\exts\\\\alipay_client.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (880, '2025-06-11 13:18:40', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (881, '2025-06-11 13:18:41', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (882, '2025-06-11 13:18:41', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (883, '2025-06-11 13:18:55', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\exts\\\\alipay_client.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (884, '2025-06-11 13:18:55', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (885, '2025-06-11 13:18:57', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (886, '2025-06-11 13:18:57', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (887, '2025-06-11 13:19:01', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (888, '2025-06-11 13:19:02', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (889, '2025-06-11 13:19:02', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (890, '2025-06-11 13:19:07', 'ERROR', 'alipay', 'pay', 28, 'Unknown format code \'f\' for object of type \'str\'', 'Traceback (most recent call last):\n  File \"D:\\PycharmProjects\\houseSystemBack\\blueprints\\alipay.py\", line 21, in pay\n    pay_url = client.generate_payment_url(\n        out_trade_no=out_trade_no,\n        total_amount=total_amount,\n        subject=subject\n    )\n  File \"D:\\PycharmProjects\\houseSystemBack\\exts\\alipay_client.py\", line 23, in generate_payment_url\n    model.total_amount = f\"{total_amount:.2f}\"\n                           ^^^^^^^^^^^^^^^^^^\nValueError: Unknown format code \'f\' for object of type \'str\'');
INSERT INTO `log_entries` VALUES (891, '2025-06-11 13:19:35', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (892, '2025-06-11 13:19:36', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (893, '2025-06-11 13:19:36', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (894, '2025-06-11 13:19:43', 'ERROR', 'alipay', 'pay', 28, '\'AlipayTradePagePayRequest\' object has no attribute \'set_biz_model\'', 'Traceback (most recent call last):\n  File \"D:\\PycharmProjects\\houseSystemBack\\blueprints\\alipay.py\", line 21, in pay\n    pay_url = client.generate_payment_url(\n        out_trade_no=out_trade_no,\n        total_amount=total_amount,\n        subject=subject\n    )\n  File \"D:\\PycharmProjects\\houseSystemBack\\exts\\alipay_client.py\", line 28, in generate_payment_url\n    request.set_biz_model(model)\n    ^^^^^^^^^^^^^^^^^^^^^\nAttributeError: \'AlipayTradePagePayRequest\' object has no attribute \'set_biz_model\'. Did you mean: \'biz_model\'?');
INSERT INTO `log_entries` VALUES (895, '2025-06-11 13:20:22', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (896, '2025-06-11 13:20:23', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (897, '2025-06-11 13:20:23', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (898, '2025-06-11 13:20:27', 'ERROR', 'alipay', 'pay', 28, '[d6b38b40-46c6-11f0-a4f5-005056c00008]request sign failed. int() argument must be a string, a bytes-like object or a real number, not \'Sequence\'', 'Traceback (most recent call last):\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 127, in __prepare_request_params\n    sign = sign_with_rsa2(self.__config.app_private_key, sign_content, self.__config.charset)\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\util\\SignatureUtils.py\", line 49, in sign_with_rsa2\n    signature = rsa.sign(sign_content, rsa.PrivateKey.load_pkcs1(private_key, format=\'PEM\'), \'SHA-256\')\n                                       ~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\rsa\\key.py\", line 125, in load_pkcs1\n    return method(keyfile)\n  File \"D:\\Python313\\Lib\\site-packages\\rsa\\key.py\", line 613, in _load_pkcs1_pem\n    return cls._load_pkcs1_der(der)\n           ~~~~~~~~~~~~~~~~~~~^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\rsa\\key.py\", line 548, in _load_pkcs1_der\n    key = cls(*as_ints)\nTypeError: int() argument must be a string, a bytes-like object or a real number, not \'Sequence\'\n\nDuring handling of the above exception, another exception occurred:\n\nTraceback (most recent call last):\n  File \"D:\\PycharmProjects\\houseSystemBack\\blueprints\\alipay.py\", line 21, in pay\n    pay_url = client.generate_payment_url(\n        out_trade_no=out_trade_no,\n        total_amount=total_amount,\n        subject=subject\n    )\n  File \"D:\\PycharmProjects\\houseSystemBack\\exts\\alipay_client.py\", line 33, in generate_payment_url\n    return self.client.page_execute(request, http_method=\"GET\")\n           ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 322, in page_execute\n    query_string, params = self.__prepare_request(request)\n                           ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 89, in __prepare_request\n    common_params, params = self.__prepare_request_params(request)\n                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 131, in __prepare_request_params\n    raise RequestException(\'[\' + THREAD_LOCAL.uuid + \']request sign failed. \' + str(e))\nalipay.aop.api.exception.Exception.RequestException: [d6b38b40-46c6-11f0-a4f5-005056c00008]request sign failed. int() argument must be a string, a bytes-like object or a real number, not \'Sequence\'');
INSERT INTO `log_entries` VALUES (899, '2025-06-11 13:22:34', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (900, '2025-06-11 13:22:36', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (901, '2025-06-11 13:22:36', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (902, '2025-06-11 13:22:40', 'ERROR', 'alipay', 'pay', 28, '[25fc0db6-46c7-11f0-9ca2-005056c00008]request sign failed. argument should be integer or bytes-like object, not \'str\'', 'Traceback (most recent call last):\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 127, in __prepare_request_params\n    sign = sign_with_rsa2(self.__config.app_private_key, sign_content, self.__config.charset)\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\util\\SignatureUtils.py\", line 48, in sign_with_rsa2\n    private_key = fill_private_key_marker(private_key)\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\util\\SignatureUtils.py\", line 27, in fill_private_key_marker\n    return add_start_end(private_key, \"-----BEGIN RSA PRIVATE KEY-----\\n\", \"\\n-----END RSA PRIVATE KEY-----\")\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\util\\StringUtils.py\", line 10, in add_start_end\n    if key.find(startMarker) < 0:\n       ~~~~~~~~^^^^^^^^^^^^^\nTypeError: argument should be integer or bytes-like object, not \'str\'\n\nDuring handling of the above exception, another exception occurred:\n\nTraceback (most recent call last):\n  File \"D:\\PycharmProjects\\houseSystemBack\\blueprints\\alipay.py\", line 21, in pay\n    pay_url = client.generate_payment_url(\n        out_trade_no=out_trade_no,\n        total_amount=total_amount,\n        subject=subject\n    )\n  File \"D:\\PycharmProjects\\houseSystemBack\\exts\\alipay_client.py\", line 33, in generate_payment_url\n    return self.client.page_execute(request, http_method=\"GET\")\n           ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 322, in page_execute\n    query_string, params = self.__prepare_request(request)\n                           ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 89, in __prepare_request\n    common_params, params = self.__prepare_request_params(request)\n                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 131, in __prepare_request_params\n    raise RequestException(\'[\' + THREAD_LOCAL.uuid + \']request sign failed. \' + str(e))\nalipay.aop.api.exception.Exception.RequestException: [25fc0db6-46c7-11f0-9ca2-005056c00008]request sign failed. argument should be integer or bytes-like object, not \'str\'');
INSERT INTO `log_entries` VALUES (903, '2025-06-11 13:33:34', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (904, '2025-06-11 13:33:36', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (905, '2025-06-11 13:33:36', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (906, '2025-06-11 13:33:38', 'ERROR', 'alipay', 'pay', 28, '[ae3e8380-46c8-11f0-8deb-005056c00008]request sign failed. \'cryptography.hazmat.bindings._rust.openssl.rsa.RSAPrivateKey\' object has no attribute \'find\'', 'Traceback (most recent call last):\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 127, in __prepare_request_params\n    sign = sign_with_rsa2(self.__config.app_private_key, sign_content, self.__config.charset)\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\util\\SignatureUtils.py\", line 48, in sign_with_rsa2\n    private_key = fill_private_key_marker(private_key)\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\util\\SignatureUtils.py\", line 27, in fill_private_key_marker\n    return add_start_end(private_key, \"-----BEGIN RSA PRIVATE KEY-----\\n\", \"\\n-----END RSA PRIVATE KEY-----\")\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\util\\StringUtils.py\", line 10, in add_start_end\n    if key.find(startMarker) < 0:\n       ^^^^^^^^\nAttributeError: \'cryptography.hazmat.bindings._rust.openssl.rsa.RSAPrivateKey\' object has no attribute \'find\'\n\nDuring handling of the above exception, another exception occurred:\n\nTraceback (most recent call last):\n  File \"D:\\PycharmProjects\\houseSystemBack\\blueprints\\alipay.py\", line 21, in pay\n    pay_url = client.generate_payment_url(\n        out_trade_no=out_trade_no,\n        total_amount=total_amount,\n        subject=subject\n    )\n  File \"D:\\PycharmProjects\\houseSystemBack\\exts\\alipay_client.py\", line 33, in generate_payment_url\n    return self.client.page_execute(request, http_method=\"GET\")\n           ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 322, in page_execute\n    query_string, params = self.__prepare_request(request)\n                           ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 89, in __prepare_request\n    common_params, params = self.__prepare_request_params(request)\n                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 131, in __prepare_request_params\n    raise RequestException(\'[\' + THREAD_LOCAL.uuid + \']request sign failed. \' + str(e))\nalipay.aop.api.exception.Exception.RequestException: [ae3e8380-46c8-11f0-8deb-005056c00008]request sign failed. \'cryptography.hazmat.bindings._rust.openssl.rsa.RSAPrivateKey\' object has no attribute \'find\'');
INSERT INTO `log_entries` VALUES (907, '2025-06-11 13:33:50', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\exts\\\\alipay.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (908, '2025-06-11 13:33:50', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (909, '2025-06-11 13:33:52', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (910, '2025-06-11 13:33:52', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (911, '2025-06-11 13:35:05', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (912, '2025-06-11 13:35:06', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (913, '2025-06-11 13:35:06', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (914, '2025-06-11 13:35:09', 'ERROR', 'alipay', 'pay', 28, '[e49ca753-46c8-11f0-b04e-005056c00008]request sign failed. int() argument must be a string, a bytes-like object or a real number, not \'Sequence\'', 'Traceback (most recent call last):\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 127, in __prepare_request_params\n    sign = sign_with_rsa2(self.__config.app_private_key, sign_content, self.__config.charset)\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\util\\SignatureUtils.py\", line 49, in sign_with_rsa2\n    signature = rsa.sign(sign_content, rsa.PrivateKey.load_pkcs1(private_key, format=\'PEM\'), \'SHA-256\')\n                                       ~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\rsa\\key.py\", line 125, in load_pkcs1\n    return method(keyfile)\n  File \"D:\\Python313\\Lib\\site-packages\\rsa\\key.py\", line 613, in _load_pkcs1_pem\n    return cls._load_pkcs1_der(der)\n           ~~~~~~~~~~~~~~~~~~~^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\rsa\\key.py\", line 548, in _load_pkcs1_der\n    key = cls(*as_ints)\nTypeError: int() argument must be a string, a bytes-like object or a real number, not \'Sequence\'\n\nDuring handling of the above exception, another exception occurred:\n\nTraceback (most recent call last):\n  File \"D:\\PycharmProjects\\houseSystemBack\\blueprints\\alipay.py\", line 21, in pay\n    pay_url = client.generate_payment_url(\n        out_trade_no=out_trade_no,\n        total_amount=total_amount,\n        subject=subject\n    )\n  File \"D:\\PycharmProjects\\houseSystemBack\\exts\\alipay_client.py\", line 33, in generate_payment_url\n    return self.client.page_execute(request, http_method=\"GET\")\n           ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 322, in page_execute\n    query_string, params = self.__prepare_request(request)\n                           ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 89, in __prepare_request\n    common_params, params = self.__prepare_request_params(request)\n                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 131, in __prepare_request_params\n    raise RequestException(\'[\' + THREAD_LOCAL.uuid + \']request sign failed. \' + str(e))\nalipay.aop.api.exception.Exception.RequestException: [e49ca753-46c8-11f0-b04e-005056c00008]request sign failed. int() argument must be a string, a bytes-like object or a real number, not \'Sequence\'');
INSERT INTO `log_entries` VALUES (915, '2025-06-11 13:36:09', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (916, '2025-06-11 13:36:11', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (917, '2025-06-11 13:36:11', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (918, '2025-06-11 13:36:12', 'ERROR', 'alipay', 'pay', 28, '[0a49bd54-46c9-11f0-b18e-005056c00008]request sign failed. Invalid base64-encoded string: number of data characters (1657) cannot be 1 more than a multiple of 4', 'Traceback (most recent call last):\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 127, in __prepare_request_params\n    sign = sign_with_rsa2(self.__config.app_private_key, sign_content, self.__config.charset)\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\util\\SignatureUtils.py\", line 49, in sign_with_rsa2\n    signature = rsa.sign(sign_content, rsa.PrivateKey.load_pkcs1(private_key, format=\'PEM\'), \'SHA-256\')\n                                       ~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\rsa\\key.py\", line 125, in load_pkcs1\n    return method(keyfile)\n  File \"D:\\Python313\\Lib\\site-packages\\rsa\\key.py\", line 612, in _load_pkcs1_pem\n    der = rsa.pem.load_pem(keyfile, b\"RSA PRIVATE KEY\")\n  File \"D:\\Python313\\Lib\\site-packages\\rsa\\pem.py\", line 107, in load_pem\n    return base64.standard_b64decode(pem)\n           ~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^\n  File \"D:\\Python313\\Lib\\base64.py\", line 106, in standard_b64decode\n    return b64decode(s)\n  File \"D:\\Python313\\Lib\\base64.py\", line 88, in b64decode\n    return binascii.a2b_base64(s, strict_mode=validate)\n           ~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^\nbinascii.Error: Invalid base64-encoded string: number of data characters (1657) cannot be 1 more than a multiple of 4\n\nDuring handling of the above exception, another exception occurred:\n\nTraceback (most recent call last):\n  File \"D:\\PycharmProjects\\houseSystemBack\\blueprints\\alipay.py\", line 21, in pay\n    pay_url = client.generate_payment_url(\n        out_trade_no=out_trade_no,\n        total_amount=total_amount,\n        subject=subject\n    )\n  File \"D:\\PycharmProjects\\houseSystemBack\\exts\\alipay_client.py\", line 33, in generate_payment_url\n    return self.client.page_execute(request, http_method=\"GET\")\n           ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 322, in page_execute\n    query_string, params = self.__prepare_request(request)\n                           ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 89, in __prepare_request\n    common_params, params = self.__prepare_request_params(request)\n                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 131, in __prepare_request_params\n    raise RequestException(\'[\' + THREAD_LOCAL.uuid + \']request sign failed. \' + str(e))\nalipay.aop.api.exception.Exception.RequestException: [0a49bd54-46c9-11f0-b18e-005056c00008]request sign failed. Invalid base64-encoded string: number of data characters (1657) cannot be 1 more than a multiple of 4');
INSERT INTO `log_entries` VALUES (919, '2025-06-11 13:37:17', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (920, '2025-06-11 13:37:18', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (921, '2025-06-11 13:37:18', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (922, '2025-06-11 13:37:20', 'ERROR', 'alipay', 'pay', 28, '[32a676e1-46c9-11f0-9672-005056c00008]request sign failed. int() argument must be a string, a bytes-like object or a real number, not \'Sequence\'', 'Traceback (most recent call last):\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 127, in __prepare_request_params\n    sign = sign_with_rsa2(self.__config.app_private_key, sign_content, self.__config.charset)\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\util\\SignatureUtils.py\", line 49, in sign_with_rsa2\n    signature = rsa.sign(sign_content, rsa.PrivateKey.load_pkcs1(private_key, format=\'PEM\'), \'SHA-256\')\n                                       ~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\rsa\\key.py\", line 125, in load_pkcs1\n    return method(keyfile)\n  File \"D:\\Python313\\Lib\\site-packages\\rsa\\key.py\", line 613, in _load_pkcs1_pem\n    return cls._load_pkcs1_der(der)\n           ~~~~~~~~~~~~~~~~~~~^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\rsa\\key.py\", line 548, in _load_pkcs1_der\n    key = cls(*as_ints)\nTypeError: int() argument must be a string, a bytes-like object or a real number, not \'Sequence\'\n\nDuring handling of the above exception, another exception occurred:\n\nTraceback (most recent call last):\n  File \"D:\\PycharmProjects\\houseSystemBack\\blueprints\\alipay.py\", line 21, in pay\n    pay_url = client.generate_payment_url(\n        out_trade_no=out_trade_no,\n        total_amount=total_amount,\n        subject=subject\n    )\n  File \"D:\\PycharmProjects\\houseSystemBack\\exts\\alipay_client.py\", line 33, in generate_payment_url\n    return self.client.page_execute(request, http_method=\"GET\")\n           ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 322, in page_execute\n    query_string, params = self.__prepare_request(request)\n                           ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 89, in __prepare_request\n    common_params, params = self.__prepare_request_params(request)\n                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 131, in __prepare_request_params\n    raise RequestException(\'[\' + THREAD_LOCAL.uuid + \']request sign failed. \' + str(e))\nalipay.aop.api.exception.Exception.RequestException: [32a676e1-46c9-11f0-9672-005056c00008]request sign failed. int() argument must be a string, a bytes-like object or a real number, not \'Sequence\'');
INSERT INTO `log_entries` VALUES (923, '2025-06-11 13:38:43', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (924, '2025-06-11 13:38:44', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (925, '2025-06-11 13:38:44', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (926, '2025-06-11 13:38:47', 'ERROR', 'alipay', 'pay', 28, '[66511182-46c9-11f0-8da1-005056c00008]request sign failed. Incorrect padding', 'Traceback (most recent call last):\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 127, in __prepare_request_params\n    sign = sign_with_rsa2(self.__config.app_private_key, sign_content, self.__config.charset)\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\util\\SignatureUtils.py\", line 49, in sign_with_rsa2\n    signature = rsa.sign(sign_content, rsa.PrivateKey.load_pkcs1(private_key, format=\'PEM\'), \'SHA-256\')\n                                       ~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\rsa\\key.py\", line 125, in load_pkcs1\n    return method(keyfile)\n  File \"D:\\Python313\\Lib\\site-packages\\rsa\\key.py\", line 612, in _load_pkcs1_pem\n    der = rsa.pem.load_pem(keyfile, b\"RSA PRIVATE KEY\")\n  File \"D:\\Python313\\Lib\\site-packages\\rsa\\pem.py\", line 107, in load_pem\n    return base64.standard_b64decode(pem)\n           ~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^\n  File \"D:\\Python313\\Lib\\base64.py\", line 106, in standard_b64decode\n    return b64decode(s)\n  File \"D:\\Python313\\Lib\\base64.py\", line 88, in b64decode\n    return binascii.a2b_base64(s, strict_mode=validate)\n           ~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^\nbinascii.Error: Incorrect padding\n\nDuring handling of the above exception, another exception occurred:\n\nTraceback (most recent call last):\n  File \"D:\\PycharmProjects\\houseSystemBack\\blueprints\\alipay.py\", line 21, in pay\n    pay_url = client.generate_payment_url(\n        out_trade_no=out_trade_no,\n        total_amount=total_amount,\n        subject=subject\n    )\n  File \"D:\\PycharmProjects\\houseSystemBack\\exts\\alipay_client.py\", line 33, in generate_payment_url\n    return self.client.page_execute(request, http_method=\"GET\")\n           ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 322, in page_execute\n    query_string, params = self.__prepare_request(request)\n                           ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 89, in __prepare_request\n    common_params, params = self.__prepare_request_params(request)\n                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 131, in __prepare_request_params\n    raise RequestException(\'[\' + THREAD_LOCAL.uuid + \']request sign failed. \' + str(e))\nalipay.aop.api.exception.Exception.RequestException: [66511182-46c9-11f0-8da1-005056c00008]request sign failed. Incorrect padding');
INSERT INTO `log_entries` VALUES (927, '2025-06-11 13:40:35', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (928, '2025-06-11 13:40:37', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (929, '2025-06-11 13:40:37', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (930, '2025-06-11 13:40:39', 'ERROR', 'alipay', 'pay', 28, '[a978dbc2-46c9-11f0-b706-005056c00008]request sign failed. int() argument must be a string, a bytes-like object or a real number, not \'Sequence\'', 'Traceback (most recent call last):\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 127, in __prepare_request_params\n    sign = sign_with_rsa2(self.__config.app_private_key, sign_content, self.__config.charset)\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\util\\SignatureUtils.py\", line 49, in sign_with_rsa2\n    signature = rsa.sign(sign_content, rsa.PrivateKey.load_pkcs1(private_key, format=\'PEM\'), \'SHA-256\')\n                                       ~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\rsa\\key.py\", line 125, in load_pkcs1\n    return method(keyfile)\n  File \"D:\\Python313\\Lib\\site-packages\\rsa\\key.py\", line 613, in _load_pkcs1_pem\n    return cls._load_pkcs1_der(der)\n           ~~~~~~~~~~~~~~~~~~~^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\rsa\\key.py\", line 548, in _load_pkcs1_der\n    key = cls(*as_ints)\nTypeError: int() argument must be a string, a bytes-like object or a real number, not \'Sequence\'\n\nDuring handling of the above exception, another exception occurred:\n\nTraceback (most recent call last):\n  File \"D:\\PycharmProjects\\houseSystemBack\\blueprints\\alipay.py\", line 21, in pay\n    pay_url = client.generate_payment_url(\n        out_trade_no=out_trade_no,\n        total_amount=total_amount,\n        subject=subject\n    )\n  File \"D:\\PycharmProjects\\houseSystemBack\\exts\\alipay_client.py\", line 33, in generate_payment_url\n    return self.client.page_execute(request, http_method=\"GET\")\n           ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 322, in page_execute\n    query_string, params = self.__prepare_request(request)\n                           ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 89, in __prepare_request\n    common_params, params = self.__prepare_request_params(request)\n                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 131, in __prepare_request_params\n    raise RequestException(\'[\' + THREAD_LOCAL.uuid + \']request sign failed. \' + str(e))\nalipay.aop.api.exception.Exception.RequestException: [a978dbc2-46c9-11f0-b706-005056c00008]request sign failed. int() argument must be a string, a bytes-like object or a real number, not \'Sequence\'');
INSERT INTO `log_entries` VALUES (931, '2025-06-11 13:43:20', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (932, '2025-06-11 13:43:21', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (933, '2025-06-11 13:43:21', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (934, '2025-06-11 13:43:31', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (935, '2025-06-11 13:43:33', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (936, '2025-06-11 13:43:33', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (937, '2025-06-11 13:43:43', 'ERROR', 'alipay', 'pay', 28, '[170b0e89-46ca-11f0-b22f-005056c00008]request sign failed. int() argument must be a string, a bytes-like object or a real number, not \'Sequence\'', 'Traceback (most recent call last):\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 127, in __prepare_request_params\n    sign = sign_with_rsa2(self.__config.app_private_key, sign_content, self.__config.charset)\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\util\\SignatureUtils.py\", line 49, in sign_with_rsa2\n    signature = rsa.sign(sign_content, rsa.PrivateKey.load_pkcs1(private_key, format=\'PEM\'), \'SHA-256\')\n                                       ~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\rsa\\key.py\", line 125, in load_pkcs1\n    return method(keyfile)\n  File \"D:\\Python313\\Lib\\site-packages\\rsa\\key.py\", line 613, in _load_pkcs1_pem\n    return cls._load_pkcs1_der(der)\n           ~~~~~~~~~~~~~~~~~~~^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\rsa\\key.py\", line 548, in _load_pkcs1_der\n    key = cls(*as_ints)\nTypeError: int() argument must be a string, a bytes-like object or a real number, not \'Sequence\'\n\nDuring handling of the above exception, another exception occurred:\n\nTraceback (most recent call last):\n  File \"D:\\PycharmProjects\\houseSystemBack\\blueprints\\alipay.py\", line 21, in pay\n    pay_url = client.generate_payment_url(\n        out_trade_no=out_trade_no,\n        total_amount=total_amount,\n        subject=subject\n    )\n  File \"D:\\PycharmProjects\\houseSystemBack\\exts\\alipay_client.py\", line 33, in generate_payment_url\n    return self.client.page_execute(request, http_method=\"GET\")\n           ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 322, in page_execute\n    query_string, params = self.__prepare_request(request)\n                           ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 89, in __prepare_request\n    common_params, params = self.__prepare_request_params(request)\n                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 131, in __prepare_request_params\n    raise RequestException(\'[\' + THREAD_LOCAL.uuid + \']request sign failed. \' + str(e))\nalipay.aop.api.exception.Exception.RequestException: [170b0e89-46ca-11f0-b22f-005056c00008]request sign failed. int() argument must be a string, a bytes-like object or a real number, not \'Sequence\'');
INSERT INTO `log_entries` VALUES (938, '2025-06-11 13:47:06', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (939, '2025-06-11 13:47:08', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (940, '2025-06-11 13:47:08', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (941, '2025-06-11 13:47:14', 'ERROR', 'alipay', 'pay', 28, '[94b0f8fb-46ca-11f0-85a8-005056c00008]request sign failed. int() argument must be a string, a bytes-like object or a real number, not \'Sequence\'', 'Traceback (most recent call last):\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 127, in __prepare_request_params\n    sign = sign_with_rsa2(self.__config.app_private_key, sign_content, self.__config.charset)\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\util\\SignatureUtils.py\", line 49, in sign_with_rsa2\n    signature = rsa.sign(sign_content, rsa.PrivateKey.load_pkcs1(private_key, format=\'PEM\'), \'SHA-256\')\n                                       ~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\rsa\\key.py\", line 125, in load_pkcs1\n    return method(keyfile)\n  File \"D:\\Python313\\Lib\\site-packages\\rsa\\key.py\", line 613, in _load_pkcs1_pem\n    return cls._load_pkcs1_der(der)\n           ~~~~~~~~~~~~~~~~~~~^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\rsa\\key.py\", line 548, in _load_pkcs1_der\n    key = cls(*as_ints)\nTypeError: int() argument must be a string, a bytes-like object or a real number, not \'Sequence\'\n\nDuring handling of the above exception, another exception occurred:\n\nTraceback (most recent call last):\n  File \"D:\\PycharmProjects\\houseSystemBack\\blueprints\\alipay.py\", line 21, in pay\n    pay_url = client.generate_payment_url(\n        out_trade_no=out_trade_no,\n        total_amount=total_amount,\n        subject=subject\n    )\n  File \"D:\\PycharmProjects\\houseSystemBack\\exts\\alipay_client.py\", line 33, in generate_payment_url\n    return self.client.page_execute(request, http_method=\"GET\")\n           ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 322, in page_execute\n    query_string, params = self.__prepare_request(request)\n                           ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 89, in __prepare_request\n    common_params, params = self.__prepare_request_params(request)\n                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 131, in __prepare_request_params\n    raise RequestException(\'[\' + THREAD_LOCAL.uuid + \']request sign failed. \' + str(e))\nalipay.aop.api.exception.Exception.RequestException: [94b0f8fb-46ca-11f0-85a8-005056c00008]request sign failed. int() argument must be a string, a bytes-like object or a real number, not \'Sequence\'');
INSERT INTO `log_entries` VALUES (942, '2025-06-11 13:47:18', 'ERROR', 'alipay', 'pay', 28, '[96caabe2-46ca-11f0-aa7b-005056c00008]request sign failed. int() argument must be a string, a bytes-like object or a real number, not \'Sequence\'', 'Traceback (most recent call last):\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 127, in __prepare_request_params\n    sign = sign_with_rsa2(self.__config.app_private_key, sign_content, self.__config.charset)\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\util\\SignatureUtils.py\", line 49, in sign_with_rsa2\n    signature = rsa.sign(sign_content, rsa.PrivateKey.load_pkcs1(private_key, format=\'PEM\'), \'SHA-256\')\n                                       ~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\rsa\\key.py\", line 125, in load_pkcs1\n    return method(keyfile)\n  File \"D:\\Python313\\Lib\\site-packages\\rsa\\key.py\", line 613, in _load_pkcs1_pem\n    return cls._load_pkcs1_der(der)\n           ~~~~~~~~~~~~~~~~~~~^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\rsa\\key.py\", line 548, in _load_pkcs1_der\n    key = cls(*as_ints)\nTypeError: int() argument must be a string, a bytes-like object or a real number, not \'Sequence\'\n\nDuring handling of the above exception, another exception occurred:\n\nTraceback (most recent call last):\n  File \"D:\\PycharmProjects\\houseSystemBack\\blueprints\\alipay.py\", line 21, in pay\n    pay_url = client.generate_payment_url(\n        out_trade_no=out_trade_no,\n        total_amount=total_amount,\n        subject=subject\n    )\n  File \"D:\\PycharmProjects\\houseSystemBack\\exts\\alipay_client.py\", line 33, in generate_payment_url\n    return self.client.page_execute(request, http_method=\"GET\")\n           ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 322, in page_execute\n    query_string, params = self.__prepare_request(request)\n                           ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 89, in __prepare_request\n    common_params, params = self.__prepare_request_params(request)\n                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 131, in __prepare_request_params\n    raise RequestException(\'[\' + THREAD_LOCAL.uuid + \']request sign failed. \' + str(e))\nalipay.aop.api.exception.Exception.RequestException: [96caabe2-46ca-11f0-aa7b-005056c00008]request sign failed. int() argument must be a string, a bytes-like object or a real number, not \'Sequence\'');
INSERT INTO `log_entries` VALUES (943, '2025-06-11 13:55:42', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (944, '2025-06-11 13:55:43', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (945, '2025-06-11 13:55:43', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (946, '2025-06-11 13:55:46', 'ERROR', 'alipay', 'pay', 28, '[c5a5e1f1-46cb-11f0-b3b6-005056c00008]request sign failed. argument should be integer or bytes-like object, not \'str\'', 'Traceback (most recent call last):\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 127, in __prepare_request_params\n    sign = sign_with_rsa2(self.__config.app_private_key, sign_content, self.__config.charset)\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\util\\SignatureUtils.py\", line 48, in sign_with_rsa2\n    private_key = fill_private_key_marker(private_key)\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\util\\SignatureUtils.py\", line 27, in fill_private_key_marker\n    return add_start_end(private_key, \"-----BEGIN RSA PRIVATE KEY-----\\n\", \"\\n-----END RSA PRIVATE KEY-----\")\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\util\\StringUtils.py\", line 10, in add_start_end\n    if key.find(startMarker) < 0:\n       ~~~~~~~~^^^^^^^^^^^^^\nTypeError: argument should be integer or bytes-like object, not \'str\'\n\nDuring handling of the above exception, another exception occurred:\n\nTraceback (most recent call last):\n  File \"D:\\PycharmProjects\\houseSystemBack\\blueprints\\alipay.py\", line 21, in pay\n    pay_url = client.generate_payment_url(\n        out_trade_no=out_trade_no,\n        total_amount=total_amount,\n        subject=subject\n    )\n  File \"D:\\PycharmProjects\\houseSystemBack\\exts\\alipay_client.py\", line 33, in generate_payment_url\n    return self.client.page_execute(request, http_method=\"GET\")\n           ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 322, in page_execute\n    query_string, params = self.__prepare_request(request)\n                           ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 89, in __prepare_request\n    common_params, params = self.__prepare_request_params(request)\n                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 131, in __prepare_request_params\n    raise RequestException(\'[\' + THREAD_LOCAL.uuid + \']request sign failed. \' + str(e))\nalipay.aop.api.exception.Exception.RequestException: [c5a5e1f1-46cb-11f0-b3b6-005056c00008]request sign failed. argument should be integer or bytes-like object, not \'str\'');
INSERT INTO `log_entries` VALUES (947, '2025-06-11 13:57:41', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (948, '2025-06-11 13:57:43', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (949, '2025-06-11 13:57:43', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (950, '2025-06-11 13:57:46', 'ERROR', 'alipay', 'pay', 28, '[0d488fa3-46cc-11f0-93a3-005056c00008]request sign failed. argument should be integer or bytes-like object, not \'str\'', 'Traceback (most recent call last):\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 127, in __prepare_request_params\n    sign = sign_with_rsa2(self.__config.app_private_key, sign_content, self.__config.charset)\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\util\\SignatureUtils.py\", line 48, in sign_with_rsa2\n    private_key = fill_private_key_marker(private_key)\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\util\\SignatureUtils.py\", line 27, in fill_private_key_marker\n    return add_start_end(private_key, \"-----BEGIN RSA PRIVATE KEY-----\\n\", \"\\n-----END RSA PRIVATE KEY-----\")\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\util\\StringUtils.py\", line 10, in add_start_end\n    if key.find(startMarker) < 0:\n       ~~~~~~~~^^^^^^^^^^^^^\nTypeError: argument should be integer or bytes-like object, not \'str\'\n\nDuring handling of the above exception, another exception occurred:\n\nTraceback (most recent call last):\n  File \"D:\\PycharmProjects\\houseSystemBack\\blueprints\\alipay.py\", line 21, in pay\n    pay_url = client.generate_payment_url(\n        out_trade_no=out_trade_no,\n        total_amount=total_amount,\n        subject=subject\n    )\n  File \"D:\\PycharmProjects\\houseSystemBack\\exts\\alipay_client.py\", line 33, in generate_payment_url\n    return self.client.page_execute(request, http_method=\"GET\")\n           ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 322, in page_execute\n    query_string, params = self.__prepare_request(request)\n                           ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 89, in __prepare_request\n    common_params, params = self.__prepare_request_params(request)\n                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 131, in __prepare_request_params\n    raise RequestException(\'[\' + THREAD_LOCAL.uuid + \']request sign failed. \' + str(e))\nalipay.aop.api.exception.Exception.RequestException: [0d488fa3-46cc-11f0-93a3-005056c00008]request sign failed. argument should be integer or bytes-like object, not \'str\'');
INSERT INTO `log_entries` VALUES (951, '2025-06-11 13:58:20', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (952, '2025-06-11 13:58:21', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (953, '2025-06-11 13:58:21', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (954, '2025-06-11 13:58:24', 'ERROR', 'alipay', 'pay', 28, '[244a6236-46cc-11f0-84fe-005056c00008]request sign failed. argument should be integer or bytes-like object, not \'str\'', 'Traceback (most recent call last):\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 127, in __prepare_request_params\n    sign = sign_with_rsa2(self.__config.app_private_key, sign_content, self.__config.charset)\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\util\\SignatureUtils.py\", line 48, in sign_with_rsa2\n    private_key = fill_private_key_marker(private_key)\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\util\\SignatureUtils.py\", line 27, in fill_private_key_marker\n    return add_start_end(private_key, \"-----BEGIN RSA PRIVATE KEY-----\\n\", \"\\n-----END RSA PRIVATE KEY-----\")\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\util\\StringUtils.py\", line 10, in add_start_end\n    if key.find(startMarker) < 0:\n       ~~~~~~~~^^^^^^^^^^^^^\nTypeError: argument should be integer or bytes-like object, not \'str\'\n\nDuring handling of the above exception, another exception occurred:\n\nTraceback (most recent call last):\n  File \"D:\\PycharmProjects\\houseSystemBack\\blueprints\\alipay.py\", line 21, in pay\n    pay_url = client.generate_payment_url(\n        out_trade_no=out_trade_no,\n        total_amount=total_amount,\n        subject=subject\n    )\n  File \"D:\\PycharmProjects\\houseSystemBack\\exts\\alipay_client.py\", line 33, in generate_payment_url\n    return self.client.page_execute(request, http_method=\"GET\")\n           ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 322, in page_execute\n    query_string, params = self.__prepare_request(request)\n                           ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 89, in __prepare_request\n    common_params, params = self.__prepare_request_params(request)\n                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 131, in __prepare_request_params\n    raise RequestException(\'[\' + THREAD_LOCAL.uuid + \']request sign failed. \' + str(e))\nalipay.aop.api.exception.Exception.RequestException: [244a6236-46cc-11f0-84fe-005056c00008]request sign failed. argument should be integer or bytes-like object, not \'str\'');
INSERT INTO `log_entries` VALUES (955, '2025-06-11 13:59:07', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\blueprints\\\\alipay.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (956, '2025-06-11 13:59:08', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (957, '2025-06-11 13:59:09', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (958, '2025-06-11 13:59:09', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (959, '2025-06-11 14:01:01', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (960, '2025-06-11 14:01:03', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (961, '2025-06-11 14:01:03', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (962, '2025-06-11 14:01:06', 'ERROR', 'alipay', 'pay', 28, '[8449da1b-46cc-11f0-b731-005056c00008]request sign failed. argument should be integer or bytes-like object, not \'str\'', 'Traceback (most recent call last):\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 127, in __prepare_request_params\n    sign = sign_with_rsa2(self.__config.app_private_key, sign_content, self.__config.charset)\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\util\\SignatureUtils.py\", line 48, in sign_with_rsa2\n    private_key = fill_private_key_marker(private_key)\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\util\\SignatureUtils.py\", line 27, in fill_private_key_marker\n    return add_start_end(private_key, \"-----BEGIN RSA PRIVATE KEY-----\\n\", \"\\n-----END RSA PRIVATE KEY-----\")\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\util\\StringUtils.py\", line 10, in add_start_end\n    if key.find(startMarker) < 0:\n       ~~~~~~~~^^^^^^^^^^^^^\nTypeError: argument should be integer or bytes-like object, not \'str\'\n\nDuring handling of the above exception, another exception occurred:\n\nTraceback (most recent call last):\n  File \"D:\\PycharmProjects\\houseSystemBack\\blueprints\\alipay.py\", line 21, in pay\n    pay_url = client.generate_payment_url(\n        out_trade_no=out_trade_no,\n        total_amount=total_amount,\n        subject=subject\n    )\n  File \"D:\\PycharmProjects\\houseSystemBack\\exts\\alipay_client.py\", line 33, in generate_payment_url\n    return self.client.page_execute(request, http_method=\"GET\")\n           ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 322, in page_execute\n    query_string, params = self.__prepare_request(request)\n                           ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 89, in __prepare_request\n    common_params, params = self.__prepare_request_params(request)\n                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 131, in __prepare_request_params\n    raise RequestException(\'[\' + THREAD_LOCAL.uuid + \']request sign failed. \' + str(e))\nalipay.aop.api.exception.Exception.RequestException: [8449da1b-46cc-11f0-b731-005056c00008]request sign failed. argument should be integer or bytes-like object, not \'str\'');
INSERT INTO `log_entries` VALUES (963, '2025-06-11 14:04:05', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (964, '2025-06-11 14:04:06', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (965, '2025-06-11 14:04:06', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (966, '2025-06-11 14:04:10', 'ERROR', 'alipay', 'pay', 28, '[f1f978ed-46cc-11f0-b2b0-005056c00008]request sign failed. argument should be integer or bytes-like object, not \'str\'', 'Traceback (most recent call last):\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 127, in __prepare_request_params\n    sign = sign_with_rsa2(self.__config.app_private_key, sign_content, self.__config.charset)\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\util\\SignatureUtils.py\", line 48, in sign_with_rsa2\n    private_key = fill_private_key_marker(private_key)\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\util\\SignatureUtils.py\", line 27, in fill_private_key_marker\n    return add_start_end(private_key, \"-----BEGIN RSA PRIVATE KEY-----\\n\", \"\\n-----END RSA PRIVATE KEY-----\")\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\util\\StringUtils.py\", line 10, in add_start_end\n    if key.find(startMarker) < 0:\n       ~~~~~~~~^^^^^^^^^^^^^\nTypeError: argument should be integer or bytes-like object, not \'str\'\n\nDuring handling of the above exception, another exception occurred:\n\nTraceback (most recent call last):\n  File \"D:\\PycharmProjects\\houseSystemBack\\blueprints\\alipay.py\", line 21, in pay\n    pay_url = client.generate_payment_url(\n        out_trade_no=out_trade_no,\n        total_amount=total_amount,\n        subject=subject\n    )\n  File \"D:\\PycharmProjects\\houseSystemBack\\exts\\alipay_client.py\", line 33, in generate_payment_url\n    return self.client.page_execute(request, http_method=\"GET\")\n           ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 322, in page_execute\n    query_string, params = self.__prepare_request(request)\n                           ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 89, in __prepare_request\n    common_params, params = self.__prepare_request_params(request)\n                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^\n  File \"D:\\Python313\\Lib\\site-packages\\alipay\\aop\\api\\DefaultAlipayClient.py\", line 131, in __prepare_request_params\n    raise RequestException(\'[\' + THREAD_LOCAL.uuid + \']request sign failed. \' + str(e))\nalipay.aop.api.exception.Exception.RequestException: [f1f978ed-46cc-11f0-b2b0-005056c00008]request sign failed. argument should be integer or bytes-like object, not \'str\'');
INSERT INTO `log_entries` VALUES (967, '2025-06-11 14:05:09', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\exts\\\\alipay.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (968, '2025-06-11 14:05:09', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (969, '2025-06-11 14:05:11', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (970, '2025-06-11 14:05:11', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (971, '2025-06-11 14:05:19', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\exts\\\\alipay.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (972, '2025-06-11 14:05:19', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (973, '2025-06-11 14:05:21', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (974, '2025-06-11 14:05:21', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (975, '2025-06-11 14:09:21', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (976, '2025-06-11 14:09:22', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (977, '2025-06-11 14:09:22', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (978, '2025-06-11 14:13:50', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\blueprints\\\\user.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (979, '2025-06-11 14:13:50', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (980, '2025-06-11 14:13:52', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (981, '2025-06-11 14:13:52', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (982, '2025-06-11 14:17:34', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\exts\\\\alipay.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (983, '2025-06-11 14:17:34', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (984, '2025-06-11 14:17:36', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (985, '2025-06-11 14:17:36', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (986, '2025-06-11 14:20:49', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (987, '2025-06-11 14:20:50', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (988, '2025-06-11 14:20:50', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (989, '2025-06-11 14:22:08', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\blueprints\\\\alipay.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (990, '2025-06-11 14:22:08', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (991, '2025-06-11 14:22:10', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (992, '2025-06-11 14:22:10', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (993, '2025-06-11 14:25:45', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\blueprints\\\\alipay.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (994, '2025-06-11 14:25:45', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (995, '2025-06-11 14:25:47', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (996, '2025-06-11 14:25:47', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (997, '2025-06-11 14:40:09', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (998, '2025-06-11 14:40:10', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (999, '2025-06-11 14:40:10', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (1000, '2025-06-11 14:42:36', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (1001, '2025-06-11 14:42:37', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (1002, '2025-06-11 14:42:37', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (1003, '2025-06-11 14:43:36', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (1004, '2025-06-11 14:43:37', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (1005, '2025-06-11 14:43:37', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (1006, '2025-06-11 14:43:55', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (1007, '2025-06-11 14:43:57', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (1008, '2025-06-11 14:43:57', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (1009, '2025-06-11 14:45:01', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (1010, '2025-06-11 14:45:03', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (1011, '2025-06-11 14:45:03', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (1012, '2025-06-11 14:45:19', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (1013, '2025-06-11 14:45:20', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (1014, '2025-06-11 14:45:20', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (1015, '2025-06-11 14:46:32', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (1016, '2025-06-11 14:46:33', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (1017, '2025-06-11 14:46:33', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (1018, '2025-06-11 14:47:19', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\blueprints\\\\user.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (1019, '2025-06-11 14:47:19', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (1020, '2025-06-11 14:47:21', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (1021, '2025-06-11 14:47:21', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (1022, '2025-06-11 14:56:02', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack\\\\blueprints\\\\celery.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (1023, '2025-06-11 14:56:02', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (1024, '2025-06-11 14:56:04', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (1025, '2025-06-11 14:56:04', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (1026, '2025-06-12 07:54:25', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (1027, '2025-06-12 07:54:26', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (1028, '2025-06-12 07:54:27', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (1029, '2025-06-12 07:54:58', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (1030, '2025-06-12 07:54:59', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (1031, '2025-06-12 07:54:59', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (1032, '2025-06-12 07:55:44', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (1033, '2025-06-12 07:55:46', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (1034, '2025-06-12 07:55:46', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (1035, '2025-06-12 07:56:06', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (1036, '2025-06-12 07:56:07', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (1037, '2025-06-12 07:56:07', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (1038, '2025-06-12 07:56:42', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (1039, '2025-06-12 07:56:44', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (1040, '2025-06-12 07:56:44', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (1041, '2025-06-12 07:57:11', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (1042, '2025-06-12 07:57:13', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (1043, '2025-06-12 07:57:13', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (1044, '2025-06-12 07:57:22', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (1045, '2025-06-12 07:57:24', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (1046, '2025-06-12 07:57:24', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (1047, '2025-06-12 07:58:34', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (1048, '2025-06-12 07:58:36', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (1049, '2025-06-12 07:58:36', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (1050, '2025-06-12 07:59:38', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (1051, '2025-06-12 07:59:40', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (1052, '2025-06-12 07:59:40', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (1053, '2025-06-12 07:59:47', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (1054, '2025-06-12 07:59:48', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (1055, '2025-06-12 07:59:48', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (1056, '2025-06-12 08:00:12', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (1057, '2025-06-12 08:00:14', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (1058, '2025-06-12 08:00:14', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (1059, '2025-06-12 08:01:05', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (1060, '2025-06-12 08:01:06', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (1061, '2025-06-12 08:01:06', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (1062, '2025-06-12 08:01:39', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack2\\\\services\\\\user_service.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (1063, '2025-06-12 08:01:39', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (1064, '2025-06-12 08:01:41', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (1065, '2025-06-12 08:01:41', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (1066, '2025-06-12 08:01:44', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (1067, '2025-06-12 08:01:46', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (1068, '2025-06-12 08:01:46', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (1069, '2025-06-12 08:02:15', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack2\\\\models\\\\user_model.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (1070, '2025-06-12 08:02:15', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (1071, '2025-06-12 08:02:17', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (1072, '2025-06-12 08:02:17', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (1073, '2025-06-12 08:02:21', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (1074, '2025-06-12 08:02:22', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (1075, '2025-06-12 08:02:22', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (1076, '2025-06-12 08:02:28', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (1077, '2025-06-12 08:02:30', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (1078, '2025-06-12 08:02:30', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (1079, '2025-06-12 08:02:50', 'INFO', '_internal', '_log', 97, ' * Detected change in \'D:\\\\PycharmProjects\\\\houseSystemBack2\\\\blueprints\\\\user.py\', reloading', NULL);
INSERT INTO `log_entries` VALUES (1080, '2025-06-12 08:02:50', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (1081, '2025-06-12 08:02:52', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (1082, '2025-06-12 08:02:52', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (1083, '2025-06-12 08:05:52', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (1084, '2025-06-12 08:05:54', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (1085, '2025-06-12 08:05:54', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (1086, '2025-06-12 13:08:11', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (1087, '2025-06-12 13:08:12', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (1088, '2025-06-12 13:08:12', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (1089, '2025-06-12 13:12:55', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (1090, '2025-06-12 13:12:56', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (1091, '2025-06-12 13:12:56', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (1092, '2025-06-12 13:15:40', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (1093, '2025-06-12 13:15:41', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (1094, '2025-06-12 13:15:41', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (1095, '2025-06-19 11:45:36', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (1096, '2025-06-19 11:45:37', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (1097, '2025-06-19 11:45:37', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (1098, '2025-06-19 13:05:47', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (1099, '2025-06-19 13:05:49', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (1100, '2025-06-19 13:05:49', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (1101, '2025-06-19 13:09:06', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (1102, '2025-06-19 13:09:08', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (1103, '2025-06-19 13:09:08', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (1104, '2025-06-19 13:14:51', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (1105, '2025-06-19 13:14:52', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (1106, '2025-06-19 13:14:52', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (1107, '2025-06-19 13:21:34', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (1108, '2025-06-19 13:21:36', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (1109, '2025-06-19 13:21:36', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (1110, '2025-06-19 13:33:14', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (1111, '2025-06-19 13:33:15', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (1112, '2025-06-19 13:33:15', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (1113, '2025-06-19 13:38:14', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (1114, '2025-06-19 13:38:16', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (1115, '2025-06-19 13:38:16', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (1116, '2025-06-19 13:48:09', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (1117, '2025-06-19 13:48:11', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (1118, '2025-06-19 13:48:11', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (1119, '2025-06-19 13:52:50', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (1120, '2025-06-19 13:52:51', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (1121, '2025-06-19 13:52:52', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (1122, '2025-06-19 13:54:21', 'ERROR', 'alipay', 'verify_return', 89, 'Exception in /verify_return', 'Traceback (most recent call last):\n  File \"D:\\PycharmProjects\\houseSystemBack2\\blueprints\\alipay.py\", line 78, in verify_return\n    ok = client.verify(data, signature)\n  File \"D:\\PycharmProjects\\houseSystemBack2\\exts\\alipay_client.py\", line 37, in verify\n    return self.client.verify(data, signature)\n           ^^^^^^^^^^^^^^^^^^\nAttributeError: \'DefaultAlipayClient\' object has no attribute \'verify\'');
INSERT INTO `log_entries` VALUES (1123, '2025-06-19 13:56:24', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (1124, '2025-06-19 13:56:25', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (1125, '2025-06-19 13:56:25', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (1126, '2025-06-19 13:59:03', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (1127, '2025-06-19 13:59:04', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (1128, '2025-06-19 13:59:04', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);
INSERT INTO `log_entries` VALUES (1129, '2025-06-20 01:48:21', 'INFO', '_internal', '_log', 97, ' * Restarting with stat', NULL);
INSERT INTO `log_entries` VALUES (1130, '2025-06-20 01:48:23', 'WARNING', '_internal', '_log', 97, ' * Debugger is active!', NULL);
INSERT INTO `log_entries` VALUES (1131, '2025-06-20 01:48:23', 'INFO', '_internal', '_log', 97, ' * Debugger PIN: 144-990-485', NULL);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `message_id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '消息内容',
  `sender_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '发送者用户名',
  `receiver_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '接收者用户名',
  `timestamp` datetime NULL DEFAULT NULL COMMENT '消息时间戳',
  `channel_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`message_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (1, 'manba out', 'Andy', 'LU', '2025-05-19 16:08:26', 1);
INSERT INTO `message` VALUES (2, 'what can i say', 'Andy', 'LU', '2025-05-19 16:10:02', 1);
INSERT INTO `message` VALUES (3, 'kobe brant', 'Andy', 'LU', '2025-05-19 16:35:40', 1);
INSERT INTO `message` VALUES (4, 'man', 'Andy', 'LU', '2025-05-19 16:43:08', 1);
INSERT INTO `message` VALUES (5, 'hahahaha', 'Andy', 'LU', '2025-05-19 16:43:08', 1);
INSERT INTO `message` VALUES (6, 'hahahahahaha', 'Andy', 'LU', '2025-05-21 16:29:32', 1);
INSERT INTO `message` VALUES (7, 'manba in', 'Andy', 'LU', '2025-05-21 19:08:20', 1);
INSERT INTO `message` VALUES (8, 'manba out', 'Andy', 'LU', '2025-05-21 19:08:20', 1);
INSERT INTO `message` VALUES (9, '你是谁?', 'Andy', 'LU', '2025-05-21 19:08:20', 1);
INSERT INTO `message` VALUES (10, '我是乃龙', 'Andy', 'LU', '2025-05-21 19:15:39', 1);
INSERT INTO `message` VALUES (11, '我会喷火，你会吗', 'Andy', 'LU', '2025-05-21 19:56:29', 1);
INSERT INTO `message` VALUES (12, 'woc', 'Andy', 'LU', '2025-05-21 20:48:06', 1);
INSERT INTO `message` VALUES (13, 'bin', 'Andy', 'LU', '2025-05-21 21:01:37', 1);
INSERT INTO `message` VALUES (14, '你好', 'Andy', 'LU', '2025-05-23 22:42:10', 1);
INSERT INTO `message` VALUES (32, '你好', 'Lappand', '陆岳', '2025-06-02 20:41:17', 4);
INSERT INTO `message` VALUES (40, '你好', 'Lappand', '张女士', '2025-06-03 12:59:45', 5);
INSERT INTO `message` VALUES (41, '你好', '陆岳', 'Lappand', '2025-06-03 13:02:17', 4);
INSERT INTO `message` VALUES (42, '你是谁', 'Lappand', '陆岳', '2025-06-03 13:02:26', 4);
INSERT INTO `message` VALUES (43, '我是乃龙', '陆岳', 'Lappand', '2025-06-03 13:02:36', 4);
INSERT INTO `message` VALUES (44, '真的吗', 'Lappand', '陆岳', '2025-06-03 13:02:49', 4);
INSERT INTO `message` VALUES (45, '真的哦', '陆岳', 'Lappand', '2025-06-03 13:02:55', 4);
INSERT INTO `message` VALUES (46, '杠', '忧郁的令家人', '张先生', '2025-06-12 21:11:19', 6);
INSERT INTO `message` VALUES (47, '绰约', '张先生', '陆岳', '2025-06-12 21:18:01', 7);
INSERT INTO `message` VALUES (48, '放屁', '陆岳', '张先生', '2025-06-12 21:18:20', 7);

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `publish_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (26, '震惊', '当美警遇上钓鱼佬', '2025-05-24 10:29:04');
INSERT INTO `news` VALUES (27, '重磅消息', '中共二十大决定，坚定执行党的领导，对于……', '2025-05-24 00:00:00');
INSERT INTO `news` VALUES (28, 'yess', '你是一个一个一个...', '2025-05-30 00:00:00');

-- ----------------------------
-- Table structure for rental
-- ----------------------------
DROP TABLE IF EXISTS `rental`;
CREATE TABLE `rental`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tenant_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `landlord_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `house_id` int NULL DEFAULT NULL,
  `currentDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rental
-- ----------------------------
INSERT INTO `rental` VALUES (1, 'Ylfmoonn', '陈先生', 1, '2025-05-31 00:00:00');
INSERT INTO `rental` VALUES (2, 'Ylfmoonn', '张女士', 2, '2025-05-31 00:00:00');
INSERT INTO `rental` VALUES (3, 'Ylfmoonn', '刘先生', 3, '2025-05-31 00:00:00');
INSERT INTO `rental` VALUES (4, 'Ylfmoonn', '张先生', 37, '2025-06-20 00:00:00');

-- ----------------------------
-- Table structure for repair_complaint
-- ----------------------------
DROP TABLE IF EXISTS `repair_complaint`;
CREATE TABLE `repair_complaint`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `report_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `house_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `repair_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `repair_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `complaint_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `complaint_person` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `agreed_terms` int NULL DEFAULT NULL,
  `create_at` datetime NULL DEFAULT NULL,
  `handle` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of repair_complaint
-- ----------------------------
INSERT INTO `repair_complaint` VALUES (1, 'repair', 'dasdas', '水电维修', '', NULL, NULL, 1, '2025-05-19 10:50:31', NULL);
INSERT INTO `repair_complaint` VALUES (2, 'repair', 'dasdas', '水电维修', '', NULL, NULL, 1, '2025-05-19 10:56:48', NULL);
INSERT INTO `repair_complaint` VALUES (3, 'complaint', 'dasdas', '水电维修', '', NULL, '李茜', 1, '2025-05-19 10:58:03', NULL);
INSERT INTO `repair_complaint` VALUES (4, 'repair', 'aaaaaaa', '网络维修', '', '', NULL, 1, '2025-05-19 11:02:59', NULL);
INSERT INTO `repair_complaint` VALUES (5, 'repair', 'fffffffff', '其他维修', 'aaaaa', '', NULL, 1, '2025-05-19 11:05:07', NULL);
INSERT INTO `repair_complaint` VALUES (6, 'repair', '11111', '设备维修', '', '', NULL, 1, '2025-05-19 11:12:23', NULL);
INSERT INTO `repair_complaint` VALUES (7, 'repair', '12舍', '网络维修', '', '', '', 1, '2025-05-19 11:16:21', NULL);
INSERT INTO `repair_complaint` VALUES (8, 'complaint', '', NULL, '王万古', 'aaaaaaaaa', '王万古', 1, '2025-05-19 11:19:19', NULL);
INSERT INTO `repair_complaint` VALUES (9, 'repair', 'sssssssssssss', '网络维修', ' ', ' ', '', 1, '2025-05-19 11:20:25', NULL);
INSERT INTO `repair_complaint` VALUES (10, 'repair', 'sssssssssssss', '网络维修', ' ', ' ', '', 1, '2025-05-19 11:22:27', NULL);
INSERT INTO `repair_complaint` VALUES (11, 'repair', '12525', '网络维修', ' ', ' ', '', 1, '2025-05-19 11:28:50', NULL);
INSERT INTO `repair_complaint` VALUES (12, 'repair', '12525', '网络维修', ' ', ' ', '', 1, '2025-05-19 11:30:44', NULL);
INSERT INTO `repair_complaint` VALUES (13, 'repair', '1111', '设备维修', ' ', ' ', '', 1, '2025-05-19 11:31:29', NULL);
INSERT INTO `repair_complaint` VALUES (14, 'repair', 'sss', '设备维修', ' ', ' ', '', 1, '2025-05-21 16:30:54', NULL);
INSERT INTO `repair_complaint` VALUES (15, 'repair', '12舍525', '网络维修', ' ', ' ', '', 1, '2025-05-21 19:29:09', NULL);
INSERT INTO `repair_complaint` VALUES (16, 'complaint', '', NULL, ' ', '你是一个一个', '王万古', 1, '2025-05-21 19:58:29', NULL);
INSERT INTO `repair_complaint` VALUES (17, 'repair', '你是一个一个', '水电维修', ' ', ' ', '', 1, '2025-05-21 20:11:33', NULL);
INSERT INTO `repair_complaint` VALUES (18, 'repair', '和卢月整合', '设备维修', ' ', ' ', '', 1, '2025-05-21 20:50:05', NULL);
INSERT INTO `repair_complaint` VALUES (19, 'complaint', '', NULL, ' ', '不想写代码', '王万古', 1, '2025-05-21 21:02:27', NULL);
INSERT INTO `repair_complaint` VALUES (20, 'repair', 'yinbocode', '设备维修', ' ', ' ', '', 1, '2025-05-23 20:35:00', NULL);
INSERT INTO `repair_complaint` VALUES (21, 'repair', '银波codefix2.0', '水电维修', ' ', ' ', '', 1, '2025-05-23 23:42:44', NULL);
INSERT INTO `repair_complaint` VALUES (22, 'repair', 'assad', '网络维修', ' ', ' ', '', 1, '2025-05-24 00:33:20', NULL);
INSERT INTO `repair_complaint` VALUES (23, 'repair', '校本部12舍525', '水电维修', ' ', ' ', '', 1, '2025-05-24 00:37:19', NULL);
INSERT INTO `repair_complaint` VALUES (24, 'complaint', '', NULL, ' ', '熬夜写代码', '7', 1, '2025-05-24 10:03:29', NULL);
INSERT INTO `repair_complaint` VALUES (25, 'repair', '奥雷', '设备维修', ' ', ' ', '', 1, '2025-05-24 10:04:34', 1);
INSERT INTO `repair_complaint` VALUES (26, 'complaint', '', NULL, ' ', 'haodihen', '9', 1, '2025-05-24 10:04:43', 0);
INSERT INTO `repair_complaint` VALUES (27, 'repair', 'eds', '设备维修', ' ', ' ', '', 1, '2025-05-26 14:52:58', NULL);
INSERT INTO `repair_complaint` VALUES (28, 'complaint', '', NULL, ' ', '啊啊啊啊啊', '8', 1, '2025-05-26 15:21:52', NULL);
INSERT INTO `repair_complaint` VALUES (29, 'complaint', '', NULL, ' ', '整合修bug\noss都怪你', '7', 1, '2025-05-26 16:15:49', NULL);
INSERT INTO `repair_complaint` VALUES (30, 'complaint', '', NULL, ' ', '333333', '8', 1, '2025-05-30 22:36:26', NULL);
INSERT INTO `repair_complaint` VALUES (31, 'complaint', '', NULL, ' ', '433', '7', 1, '2025-06-01 19:36:19', NULL);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `seen_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `collect_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `identityCard` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userType` int NULL DEFAULT NULL,
  `avatarUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1, 'aaaa', '$2b$12$IQmUsGOK8okL9as/abcU7e2ZfZThnoIEquL9SB0vhyaTNELEjb0Le', '114514@qq.com', '1145141919', '123456', '0', '0', '', 2, NULL);
INSERT INTO `user_info` VALUES (3, 'Ylfmoonn', '$2b$12$.qbllCaHCKG8g9xTP29S4eVM3VReNMzzgLSNb/KNAQDoCCPORGhuS', 'lapu2023@outlook.com', '19511053623', '岳麓区', '1', '2', '41132511451411', 1, NULL);
INSERT INTO `user_info` VALUES (4, 'Lappand', '$2b$12$bA1jsIhsQi/qTGAilYyLF.EV0v3EHkl5qcpBGxBmWJRH/LPHsUchq', NULL, '19511053624', '校本部1111', NULL, NULL, NULL, 0, 'https://i.pinimg.com/736x/54/0a/89/540a89862811d8bffc763caf6829699d.jpg');
INSERT INTO `user_info` VALUES (5, NULL, '$2b$12$BKQ4MnXq8qnvz4SownzK3uoBCdmRktRdr2BX4FlzjT/7xBjGXzyqS', NULL, '15274896231', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES (6, NULL, '$2b$12$ChX6QeErNGea10kbGHpLSeOlJVX4iW2t/OxGthi3.F38IhQzBitl2', NULL, '195110536232', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES (7, '陆岳', '$2b$12$Sxpz3EUvmc4YzE2PctOh1OYYMhkHK5fLQf7d6HLQ0sZ0kCCF7hJa.', '2708@qq.com', '16608188853', '校本部', NULL, NULL, '111111111111111111', 2, 'http://localhost:5000/user/images/7_20250612131829.png');
INSERT INTO `user_info` VALUES (8, '胡琪', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL);
INSERT INTO `user_info` VALUES (9, '梅姨', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL);
INSERT INTO `user_info` VALUES (10, NULL, '$2b$12$N/yOiQTDtKMI.gzO00VoBeZjHUwI.5hZ/KzaEoLJPGEsl3CM4KLCS', NULL, '15083377951', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES (13, 'luyue', '$2b$12$EsAYOOEL0cmyIyqJNmsqS.n7vaCMnQIUPjt3dh69kHUJQ5jBI.uMa', '277@qq.com', '1342585678', '525', NULL, NULL, '111111111111111111', NULL, NULL);
INSERT INTO `user_info` VALUES (14, '忧郁的令家人', '$2b$12$VcUgB70uv9wFp8nUTJar0.0HTGD475/NPkyQuko1sgdlw2clmnME.', '2779902707@qq.com', '13630278915', '泰拉', NULL, NULL, '278990766576789087', 1, 'http://localhost:5000/user/images/14_20250612131009.png');

SET FOREIGN_KEY_CHECKS = 1;
