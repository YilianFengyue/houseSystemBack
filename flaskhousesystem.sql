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

 Date: 21/05/2025 19:21:18
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
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of appointment
-- ----------------------------
INSERT INTO `appointment` VALUES (1, 'a', 'a', '2025-05-15 20:15:11');
INSERT INTO `appointment` VALUES (3, 'aaaa', '万科魅力之城武广新城', '2025-05-19 16:00:00');
INSERT INTO `appointment` VALUES (4, 'aaaa', '万科魅力之城武广新城', '2025-05-21 16:00:00');
INSERT INTO `appointment` VALUES (5, 'aaaa', '万科魅力之城武广新城', '2025-05-21 16:00:00');
INSERT INTO `appointment` VALUES (6, 'aaaa', '万科魅力之城武广新城', '2025-05-20 16:00:00');
INSERT INTO `appointment` VALUES (7, 'aaaa', '万科魅力之城武广新城', '2025-05-30 16:00:00');

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of contract
-- ----------------------------
INSERT INTO `contract` VALUES (3, '10251', '办公', '2025-04-30 16:00:00', '2025-05-30 16:00:00', '', NULL, '', '', NULL, '', '壹万零仟贰佰伍拾壹元整', '2025-05-19 00:00:00');
INSERT INTO `contract` VALUES (4, '10251', '仓储', '2025-05-02 16:00:00', '2025-05-28 16:00:00', '', NULL, '', '', NULL, '', '壹万零仟贰佰伍拾壹元整', '2025-05-19 00:00:00');
INSERT INTO `contract` VALUES (5, '10251', '仓储', '2025-05-21 16:00:00', '2025-05-30 16:00:00', '', NULL, '', '', NULL, '', '壹万零仟贰佰伍拾壹元整', '2025-05-21 00:00:00');
INSERT INTO `contract` VALUES (6, '10251', '办公', '2025-04-30 16:00:00', '2025-05-30 16:00:00', '', NULL, '', '', NULL, '', '壹万零仟贰佰伍拾壹元整', '2025-05-21 00:00:00');

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
  `house_num` int NULL DEFAULT NULL COMMENT '房源编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of house_info
-- ----------------------------
INSERT INTO `house_info` VALUES (1, '整租·锦源小区 2室1厅 南', '雨花', '树木岭', '锦源小区', 73, '南', '2室1厅1卫', 1600, '整租', '精装', 1, 1, 1, 'https://ke-image.ljcdn.com/110000-inspection/pc1_o9ZESXPFp.jpg!m_fill,w_250,h_182,l_fbk,o_auto', '2025-05-15', '108次浏览', '张先生', '13800001234', 10001);
INSERT INTO `house_info` VALUES (2, '合租·泰时新雅园 4居室 南卧', '芙蓉', '晚报', '泰时新雅园', 18, '南', '4室2厅2卫', 580, '合租', '精装', 1, 1, 0, 'https://ke-image.ljcdn.com/wanjia/84dea3623cbb7d70b1444dee3e486d20-1743828503309/6195a4527c94c89b3af7ffaf6641bd0a.jpg.250x182.jpg', '2025-05-14', '89次浏览', '龟壳公寓', '13800005678', 10002);
INSERT INTO `house_info` VALUES (3, '整租·星宇V立方 1室0厅 南', '天心', '金盆岭', '星宇V立方', 29.14, '南', '1室0厅1卫', 1280, '整租', '精装', 1, 1, 1, 'https://ke-image.ljcdn.com/110000-inspection/8c22d754-2647-4bb0-a5d1-2e381870c87b_1000.jpg!m_fill,w_250,h_182,l_fbk,o_auto', '2025-05-15', '72次浏览', '李女士', '13800007890', 10003);
INSERT INTO `house_info` VALUES (4, '合租·长远华樟名府 5居室 南卧', '雨花', '尚东', '长远华樟名府', 25, '南', '5室1厅3卫', 540, '合租', '精装', 1, 1, 1, 'https://ke-image.ljcdn.com/wanjia/ed67729734b83b99410bfacd29f5f128-1747202463168/c092164f9835c30396fa9619a8deb8a3.jpg.250x182.jpg', '2025-05-14', '61次浏览', '包租婆宿懒公寓', '13800009876', 10004);
INSERT INTO `house_info` VALUES (5, '整租·长大彩虹都 3室2厅 南/北', '天心', '铁道学院', '长大彩虹都', 90, '南/北', '3室2厅1卫', 1900, '整租', '精装', 1, 1, 0, 'https://ke-image.ljcdn.com/110000-inspection/pc1_n6HwU8PUC.jpg!m_fill,w_250,h_182,l_fbk,o_auto', '2025-05-17', '0次浏览', '房东直租', '18800000005', 10005);
INSERT INTO `house_info` VALUES (6, '合租·山水华景 5居室 南卧', '芙蓉', '马王堆', '山水华景', 25, '南', '5室1厅2卫', 849, '合租', '精装', 0, 1, 0, 'https://ke-image.ljcdn.com/wanjia/885e92fd2470add49f2c29ce7824562c-1743474437330/458004f9fa46b67b17d8e69c543c97e5.jpg.250x182.jpg', '2025-05-15', '0次浏览', '长沙鸿威公寓', '18800000006', 10006);
INSERT INTO `house_info` VALUES (7, '整租·国税局 3室2厅 南', '天心', '书院路', '国税局', 120, '南', '3室2厅2卫', 2600, '整租', '精装', 1, 1, 1, 'https://ke-image.ljcdn.com/110000-inspection/pc1_FDoD4Qv0H.jpg!m_fill,w_250,h_182,l_fbk,o_auto', '2025-05-17', '0次浏览', '房东直租', '18800000007', 10007);
INSERT INTO `house_info` VALUES (8, '合租·运通尊苑 5居室 南卧', '芙蓉', '马王堆', '运通尊苑', 22, '南', '5室1厅2卫', 499, '合租', '精装', 1, 1, 0, 'https://ke-image.ljcdn.com/wanjia/885e92fd2470add49f2c29ce7824562c-1744075290085/1ae441cdb24ea2e1337c8d898dadd212.jpg.250x182.jpg', '2025-05-15', '0次浏览', '长沙鸿威公寓', '18800000008', 10008);

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
  PRIMARY KEY (`message_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (1, 'manba out', 'Andy', 'LU', '2025-05-19 16:08:26');
INSERT INTO `message` VALUES (2, 'what can i say', 'Andy', 'LU', '2025-05-19 16:10:02');
INSERT INTO `message` VALUES (3, 'kobe brant', 'Andy', 'LU', '2025-05-19 16:35:40');
INSERT INTO `message` VALUES (4, 'man', 'Andy', 'LU', '2025-05-19 16:43:08');
INSERT INTO `message` VALUES (5, 'hahahaha', 'Andy', 'LU', '2025-05-19 16:43:08');
INSERT INTO `message` VALUES (6, 'hahahahahaha', 'Andy', 'LU', '2025-05-21 16:29:32');
INSERT INTO `message` VALUES (7, 'manba in', 'Andy', 'LU', '2025-05-21 19:08:20');
INSERT INTO `message` VALUES (8, 'manba out', 'Andy', 'LU', '2025-05-21 19:08:20');
INSERT INTO `message` VALUES (9, '你是谁?', 'Andy', 'LU', '2025-05-21 19:08:20');
INSERT INTO `message` VALUES (10, '我是乃龙', 'Andy', 'LU', '2025-05-21 19:15:39');

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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `id` int NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `seen_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `collect_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `identityCard` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1, 'aaaa', 'aaaa', '2779902707@qq.com', '16608188853', '校本部', '0', '0', '11111111111111111111111111');

SET FOREIGN_KEY_CHECKS = 1;
