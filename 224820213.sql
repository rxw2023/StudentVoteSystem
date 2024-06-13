/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50744
Source Host           : localhost:3306
Source Database       : 224820213

Target Server Type    : MYSQL
Target Server Version : 50744
File Encoding         : 65001

Date: 2024-06-13 23:31:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `password` varchar(10) NOT NULL,
  `adminId` varchar(10) NOT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('20030301', 'doc');

-- ----------------------------
-- Table structure for `t_student`
-- ----------------------------
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_student` (
  `studentNo` varchar(10) NOT NULL,
  `name` varchar(10) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  PRIMARY KEY (`studentNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_student
-- ----------------------------
INSERT INTO `t_student` VALUES ('222', 'rrrrr', 'male', '12345');
INSERT INTO `t_student` VALUES ('224820213', 'rxw', 'male', '12345');
INSERT INTO `t_student` VALUES ('224820214', 'wxr', 'male', '111222');

-- ----------------------------
-- Table structure for `t_vote`
-- ----------------------------
DROP TABLE IF EXISTS `t_vote`;
CREATE TABLE `t_vote` (
  `teacherno` varchar(10) NOT NULL,
  `teachername` varchar(10) NOT NULL,
  `vote` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`teacherno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_vote
-- ----------------------------
INSERT INTO `t_vote` VALUES ('1', 'dd', '3');
INSERT INTO `t_vote` VALUES ('2', '李老师', '6');
INSERT INTO `t_vote` VALUES ('3', '王老师', '7');
INSERT INTO `t_vote` VALUES ('4', 'weq', '2');
INSERT INTO `t_vote` VALUES ('5', 'rrrd', '8');
