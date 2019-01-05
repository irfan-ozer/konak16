-- ----------------------------
-- Table structure for `banners`
-- ----------------------------
CREATE TABLE `banners` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `text` text NOT NULL,
  `transition` varchar(255) NOT NULL,
  `delay` int(10) unsigned NOT NULL,
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  `language` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;