/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : tas

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 29/09/2021 18:22:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for leaving_message
-- ----------------------------
DROP TABLE IF EXISTS `leaving_message`;
CREATE TABLE `leaving_message`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '留言信息id',
  `sender_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '留言发送者id',
  `lm_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '留言时间',
  `lm_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '留言标题',
  `lm_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '留言内容',
  `receiver_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '留言接收者id',
  `is_deleted` enum('未删除','已删除') CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '未删除' COMMENT '数据是否已删除(0未删除,1已删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 162 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of leaving_message
-- ----------------------------
INSERT INTO `leaving_message` VALUES (1, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-16 13:25:10', '我来留言了', '我是第一个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (2, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-16 12:25:10', '我来留言了', '我是第二个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (3, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-16 13:24:10', '我来留言了', '我是第三个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (6, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-18 12:25:10', '我来留言了', '我是第5个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (9, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-13 13:25:10', '我来留言了', '我是第7个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (10, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-18 12:25:10', '我来留言了', '我是第8个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (13, '35856bfb64df4d13b2a5d471c3361a6c', '2021-06-16 13:25:10', '我来留言了', '我是第10个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (14, '35856bfb64df4d13b2a5d471c3361a6c', '2021-07-16 12:25:10', '我来留言了', '我是第11个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (15, '35856bfb64df4d13b2a5d471c3361a6c', '2020-09-16 13:24:10', '我来留言了', '我是第12个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (16, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-16 12:25:10', '我来留言了', '我是第二个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (17, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-16 13:24:10', '我来留言了', '我是第三个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (18, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-18 12:25:10', '我来留言了', '我是第5个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (19, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-13 13:25:10', '我来留言了', '我是第7个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (20, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-18 12:25:10', '我来留言了', '我是第8个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (21, 'admin', '2021-08-16 13:24:10', '我来留言了', '我是第9个留言的', 'admin', '已删除');
INSERT INTO `leaving_message` VALUES (22, '35856bfb64df4d13b2a5d471c3361a6c', '2021-06-16 13:25:10', '我来留言了', '我是第10个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (23, '35856bfb64df4d13b2a5d471c3361a6c', '2021-07-16 12:25:10', '我来留言了', '我是第11个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (24, '35856bfb64df4d13b2a5d471c3361a6c', '2020-09-16 13:24:10', '我来留言了', '我是第12个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (25, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-07 12:25:10', '我来留言了', '我是第14个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (26, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-06 13:24:10', '我来留言了', '我是第15个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (27, 'admin', '2021-09-16 13:25:10', '我来留言了', '我是第一个留言的', 'admin', '已删除');
INSERT INTO `leaving_message` VALUES (28, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-16 12:25:10', '我来留言了', '我是第二个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (29, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-16 13:24:10', '我来留言了', '我是第三个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (30, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-06 13:25:10', '我来留言了', '我是第四个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (31, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-18 12:25:10', '我来留言了', '我是第5个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (32, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-13 13:25:10', '我来留言了', '我是第7个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (33, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-18 12:25:10', '我来留言了', '我是第8个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (34, '35856bfb64df4d13b2a5d471c3361a6c', '2021-08-16 13:24:10', '我来留言了', '我是第9个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (35, '35856bfb64df4d13b2a5d471c3361a6c', '2021-06-16 13:25:10', '我来留言了', '我是第10个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (36, '35856bfb64df4d13b2a5d471c3361a6c', '2021-07-16 12:25:10', '我来留言了', '我是第11个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (37, 'admin', '2020-09-16 13:24:10', '我来留言了', '我是第12个留言的', 'admin', '已删除');
INSERT INTO `leaving_message` VALUES (38, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-07 12:25:10', '我来留言了', '我是第14个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (39, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-06 13:24:10', '我来留言了', '我是第15个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (40, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-16 13:25:10', '我来留言了', '我是第一个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (41, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-16 12:25:10', '我来留言了', '我是第二个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (42, 'admin', '2021-09-16 13:24:10', '我来留言了', '我是第三个留言的', 'admin', '已删除');
INSERT INTO `leaving_message` VALUES (43, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-06 13:25:10', '我来留言了', '我是第四个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (44, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-18 12:25:10', '我来留言了', '我是第5个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (45, 'admin', '2021-09-07 13:24:10', '我来留言了', '我是第6个留言的', 'admin', '已删除');
INSERT INTO `leaving_message` VALUES (46, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-13 13:25:10', '我来留言了', '我是第7个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (47, 'admin', '2021-08-16 13:24:10', '我来留言了', '我是第9个留言的', 'admin', '已删除');
INSERT INTO `leaving_message` VALUES (48, '35856bfb64df4d13b2a5d471c3361a6c', '2021-06-16 13:25:10', '我来留言了', '我是第10个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (49, '35856bfb64df4d13b2a5d471c3361a6c', '2021-07-16 12:25:10', '我来留言了', '我是第11个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (50, '35856bfb64df4d13b2a5d471c3361a6c', '2020-09-16 13:24:10', '我来留言了', '我是第12个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (51, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-07 12:25:10', '我来留言了', '我是第14个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (52, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-16 12:25:10', '我来留言了', '我是第二个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (53, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-16 13:24:10', '我来留言了', '我是第三个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (54, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-18 12:25:10', '我来留言了', '我是第5个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (55, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-13 13:25:10', '我来留言了', '我是第7个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (56, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-18 12:25:10', '我来留言了', '我是第8个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (57, 'admin', '2021-08-16 13:24:10', '我来留言了', '我是第9个留言的', 'admin', '已删除');
INSERT INTO `leaving_message` VALUES (58, '35856bfb64df4d13b2a5d471c3361a6c', '2021-06-16 13:25:10', '我来留言了', '我是第10个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (59, '35856bfb64df4d13b2a5d471c3361a6c', '2021-07-16 12:25:10', '我来留言了', '我是第11个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (60, '35856bfb64df4d13b2a5d471c3361a6c', '2020-09-16 13:24:10', '我来留言了', '我是第12个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (61, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-07 12:25:10', '我来留言了', '我是第14个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (62, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-06 13:24:10', '我来留言了', '我是第15个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (63, 'admin', '2021-09-16 13:25:10', '我来留言了', '我是第一个留言的', 'admin', '已删除');
INSERT INTO `leaving_message` VALUES (64, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-16 12:25:10', '我来留言了', '我是第二个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (65, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-16 13:24:10', '我来留言了', '我是第三个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (66, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-06 13:25:10', '我来留言了', '我是第四个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (67, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-18 12:25:10', '我来留言了', '我是第5个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (68, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-13 13:25:10', '我来留言了', '我是第7个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (69, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-18 12:25:10', '我来留言了', '我是第8个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (70, '35856bfb64df4d13b2a5d471c3361a6c', '2021-08-16 13:24:10', '我来留言了', '我是第9个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (71, '35856bfb64df4d13b2a5d471c3361a6c', '2021-06-16 13:25:10', '我来留言了', '我是第10个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (72, '35856bfb64df4d13b2a5d471c3361a6c', '2021-07-16 12:25:10', '我来留言了', '我是第11个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (73, 'admin', '2020-09-16 13:24:10', '我来留言了', '我是第12个留言的', 'admin', '已删除');
INSERT INTO `leaving_message` VALUES (74, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-07 12:25:10', '我来留言了', '我是第14个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (75, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-06 13:24:10', '我来留言了', '我是第15个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (76, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-16 13:25:10', '我来留言了', '我是第一个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (77, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-16 12:25:10', '我来留言了', '我是第二个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (78, 'admin', '2021-09-16 13:24:10', '我来留言了', '我是第三个留言的', 'admin', '已删除');
INSERT INTO `leaving_message` VALUES (79, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-06 13:25:10', '我来留言了', '我是第四个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (80, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-18 12:25:10', '我来留言了', '我是第5个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (81, 'admin', '2021-09-07 13:24:10', '我来留言了', '我是第6个留言的', 'admin', '已删除');
INSERT INTO `leaving_message` VALUES (82, 'admin', '2021-09-22 13:46:04', '我的留言1', '你好，tom', '2a67c0ecdfd040cba85faecfa920fe3a', '未删除');
INSERT INTO `leaving_message` VALUES (83, 'admin', '2021-09-22 14:08:54', '留言520', '还在吗？田老弟', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (84, 'admin', '2021-09-22 13:59:01', '下午好', '吃过下午饭了吗？', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (85, 'admin', '2021-09-22 13:51:21', '我的留言2', '管理员，你好呀', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (86, 'admin', '2021-09-22 14:07:50', '打招呼', '好久不见！！！', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (87, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (88, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (89, 'admin', '2021-09-07 13:24:10', '我来留言了', '我给田梦豪的第二个留言', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (90, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (91, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (92, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (93, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (94, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (95, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (96, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (97, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (98, 'admin', '2021-09-07 13:24:10', '我来留言了', '我给田梦豪的第二个留言', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (99, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (100, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (101, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (102, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (103, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (104, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (105, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (106, 'admin', '2021-09-22 14:09:25', '晚上好', '睡了吗？挺想你的', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (107, 'admin', '2021-09-07 13:24:10', '我来留言了', '我给田梦豪的第二个留言', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (108, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (109, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (110, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (111, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (112, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (113, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (114, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (115, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (116, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-06 13:24:10', '我来留言了', '我是第15个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (117, 'admin', '2021-09-16 13:25:10', '我来留言了', '我是第一个留言的', 'admin', '已删除');
INSERT INTO `leaving_message` VALUES (118, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-16 12:25:10', '我来留言了', '我是第二个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (119, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-16 13:24:10', '我来留言了', '我是第三个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (120, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-06 13:25:10', '我来留言了', '我是第四个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (121, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-18 12:25:10', '我来留言了', '我是第5个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (122, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-13 13:25:10', '我来留言了', '我是第7个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (123, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-18 12:25:10', '我来留言了', '我是第8个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (124, '35856bfb64df4d13b2a5d471c3361a6c', '2021-08-16 13:24:10', '我来留言了', '我是第9个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (125, '35856bfb64df4d13b2a5d471c3361a6c', '2021-06-16 13:25:10', '我来留言了', '我是第10个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (126, '35856bfb64df4d13b2a5d471c3361a6c', '2021-07-16 12:25:10', '我来留言了', '我是第11个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (127, 'admin', '2020-09-16 13:24:10', '我来留言了', '我是第12个留言的', 'admin', '已删除');
INSERT INTO `leaving_message` VALUES (128, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-07 12:25:10', '我来留言了', '我是第14个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (129, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-06 13:24:10', '我来留言了', '我是第15个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (130, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-16 13:25:10', '我来留言了', '我是第一个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (131, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-16 12:25:10', '我来留言了', '我是第二个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (132, 'admin', '2021-09-16 13:24:10', '我来留言了', '我是第三个留言的', 'admin', '已删除');
INSERT INTO `leaving_message` VALUES (133, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-06 13:25:10', '我来留言了', '我是第四个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (134, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-18 12:25:10', '我来留言了', '我是第5个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (135, 'admin', '2021-09-07 13:24:10', '我来留言了', '我是第6个留言的', 'admin', '已删除');
INSERT INTO `leaving_message` VALUES (136, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (137, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '35856bfb64df4d13b2a5d471c3361a6c', '已删除');
INSERT INTO `leaving_message` VALUES (138, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '35856bfb64df4d13b2a5d471c3361a6c', '已删除');
INSERT INTO `leaving_message` VALUES (139, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (140, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (141, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (142, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '35856bfb64df4d13b2a5d471c3361a6c', '已删除');
INSERT INTO `leaving_message` VALUES (143, 'admin', '2021-09-07 13:24:10', '我来留言了', '我给田梦豪的第二个留言', '35856bfb64df4d13b2a5d471c3361a6c', '已删除');
INSERT INTO `leaving_message` VALUES (144, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '35856bfb64df4d13b2a5d471c3361a6c', '已删除');
INSERT INTO `leaving_message` VALUES (145, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (146, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (147, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (148, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (149, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-18 10:22:42', '标题1', '我给admin的留言', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (150, '35856bfb64df4d13b2a5d471c3361a6c', '2021-09-18 10:22:42', '标题2', '我给admin的留言', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (151, 'admin', '2021-09-18 10:22:42', '标题3', '这是我自己的留言', 'admin', '已删除');
INSERT INTO `leaving_message` VALUES (152, 'admin', '2021-09-18 10:22:42', '标题4', '没人给我留言', 'admin', '已删除');
INSERT INTO `leaving_message` VALUES (153, 'admin', '2021-09-18 10:22:42', '标题5', '我给田梦豪的留言', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (154, 'admin', '2021-09-18 10:22:42', '标题6', '我给田梦豪的留言', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (155, 'admin', '2021-09-18 10:22:42', '标题7', '我给田梦豪的留言', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (156, 'admin', '2021-09-18 10:22:42', '标题8', '我给田梦豪的留言', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (157, 'admin', '2021-09-18 10:22:42', '标题9', '我给田梦豪的留言', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (158, 'admin', '2021-09-18 10:22:42', '标题10', '我给田梦豪的留言', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (159, 'admin', '2021-09-18 10:22:42', '标题11', '我给田梦豪的留言', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (160, 'admin', '2021-09-22 15:16:04', 'Good Lucky', '祝你幸运!', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');
INSERT INTO `leaving_message` VALUES (161, 'admin', '2021-09-22 15:22:46', '标题666', '又是一个测试，疯啦疯啦疯啦', '35856bfb64df4d13b2a5d471c3361a6c', '未删除');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户id，唯一标识',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户姓名',
  `role` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'student' COMMENT '角色身份标识(管理员,老师,学生)',
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户密码',
  `is_registered` tinyint(1) NOT NULL DEFAULT 0 COMMENT '用户是否注册,可用于注销用户',
  `role_num` int NOT NULL DEFAULT 0 COMMENT '用户身份号,老师和学生需要提供,管理员不需要',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2a67c0ecdfd040cba85faecfa920fe3a', 'tom', 'teacher', 'root', 1, 1321);
INSERT INTO `user` VALUES ('35856bfb64df4d13b2a5d471c3361a6c', '田梦豪', 'student', '123456', 1, 2019121218);
INSERT INTO `user` VALUES ('admin', 'admin', 'admin', 'admin', 1, 0);

SET FOREIGN_KEY_CHECKS = 1;
