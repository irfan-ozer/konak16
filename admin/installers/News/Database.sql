-- ----------------------------
-- Table structure for `news`
-- ----------------------------
CREATE TABLE `news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `summary` text NOT NULL,
  `detail` longtext NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` DATE NOT NULL,
  `metaTitle` varchar(255) DEFAULT NULL,
  `metaDescription` text,
  `metaKeywords` text,
  `order` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `language` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

