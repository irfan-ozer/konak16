-- ----------------------------
-- Table structure for `galleries`
-- ----------------------------
CREATE TABLE `galleries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  `language` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `gallery_images`
-- ----------------------------
CREATE TABLE `gallery_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `galleryId` int(10) unsigned NOT NULL,
  `image` varchar(255) NOT NULL,
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  `language` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
