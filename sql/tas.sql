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

 Date: 14/10/2021 13:43:42
*/
create DATABASE if not EXISTS tas_tmh;
use tas_tmh;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `num` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程编号',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '课程名',
  `teacher_num` int NOT NULL COMMENT '教师编号',
  PRIMARY KEY (`num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('hl-0001', '移动互联应用系统综合开发', 2021001);
INSERT INTO `course` VALUES ('hl-0002', 'Web系统设计与开发', 2021001);
INSERT INTO `course` VALUES ('hl-0003', '软件测试', 2021002);
INSERT INTO `course` VALUES ('hl-0004', '实用英语', 2021003);
INSERT INTO `course` VALUES ('hl-0005', '高等数学', 2021002);
INSERT INTO `course` VALUES ('hl-0006', '数据结构和算法', 2021001);

-- ----------------------------
-- Table structure for leaving_message
-- ----------------------------
DROP TABLE IF EXISTS `leaving_message`;
CREATE TABLE `leaving_message`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '留言信息id',
  `sender` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '留言发送者',
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '留言时间',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '留言标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '留言内容',
  `receiver` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '留言接收者',
  `is_deleted` enum('未删除','已删除') CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '未删除' COMMENT '数据是否已删除(0未删除,1已删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 180 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of leaving_message
-- ----------------------------
INSERT INTO `leaving_message` VALUES (1, '小亮', '2021-09-16 13:25:10', '我来留言了', '我是第一个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (2, '小亮', '2021-09-16 12:25:10', '我来留言了', '我是第二个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (3, '小亮', '2021-09-16 13:24:10', '我来留言了', '我是第三个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (6, '小亮', '2021-09-18 12:25:10', '我来留言了', '我是第5个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (9, '小亮', '2021-09-13 13:25:10', '我来留言了', '我是第7个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (10, '小亮', '2021-09-18 12:25:10', '我来留言了', '我是第8个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (13, '小亮', '2021-06-16 13:25:10', '我来留言了', '我是第10个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (14, '小亮', '2021-07-16 12:25:10', '我来留言了', '我是第11个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (15, '小亮', '2020-09-16 13:24:10', '我来留言了', '我是第12个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (16, '小亮', '2021-09-16 12:25:10', '我来留言了', '老师好呀，老师辛苦啦，祝愿老师天天开心，身体健康，完事如意，每天都快快乐乐，吃得好，睡得好', 'Tom', '未删除');
INSERT INTO `leaving_message` VALUES (17, '小亮', '2021-09-16 13:24:10', '我来留言了', '我是第三个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (18, '小亮', '2021-09-18 12:25:10', '我来留言了', '我是第5个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (19, '小亮', '2021-09-13 13:25:10', '我来留言了', '我是第7个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (20, '小亮', '2021-09-18 12:25:10', '我来留言了', '我是第8个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (21, 'admin', '2021-08-16 13:24:10', '我来留言了', '我是第9个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (22, '小亮', '2021-06-16 13:25:10', '我来留言了', '我是第10个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (23, '小亮', '2021-07-16 12:25:10', '我来留言了', '我是第11个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (24, '小亮', '2020-09-16 13:24:10', '我来留言了', '我是第12个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (25, '小亮', '2021-09-07 12:25:10', '我来留言了', '我是第14个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (26, '小亮', '2021-09-06 13:24:10', '我来留言了', '我是第15个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (27, 'admin', '2021-09-16 13:25:10', '我来留言了', '我是第一个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (28, '小亮', '2021-09-16 12:25:10', '我来留言了', '我是第二个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (29, '小亮', '2021-09-16 13:24:10', '我来留言了', '我是第三个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (30, '小亮', '2021-09-06 13:25:10', '我来留言了', '我是第四个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (31, '小亮', '2021-09-18 12:25:10', '我来留言了', '我是第5个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (32, '小亮', '2021-09-13 13:25:10', '我来留言了', '我是第7个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (33, '小亮', '2021-09-18 12:25:10', '我来留言了', '我是第8个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (34, '小亮', '2021-08-16 13:24:10', '我来留言了', '我是第9个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (35, '小亮', '2021-06-16 13:25:10', '我来留言了', '我是第10个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (36, '小亮', '2021-07-16 12:25:10', '我来留言了', '我是第11个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (37, 'admin', '2020-09-16 13:24:10', '我来留言了', '我是第12个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (38, '小亮', '2021-09-07 12:25:10', '我来留言了', '我是第14个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (39, '小亮', '2021-09-06 13:24:10', '我来留言了', '我是第15个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (40, '小亮', '2021-09-16 13:25:10', '我来留言了', '我是第一个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (41, '小亮', '2021-09-16 12:25:10', '我来留言了', '我是第二个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (42, 'admin', '2021-09-16 13:24:10', '我来留言了', '我是第三个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (43, '小亮', '2021-09-06 13:25:10', '我来留言了', '我是第四个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (44, '小亮', '2021-09-18 12:25:10', '我来留言了', '我是第5个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (45, 'admin', '2021-09-07 13:24:10', '我来留言了', '我是第6个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (46, '小亮', '2021-09-13 13:25:10', '我来留言了', '我是第7个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (47, 'admin', '2021-08-16 13:24:10', '我来留言了', '我是第9个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (48, '小亮', '2021-06-16 13:25:10', '我来留言了', '我是第10个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (49, '小亮', '2021-07-16 12:25:10', '我来留言了', '我是第11个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (50, '小亮', '2020-09-16 13:24:10', '我来留言了', '我是第12个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (51, '小亮', '2021-09-07 12:25:10', '我来留言了', '我是第14个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (52, '小亮', '2021-09-16 12:25:10', '我来留言了', '我是第二个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (53, '小亮', '2021-09-16 13:24:10', '我来留言了', '我是第三个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (54, '小亮', '2021-09-18 12:25:10', '我来留言了', '我是第5个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (55, '小亮', '2021-09-13 13:25:10', '我来留言了', '我是第7个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (56, '小亮', '2021-09-18 12:25:10', '我来留言了', '我是第8个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (57, 'admin', '2021-08-16 13:24:10', '我来留言了', '我是第9个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (58, '小亮', '2021-06-16 13:25:10', '我来留言了', '我是第10个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (59, '小亮', '2021-07-16 12:25:10', '我来留言了', '我是第11个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (60, '小亮', '2020-09-16 13:24:10', '我来留言了', '我是第12个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (61, '小亮', '2021-09-07 12:25:10', '我来留言了', '我是第14个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (62, '小亮', '2021-09-06 13:24:10', '我来留言了', '我是第15个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (63, 'admin', '2021-09-16 13:25:10', '我来留言了', '我是第一个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (64, '小亮', '2021-09-16 12:25:10', '我来留言了', '我是第二个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (65, '小亮', '2021-09-16 13:24:10', '我来留言了', '我是第三个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (66, '小亮', '2021-09-06 13:25:10', '我来留言了', '我是第四个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (67, '小亮', '2021-09-18 12:25:10', '我来留言了', '我是第5个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (68, '小亮', '2021-09-13 13:25:10', '我来留言了', '我是第7个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (69, '小亮', '2021-09-18 12:25:10', '我来留言了', '我是第8个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (70, '小亮', '2021-08-16 13:24:10', '我来留言了', '我是第9个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (71, '小亮', '2021-06-16 13:25:10', '我来留言了', '我是第10个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (72, '小亮', '2021-07-16 12:25:10', '我来留言了', '我是第11个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (73, 'admin', '2020-09-16 13:24:10', '我来留言了', '我是第12个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (74, '小亮', '2021-09-07 12:25:10', '我来留言了', '我是第14个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (75, '小亮', '2021-09-06 13:24:10', '我来留言了', '我是第15个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (76, '小亮', '2021-09-16 13:25:10', '我来留言了', '我是第一个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (77, '小亮', '2021-09-16 12:25:10', '我来留言了', '我是第二个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (78, 'admin', '2021-09-16 13:24:10', '我来留言了', '我是第三个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (79, '小亮', '2021-09-06 13:25:10', '我来留言了', '我是第四个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (80, '小亮', '2021-09-18 12:25:10', '我来留言了', '我是第5个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (81, 'admin', '2021-09-07 13:24:10', '我来留言了', '我是第6个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (82, 'admin', '2021-09-22 13:46:04', '我的留言1', '你好，田梦豪', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (83, 'admin', '2021-09-22 14:08:54', '留言520', '还在吗？田老弟', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (84, 'admin', '2021-09-22 13:59:01', '下午好', '吃过下午饭了吗？', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (85, 'admin', '2021-09-22 13:51:21', '我的留言2', '管理员，你好呀', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (86, 'admin', '2021-09-22 14:07:50', '打招呼', '好久不见！！！', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (87, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (88, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (89, 'admin', '2021-09-07 13:24:10', '我来留言了', '我给田梦豪的第二个留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (90, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (91, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (97, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (98, 'admin', '2021-09-07 13:24:10', '我来留言了', '我给我自己的第二个留言', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (99, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (100, 'admin', '2021-09-18 10:23:18', '个人留言', '我给我自己的第三个留言', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (101, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (102, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (103, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (104, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '小亮', '已删除');
INSERT INTO `leaving_message` VALUES (105, 'admin', '2021-09-18 10:22:42', '这是我的留言', '不知道了吧，现在田梦豪是小亮了，晕了吧', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (106, 'admin', '2021-09-22 14:09:25', '晚上好', '睡了吗？挺想你的', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (107, 'admin', '2021-09-07 13:24:10', '我来留言了', '我给田梦豪的第二个留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (108, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (109, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (110, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (111, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (112, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (113, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (114, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (115, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (116, '小亮', '2021-09-06 13:24:10', '我来留言了', '我是第15个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (117, 'admin', '2021-09-16 13:25:10', '我来留言了', '我是第一个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (118, '小亮', '2021-09-16 12:25:10', '我来留言了', '我是第二个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (119, '小亮', '2021-09-16 13:24:10', '我来留言了', '我是第三个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (120, '小亮', '2021-09-06 13:25:10', '我来留言了', '我是第四个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (121, '小亮', '2021-09-18 12:25:10', '我来留言了', '我是第5个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (122, '小亮', '2021-09-13 13:25:10', '我来留言了', '我是第7个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (123, '小亮', '2021-09-18 12:25:10', '我来留言了', '我是第8个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (124, '小亮', '2021-08-16 13:24:10', '我来留言了', '我是第9个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (125, '小亮', '2021-06-16 13:25:10', '我来留言了', '我是第10个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (126, '小亮', '2021-07-16 12:25:10', '我来留言了', '我是第11个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (127, 'admin', '2020-09-16 13:24:10', '我来留言了', '我是第12个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (128, '小亮', '2021-09-07 12:25:10', '我来留言了', '我是第14个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (129, '小亮', '2021-09-06 13:24:10', '我来留言了', '我是第15个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (130, '小亮', '2021-09-16 13:25:10', '我来留言了', '我是第一个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (131, '小亮', '2021-09-16 12:25:10', '我来留言了', '我是第二个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (132, 'admin', '2021-09-16 13:24:10', '我来留言了', '我是第三个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (133, '小亮', '2021-09-06 13:25:10', '我来留言了', '我是第四个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (134, '小亮', '2021-09-18 12:25:10', '我来留言了', '我是第5个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (135, 'admin', '2021-09-07 13:24:10', '在吗', '你怎么把田梦豪改成小亮啦？用户名变了都不认识了', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (136, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (137, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (138, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (139, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (140, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (141, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (142, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (143, 'admin', '2021-09-07 13:24:10', '我来留言了', '我给田梦豪的第二个留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (144, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (145, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (146, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (147, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (148, '小亮', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (149, '小亮', '2021-09-18 10:22:42', '标题1', '我给admin的留言', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (150, '小亮', '2021-09-18 10:22:42', '标题2', '我给admin的留言', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (151, 'admin', '2021-09-18 10:22:42', '标题3', '这是我自己的留言', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (152, 'admin', '2021-09-18 10:22:42', '标题4', '没人给我留言', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (153, 'admin', '2021-09-18 10:22:42', '标题5', '我给田梦豪的留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (154, 'admin', '2021-09-18 10:22:42', '标题6', '我给田梦豪的留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (155, 'admin', '2021-09-18 10:22:42', '标题7', '我给田梦豪的留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (156, 'admin', '2021-09-18 10:22:42', '标题8', '我给田梦豪的留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (157, 'admin', '2021-09-18 10:22:42', '标题9', '我给田梦豪的留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (158, 'admin', '2021-09-18 10:22:42', '标题10', '我给田梦豪的留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (159, 'admin', '2021-09-18 10:22:42', '标题11', '我给田梦豪的留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (160, 'admin', '2021-09-22 15:16:04', 'Good Lucky', '祝你幸运!', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (161, 'admin', '2021-09-22 15:22:46', '标题666', '又是一个测试，疯啦疯啦疯啦', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (162, 'admin', '2021-09-07 13:24:10', '我来留言了', '我是第6个留言的', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (163, 'admin', '2021-09-22 13:46:04', '我的留言1', '你好，田梦豪', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (164, 'admin', '2021-09-22 14:08:54', '留言520', '还在吗？田老弟', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (165, 'admin', '2021-09-22 13:59:01', '下午好', '吃过下午饭了吗？', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (166, 'admin', '2021-09-22 13:51:21', '我的留言2', '管理员，你好呀', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (167, 'admin', '2021-09-22 14:07:50', '打招呼', '好久不见！！！', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (168, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (169, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (170, 'admin', '2021-09-07 13:24:10', '我来留言了', '我给田梦豪的第二个留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (171, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (172, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (173, 'admin', '2021-09-18 10:23:18', '我的留言', '我给田梦豪的第二个留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (174, 'admin', '2021-09-07 13:24:10', '我来留言了', '我给我自己的第二个留言', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (175, 'admin', '2021-09-18 10:22:42', '这是我的留言', '我给田梦豪的留言', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (176, 'admin', '2021-10-02 20:27:13', '晚上好', '吃过晚饭了吗', '小亮', '未删除');
INSERT INTO `leaving_message` VALUES (177, 'admin', '2021-10-02 20:31:09', '老师好', 'TOM老师好呀，我是管理员', 'Tom', '未删除');
INSERT INTO `leaving_message` VALUES (178, 'Tom', '2021-10-03 15:50:17', '你好', '管理员你好，我是tom老师，初来乍到，多多关照', 'admin', '未删除');
INSERT INTO `leaving_message` VALUES (179, 'admin', '2021-10-08 10:45:31', '欢迎', '欢迎老师来到教学辅助系统呀', 'Jerry', '未删除');
INSERT INTO `leaving_message` VALUES (180, 'admin', '2021-10-08 11:01:58', '欢迎', '欢迎老师来到教学辅助系统呀', 'Butch', '未删除');

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `course_num` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '课程编号',
  `student_num` int NOT NULL COMMENT '学生学号',
  `num` double(6, 2) NOT NULL COMMENT '分数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `score_ibfk_1`(`course_num`) USING BTREE,
  INDEX `score_ibfk_2`(`student_num`) USING BTREE,
  CONSTRAINT `score_ibfk_1` FOREIGN KEY (`course_num`) REFERENCES `course` (`num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `score_ibfk_2` FOREIGN KEY (`student_num`) REFERENCES `student` (`student_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of score
-- ----------------------------
INSERT INTO `score` VALUES (1, 'hl-0001', 2019121218, 98.00);
INSERT INTO `score` VALUES (3, 'hl-0002', 2019121218, 99.00);
INSERT INTO `score` VALUES (4, 'hl-0003', 2019121218, 99.50);
INSERT INTO `score` VALUES (5, 'hl-0004', 2019121218, 99.60);
INSERT INTO `score` VALUES (6, 'hl-0001', 2019121235, 95.00);
INSERT INTO `score` VALUES (8, 'hl-0002', 2019121235, 94.00);
INSERT INTO `score` VALUES (9, 'hl-0003', 2019121235, 90.00);
INSERT INTO `score` VALUES (10, 'hl-0004', 2019121235, 95.00);
INSERT INTO `score` VALUES (11, 'hl-0005', 2019121237, 93.00);
INSERT INTO `score` VALUES (12, 'hl-0006', 2019121237, 90.00);
INSERT INTO `score` VALUES (13, 'hl-0002', 2019121237, 87.00);
INSERT INTO `score` VALUES (14, 'hl-0001', 2019121237, 96.00);
INSERT INTO `score` VALUES (15, 'hl-0004', 2019121237, 90.50);
INSERT INTO `score` VALUES (16, 'hl-0005', 2019121236, 90.50);
INSERT INTO `score` VALUES (17, 'hl-0005', 2019121218, 94.00);
INSERT INTO `score` VALUES (18, 'hl-0006', 2019121218, 97.00);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `user_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '学生用户名',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '学生姓名',
  `student_num` int NOT NULL COMMENT '学生学号',
  `student_class` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '学生所在班级',
  PRIMARY KEY (`user_name`) USING BTREE,
  UNIQUE INDEX `student_num`(`student_num`) USING BTREE,
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`user_name`) REFERENCES `user` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('小亮', '赵小亮', 2019121218, '191互联2');
INSERT INTO `student` VALUES ('小六', '孙六', 2019121237, '191互联3');
INSERT INTO `student` VALUES ('小明', '王小明', 2019121235, '191互联2');
INSERT INTO `student` VALUES ('月亮', '钱月亮', 2019121236, '191互联1');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `user_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '教师用户名',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '教师姓名',
  `teacher_num` int NOT NULL COMMENT '教师工号',
  `department` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '教师所在部门',
  PRIMARY KEY (`user_name`) USING BTREE,
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`user_name`) REFERENCES `user` (`name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

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
  `password` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户密码',
  `is_registered` tinyint(1) NOT NULL DEFAULT 0 COMMENT '用户是否注册,可用于注销用户',
  `role_num` int NOT NULL COMMENT '用户身份号,老师和学生需要提供,管理员不需要',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('27c87e5efb7b400d8fa21cdf180dea72', 'Jerry', 'teacher', '63a9f0ea7bb98050796b649e85481845', 1, 2021002);
INSERT INTO `user` VALUES ('2a67c0ecdfd040cba85faecfa920fe3a', 'Tom', 'teacher', '63a9f0ea7bb98050796b649e85481845', 1, 2021001);
INSERT INTO `user` VALUES ('35856bfb64df4d13b2a5d471c3361a6c', '小亮', 'student', 'e10adc3949ba59abbe56e057f20f883e', 1, 2019121218);
INSERT INTO `user` VALUES ('524b6aed92314b86a5c949b77ad833d5', '月亮', 'student', 'e10adc3949ba59abbe56e057f20f883e', 1, 2019121236);
INSERT INTO `user` VALUES ('admin', 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 1, 0);
INSERT INTO `user` VALUES ('ba63df9527304605a6f80a1b214e5e3d', 'Butch', 'teacher', '63a9f0ea7bb98050796b649e85481845', 1, 2021003);
INSERT INTO `user` VALUES ('ce55b48151ea4eec927a40bc9c488e36', '小明', 'student', 'e10adc3949ba59abbe56e057f20f883e', 1, 2019121235);
INSERT INTO `user` VALUES ('dd3cd98789a843bab06167f340c2ce6b', '小六', 'student', 'e10adc3949ba59abbe56e057f20f883e', 1, 2019121237);

SET FOREIGN_KEY_CHECKS = 1;
