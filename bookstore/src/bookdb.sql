/*
Navicat MySQL Data Transfer

Source Server         : admin
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : bookdb

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2017-12-08 13:18:57
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `book`
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) DEFAULT NULL COMMENT '书名',
  `author` varchar(50) DEFAULT NULL COMMENT '作者',
  `price` double DEFAULT NULL COMMENT '单价',
  `description` varchar(50) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO book VALUES ('1', '西游记', '吴承恩', '100', '四大名著之一');
INSERT INTO book VALUES ('2', '红楼梦', '曹雪芹', '200', '四大名著之一');
INSERT INTO book VALUES ('3', '三国演义', '罗贯中', '300', '四大名著之一');
INSERT INTO book VALUES ('4', '水浒传', '施耐庵', '400', '四大名著之一');
