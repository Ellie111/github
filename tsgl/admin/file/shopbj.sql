-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2019 �?03 �?07 �?07:19
-- 服务器版本: 5.5.53
-- PHP 版本: 5.6.27

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `shopbj`
--

-- --------------------------------------------------------

--
-- 表的结构 `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `username` varchar(12) CHARACTER SET utf8 NOT NULL,
  `password` varchar(12) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- 表的结构 `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(123) NOT NULL AUTO_INCREMENT,
  `uname` varchar(123) COLLATE utf8_bin NOT NULL,
  `title` varchar(123) COLLATE utf8_bin NOT NULL,
  `content` varchar(2134) COLLATE utf8_bin NOT NULL,
  `time` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `news`
--

INSERT INTO `news` (`id`, `uname`, `title`, `content`, `time`) VALUES
(1, '王凯', '清明节全场4折', '清明节全称商品一律4折13', '2019-03-01'),
(5, '管理员', '想买到实惠的宝贝就来商品比价网', '更多实惠这里找', '2019-03-01'),
(6, '管理员', '测试公共发布', '测试公共发布测试公共发布测试公共发布', '2019-03-01');

-- --------------------------------------------------------

--
-- 表的结构 `pingjia`
--

CREATE TABLE IF NOT EXISTS `pingjia` (
  `id` int(123) NOT NULL AUTO_INCREMENT,
  `pid` varchar(123) COLLATE utf8_bin NOT NULL,
  `uname` varchar(123) COLLATE utf8_bin NOT NULL,
  `content` varchar(123) COLLATE utf8_bin NOT NULL,
  `title` varchar(123) COLLATE utf8_bin NOT NULL,
  `type` varchar(123) COLLATE utf8_bin NOT NULL,
  `pic` varchar(123) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `pingjia`
--

INSERT INTO `pingjia` (`id`, `pid`, `uname`, `content`, `title`, `type`, `pic`) VALUES
(13, '132', '王五', '很不错的', '仙人掌多肉植物组合', '好评', '5.jpg'),
(12, '131', '梦蝶', '很实惠，页很好活的！', '多肉植物组合新手套餐', '好评', '17.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `title` varchar(123) COLLATE utf8_bin NOT NULL,
  `content` varchar(2134) COLLATE utf8_bin NOT NULL,
  `pic` varchar(123) COLLATE utf8_bin NOT NULL,
  `lanmu` varchar(123) COLLATE utf8_bin NOT NULL,
  `bq` varchar(123) COLLATE utf8_bin NOT NULL DEFAULT '衣服',
  `price` varchar(123) COLLATE utf8_bin NOT NULL,
  `links` varchar(123) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=137 ;

--
-- 转存表中的数据 `product`
--

INSERT INTO `product` (`id`, `title`, `content`, `pic`, `lanmu`, `bq`, `price`, `links`) VALUES
(132, '仙人掌多肉植物组合', '<p>\r\n	仙人掌多肉植物组合盆栽铁罐仙人球类肉肉植物超萌室内防辐射含盆\r\n</p>\r\n<p>\r\n	<img src="/php/shopbj/shopbj/attached/image/20190301/20190301071918_98148.jpg" alt="" width="500" height="609" title="" align="" /> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '5.jpg', '淘宝', '10', '9.9', 'https://detail.tmall.com/item.htm?id=560320820430&ns=1&abbucket=16'),
(129, '所然原创文艺范个性长袖印花连衣裙', '<p>\r\n	<img src="/php/shopbj/shopbj/php/../attached/image/20190301/20190301073030_53387.jpg" alt="" width="600" height="93" title="" align="" /> \r\n</p>\r\n<p>\r\n	<img src="http://127.0.0.1:8080/php/shopbj/shopbj/attached/image/20190301/20190301073030_33774.jpg" alt="" width="600" height="798" title="" align="" /> \r\n</p>', 'llm.jpg', '淘宝', '5', '699', 'https://www.taobao.com/'),
(131, '多肉植物组合新手套餐', '<p>\r\n	<img src="/php/shopbj/shopbj/attached/image/20190301/20190301030135_83844.jpg" alt="" width="500" height="500" title="" align="" /> \r\n</p>\r\n<p>\r\n	<span style="font-size:14px;">多肉植物组合新手套餐包邮含盆绿植花卉盆栽肉肉嘟嘟植物室内</span> \r\n</p>', '17.jpg', '淘宝', '8', '5', 'https://item.taobao.com/item.htm?spm=a1z10.1-c.w9714256-21265946589.4.6b4a1483laAT92&id=579164843511'),
(133, '前短后长侧开叉绣花半开门襟衬衫', '<p>\r\n	<img src="/php/shopbj/shopbj/attached/image/20190301/20190301072702_12524.jpg" alt="" width="600" height="96" title="" align="" />\r\n</p>\r\n<p>\r\n	<img src="/php/shopbj/shopbj/attached/image/20190301/20190301072738_98942.jpg" alt="" width="600" height="864" title="" align="" />\r\n</p>', 'fz1.jpg', '淘宝', '10', '198', 'https://www.taobao.com/'),
(134, '多肉新手套餐 ', '<p>\r\n	轩林美 多肉新手套餐 多肉植物盆栽组合套装 肉肉植物 多肉老桩盆景 办公室内迷你绿植花卉盆栽 方盆套装10盆：10棵肉+10个盆+2包土\r\n</p>\r\n<p>\r\n	<img src="/php/shopbj/shopbj/attached/image/20190301/20190301073659_26748.jpg" alt="" width="600" height="415" title="" align="" /> \r\n</p>', 'jd1.jpg', '京东', '20', '9.6', 'https://item.jd.com/12649367214.html'),
(135, '多肉植物姬玉露', '<p>\r\n	多肉植物新手组合套装肉肉植物办公室内花卉绿植盆栽 姬玉露（含盆）\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<img src="/php/shopbj/shopbj/attached/image/20190301/20190301074502_99187.jpg" alt="" width="600" height="892" title="" align="" />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '13.jpg', '京东', '2', '1.2', 'https://item.jd.com/17988837125.html#comment'),
(136, '多肉植红宝石（含盆）', '<p>\r\n	【赠送花盆】多肉植物新手组合套装贵货多肉肉肉植物办公室内花卉绿植盆栽 红宝石（含盆）\r\n</p>\r\n<p>\r\n	<img src="/php/shopbj/shopbj/attached/image/20190301/20190301082628_54928.jpg" alt="" /> \r\n</p>', '14.jpg', '淘宝', '5', '1.5', 'https://item.jd.com/11102747818.html#comment');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
