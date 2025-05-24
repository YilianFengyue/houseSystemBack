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

 Date: 24/05/2025 10:51:49
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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of appointment
-- ----------------------------
INSERT INTO `appointment` VALUES (1, 'a', 'a', '2025-05-15 20:15:11');
INSERT INTO `appointment` VALUES (2, 'aaaa', '万科魅力之城武广新城', '2025-05-18 16:00:00');
INSERT INTO `appointment` VALUES (3, 'aaaa', '万科魅力之城武广新城', '2025-05-23 16:00:00');
INSERT INTO `appointment` VALUES (4, 'aaaa', '万科魅力之城武广新城', '2025-05-02 16:00:00');
INSERT INTO `appointment` VALUES (5, 'aaaa', '万科魅力之城武广新城', '2025-05-24 16:00:00');

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of channel
-- ----------------------------
INSERT INTO `channel` VALUES (1, 'Andy', 'Lu', '2025-05-21 19:25:54');

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of contract
-- ----------------------------
INSERT INTO `contract` VALUES (1, '10251', '居住', '2025-04-30 16:00:00', '2025-05-30 16:00:00', '', NULL, '', '', NULL, '', '壹万零仟贰佰伍拾壹元整', '2025-05-18 00:00:00');
INSERT INTO `contract` VALUES (2, '3200', '居住', '2025-05-01 16:00:00', '2025-05-02 16:00:00', '', NULL, '', '', NULL, '', '叁仟贰佰零拾零元整', '2025-05-23 00:00:00');
INSERT INTO `contract` VALUES (3, '3200', '居住', '2025-05-01 16:00:00', '2025-05-29 16:00:00', '张先生', NULL, '13800001234', '', NULL, '', '叁仟贰佰零拾零元整', '2025-05-24 00:00:00');

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
  `page_views` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '浏览量',
  `landlord` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '房东',
  `phone_num` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '房东电话',
  `house_num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '房源编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of house_info
-- ----------------------------
INSERT INTO `house_info` VALUES (1, '整租·锦源小区 2室1厅 南', '雨花', '树木岭', '锦源小区', 73, '南', '2室1厅1卫', 1600, '整租', '精装', 1, 1, 1, 'https://i.pinimg.com/736x/c4/3a/90/c43a90fcf336e05d7f849b527f067464.jpg', '2025-05-15', '108次浏览', '张先生', '13800001234', '10001');
INSERT INTO `house_info` VALUES (2, '合租·泰时新雅园 4居室 南卧', '芙蓉', '晚报', '泰时新雅园', 18, '南', '4室2厅2卫', 580, '合租', '精装', 1, 1, 0, 'https://i.pinimg.com/736x/f4/2c/7b/f42c7b16d92dab70ff7af2b59d02fdb5.jpg', '2025-05-14', '89次浏览', '龟壳公寓', '13800005678', '10002');
INSERT INTO `house_info` VALUES (3, '整租·星宇V立方 1室0厅 南', '天心', '金盆岭', '星宇V立方', 29.14, '南', '1室0厅1卫', 1280, '整租', '精装', 1, 1, 1, 'https://flaskhousesystem.oss-cn-hangzhou.aliyuncs.com/house_images/3/82d3513094144b92abfe5a20419d82e9.png', '2025-05-15', '72次浏览', '李女士', '13800007890', '10003');
INSERT INTO `house_info` VALUES (4, '合租·长远华樟名府 5居室 南卧', '雨花', '尚东', '长远华樟名府', 25, '南', '5室1厅3卫', 540, '合租', '精装', 1, 1, 1, 'https://flaskhousesystem.oss-cn-hangzhou.aliyuncs.com/house_images/4/a1e68eda3df44341b55a3beea55dda84.png', '2025-05-14', '61次浏览', '包租婆宿懒公寓', '13800009876', '10004');
INSERT INTO `house_info` VALUES (5, '整租·长大彩虹都 3室2厅 南/北', '天心', '铁道学院', '长大彩虹都', 90, '南/北', '3室2厅1卫', 1900, '整租', '精装', 1, 1, 0, 'https://flaskhousesystem.oss-cn-hangzhou.aliyuncs.com/house_images/5/f670c3336dce42a7b1a12850e4948a6f.png', '2025-05-17', '0次浏览', '房东直租', '18800000005', '10005');
INSERT INTO `house_info` VALUES (6, '合租·山水华景 5居室 南卧', '芙蓉', '马王堆', '山水华景', 25, '南', '5室1厅2卫', 849, '合租', '精装', 0, 1, 0, 'https://ke-image.ljcdn.com/wanjia/885e92fd2470add49f2c29ce7824562c-1743474437330/458004f9fa46b67b17d8e69c543c97e5.jpg.250x182.jpg', '2025-05-15', '0次浏览', '长沙鸿威公寓', '18800000006', '10006');
INSERT INTO `house_info` VALUES (7, '整租·国税局 3室2厅 南', '天心', '书院路', '国税局', 120, '南', '3室2厅2卫', 2600, '整租', '精装', 1, 1, 1, 'https://ke-image.ljcdn.com/110000-inspection/pc1_FDoD4Qv0H.jpg!m_fill,w_250,h_182,l_fbk,o_auto', '2025-05-17', '0次浏览', '房东直租', '18800000007', '10007');
INSERT INTO `house_info` VALUES (8, '合租·运通尊苑 5居室 南卧', '芙蓉', '马王堆', '运通尊苑', 22, '南', '5室1厅2卫', 499, '合租', '精装', 1, 1, 0, 'https://ke-image.ljcdn.com/wanjia/885e92fd2470add49f2c29ce7824562c-1744075290085/1ae441cdb24ea2e1337c8d898dadd212.jpg.250x182.jpg', '2025-05-15', '0次浏览', '长沙鸿威公寓', '18800000008', '10008');
INSERT INTO `house_info` VALUES (17, '整租·星城国际 2室1厅 南', '长沙县', '泉塘', '星城国际', 94, '南', '2室1厅', 1300, '整租', '精装', 0, 1, 1, 'https://ke-image.ljcdn.com/110000-inspection/pc1_uDfVpz1x0.jpg!m_fill,w_250,h_182,l_fbk,o_auto', '2025-05-18', '345', '李公寓', '13812340001', '2034863457987198976');
INSERT INTO `house_info` VALUES (18, '独栋·冠寓 长沙大王山二店 端午节假特惠长租首月温馨单间/无中介/押一付一/学生特惠/拎包入住 1室1厅', NULL, NULL, NULL, 25, NULL, '1室1厅', 1082, '整租', '精装', 1, 1, 0, 'https://ke-image.ljcdn.com/wanjia/a2725a504f8355b0dc85a1a5f063dd14-1730705081114/7faa52b57e5b39bc5b683179bb40dc94.jpg.250x182.jpg', '2025-05-07', '762', '冠寓', '15012340002', '81148');
INSERT INTO `house_info` VALUES (19, '整租·星语林名园 4室2厅 南/北', '雨花', '铁道学院', '星语林名园', 161, '南/北', '4室2厅', 2400, '整租', '精装', 0, 1, 1, 'https://ke-image.ljcdn.com/110000-inspection/pc1_3zywCsF31.jpg!m_fill,w_250,h_182,l_fbk,o_auto', '2025-05-18', '189', '张之家', '13912340003', '2034860054812819456');
INSERT INTO `house_info` VALUES (20, '独栋·长鸿公寓 袁家岭火车站店 袁家岭 火车站 精装公寓 （不短租） 1室1厅', NULL, NULL, NULL, 30, NULL, '1室1厅', 1280, '整租', '精装', 1, 1, 0, 'https://ke-image.ljcdn.com/wanjia/d39c5e560eeab606c45f04f631121b29-1700222454743/7c243ce3a83b979fea41c96a4f928366.jpg.250x182.jpg', '2025-05-09', '488', '长鸿公寓', '13712340004', '70636');
INSERT INTO `house_info` VALUES (21, '整租·2076至高点 1室1厅 东', '雨花', '左家塘', '2076至高点', 41, '东', '1室1厅', 1100, '整租', '精装', 0, 1, 1, 'https://ke-image.ljcdn.com/110000-inspection/pc1_5rbWll83U.jpg!m_fill,w_250,h_182,l_fbk,o_auto', '2025-05-19', '971', '刘先生', '13612340005', '2024412686569177088');
INSERT INTO `house_info` VALUES (22, '独栋·原宿奢宅 北辰定江洋 定江洋2-2007 3室2厅', NULL, NULL, NULL, 200, NULL, '3室2厅', 15800, '整租', '精装', 0, 1, 1, 'https://ke-image.ljcdn.com/wanjia/970ac731d8b27629750e6bbe1321eaf8-1747299807893/b534223a79a3f52a05fc48b95d65531b.jpg.250x182.jpg', '2025-05-16', '1503', '原宿奢宅', '13512340006', '92368');
INSERT INTO `house_info` VALUES (23, '整租·中海阅溪府 3室2厅 南', '岳麓', '东方红', '中海阅溪府', 112, '南', '3室2厅', 3200, '整租', '精装', 1, 1, 1, 'https://ke-image.ljcdn.com/110000-inspection/pc1_a9nlH8ZdH.jpg!m_fill,w_250,h_182,l_fbk,o_auto', '2025-05-18', '622', '杨女士', '13412340007', '2034617752949358592');
INSERT INTO `house_info` VALUES (24, '独栋·包租婆HOUSE 名富公寓 无中介 开福寺地铁口 华创 湘雅附一 名富公寓 押一付一 1室1厅', NULL, NULL, NULL, 33, NULL, '1室1厅', 1450, '整租', '精装', 1, 1, 1, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-14', '881', '包租婆HOUSE', '13312340008', '91901');
INSERT INTO `house_info` VALUES (25, '整租·黄金一区 1室1厅 南', '望城', '望城区', '黄金一区', 47, '南', '1室1厅', 1100, '整租', '精装', 0, 1, 1, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-19', '205', '赵租房', '13212340009', '2033823854522007552');
INSERT INTO `house_info` VALUES (26, '独栋·包租婆宿懒公寓 保利天禧 不短租 无中介可月付 六沟垅地铁万达广场 山姆超市 1室1厅', NULL, NULL, NULL, 35, NULL, '1室1厅', 1801, '整租', '精装', 1, 1, 0, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-17', '1130', '包租婆宿懒公寓', '13112340010', '89307');
INSERT INTO `house_info` VALUES (27, '整租·楚天世纪城 3室2厅 南', '长沙县', '泉塘', '楚天世纪城', 92, '南', '3室2厅', 1950, '整租', '精装', 0, 1, 0, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-19', '450', '吴先生', '15112340011', '2025545561456771072');
INSERT INTO `house_info` VALUES (28, '独栋·包租婆宿懒公寓 保利天禧 一线江景 不短租 近六沟垅地铁 山姆超市 万象城 可月付无中介 2室1厅', NULL, NULL, NULL, 38, NULL, '2室1厅', 2750, '整租', '精装', 1, 1, 0, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-17', '1302', '包租婆宿懒公寓', '15212340012', '89307');
INSERT INTO `house_info` VALUES (29, '整租·泊富骊庭 3室1厅 南', '天心', '铁道学院', '泊富骊庭', 95, '南', '3室1厅', 2400, '整租', '精装', 0, 1, 0, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-18', '693', '周公寓', '15312340013', '2010950629303779328');
INSERT INTO `house_info` VALUES (30, '独栋·穗露公寓 湘江悦城 无中介费 湘江悦城精装四房 全长沙整租房源 4室2厅', NULL, NULL, NULL, 140, NULL, '4室2厅', 3000, '整租', '精装', 1, 1, 0, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-13', '1008', '穗露公寓', '15512340014', '70270');
INSERT INTO `house_info` VALUES (31, '整租·尚鑫海悦 1室0厅 南/北', '长沙县', '开元路', '尚鑫海悦', 28, '南/北', '1室0厅', 1200, '整租', '简装', 1, 1, 0, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-18', '312', '丁先生', '15612340015', '1936725279640649728');
INSERT INTO `house_info` VALUES (32, '整租·润和湘江天地 1室1厅 南', '望城', '金星北', '润和湘江天地', 109, '南', '1室1厅', 1500, '整租', '精装', 1, 1, 0, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-19', '560', '孙女士', '15712340016', '2004420834805940224');
INSERT INTO `house_info` VALUES (33, '整租·公交金盆小区 2室2厅 南', '天心', '金盆岭', '公交金盆小区', 70, '南', '2室2厅', 1560, '整租', '精装', 0, 1, 1, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-14', '788', '朱公寓', '15812340017', '2028676655848882176');
INSERT INTO `house_info` VALUES (34, '独栋·穗露公寓 润和天地印湘江 整租 越秀湘江星汇城豪装大平层 全长沙都有房源 4室2厅', NULL, NULL, NULL, 186, NULL, '4室2厅', 6600, '整租', '精装', 1, 1, 0, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-18', '1403', '穗露公寓', '15912340018', '53017');
INSERT INTO `house_info` VALUES (35, '整租·旺德府恺悦国际 3室2厅 东', '长沙县', '月湖', '旺德府恺悦国际', 99, '东', '3室2厅', 2200, '整租', '精装', 0, 1, 0, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-17', '821', '何之家', '18012340019', '1982314656307347456');
INSERT INTO `house_info` VALUES (36, '整租·桂芳家园 3室2厅 东南', '望城', '望城区', '桂芳家园', 110, '东南', '3室2厅', 1600, '整租', '精装', 0, 1, 1, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-16', '670', '王先生', '18112340020', '2033406282563584000');
INSERT INTO `house_info` VALUES (37, '整租·世锦家和院 3室2厅 南', '长沙县', '开元路', '世锦家和院', 80, '南', '3室2厅', 1800, '整租', '精装', 1, 1, 1, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-17', '903', '张女士', '18212340021', '2034515051976589312');
INSERT INTO `house_info` VALUES (38, '合租·保利麓谷林语D区 4居室 南卧', '岳麓', '麓谷西', '保利麓谷林语D区', 28, '南卧', '4居室', 799, '合租', '精装', 1, 1, 1, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-18', '455', '美美公寓', '18312340022', '2034904158825349120');
INSERT INTO `house_info` VALUES (39, '整租·名都花园 3室2厅 南', '雨花', '赤岗冲', '名都花园', 141, '南', '3室2厅', 2700, '整租', '精装', 0, 1, 1, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-17', '1029', '刘公寓', '18512340023', '2032671830451421184');
INSERT INTO `house_info` VALUES (40, '合租·博林金谷 4居室 南卧', '天心', '新开铺', '博林金谷', 28, '南卧', '4居室', 1150, '合租', '精装', 1, 1, 0, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-16', '723', '快聚租公寓', '18612340024', '2026514311534346240');
INSERT INTO `house_info` VALUES (41, '整租·碧桂园翘楚棠 4室2厅 南', '长沙县', '万家丽北', '碧桂园翘楚棠', 138.9, '南', '4室2厅', 2750, '整租', '精装', 1, 1, 0, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-19', '999', '陈先生', '18712340025', '2009581722345144320');
INSERT INTO `house_info` VALUES (42, '合租·东方新城 5居室 南卧', '芙蓉', '德政园', '东方新城', 18, '南卧', '5居室', 599, '合租', '毛坯', 1, 1, 0, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-19', '302', '长沙鸿威公寓', '18812340026', '2004451401635201024');
INSERT INTO `house_info` VALUES (43, '整租·北辰中央公园(慧辰园) 2室2厅 南', '天心', '省政府', '北辰中央公园(慧辰园)', 95, '南', '2室2厅', 3000, '整租', '精装', 0, 1, 1, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-19', '1201', '杨公寓', '18912340027', '2010951165017063424');
INSERT INTO `house_info` VALUES (44, '独栋·湘江悦家 麓隐桐溪·大王山店 3号线大王山正地铁口/开业特惠95折/无中介/无服务费A 开间', NULL, NULL, NULL, 37.28, NULL, '1室0厅1卫', 1220, '整租', '精装', 1, 1, 0, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-01', '805', '湘江悦家', '19012340028', '84585');
INSERT INTO `house_info` VALUES (45, '整租·融城花苑 3室2厅 南', '雨花', '井湾子', '融城花苑', 99, '南', '3室2厅', 1300, '整租', '精装', 0, 1, 0, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-19', '500', '赵先生', '19112340029', '1884114366576459776');
INSERT INTO `house_info` VALUES (46, '独栋·华佑e家 万国城店 无中介费可月付 润和珠江星环马厂地铁站 万国城两室 2室2厅', NULL, NULL, '楚天世纪城', 76, NULL, '2室2厅', 2208, '整租', '精装', 1, 1, 1, 'https://s1.ljcdn.com/matrix_pc/dist/pc/src/resource/default/250-182.png?_v=202503271205116ae', '2025-05-19', '1150', '华佑e家', '19212340030', '92145');

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
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `message` VALUES (12, 'test，test', 'Andy', 'LU', '2025-05-21 20:20:00', 1);
INSERT INTO `message` VALUES (13, 'senbai sukisi', 'Andy', 'LU', '2025-05-21 21:21:33', 1);
INSERT INTO `message` VALUES (14, '你是一个一个一个', 'Andy', 'LU', '2025-05-21 21:21:33', 1);
INSERT INTO `message` VALUES (15, '我会喷火，你会吗', 'Andy', 'LU', '2025-05-22 16:25:07', 1);
INSERT INTO `message` VALUES (16, '可恶，你都会', 'Andy', 'LU', '2025-05-23 20:20:53', 1);
INSERT INTO `message` VALUES (17, '我知道，乃龙什么都能吃', 'Andy', 'LU', '2025-05-24 10:15:16', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (1, '111', '222', '2025-05-11 17:25:39');
INSERT INTO `news` VALUES (2, '112233', '332211', '2025-05-22 00:00:00');
INSERT INTO `news` VALUES (3, '114514', '1919810', '2025-05-22 00:00:00');
INSERT INTO `news` VALUES (4, '1111111111', '111111111111', '2025-05-22 00:00:00');
INSERT INTO `news` VALUES (5, '333333333333', '111111111111', '2025-05-22 00:00:00');
INSERT INTO `news` VALUES (6, '2', '2', '2025-05-22 00:00:00');
INSERT INTO `news` VALUES (7, '11', '1111', '2025-05-22 00:00:00');
INSERT INTO `news` VALUES (8, '2', '21', '2025-05-22 00:00:00');
INSERT INTO `news` VALUES (9, '3', '3', '2025-05-22 00:00:00');
INSERT INTO `news` VALUES (12, '3', '3455', '2025-05-22 00:00:00');
INSERT INTO `news` VALUES (15, '12345', '12345', '2025-05-22 00:00:00');
INSERT INTO `news` VALUES (18, '震惊', '中南大学', '2025-05-22 00:00:00');
INSERT INTO `news` VALUES (22, '12345', '12345', '2025-05-22 00:00:00');
INSERT INTO `news` VALUES (23, '12345', '4444', '2025-05-22 00:00:00');
INSERT INTO `news` VALUES (24, '111111', '55555555555', '2025-05-22 00:00:00');

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of repair_complaint
-- ----------------------------
INSERT INTO `repair_complaint` VALUES (1, 'repair', 'dasdas', '水电维修', '', NULL, NULL, 1, '2025-05-19 10:50:31');
INSERT INTO `repair_complaint` VALUES (2, 'repair', 'dasdas', '水电维修', '', NULL, NULL, 1, '2025-05-19 10:56:48');
INSERT INTO `repair_complaint` VALUES (3, 'complaint', 'dasdas', '水电维修', '', NULL, '李茜', 1, '2025-05-19 10:58:03');
INSERT INTO `repair_complaint` VALUES (4, 'repair', 'aaaaaaa', '网络维修', '', '', NULL, 1, '2025-05-19 11:02:59');
INSERT INTO `repair_complaint` VALUES (5, 'repair', 'fffffffff', '其他维修', 'aaaaa', '', NULL, 1, '2025-05-19 11:05:07');
INSERT INTO `repair_complaint` VALUES (6, 'repair', '11111', '设备维修', '', '', NULL, 1, '2025-05-19 11:12:23');
INSERT INTO `repair_complaint` VALUES (7, 'repair', '12舍', '网络维修', '', '', '', 1, '2025-05-19 11:16:21');
INSERT INTO `repair_complaint` VALUES (8, 'complaint', '', NULL, '王万古', 'aaaaaaaaa', '王万古', 1, '2025-05-19 11:19:19');
INSERT INTO `repair_complaint` VALUES (9, 'repair', 'sssssssssssss', '网络维修', ' ', ' ', '', 1, '2025-05-19 11:20:25');
INSERT INTO `repair_complaint` VALUES (10, 'repair', 'sssssssssssss', '网络维修', ' ', ' ', '', 1, '2025-05-19 11:22:27');
INSERT INTO `repair_complaint` VALUES (11, 'repair', '12525', '网络维修', ' ', ' ', '', 1, '2025-05-19 11:28:50');
INSERT INTO `repair_complaint` VALUES (12, 'repair', '12525', '网络维修', ' ', ' ', '', 1, '2025-05-19 11:30:44');
INSERT INTO `repair_complaint` VALUES (13, 'repair', '1111', '设备维修', ' ', ' ', '', 1, '2025-05-19 11:31:29');
INSERT INTO `repair_complaint` VALUES (14, 'repair', 'sss', '设备维修', ' ', ' ', '', 1, '2025-05-21 16:30:54');
INSERT INTO `repair_complaint` VALUES (15, 'repair', '12舍525', '网络维修', ' ', ' ', '', 1, '2025-05-21 19:29:09');
INSERT INTO `repair_complaint` VALUES (16, 'complaint', '', NULL, ' ', '你是一个一个', '王万古', 1, '2025-05-21 19:58:29');
INSERT INTO `repair_complaint` VALUES (17, 'repair', '你是一个一个', '水电维修', ' ', ' ', '', 1, '2025-05-21 20:11:33');
INSERT INTO `repair_complaint` VALUES (18, 'repair', '111111111111111111111', '水电维修', ' ', ' ', '', 1, '2025-05-21 21:11:42');
INSERT INTO `repair_complaint` VALUES (19, 'repair', '校本部12舍', '网络维修', ' ', ' ', '', 1, '2025-05-21 21:24:23');
INSERT INTO `repair_complaint` VALUES (20, 'repair', '112233', '设备维修', ' ', ' ', '', 1, '2025-05-22 16:25:50');
INSERT INTO `repair_complaint` VALUES (21, 'complaint', '', NULL, ' ', '112233', '李茜', 1, '2025-05-22 17:33:33');
INSERT INTO `repair_complaint` VALUES (22, 'repair', '31321', '水电维修', ' ', ' ', '', 1, '2025-05-23 20:21:19');
INSERT INTO `repair_complaint` VALUES (23, 'complaint', '', NULL, ' ', '好吵啊', '李茜', 1, '2025-05-23 20:36:57');
INSERT INTO `repair_complaint` VALUES (24, 'complaint', '', NULL, ' ', '不要敲代码了', '5', 1, '2025-05-24 10:16:36');

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1, 'aaaa', 'aaaa', '2779902707@qq.com', '16608188853', '校本部', '0', '0', '11111111111111111111111111', 1, NULL);
INSERT INTO `user_info` VALUES (3, 'Ylfmoonn', '$2b$12$.qbllCaHCKG8g9xTP29S4eVM3VReNMzzgLSNb/KNAQDoCCPORGhuS', 'lapu2023@outlook.com', '19511053623', '岳麓区', '1', '2', '41132511451411', 1, NULL);
INSERT INTO `user_info` VALUES (4, 'Lappand', '$2b$12$bA1jsIhsQi/qTGAilYyLF.EV0v3EHkl5qcpBGxBmWJRH/LPHsUchq', NULL, '19511053624', '校本部1111', NULL, NULL, NULL, 2, NULL);
INSERT INTO `user_info` VALUES (5, 'Luyue', '$2b$12$BKQ4MnXq8qnvz4SownzK3uoBCdmRktRdr2BX4FlzjT/7xBjGXzyqS', NULL, '15274896231', NULL, NULL, NULL, NULL, 2, NULL);
INSERT INTO `user_info` VALUES (6, NULL, '$2b$12$ChX6QeErNGea10kbGHpLSeOlJVX4iW2t/OxGthi3.F38IhQzBitl2', NULL, '195110536232', NULL, NULL, NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
