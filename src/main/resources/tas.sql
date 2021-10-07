/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : tas

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 08/10/2021 00:05:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `num` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程编号',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '课程名',
  `teacher_num` int(0) NOT NULL COMMENT '教师编号',
  PRIMARY KEY (`num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('hl-0001', '移动互联应用系统综合开发', 2021001);
INSERT INTO `course` VALUES ('hl-0002', 'Web系统设计与开发', 2021001);
INSERT INTO `course` VALUES ('hl-0003', '软件测试', 2021002);
INSERT INTO `course` VALUES ('hl-0004', '实用英语', 2021003);

-- ----------------------------
-- Table structure for leaving_message
-- ----------------------------
DROP TABLE IF EXISTS `leaving_message`;
CREATE TABLE `leaving_message`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '留言信息id',
  `sender` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '留言发送者',
  `date` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '留言时间',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '留言标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '留言内容',
  `receiver` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '留言接收者',
  `is_deleted` enum('未删除','已删除') CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '未删除' COMMENT '数据是否已删除(0未删除,1已删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 179 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of leaving_message
-- ----------------------------
INSERT INTO `leaving_message` VALUES (1, '田梦豪', '2021-09-16 13:25:10', '我来留言了', '我是第一个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (2, '田梦豪', '2021-09-16 12:25:10', '我来留言了', '我是第二个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (3, '田梦豪', '2021-09-16 13:24:10', '我来留言了', '我是第三个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (6, '田梦豪', '2021-09-18 12:25:10', '我来留言了', '我是第5个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (9, '田梦豪', '2021-09-13 13:25:10', '我来留言了', '我是第7个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (10, '田梦豪', '2021-09-18 12:25:10', '我来留言了', '我是第8个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (13, '田梦豪', '2021-06-16 13:25:10', '我来留言了', '我是第10个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (14, '田梦豪', '2021-07-16 12:25:10', '我来留言了', '我是第11个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (15, '田梦豪', '2020-09-16 13:24:10', '我来留言了', '我是第12个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (16, '田梦豪', '2021-09-16 12:25:10', '我来留言了', '我是第二个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (17, '田梦豪', '2021-09-16 13:24:10', '我来留言了', '我是第三个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (18, '田梦豪', '2021-09-18 12:25:10', '我来留言了', '我是第5个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (19, '田梦豪', '2021-09-13 13:25:10', '我来留言了', '我是第7个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (20, '田梦豪', '2021-09-18 12:25:10', '我来留言了', '我是第8个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (21, 'admin', '2021-08-16 13:24:10', '我来留言了', '我是第9个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (22, '田梦豪', '2021-06-16 13:25:10', '我来留言了', '我是第10个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (23, '田梦豪', '2021-07-16 12:25:10', '我来留言了', '我是第11个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (24, '田梦豪', '2020-09-16 13:24:10', '我来留言了', '我是第12个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (25, '田梦豪', '2021-09-07 12:25:10', '我来留言了', '我是第14个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (26, '田梦豪', '2021-09-06 13:24:10', '我来留言了', '我是第15个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (27, 'admin', '2021-09-16 13:25:10', '我来留言了', '我是第一个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (28, '田梦豪', '2021-09-16 12:25:10', '我来留言了', '我是第二个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (29, '田梦豪', '2021-09-16 13:24:10', '我来留言了', '我是第三个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (30, '田梦豪', '2021-09-06 13:25:10', '我来留言了', '我是第四个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (31, '田梦豪', '2021-09-18 12:25:10', '我来留言了', '我是第5个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (32, '田梦豪', '2021-09-13 13:25:10', '我来留言了', '我是第7个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (33, '田梦豪', '2021-09-18 12:25:10', '我来留言了', '我是第8个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (34, '田梦豪', '2021-08-16 13:24:10', '我来留言了', '我是第9个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (35, '田梦豪', '2021-06-16 13:25:10', '我来留言了', '我是第10个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (36, '田梦豪', '2021-07-16 12:25:10', '我来留言了', '我是第11个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (37, 'admin', '2020-09-16 13:24:10', '我来留言了', '我是第12个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (38, '田梦豪', '2021-09-07 12:25:10', '我来留言了', '我是第14个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (39, '田梦豪', '2021-09-06 13:24:10', '我来留言了', '我是第15个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (40, '田梦豪', '2021-09-16 13:25:10', '我来留言了', '我是第一个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (41, '田梦豪', '2021-09-16 12:25:10', '我来留言了', '我是第二个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (42, 'admin', '2021-09-16 13:24:10', '我来留言了', '我是第三个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (43, '田梦豪', '2021-09-06 13:25:10', '我来留言了', '我是第四个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (44, '田梦豪', '2021-09-18 12:25:10', '我来留言了', '我是第5个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (45, 'admin', '2021-09-07 13:24:10', '我来留言了', '我是第6个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (46, '田梦豪', '2021-09-13 13:25:10', '我来留言了', '我是第7个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (47, 'admin', '2021-08-16 13:24:10', '我来留言了', '我是第9个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (48, '田梦豪', '2021-06-16 13:25:10', '我来留言了', '我是第10个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (49, '田梦豪', '2021-07-16 12:25:10', '我来留言了', '我是第11个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (50, '田梦豪', '2020-09-16 13:24:10', '我来留言了', '我是第12个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (51, '田梦豪', '2021-09-07 12:25:10', '我来留言了', '我是第14个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (52, '田梦豪', '2021-09-16 12:25:10', '我来留言了', '我是第二个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (53, '田梦豪', '2021-09-16 13:24:10', '我来留言了', '我是第三个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (54, '田梦豪', '2021-09-18 12:25:10', '我来留言了', '我是第5个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (55, '田梦豪', '2021-09-13 13:25:10', '我来留言了', '我是第7个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (56, '田梦豪', '2021-09-18 12:25:10', '我来留言了', '我是第8个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (57, 'admin', '2021-08-16 13:24:10', '我来留言了', '我是第9个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (58, '田梦豪', '2021-06-16 13:25:10', '我来留言了', '我是第10个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (59, '田梦豪', '2021-07-16 12:25:10', '我来留言了', '我是第11个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (60, '田梦豪', '2020-09-16 13:24:10', '我来留言了', '我是第12个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (61, '田梦豪', '2021-09-07 12:25:10', '我来留言了', '我是第14个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (62, '田梦豪', '2021-09-06 13:24:10', '我来留言了', '我是第15个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (63, 'admin', '2021-09-16 13:25:10', '我来留言了', '我是第一个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (64, '田梦豪', '2021-09-16 12:25:10', '我来留言了', '我是第二个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (65, '田梦豪', '2021-09-16 13:24:10', '我来留言了', '我是第三个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (66, '田梦豪', '2021-09-06 13:25:10', '我来留言了', '我是第四个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (67, '田梦豪', '2021-09-18 12:25:10', '我来留言了', '我是第5个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (68, '田梦豪', '2021-09-13 13:25:10', '我来留言了', '我是第7个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (69, '田梦豪', '2021-09-18 12:25:10', '我来留言了', '我是第8个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (70, '田梦豪', '2021-08-16 13:24:10', '我来留言了', '我是第9个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (71, '田梦豪', '2021-06-16 13:25:10', '我来留言了', '我是第10个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (72, '田梦豪', '2021-07-16 12:25:10', '我来留言了', '我是第11个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (73, 'admin', '2020-09-16 13:24:10', '我来留言了', '我是第12个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (74, '田梦豪', '2021-09-07 12:25:10', '我来留言了', '我是第14个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (75, '田梦豪', '2021-09-06 13:24:10', '我来留言了', '我是第15个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (76, '田梦豪', '2021-09-16 13:25:10', '我来留言了', '我是第一个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (77, '田梦豪', '2021-09-16 12:25:10', '我来留言了', '我是第二个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (78, 'admin', '2021-09-16 13:24:10', '我来留言了', '我是第三个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (79, '田梦豪', '2021-09-06 13:25:10', '我来留言了', '我是第四个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (80, '田梦豪', '2021-09-18 12:25:10', '我来留言了', '我是第5个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (81, 'admin', '2021-09-07 13:24:10', '我来留言了', '我是第6个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (82, 'admin', '2021-09-22 13:46:04', '我的留言1', '你好，田梦豪', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (83, 'admin', '2021-09-22 14:08:54', '留言520', '还在吗？田老弟', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (84, 'admin', '2021-09-22 13:59:01', '下午好', '吃过下午饭了吗？', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (85, 'admin', '2021-09-22 13:51:21', '我的留言2', '管理员，你好呀', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (86, 'admin', '2021-09-22 14:07:50', '打招呼', '好久不见！！！', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (87, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (88, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (89, 'admin', '2021-09-07 13:24:10', '我来留言了', '我给田梦豪的第二个留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (90, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (91, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (97, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (98, 'admin', '2021-09-07 13:24:10', '我来留言了', '我给我自己的第二个留言', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (99, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (100, 'admin', '2021-09-18 10:23:18', '个人留言', '我给我自己的第三个留言', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (101, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (102, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (103, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (104, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (105, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (106, 'admin', '2021-09-22 14:09:25', '晚上好', '睡了吗？挺想你的', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (107, 'admin', '2021-09-07 13:24:10', '我来留言了', '我给田梦豪的第二个留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (108, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (109, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (110, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (111, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (112, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (113, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (114, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (115, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (116, '田梦豪', '2021-09-06 13:24:10', '我来留言了', '我是第15个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (117, 'admin', '2021-09-16 13:25:10', '我来留言了', '我是第一个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (118, '田梦豪', '2021-09-16 12:25:10', '我来留言了', '我是第二个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (119, '田梦豪', '2021-09-16 13:24:10', '我来留言了', '我是第三个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (120, '田梦豪', '2021-09-06 13:25:10', '我来留言了', '我是第四个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (121, '田梦豪', '2021-09-18 12:25:10', '我来留言了', '我是第5个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (122, '田梦豪', '2021-09-13 13:25:10', '我来留言了', '我是第7个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (123, '田梦豪', '2021-09-18 12:25:10', '我来留言了', '我是第8个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (124, '田梦豪', '2021-08-16 13:24:10', '我来留言了', '我是第9个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (125, '田梦豪', '2021-06-16 13:25:10', '我来留言了', '我是第10个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (126, '田梦豪', '2021-07-16 12:25:10', '我来留言了', '我是第11个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (127, 'admin', '2020-09-16 13:24:10', '我来留言了', '我是第12个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (128, '田梦豪', '2021-09-07 12:25:10', '我来留言了', '我是第14个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (129, '田梦豪', '2021-09-06 13:24:10', '我来留言了', '我是第15个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (130, '田梦豪', '2021-09-16 13:25:10', '我来留言了', '我是第一个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (131, '田梦豪', '2021-09-16 12:25:10', '我来留言了', '我是第二个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (132, 'admin', '2021-09-16 13:24:10', '我来留言了', '我是第三个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (133, '田梦豪', '2021-09-06 13:25:10', '我来留言了', '我是第四个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (134, '田梦豪', '2021-09-18 12:25:10', '我来留言了', '我是第5个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (135, 'admin', '2021-09-07 13:24:10', '我来留言了', '我是第6个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (136, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (137, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (138, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (139, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (140, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (141, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (142, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (143, 'admin', '2021-09-07 13:24:10', '我来留言了', '我给田梦豪的第二个留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (144, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (145, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (146, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (147, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (148, '田梦豪', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (149, '田梦豪', '2021-09-18 10:22:42', '标题1', '我给admin的留言', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (150, '田梦豪', '2021-09-18 10:22:42', '标题2', '我给admin的留言', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (151, 'admin', '2021-09-18 10:22:42', '标题3', '这是我自己的留言', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (152, 'admin', '2021-09-18 10:22:42', '标题4', '没人给我留言', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (153, 'admin', '2021-09-18 10:22:42', '标题5', '我给田梦豪的留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (154, 'admin', '2021-09-18 10:22:42', '标题6', '我给田梦豪的留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (155, 'admin', '2021-09-18 10:22:42', '标题7', '我给田梦豪的留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (156, 'admin', '2021-09-18 10:22:42', '标题8', '我给田梦豪的留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (157, 'admin', '2021-09-18 10:22:42', '标题9', '我给田梦豪的留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (158, 'admin', '2021-09-18 10:22:42', '标题10', '我给田梦豪的留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (159, 'admin', '2021-09-18 10:22:42', '标题11', '我给田梦豪的留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (160, 'admin', '2021-09-22 15:16:04', 'Good Lucky', '祝你幸运!', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (161, 'admin', '2021-09-22 15:22:46', '标题666', '又是一个测试，疯啦疯啦疯啦', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (162, 'admin', '2021-09-07 13:24:10', '我来留言了', '我是第6个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (163, 'admin', '2021-09-22 13:46:04', '我的留言1', '你好，田梦豪', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (164, 'admin', '2021-09-22 14:08:54', '留言520', '还在吗？田老弟', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (165, 'admin', '2021-09-22 13:59:01', '下午好', '吃过下午饭了吗？', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (166, 'admin', '2021-09-22 13:51:21', '我的留言2', '管理员，你好呀', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (167, 'admin', '2021-09-22 14:07:50', '打招呼', '好久不见！！！', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (168, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (169, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (170, 'admin', '2021-09-07 13:24:10', '我来留言了', '我给田梦豪的第二个留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (171, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (172, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (173, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (174, 'admin', '2021-09-07 13:24:10', '我来留言了', '我给我自己的第二个留言', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (175, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (176, 'admin', '2021-10-02 20:27:13', '晚上好', '吃过晚饭了吗', '田梦豪', '未删除');
INSERT INTO `leaving_message` VALUES (177, 'admin', '2021-10-02 20:31:09', '老师好', 'TOM老师好呀，我是管理员', 'Tom', '未删除');
INSERT INTO `leaving_message` VALUES (178, 'Tom', '2021-10-03 15:50:17', '你好', '管理员你好，我是tom老师，初来乍到，多多关照', 'admin', '未删除');

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `course_num` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '课程编号',
  `student_num` int(0) NOT NULL COMMENT '学生学号',
  `num` double(6, 2) NOT NULL COMMENT '分数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `score_ibfk_1`(`course_num`) USING BTREE,
  INDEX `score_ibfk_2`(`student_num`) USING BTREE,
  CONSTRAINT `score_ibfk_1` FOREIGN KEY (`course_num`) REFERENCES `course` (`num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `score_ibfk_2` FOREIGN KEY (`student_num`) REFERENCES `student` (`student_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of score
-- ----------------------------
INSERT INTO `score` VALUES (1, 'hl-0001', 2019121218, 98.00);
INSERT INTO `score` VALUES (3, 'hl-0002', 2019121218, 99.00);
INSERT INTO `score` VALUES (4, 'hl-0003', 2019121218, 99.50);
INSERT INTO `score` VALUES (5, 'hl-0004', 2019121218, 99.60);
INSERT INTO `score` VALUES (6, 'hl-0001', 2019121235, 85.60);
INSERT INTO `score` VALUES (8, 'hl-0002', 2019121235, 86.00);
INSERT INTO `score` VALUES (9, 'hl-0003', 2019121235, 90.00);
INSERT INTO `score` VALUES (10, 'hl-0004', 2019121235, 95.00);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `user_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '学生用户名',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '学生姓名',
  `student_num` int(0) NOT NULL COMMENT '学生学号',
  `student_class` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '学生所在班级',
  PRIMARY KEY (`user_name`) USING BTREE,
  UNIQUE INDEX `student_num`(`student_num`) USING BTREE,
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`user_name`) REFERENCES `user` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('小明', '王小明', 2019121235, '191互联2');
INSERT INTO `student` VALUES ('田梦豪', '田梦豪', 2019121218, '191互联2');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `user_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '教师用户名',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '教师姓名',
  `teacher_num` int(0) NOT NULL COMMENT '教师工号',
  `department` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '教师所在部门',
  PRIMARY KEY (`user_name`) USING BTREE,
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`user_name`) REFERENCES `user` (`name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('Butch', '周布奇', 2021003, '通信与信息工程学院');
INSERT INTO `teacher` VALUES ('Jerry', '张女士', 2021002, '通信与信息工程学院');
INSERT INTO `teacher` VALUES ('Tom', '王漂亮', 2021001, '通信与信息工程学院');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户id，唯一标识',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户名',
  `role` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'student' COMMENT '角色身份标识(管理员,老师,学生)',
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户密码',
  `is_registered` tinyint(1) NOT NULL DEFAULT 0 COMMENT '用户是否注册,可用于注销用户',
  `role_num` int(0) NOT NULL COMMENT '用户身份号,老师和学生需要提供,管理员不需要',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('27c87e5efb7b400d8fa21cdf180dea72', 'Jerry', 'teacher', 'root', 1, 2021002);
INSERT INTO `user` VALUES ('2a67c0ecdfd040cba85faecfa920fe3a', 'Tom', 'teacher', 'root', 1, 2021001);
INSERT INTO `user` VALUES ('35856bfb64df4d13b2a5d471c3361a6c', '田梦豪', 'student', '123456', 1, 2019121218);
INSERT INTO `user` VALUES ('admin', 'admin', 'admin', 'admin', 1, 0);
INSERT INTO `user` VALUES ('ba63df9527304605a6f80a1b214e5e3d', 'Butch', 'teacher', 'root', 1, 2021003);
INSERT INTO `user` VALUES ('ce55b48151ea4eec927a40bc9c488e36', '小明', 'student', '123456', 1, 2019121235);

SET FOREIGN_KEY_CHECKS = 1;
