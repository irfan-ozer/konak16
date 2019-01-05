-- phpMyAdmin SQL Dump
-- version 4.0.10.20
-- https://www.phpmyadmin.net
--
-- Anamakine: localhost
-- Üretim Zamanı: 05 Oca 2019, 19:07:50
-- Sunucu sürümü: 5.1.73-community
-- PHP Sürümü: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Veritabanı: `konak16`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `admin_groups`
--

CREATE TABLE IF NOT EXISTS `admin_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Tablo döküm verisi `admin_groups`
--

INSERT INTO `admin_groups` (`id`, `name`) VALUES
(1, 'Yönetici');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `admin_perms`
--

CREATE TABLE IF NOT EXISTS `admin_perms` (
  `groupId` int(10) unsigned NOT NULL,
  `module` varchar(255) NOT NULL,
  `perm` varchar(255) NOT NULL,
  KEY `fk_admin_perms_groupId` (`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `admin_perms`
--

INSERT INTO `admin_perms` (`groupId`, `module`, `perm`) VALUES
(1, 'home', 'options'),
(1, 'home', 'password'),
(1, 'home', 'user-list'),
(1, 'home', 'user-insert'),
(1, 'home', 'user-update'),
(1, 'home', 'user-delete'),
(1, 'home', 'group-list'),
(1, 'home', 'group-insert'),
(1, 'home', 'group-update'),
(1, 'home', 'group-delete'),
(1, 'module', 'list'),
(1, 'module', 'update'),
(1, 'module', 'delete'),
(1, 'module', 'order'),
(1, 'social', 'list'),
(1, 'social', 'insert'),
(1, 'social', 'update'),
(1, 'social', 'delete'),
(1, 'menu', 'list'),
(1, 'menu', 'insert'),
(1, 'menu', 'update'),
(1, 'menu', 'delete'),
(1, 'content', 'list'),
(1, 'content', 'insert'),
(1, 'content', 'update'),
(1, 'content', 'delete'),
(1, 'contact', 'list'),
(1, 'contact', 'view'),
(1, 'contact', 'delete'),
(1, 'banner', 'list'),
(1, 'banner', 'insert'),
(1, 'banner', 'update'),
(1, 'banner', 'delete'),
(1, 'service', 'list'),
(1, 'service', 'insert'),
(1, 'service', 'update'),
(1, 'service', 'delete'),
(1, 'callyou', 'list'),
(1, 'callyou', 'delete'),
(1, 'gallery', 'list'),
(1, 'gallery', 'insert'),
(1, 'gallery', 'update'),
(1, 'gallery', 'delete'),
(1, 'gallery', 'image-list'),
(1, 'gallery', 'image-insert'),
(1, 'gallery', 'image-update'),
(1, 'gallery', 'image-delete');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `admin_users`
--

CREATE TABLE IF NOT EXISTS `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `groupId` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_admin_users_groupId` (`groupId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Tablo döküm verisi `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `groupId`) VALUES
(1, 'admin', 'e0f01e57d55b5038758d4d1cdf9c6aa8', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `banners`
--

CREATE TABLE IF NOT EXISTS `banners` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Tablo döküm verisi `banners`
--

INSERT INTO `banners` (`id`, `title`, `image`, `link`, `text`, `transition`, `delay`, `order`, `language`) VALUES
(22, '', '7b2ee09e9ebf911f13932ddd721a5466.png', '', '', 'transition2d: 1', 4000, 0, 'tr'),
(23, '', '218393803e1b3bec9d21bac4a6c782d8.png', '', '', 'transition2d: 1', 4000, 0, 'tr');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `callyou`
--

CREATE TABLE IF NOT EXISTS `callyou` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) NOT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `ip` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `date` datetime NOT NULL,
  `ip` varchar(255) NOT NULL,
  `viewed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `approved` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Tablo döküm verisi `comments`
--

INSERT INTO `comments` (`id`, `fullname`, `email`, `comment`, `date`, `ip`, `viewed`, `approved`) VALUES
(3, 'İbrahim Kılıç', 'ibrahim@gmail.com', 'Gerçekten bütün ürünler çok tazeydi bütün personel güler yüzlü artık hep uğrayacağım hepinize teşekkürler.', '2016-08-15 13:45:17', '78.189.166.57', 0, 1),
(4, 'Hasan Taşkıran', 'Taskiran@gmail.com', 'Çikolata çeşitleri müşthiş bir de kumda pişirilmiş türk kahvesinin yanında olunca tadına doyum olmuyor.', '2016-08-15 13:50:07', '78.189.166.57', 0, 1),
(5, 'SEOdet', 'nowodworowgeorgij@mail.ru', '  \r\nhttp://seorussian.ru - seo оптимизация сайта цена   - http://seorussian.ru - seorussian.ru', '2018-11-22 07:00:07', '109.184.187.223', 0, 0),
(6, 'Detmebrhiva', 'artyom-pokrovskiy-1970@bk.ru', 'Детская мебель на заказ в Нижнем Новгороде - <a href=http://xn--80achebb5amfoa3bm2mpb.xn--p1ai>детскаямебельнн.рф</a> \r\n \r\n<a href=http://xn--80achebb5amfoa3bm2mpb.xn--p1ai> купить мебель для детской</a>       ', '2018-12-12 10:21:18', '109.184.143.245', 0, 0),
(7, 'Kuhnirhiva', 'scatresnasemb1995@seocdvig.ru', 'Кухни на заказ Нижний Новгород - http://xn----ttbhac9ao5f.xn--p1ai - нн-кухня.рф \r\n \r\nhttp://xn----ttbhac9ao5f.xn--p1ai -  классические и современные кухни       ', '2018-12-12 20:18:41', '93.120.187.120', 0, 0),
(8, 'Kuhnirhiva', 'shulcz.nikolaj.89@mail.ru', 'Кухни на заказ Нижний Новгород - <a href=http://kuhni-nn.ru>kuhni-nn.ru</a> \r\n \r\n<a href=http://kuhni-nn.ru> кухни россии</a>       ', '2018-12-14 12:04:09', '93.120.187.120', 0, 0),
(9, 'Detmebrhiva', 'filippov.denis.filippov.1997.de@mail.ru', 'Детская мебель на заказ в Нижнем Новгороде - http://1-meb.ru - 1-meb.ru \r\n \r\nhttp://1-meb.ru -  детская мебель       ', '2018-12-15 05:14:45', '109.184.229.136', 0, 0),
(10, 'Ofismebrhiva', 'kirya.mironov.1974@list.ru', 'Офиская мебель на заказ Нижний Новгород - <a href=http://mebelnayafirma.ru>mebelnayafirma.ru</a> \r\n \r\n<a href=http://mebelnayafirma.ru> офисная мебель</a>       ', '2018-12-15 09:32:10', '109.184.229.136', 0, 0),
(11, 'Ofismebrhiva', 'zaxarov.aleksej.68@inbox.ru', 'Офиская мебель на заказ Нижний Новгород - <a href=http://xn----7sbdpbozehhab4b2b7itb.xn--p1ai>офиснаямебель-нн.рф</a> \r\n \r\n<a href=http://xn----7sbdpbozehhab4b2b7itb.xn--p1ai> офисная мебель от производителя</a>       ', '2018-12-17 15:07:41', '109.184.229.136', 0, 0),
(12, 'Kuhnirhiva', 'ignatev_german_ignatev_1997_ger@mail.ru', 'Кухни на заказ Нижний Новгород - http://xn--h1adjba6ao.xn--p1ai - кухнинн.рф \r\n \r\nhttp://xn--h1adjba6ao.xn--p1ai -  кухни на заказ в Нижнем Новгороде       ', '2018-12-17 18:41:24', '109.184.216.243', 0, 0),
(13, 'Bedroomrhiva', 'bykov.ilya.2019@list.ru', 'Мебель для спальни на заказ в Нижнем Новгороде - http://xn----7sbylkcajr7i.xn--p1ai - спальни-нн.рф \r\n \r\nhttp://xn----7sbylkcajr7i.xn--p1ai - в спальню       ', '2018-12-18 08:38:28', '109.184.168.254', 0, 0),
(14, 'Roomrhiva', 'vlasov.egor.71@list.ru', 'Стенки на заказ в Нижнем Новгороде - http://xn--90aeccbuhmbetakd5bq8n6b.xn--p1ai - мебельдлягостинной.рф \r\n \r\nhttp://xn--90aeccbuhmbetakd5bq8n6b.xn--p1ai - белая стенка фото       ', '2018-12-18 09:52:42', '109.184.168.254', 0, 0),
(15, 'SEOdet', 'learhongriddstor1983@seocdvig.ru', ' \r\nseorussian.ru - Создание сайта               \r\nhttp://?seorussian.ru - Раскрутка сайтов Москва      \r\n \r\nhttp://?seorussian.ru/Razrabotka-saytov.html - Разработка сайта Москва    ', '2018-12-23 03:11:04', '109.184.184.119', 0, 0),
(16, 'Detmebrhiva', 'vorobyov.rostislav.81@bk.ru', 'Детская мебель на заказ в Нижнем Новгороде - <a href=http://a2mebel.ru>a2mebel.ru</a> \r\n \r\n<a href=http://a2mebel.ru>детская для девочки</a>       ', '2018-12-23 15:41:30', '109.184.176.191', 0, 0),
(17, 'Kuhnirhiva', 'den-antonov-1982@bk.ru', 'Кухни на заказ Нижний Новгород - <a href=http://xn----stbjba6ao5f.xn--p1ai>кухня-нн.рф</a> \r\n \r\n<a href=http://xn----stbjba6ao5f.xn--p1ai> кухни эконом-класса</a>       ', '2018-12-23 16:53:42', '109.184.176.191', 0, 0),
(18, 'Hallwayrhiva', 'lyonya-gusev@list.ru', 'Мебель в прихожию на заказ в Нижнем Новгороде - <a href=http://xn----7sbrh2aacgj5c3g.xn--p1ai>прихожая-нн.рф</a> \r\n \r\n<a href=http://xn----7sbrh2aacgj5c3g.xn--p1ai>шкаф на заказ цена за погонный метр</a>       ', '2018-12-24 02:57:55', '109.184.184.119', 0, 0),
(19, 'Hallwaybrhiva', 'filippov.dmitrij.76@bk.ru', 'Мебель в прихожию на заказ в Нижнем Новгороде - <a href=http://salonshkafkupe.ru>salonshkafkupe.ru</a> \r\n \r\n<a href=http://salonshkafkupe.ru>встроенный шкаф купить</a>       ', '2018-12-24 22:23:35', '109.184.184.119', 0, 0),
(20, 'Everettrhiva', 'glyctimanri1970@plusgmail.ru', 'http://мебель-шкаф.рф - шкафы купе \r\nhttp://мебель-шкаф.рф - шкафы купе на заказ \r\nhttp://мебель-шкаф.рф - шкафы купе недорого \r\nhttp://мебель-шкаф.рф - угловые шкафы купе \r\nhttp://мебель-шкаф.рф - шкафы купе фото \r\nhttp://мебель-шкаф.рф - встроенные шкафы купе \r\nhttp://мебель-шкаф.рф - шкафы купе каталог \r\nhttp://мебель-шкаф.рф - куплю шкаф купе \r\nhttp://мебель-шкаф.рф - купить шкаф купе \r\nhttp://мебель-шкаф.рф - шкафы купе цены \r\nhttp://мебель-шкаф.рф - дверь для шкафа купе \r\nhttp://мебель-шкаф.рф - двери для шкафов купе \r\nhttp://мебель-шкаф.рф - мебель шкафы купе \r\nhttp://мебель-шкаф.рф - фурнитура для шкафов купе \r\nhttp://мебель-шкаф.рф - наполнение шкафа купе \r\nhttp://мебель-шкаф.рф - шкафы купе москва \r\nhttp://мебель-шкаф.рф - изготовление шкафов купе \r\nhttp://мебель-шкаф.рф - комплектующие для шкафов купе \r\nhttp://мебель-шкаф.рф - сборка шкафа купе \r\nhttp://мебель-шкаф.рф - расчет шкафа купе \r\nhttp://мебель-шкаф.рф - готовые шкафы купе \r\nhttp://мебель-шкаф.рф - дизайн шкафов купе \r\nhttp://мебель-шкаф.рф - дизайны шкафов купе \r\nhttp://мебель-шкаф.рф - шкаф купе в прихожую \r\nhttp://мебель-шкаф.рф - стоимость шкафа купе \r\nhttp://мебель-шкаф.рф - магазины шкаф купе \r\nhttp://мебель-шкаф.рф - дешевые шкафы купе \r\nhttp://мебель-шкаф.рф - заказать шкаф купе \r\nhttp://мебель-шкаф.рф - схема шкафа купе \r\nhttp://мебель-шкаф.рф - производство шкафов купе \r\nhttp://мебель-шкаф.рф - профиль для шкафов купе \r\nhttp://мебель-шкаф.рф - распродажа шкафов купе \r\nhttp://мебель-шкаф.рф - найди шкафы купе \r\nhttp://мебель-шкаф.рф - шкафы купе от производителя \r\nhttp://мебель-шкаф.рф - шкафы купе продажа \r\nhttp://мебель-шкаф.рф - раздвижные шкафы купе \r\nhttp://мебель-шкаф.рф - мебельные шкафы купе \r\nhttp://мебель-шкаф.рф - шкафы купе на заказ недорого \r\nhttp://мебель-шкаф.рф - размеры шкаф купе \r\nhttp://мебель-шкаф.рф - шкаф купе проект \r\nhttp://мебель-шкаф.рф - угловые шкафы купе фото \r\nhttp://мебель-шкаф.рф - шкаф купе эконом \r\nhttp://мебель-шкаф.рф - фабрика мебели \r\nhttp://мебель-шкаф.рф - производство мебели \r\nhttp://мебель-шкаф.рф - кухонная мебель \r\nhttp://мебель-шкаф.рф - мебель на заказ \r\nhttp://мебель-шкаф.рф - корпусная мебель \r\nhttp://мебель-шкаф.рф - гостиная мебель \r\nhttp://мебель-шкаф.рф - мебель для кухни \r\nhttp://мебель-шкаф.рф - купить мебель \r\nhttp://мебель-шкаф.рф - мебель для гостиной \r\nhttp://мебель-шкаф.рф - мебель для гостиных \r\nhttp://мебель-шкаф.рф - каталог мебели \r\nhttp://мебель-шкаф.рф - мебель для комнаты \r\nhttp://мебель-шкаф.рф - производители мебели \r\nhttp://мебель-шкаф.рф - продажа мебели \r\nhttp://мебель-шкаф.рф - изготовление мебели \r\nhttp://мебель-шкаф.рф - прихожие мебель \r\nhttp://мебель-шкаф.рф - мебель для спален \r\nhttp://мебель-шкаф.рф - мебель для спальни \r\nhttp://мебель-шкаф.рф - мебель для ванной комнаты \r\nhttp://мебель-шкаф.рф - модульная мебель \r\nhttp://мебель-шкаф.рф - ремонт мебели \r\nhttp://мебель-шкаф.рф - мебель для офиса \r\nhttp://мебель-шкаф.рф - салон мебели \r\nhttp://мебель-шкаф.рф - мебель для дачи \r\nhttp://мебель-шкаф.рф - фото мебель \r\nhttp://мебель-шкаф.рф - мебель для дома \r\nhttp://мебель-шкаф.рф - недорогая мебель \r\nhttp://мебель-шкаф.рф - сборка мебели \r\nhttp://мебель-шкаф.рф - мебель дешевле \r\nhttp://мебель-шкаф.рф - дешевая мебель \r\nhttp://мебель-шкаф.рф - мебель шкафы \r\nhttp://мебель-шкаф.рф - дизайн мебели \r\nhttp://мебель-шкаф.рф - прихожии мебель \r\nhttp://мебель-шкаф.рф - сайт мебели \r\nhttp://мебель-шкаф.рф - мебель для детской комнаты \r\nhttp://мебель-шкаф.рф - сборка мебели \r\nhttp://мебель-шкаф.рф - мебель для детской комнаты \r\nhttp://мебель-шкаф.рф - стенки мебель \r\nhttp://мебель-шкаф.рф - цены на мебель \r\nhttp://мебель-шкаф.рф - сайт мебели \r\nhttp://мебель-шкаф.рф - мебель для детского сада \r\nhttp://мебель-шкаф.рф - прайс мебель \r\nhttp://мебель-шкаф.рф - прихожии мебель \r\nhttp://мебель-шкаф.рф - мебель недорого \r\nhttp://мебель-шкаф.рф - мебель для дачи \r\nhttp://мебель-шкаф.рф - размеры мебели \r\nhttp://мебель-шкаф.рф - дешевая мебель \r\nhttp://мебель-шкаф.рф - мебель дешевле \r\nhttp://мебель-шкаф.рф - дизайнер мебели \r\nhttp://мебель-шкаф.рф - встроенная мебель \r\nhttp://мебель-шкаф.рф - мебель фасады \r\nhttp://мебель-шкаф.рф - производство корпусной мебели \r\nhttp://мебель-шкаф.рф - мебель купе \r\nhttp://мебель-шкаф.рф - материал для мебели \r\nhttp://мебель-шкаф.рф - офисная мебель россии \r\nhttp://мебель-шкаф.рф - мебель \r\nhttp://мебель-шкаф.рф - изготовление корпусной мебели \r\nhttp://мебель-шкаф.рф - современная мебель \r\nhttp://мебель-шкаф.рф - изготовление мебели на заказ \r\nhttp://мебель-шкаф.рф - мебель для гостинной \r\nhttp://мебель-шкаф.рф - мебель для ресторанов \r\nhttp://мебель-шкаф.рф - офисная мебель москва \r\nhttp://мебель-шкаф.рф - мебель компьютерная \r\nhttp://мебель-шкаф.рф - библиотека мебель \r\nhttp://мебель-шкаф.рф - мебель шкафы купе \r\nhttp://мебель-шкаф.рф - офисная мебель заказ \r\nhttp://мебель-шкаф.рф - индивидуальная мебель \r\nhttp://мебель-шкаф.рф - мебель для кухни фото \r\nhttp://мебель-шкаф.рф - мебель для гостиниц \r\nhttp://мебель-шкаф.рф - мебель для зала \r\nhttp://мебель-шкаф.рф - корпусная мебель на заказ \r\nhttp://мебель-шкаф.рф - мебель для квартиры \r\nhttp://мебель-шкаф.рф - элементы мебели \r\nhttp://мебель-шкаф.рф - мебель скидки \r\nhttp://мебель-шкаф.рф - мебель из дсп \r\nhttp://мебель-шкаф.рф - мебель для кабинета \r\nhttp://мебель-шкаф.рф - офисная мебель под заказ \r\nhttp://мебель-шкаф.рф - стоимость мебели \r\nhttp://мебель-шкаф.рф - корпусная мебель гостиная \r\nhttp://мебель-шкаф.рф - хорошая мебель \r\nhttp://мебель-шкаф.рф - шкаф \r\nhttp://мебель-шкаф.рф - шкафы купе \r\nhttp://мебель-шкаф.рф - фото шкафы \r\nhttp://мебель-шкаф.рф - угловой шкаф \r\nhttp://мебель-шкаф.рф - встроенные шкафы \r\nhttp://мебель-шкаф.рф - шкафы купе фото \r\nhttp://мебель-шкаф.рф - шкафы на заказ \r\nhttp://мебель-шкаф.рф - шкаф дверь \r\nhttp://мебель-шкаф.рф - двери шкафа \r\nhttp://мебель-шкаф.рф - куплю шкаф \r\nhttp://мебель-шкаф.рф - шкаф купить \r\nhttp://мебель-шкаф.рф - шкафы купе на заказ \r\nhttp://мебель-шкаф.рф - каталог шкафов \r\nhttp://мебель-шкаф.рф - шкафы купе каталог \r\nhttp://мебель-шкаф.рф - шкаф купе угловой \r\nhttp://мебель-шкаф.рф - двери шкафов купе \r\nhttp://мебель-шкаф.рф - мебель шкафы \r\nhttp://мебель-шкаф.рф - шкафы для одежды \r\nhttp://мебель-шкаф.рф - дизайн шкафа \r\nhttp://мебель-шкаф.рф - шкаф недорого \r\nhttp://мебель-шкаф.рф - книжный шкаф \r\nhttp://мебель-шкаф.рф - шкафы купе недорого \r\nhttp://мебель-шкаф.рф - шкафы купе цены \r\nhttp://мебель-шкаф.рф - изготовление шкафов \r\nhttp://мебель-шкаф.рф - купить шкаф купе \r\nhttp://мебель-шкаф.рф - встроенные шкафы купе \r\nhttp://мебель-шкаф.рф - дизайн шкафов купе \r\nhttp://мебель-шкаф.рф - дизайны шкафов купе \r\nhttp://мебель-шкаф.рф - наполнение шкафа \r\nhttp://мебель-шкаф.рф - сборка шкафов \r\nhttp://мебель-шкаф.рф - раздвижные шкафы \r\nhttp://мебель-шкаф.рф - расчет шкафа купе \r\nhttp://мебель-шкаф.рф - производство шкафов \r\nhttp://мебель-шкаф.рф - размеры шкафов \r\nhttp://мебель-шкаф.рф - фасады шкафов купе \r\nhttp://мебель-шкаф.рф - шкаф купе наполнение \r\nhttp://мебель-шкаф.рф - зеркало шкаф \r\nhttp://мебель-шкаф.рф - шкаф прайс \r\nhttp://мебель-шкаф.рф - кухонный шкаф \r\nhttp://мебель-шкаф.рф - встроенный духовой шкаф \r\nhttp://мебель-шкаф.рф - мебель шкафы купе \r\nhttp://мебель-шкаф.рф - фурнитура для шкафов \r\nhttp://мебель-шкаф.рф - шкаф в прихожую \r\nhttp://мебель-шкаф.рф - стоимость шкафы \r\nhttp://мебель-шкаф.рф - изготовление шкафов купе \r\nhttp://мебель-шкаф.рф - сборка шкафа купе \r\nhttp://мебель-шкаф.рф - цены на шкафы \r\nhttp://мебель-шкаф.рф - раздвижные шкафы купе \r\nhttp://мебель-шкаф.рф - шкафы купэ \r\nhttp://мебель-шкаф.рф - силовой шкаф \r\nhttp://мебель-шкаф.рф - продажа шкафов \r\nhttp://мебель-шкаф.рф - офисный шкаф \r\nhttp://мебель-шкаф.рф - фурнитура для шкафов купе \r\nhttp://мебель-шкаф.рф - духовой шкаф газовый \r\nhttp://мебель-шкаф.рф - шкаф стеллаж \r\nhttp://мебель-шкаф.рф - схемы шкафы купе \r\nhttp://мебель-шкаф.рф - шкаф купе проект \r\nhttp://мебель-шкаф.рф - настенный шкаф \r\nhttp://мебель-шкаф.рф - дверь для шкафа купе \r\nhttp://мебель-шкаф.рф - шкаф витрина \r\nhttp://мебель-шкаф.рф - фильм шкаф \r\nhttp://мебель-шкаф.рф - шкаф купе стоимость \r\nhttp://мебель-шкаф.рф - системы для шкафов купе \r\nhttp://мебель-шкаф.рф - рисунки на шкафы купе \r\nhttp://мебель-шкаф.рф - шкаф навесной \r\nhttp://мебель-шкаф.рф - профиль для шкафов \r\nhttp://мебель-шкаф.рф - конструкция шкафа \r\nhttp://мебель-шкаф.рф - стенки шкафы \r\nhttp://мебель-шкаф.рф - шкаф на балкон \r\nhttp://мебель-шкаф.рф - гардеробные шкафы \r\nhttp://мебель-шкаф.рф - модели шкафов \r\nhttp://мебель-шкаф.рф - шкаф для обуви \r\nhttp://мебель-шкаф.рф - профиль для шкафов купе \r\nhttp://мебель-шкаф.рф - шкаф купе в прихожую \r\nhttp://мебель-шкаф.рф - платяной шкаф \r\nhttp://мебель-шкаф.рф - собрать шкаф \r\nhttp://мебель-шкаф.рф - мебельный шкаф \r\nhttp://мебель-шкаф.рф - шкаф купе скачать \r\nhttp://мебель-шкаф.рф - шкаф для хранения \r\nhttp://мебель-шкаф.рф - раздвижные системы для шкафов \r\nhttp://мебель-шкаф.рф - шкаф для посуды \r\nhttp://мебель-шкаф.рф - шкафы в картинках \r\nhttp://мебель-шкаф.рф - шкаф описание \r\nhttp://мебель-шкаф.рф - корпусные шкафы \r\nhttp://мебель-шкаф.рф - кухни шкафы купе \r\nhttp://мебель-шкаф.рф - размеры шкаф купе \r\nhttp://мебель-шкаф.рф - готовые шкафы \r\nhttp://мебель-шкаф.рф - шкафы под заказ \r\nhttp://мебель-шкаф.рф - куплю шкаф \r\nhttp://мебель-шкаф.рф - шкаф купить \r\nhttp://мебель-шкаф.рф - купить шкаф купе', '2018-12-25 19:53:23', '109.184.176.191', 0, 0),
(21, 'Bedroomrhiva', 'bykov.ilya.2019@list.ru', 'Мебель для спальни на заказ в Нижнем Новгороде - http://xn----7sbylkcajr7i.xn--p1ai - спальни-нн.рф \r\n \r\nhttp://xn----7sbylkcajr7i.xn--p1ai - изготовление мебели на заказ в Нижнем Новгороде       ', '2018-12-26 02:08:14', '109.184.184.119', 0, 0),
(22, 'Ofismebrhiva', 'matveev.bogdan.1985@bk.ru', 'Офиская мебель на заказ Нижний Новгород - http://plus-mebel.ru - plus-mebel.ru \r\n \r\nhttp://plus-mebel.ru -  производство офисной мебели       ', '2018-12-26 20:32:26', '109.184.176.191', 0, 0),
(23, 'SEOdet', 'tabuddworlforc1970@seocdvig.ru', ' \r\nseorussian.ru - Создание сайта               \r\n \r\nhttp://www.seorussian.ru - Продвижение сайтов по Москве     \r\n \r\nhttp://www.seorussian.ru/Izgotovlenie-saytov.html - Изготовление сайта    ', '2018-12-30 05:20:36', '109.184.170.211', 0, 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `contacts`
--

CREATE TABLE IF NOT EXISTS `contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `date` datetime NOT NULL,
  `ip` varchar(255) NOT NULL,
  `viewed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `contents`
--

CREATE TABLE IF NOT EXISTS `contents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `summary` text,
  `detail` longtext,
  `image` varchar(255) DEFAULT NULL,
  `reserved` varchar(255) DEFAULT NULL,
  `metaTitle` varchar(255) DEFAULT NULL,
  `metaDescription` text,
  `metaKeywords` text,
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  `language` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_contents_parentId` (`parentId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Tablo döküm verisi `contents`
--

INSERT INTO `contents` (`id`, `parentId`, `title`, `slug`, `summary`, `detail`, `image`, `reserved`, `metaTitle`, `metaDescription`, `metaKeywords`, `order`, `language`) VALUES
(1, NULL, 'TÜM ÜRÜNLERİMİZ TAPTAZEDİR', 'tum-urunlerimiz-bakirdir', '<center style="    padding: 10px;\r\n">Konak 16''da çayın tazesini, en sıcağını bulabilir veya cafemizde oturup sıcak  bakır cezvelerde kahvenin en derin tadıyla deneyim kazanın...</center>', '<p style="text-align: center;"><strong style="color: rgb(34, 34, 34); font-family: tahoma; font-size: 12px; line-height: 14.772px; text-align: center;">Bakır iletkenlik &ouml;zelliği g&uuml;&ccedil;l&uuml; olan bir maddedir.Bu y&uuml;zden yalıtım s&ouml;z konusudur ve ısıyı &ccedil;abuk dağıtmaz.İ&ccedil;ine bırakılan soğuk suyu soğuk,sıcak suyu sıcak muhafaza eder.<br />\r\nBakırin iletken olma &ouml;zelliğinden dolayı y&uuml;ksek ısıda ateşe maruz bırakmamamız gerekir.Kısık ateşte kullanmak kalay &ouml;mr&uuml;n&uuml;n uzunluğu a&ccedil;ısından &ouml;nemlidir.<br />\r\nAyrıca kalay &ouml;mr&uuml;n&uuml;n uzun olması i&ccedil;in bakır kaplarda ahşap kaşık ya da yanmayan sağlıklı slikon kaşıklar kullanmakta fayda vardır.<br />\r\nYemeği pişirdikten sonra artan yemeği bakır kaplarda bekletmemek gerekiyor.Bu durum ssağlıklı ya da sağlıksız olma durumundan ziyade bakır kaplarda beklettiğimiz yemekler kalayın rengini bozabiliyorlar.</strong><br />\r\n&nbsp;</p>\r\n', 'e50158686133ffb1356618d07c26ea3c.jpg', 'home', '', '', '', 1, 'tr'),
(5, NULL, 'İnsan Kaynakları', 'insan-kaynaklari', '', '<p><strong style="margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-size: 14px; text-align: justify;">Lorem Ipsum</strong><span style="color: rgb(0, 0, 0); font-size: 14px; text-align: justify;">, dizgi ve baskı end&uuml;strisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak &uuml;zere bir yazı galerisini alarak karıştırdığı 1500&#39;lerden beri end&uuml;stri standardı sahte metinler olarak kullanılmıştır. Beşy&uuml;z yıl boyunca varlığını s&uuml;rd&uuml;rmekle kalmamış, aynı zamanda pek değişmeden elektronik dizgiye de sı&ccedil;ramıştır. 1960&#39;larda Lorem Ipsum pasajları da i&ccedil;eren Letraset yapraklarının yayınlanması ile ve yakın zamanda Aldus PageMaker gibi Lorem Ipsum s&uuml;r&uuml;mleri i&ccedil;eren masa&uuml;st&uuml; yayıncılık yazılımları ile pop&uuml;ler olmuştur.</span></p>\r\n', NULL, NULL, '', '', '', 3, 'tr'),
(16, NULL, 'Hakkımızda', 'hakkimizda', '<b>KURUYEMİŞ CAFE</b><br>; Sağlıklı ve hijyenik ortamlarda üretimini gerçekleştirdiği taze kahve ve özenle seçilip kaliteli tohumlardan üretilmiş kuruyemişlerle sizlere hizmet veriyoruz.', '<p><span style="color:#000000;"><strong>Konak 16,</strong> eğlence merkezi, gerek servis anlayışıyla, gerek muhteşem doğa dokusuyla misafirlerine alternatifsiz bir ortam sunuyor.1995&prime;dan beri <strong>Bursa&#39;nın</strong> merkezinde hizmetini s&uuml;rd&uuml;ren Konak16 Cafe, yenilenen&nbsp; i&ccedil; mekanıyla kalite ve konforu se&ccedil;kin m&uuml;şterileriyle buluşturmaya devam ediyor.</span></p>\r\n\r\n<p><span style="color: rgb(0, 0, 0);">Son derece saygın bir m&uuml;şteri portf&ouml;y&uuml;ne hizmet vermektedir. Konak16 Cafe, Uludağ &Uuml;niversitesi &ouml;ğrencileri tarafından 2 kez en &ccedil;ok gidilen Cafe &ouml;d&uuml;l&uuml;ne layık g&ouml;r&uuml;lm&uuml;şt&uuml;r. &Ouml;zel davetlerinizde misafirlerinizi ağırlayabileceğiniz Konak 16 Cafe&rsquo;de ayrıca sigara i&ccedil;ilen b&ouml;l&uuml;mde dev perdede Lig TV ve D-Smart ma&ccedil; yayınlarınıda izleyebilirsiniz.</span></p>\r\n\r\n<p><span style="color: rgb(0, 0, 0);">Haftanın 7 g&uuml;n&uuml; 08:00 &ndash; 01:00 saatleri arasında hizmet veren Konak 16 Cafe, yıllardır misafirlerini aynı sloganla karşılıyor;</span></p>\r\n\r\n<p>&nbsp;</p>\r\n', '68ed4986a8d44ab7d62d510cc5caab23.jpg', NULL, '', '', '', 13, 'tr');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cvs`
--

CREATE TABLE IF NOT EXISTS `cvs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `comment` text,
  `cv` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `ip` varchar(255) NOT NULL,
  `viewed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `galleries`
--

CREATE TABLE IF NOT EXISTS `galleries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  `language` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Tablo döküm verisi `galleries`
--

INSERT INTO `galleries` (`id`, `title`, `slug`, `image`, `order`, `language`) VALUES
(3, 'Sizden Gelenler', 'sizden-gelenler', '403991bd4a8648d888548458e8ab883c.jpg', 1, 'tr');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `gallery_images`
--

CREATE TABLE IF NOT EXISTS `gallery_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `galleryId` int(10) unsigned NOT NULL,
  `image` varchar(255) NOT NULL,
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  `language` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Tablo döküm verisi `gallery_images`
--

INSERT INTO `gallery_images` (`id`, `galleryId`, `image`, `order`, `language`) VALUES
(14, 3, '7f7d86ad548784d106a987d68cf6da8b.jpg', 2, 'tr'),
(15, 3, 'c4d020a8c8bfa620adb90fe322ec3c15.jpg', 3, 'tr'),
(16, 3, 'a7aa233df40fcd49d4497ce1bb34e566.jpg', 4, 'tr'),
(17, 3, '0df40ce4c822933d550ff9683e128965.jpg', 5, 'tr'),
(18, 3, 'ccd3ce1aaf6dc9d4646b776350c153f3.jpg', 6, 'tr'),
(19, 3, 'defe6d5315678ee3463b46d005a510ec.jpg', 7, 'tr'),
(20, 3, '8a8a5d7863d81881e9572693753abe83.jpg', 8, 'tr'),
(21, 3, 'f714213e4953fb11cefe2a972ca6b036.jpg', 9, 'tr'),
(22, 3, 'dfe76eed2702710a051faf77add275ce.jpg', 10, 'tr'),
(23, 3, '133f3b4047e70cc90a81b254741ffcc8.jpg', 11, 'tr'),
(24, 3, 'c733db37d2805068502587a2779709ea.jpg', 12, 'tr'),
(25, 3, '9f43371863b49f37b1ae28888a0cb665.jpg', 13, 'tr'),
(26, 3, '8958fbbbda7fbc462fafcbb85d7e75d9.jpg', 14, 'tr'),
(27, 3, 'bc1236a9a44530f6e899372078557683.jpg', 1, 'tr'),
(28, 3, '6974bd282c01610412957c967df87e35.jpg', 15, 'tr'),
(29, 3, 'ecbdfdd1539e718f2c29263e1e145216.jpg', 16, 'tr'),
(30, 3, '2c9353c1d1911d5729c2f508b4666689.jpg', 17, 'tr'),
(31, 3, 'b199230a94d9fe65b2b225738279ccbe.jpg', 18, 'tr');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `maillist`
--

CREATE TABLE IF NOT EXISTS `maillist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `ip` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=355 ;

--
-- Tablo döküm verisi `maillist`
--

INSERT INTO `maillist` (`id`, `fullname`, `email`, `date`, `ip`) VALUES
(1, '0', 'info23@cantatic.com', '2018-11-04 09:07:43', '147.135.4.70'),
(2, '0', 'springlovesun1990@gmail.com', '2018-12-11 14:06:19', '85.202.163.127'),
(3, '0', 'rebecca.kaupisch@googlemail.com', '2018-12-11 17:05:22', '185.220.102.8'),
(4, '0', 'julie52999@gmail.com', '2018-12-11 17:24:43', '195.176.3.19'),
(5, '0', 'bebe.vie28@gmail.com', '2018-12-11 20:36:11', '37.187.129.166'),
(6, '0', 'marienels@aol.com', '2018-12-11 21:15:53', '192.42.116.17'),
(7, '0', 'kaykavous@gmail.com', '2018-12-11 21:19:38', '91.219.236.171'),
(8, '0', 'lynchdavid@aol.com', '2018-12-11 21:35:21', '192.160.102.166'),
(9, '0', 'muthia.ahmad@gmail.com', '2018-12-11 21:42:23', '5.150.254.67'),
(10, '0', 'nlwiltshire@yahoo.com', '2018-12-11 23:05:17', '185.220.101.6'),
(11, '0', 'beasleybbeas@aol.com', '2018-12-11 23:55:39', '206.81.3.227'),
(12, '0', 'rocelag@gmail.com', '2018-12-12 00:03:09', '51.15.68.66'),
(13, '0', 'latimerjames@yahoo.com', '2018-12-12 00:09:06', '178.175.135.101'),
(14, '0', 'poohlovespiglet3@yahoo.com', '2018-12-12 00:27:14', '192.42.116.28'),
(15, '0', 'rocelag@gmail.com', '2018-12-12 00:55:12', '185.227.82.9'),
(16, '0', 'mary_tsai0628@yahoo.com', '2018-12-12 02:33:26', '144.217.60.211'),
(17, '0', 'mary_tsai0628@yahoo.com', '2018-12-12 03:07:00', '171.25.193.25'),
(18, '0', 'fossy_two@yahoo.com', '2018-12-12 03:45:08', '162.247.74.7'),
(19, '0', 'lauraewolfram@yahoo.com', '2018-12-12 03:45:14', '94.142.242.84'),
(20, '0', 'ridjil@gmail.com', '2018-12-12 05:19:43', '158.174.122.218'),
(21, '0', 'eawatkins3@gmail.com', '2018-12-12 05:59:00', '5.199.130.127'),
(22, '0', 'lynchdavid@aol.com', '2018-12-12 12:29:58', '178.20.55.16'),
(23, '0', 'lestertuesday1@gmail.com', '2018-12-12 21:19:02', '178.17.166.150'),
(24, '0', 'lyndatadams@gmail.com', '2018-12-12 21:28:25', '51.15.34.214'),
(25, '0', 'lalabone@aol.com', '2018-12-12 21:37:06', '176.10.99.200'),
(26, '0', 'cnorouzi@gmail.com', '2018-12-12 22:41:47', '65.19.167.132'),
(27, '0', 'harika.yalamati@gmail.com', '2018-12-12 23:01:52', '158.255.3.38'),
(28, '0', 'gceverett64@gmail.com', '2018-12-13 00:05:24', '198.98.56.149'),
(29, '0', 'laurarojo1@yahoo.com', '2018-12-13 00:35:08', '197.231.221.211'),
(30, '0', 'jabarris@gmail.com', '2018-12-13 00:46:43', '188.165.61.244'),
(31, '0', 'friendsindallas1@yahoo.com', '2018-12-13 03:38:51', '195.254.134.242'),
(32, '0', 'lbgoodwin@aol.com', '2018-12-13 05:12:38', '185.220.101.6'),
(33, '0', 'supermantonight@gmail.com', '2018-12-13 13:36:11', '185.220.101.31'),
(34, '0', 'alchemyofherbs@gmail.com', '2018-12-13 14:55:30', '176.10.99.200'),
(35, '0', 'dblon12@gmail.com', '2018-12-13 14:58:09', '87.118.92.43'),
(36, '0', 'trovescott@gmail.com', '2018-12-13 15:46:34', '85.202.163.127'),
(37, '0', 'gert.lueckmann@gmx.de', '2018-12-13 16:37:48', '46.165.230.5'),
(38, '0', 'willslanford@gmail.com', '2018-12-13 16:53:39', '128.31.0.13'),
(39, '0', '1gozhak@gmail.com', '2018-12-13 17:27:11', '185.220.101.30'),
(40, '0', 'willslanford@gmail.com', '2018-12-13 20:18:29', '77.247.181.162'),
(41, '0', 'cashmaddock45@gmail.com', '2018-12-13 20:41:00', '173.244.209.5'),
(42, '0', 'marcusvchin@gmail.com', '2018-12-13 20:45:19', '64.113.32.29'),
(43, '0', 'eververv343@gmail.com', '2018-12-13 21:07:09', '158.255.3.27'),
(44, '0', 'frankbooker007@gmail.com', '2018-12-13 22:57:36', '204.85.191.31'),
(45, '0', 'marcusvchin@gmail.com', '2018-12-13 23:01:30', '199.249.230.72'),
(46, '0', 'rcelene48@yahoo.com', '2018-12-13 23:08:27', '199.249.230.81'),
(47, '0', 'cohenetal3@aol.com', '2018-12-13 23:39:16', '199.249.230.74'),
(48, '0', 'patyvyfournier@gmail.com', '2018-12-14 00:57:05', '5.79.86.15'),
(49, '0', 'namelessnamester@gmail.com', '2018-12-14 01:19:10', '185.72.244.24'),
(50, '0', 'pdubzzle@gmail.com', '2018-12-14 02:03:06', '192.160.102.169'),
(51, '0', 'rodem2010@gmail.com', '2018-12-14 02:49:38', '46.38.235.14'),
(52, '0', 'marydoogie@yahoo.com', '2018-12-14 06:12:15', '199.249.230.74'),
(53, '0', 'lynchdavid@aol.com', '2018-12-14 08:30:48', '199.249.230.69'),
(54, '0', 're2427@gmail.com', '2018-12-14 08:42:24', '195.176.3.19'),
(55, '0', 'welkerjason@gmail.com', '2018-12-14 08:43:11', '193.107.85.62'),
(56, '0', 'instantadvicenetwork@gmail.com', '2018-12-14 16:05:04', '94.142.242.84'),
(57, '0', 'laura.robinson@elis.com', '2018-12-14 19:08:48', '79.134.234.247'),
(58, '0', 'dlkrenzer@gmail.com', '2018-12-14 21:54:25', '37.157.194.22'),
(59, '0', 'csleonar@gmail.com', '2018-12-14 22:45:30', '37.157.194.22'),
(60, '0', 'jspeer.5700@gmail.com', '2018-12-14 23:08:53', '54.37.16.241'),
(61, '0', 'autumnmgardner@gmail.com', '2018-12-15 00:46:09', '195.176.3.23'),
(62, '0', 'mbeelar@yahoo.com', '2018-12-15 00:50:09', '185.100.87.207'),
(63, '0', 'katie.moeser@gmail.com', '2018-12-15 02:14:20', '185.220.101.32'),
(64, '0', 'rick.mcfarlin@gmail.com', '2018-12-15 04:23:05', '176.10.99.200'),
(65, '0', 'lynchdavid@aol.com', '2018-12-15 04:42:09', '192.160.102.169'),
(66, '0', 'rmederos2002@yahoo.com', '2018-12-15 05:55:43', '151.80.167.65'),
(67, '0', 'ghtoar@gmail.com', '2018-12-15 07:24:18', '171.25.193.25'),
(68, '0', 'nyr73mets@yahoo.com', '2018-12-15 08:03:49', '176.10.99.200'),
(69, '0', 'mfry76@yahoo.com', '2018-12-15 15:47:55', '89.234.157.254'),
(70, '0', 'askreft@gmail.com', '2018-12-15 16:01:57', '185.104.120.3'),
(71, '0', 'mauriceissa41@gmail.com', '2018-12-15 19:27:07', '199.249.230.65'),
(72, '0', 'skittlekyd@gmail.com', '2018-12-15 20:12:14', '199.249.230.64'),
(73, '0', 'alijudymaster@yahoo.com', '2018-12-15 20:39:35', '171.25.193.78'),
(74, '0', 'askreft@gmail.com', '2018-12-15 20:44:58', '5.196.66.162'),
(75, '0', 'lbgoodwin@aol.com', '2018-12-15 22:10:41', '185.220.101.12'),
(76, '0', 'z4myi@yahoo.com', '2018-12-15 22:15:00', '162.247.74.199'),
(77, '0', 'z4myi@yahoo.com', '2018-12-15 23:11:53', '185.165.169.165'),
(78, '0', 'jumbocakes@gmail.com', '2018-12-16 00:09:13', '185.107.47.215'),
(79, '0', 'alijudymaster@yahoo.com', '2018-12-16 00:15:58', '176.10.99.200'),
(80, '0', 'bogdan.zelenikhin@gmail.com', '2018-12-16 00:32:58', '185.220.101.0'),
(81, '0', 'andysullivan2000@gmail.com', '2018-12-16 01:01:27', '51.15.125.181'),
(82, '0', 'boeingsa@gmail.com', '2018-12-16 01:51:00', '195.123.245.112'),
(83, '0', 'smithers9@gmail.com', '2018-12-16 05:21:08', '185.220.101.46'),
(84, '0', 'alijudymaster@yahoo.com', '2018-12-16 16:54:17', '178.20.55.16'),
(85, '0', 'willslanford@gmail.com', '2018-12-16 20:13:21', '185.220.100.252'),
(86, '0', 'beazy007505@gmail.com', '2018-12-16 20:38:47', '158.69.37.14'),
(87, '0', 'mauriceissa41@gmail.com', '2018-12-16 22:50:49', '176.10.99.200'),
(88, '0', 'alijudymaster@yahoo.com', '2018-12-16 22:52:16', '5.101.40.89'),
(89, '0', 'tvteacherohio@aol.com', '2018-12-16 23:45:20', '77.247.181.162'),
(90, '0', 'bogdan.zelenikhin@gmail.com', '2018-12-17 02:31:46', '18.85.22.239'),
(91, '0', 'esc1156@aol.com', '2018-12-17 02:37:00', '185.220.101.7'),
(92, '0', 'bogdan.zelenikhin@gmail.com', '2018-12-17 03:18:57', '185.220.101.12'),
(93, '0', 'yexzonventura64@gmail.com', '2018-12-17 04:44:37', '5.79.86.15'),
(94, '0', 'kathrynparry71@gmail.com', '2018-12-17 13:12:38', '62.102.148.67'),
(95, '0', 'raul.cardona851@gmail.com', '2018-12-17 18:00:33', '185.220.102.7'),
(96, '0', 'your-shirt@web.de', '2018-12-17 20:09:43', '185.220.101.26'),
(97, '0', 'victoria.frunze@gmail.com', '2018-12-17 20:25:25', '195.176.3.19'),
(98, '0', 'haiglelo1@gmail.com', '2018-12-17 20:57:48', '185.220.101.10'),
(99, '0', 'twitkop@aol.com', '2018-12-17 21:30:51', '158.174.122.218'),
(100, '0', 'wzeng628@gmail.com', '2018-12-17 22:28:25', '185.220.101.8'),
(101, '0', 'kim.moni.jaro@gmx.de', '2018-12-17 22:32:45', '199.195.250.77'),
(102, '0', 'bigcountry132@gmail.com', '2018-12-17 23:23:54', '199.249.230.79'),
(103, '0', 'liznikovski@gmail.com', '2018-12-18 02:39:59', '178.17.174.196'),
(104, '0', 'coachmsanabria@gmail.com', '2018-12-18 04:44:30', '185.220.101.5'),
(105, '0', 'tweetness.ar@gmail.com', '2018-12-18 05:46:28', '188.166.9.235'),
(106, '0', 'willslanford@gmail.com', '2018-12-18 15:06:03', '77.247.181.163'),
(107, '0', 'luckyduck1560@gmail.com', '2018-12-18 15:49:07', '185.220.101.50'),
(108, '0', 'tiff.saatzer3@gmail.com', '2018-12-18 20:46:42', '91.121.112.181'),
(109, '0', 'carolefreedman@aol.com', '2018-12-18 21:47:40', '77.247.181.165'),
(110, '0', 'carolefreedman@aol.com', '2018-12-18 21:47:41', '198.96.155.3'),
(111, '0', 'cherikimmel@gmail.com', '2018-12-19 01:21:43', '85.248.227.163'),
(112, '0', 'cpterry@gmail.com', '2018-12-19 01:37:39', '46.165.230.5'),
(113, '0', 'bobmacdonald311@gmail.com', '2018-12-19 03:33:21', '162.247.74.206'),
(114, '0', 'sbplumber@aol.com', '2018-12-19 05:01:08', '197.231.221.211'),
(115, '0', 'aravinthtop@gmail.com', '2018-12-19 05:43:52', '217.170.197.89'),
(116, '0', 'mtnparker22@gmail.com', '2018-12-19 07:40:00', '204.85.191.31'),
(117, '0', 'lynchdavid@aol.com', '2018-12-19 09:00:47', '199.249.230.80'),
(118, '0', 'betty.mccart.1933@gmail.com', '2018-12-19 10:27:33', '195.176.3.20'),
(119, '0', 'yexsonventura54@gmail.com', '2018-12-19 12:07:20', '193.169.145.194'),
(120, '0', 'bigcountry132@gmail.com', '2018-12-19 14:45:12', '37.139.8.104'),
(121, '0', 'hollenyc@gmail.com', '2018-12-19 16:49:50', '145.239.91.37'),
(122, '0', 'jumbocakes@gmail.com', '2018-12-19 17:15:37', '80.67.172.162'),
(123, '0', 'psomers88@gmail.com', '2018-12-19 20:35:03', '176.10.99.200'),
(124, '0', 'willyflash13@gmail.com', '2018-12-19 20:49:18', '51.15.124.1'),
(125, '0', 'mph2122@gmail.com', '2018-12-19 21:29:16', '205.185.127.219'),
(126, '0', 'lucyemersonhaagen@gmail.com', '2018-12-19 21:56:19', '51.15.43.205'),
(127, '0', 'ccaballeroplaceres@yahoo.com', '2018-12-20 00:31:13', '178.175.135.101'),
(128, '0', 'blipteachsign@yahoo.com', '2018-12-20 01:46:16', '51.15.43.205'),
(129, '0', 'vera.mawazine@gmail.com', '2018-12-20 06:04:26', '198.98.56.149'),
(130, '0', 'mark.burris@titan-intl.com', '2018-12-20 12:07:17', '163.172.67.180'),
(131, '0', 'fivewda@gmail.com', '2018-12-20 13:34:46', '171.25.193.20'),
(132, '0', 'skittlekyd@gmail.com', '2018-12-20 13:58:08', '91.219.236.171'),
(133, '0', 'jumbocakes@gmail.com', '2018-12-20 16:59:19', '195.176.3.23'),
(134, '0', 'jtabbush@gmail.com', '2018-12-20 17:01:11', '195.176.3.23'),
(135, '0', 'dwshepherd49@yahoo.com', '2018-12-20 17:08:52', '192.42.116.22'),
(136, '0', 'megarandommadness@gmail.com', '2018-12-20 17:25:12', '163.172.215.253'),
(137, '0', 'chauchau1269@gmail.com', '2018-12-20 18:07:01', '185.83.214.6'),
(138, '0', 'dwshepherd49@yahoo.com', '2018-12-20 18:53:44', '171.25.193.235'),
(139, '0', 'lewiis4017@yahoo.com', '2018-12-20 18:55:02', '199.249.230.77'),
(140, '0', 'pline3rd@aol.com', '2018-12-20 23:06:09', '5.196.66.162'),
(141, '0', 'lchenwood@gmail.com', '2018-12-21 00:23:55', '87.118.112.63'),
(142, '0', 'stradagos@gmail.com', '2018-12-21 00:52:07', '199.19.226.16'),
(143, '0', 'lchenwood@gmail.com', '2018-12-21 01:15:12', '199.87.154.255'),
(144, '0', 'exist123ride@yahoo.com', '2018-12-21 02:34:18', '51.15.235.211'),
(145, '0', 'karinaortegako@aol.com', '2018-12-21 02:36:14', '185.86.149.254'),
(146, '0', 'exist123ride@yahoo.com', '2018-12-21 03:23:45', '185.233.100.23'),
(147, '0', 'bocoopermx@gmail.com', '2018-12-21 03:51:51', '199.249.230.64'),
(148, '0', 'yexsonventura54@gmail.com', '2018-12-21 04:28:12', '77.247.181.162'),
(149, '0', 'samuelitoamato@gmail.com', '2018-12-21 07:42:52', '18.85.22.239'),
(150, '0', 'ori.gilady@gmail.com', '2018-12-21 07:43:12', '193.90.12.119'),
(151, '0', 'cm.esposito@yahoo.com', '2018-12-21 13:47:17', '195.176.3.23'),
(152, '0', 'trovescott@gmail.com', '2018-12-21 18:05:24', '89.248.162.130'),
(153, '0', 'joseph.bullock@verizon.net', '2018-12-21 20:15:40', '37.187.129.166'),
(154, '0', 'mark.fragassi@gmail.com', '2018-12-21 21:09:23', '158.174.122.218'),
(155, '0', 'jeanette.espie@gmail.com', '2018-12-21 22:32:33', '176.10.99.200'),
(156, '0', 'cvannoy55@gmail.com', '2018-12-21 23:44:26', '46.166.139.35'),
(157, '0', 'frankosharp@aol.com', '2018-12-22 01:36:27', '31.220.0.225'),
(158, '0', 'petecollesano@yahoo.com', '2018-12-22 01:58:46', '199.249.230.65'),
(159, '0', 'frankosharp@aol.com', '2018-12-22 02:28:49', '185.220.102.4'),
(160, '0', 'georgeivanwilkins@gmail.com', '2018-12-22 02:44:26', '199.249.223.76'),
(161, '0', 'andrewford3610@gmail.com', '2018-12-22 03:12:15', '199.249.230.68'),
(162, '0', 'huntertp@aol.com', '2018-12-22 03:39:34', '192.42.116.28'),
(163, '0', 'courtneyhughes30@gmail.com', '2018-12-22 03:59:22', '171.25.193.78'),
(164, '0', 'jdhaupt57@gmail.com', '2018-12-22 09:26:55', '185.117.215.9'),
(165, '0', 'mark.fragassi@gmail.com', '2018-12-22 15:22:26', '197.231.221.211'),
(166, '0', 'nathalieamato@gmail.com', '2018-12-22 16:57:22', '5.196.1.129'),
(167, '0', 'mixed83.nd@gmail.com', '2018-12-22 18:16:40', '192.42.116.16'),
(168, '0', 'gregvv127@gmail.com', '2018-12-22 18:40:54', '5.79.86.15'),
(169, '0', 'garcaa@bluffton.edu', '2018-12-22 20:11:13', '195.189.96.147'),
(170, '0', 'lynchdavid@aol.com', '2018-12-22 20:47:13', '199.249.230.80'),
(171, '0', 'lynchdavid@aol.com', '2018-12-22 22:05:28', '192.42.116.26'),
(172, '0', 'karinaortegako@aol.com', '2018-12-22 22:14:21', '87.120.36.157'),
(173, '0', 'garcaa@bluffton.edu', '2018-12-22 23:14:42', '192.42.116.14'),
(174, '0', 'westmalc@gmail.com', '2018-12-23 09:46:27', '199.249.230.75'),
(175, '0', 'sbplumber@aol.com', '2018-12-23 16:53:33', '87.118.116.12'),
(176, '0', 'scottseverin521@gmail.com', '2018-12-23 16:55:50', '66.155.4.213'),
(177, '0', 'hartlepoolnewsalerts@gmail.com', '2018-12-23 18:04:37', '91.219.236.171'),
(178, '0', 'rbkkcordova2@yahoo.com', '2018-12-23 18:44:30', '162.247.74.216'),
(179, '0', 'truck9895@yahoo.com', '2018-12-23 19:00:57', '176.10.99.200'),
(180, '0', 'hummingbirdcasper@gmail.com', '2018-12-23 20:40:53', '62.102.148.67'),
(181, '0', 'mark.fragassi@gmail.com', '2018-12-23 22:04:35', '89.234.157.254'),
(182, '0', 'cm.esposito@yahoo.com', '2018-12-23 22:11:44', '77.247.181.162'),
(183, '0', 'truck9895@yahoo.com', '2018-12-23 22:13:45', '77.247.181.162'),
(184, '0', 'laducky_2000@yahoo.com', '2018-12-23 23:01:06', '77.247.181.162'),
(185, '0', 'derele420@gmail.com', '2018-12-24 14:03:52', '185.220.102.4'),
(186, '0', 'davideitel.medical@gmail.com', '2018-12-24 14:06:27', '185.220.101.20'),
(187, '0', 'smuvv2002@yahoo.com', '2018-12-24 18:30:20', '185.220.101.15'),
(188, '0', 'kathie.dubin.tvn@gmail.com', '2018-12-24 18:46:53', '77.247.181.162'),
(189, '0', 'mark.fragassi@gmail.com', '2018-12-24 18:48:38', '185.220.101.27'),
(190, '0', 'jschlabach@gmail.com', '2018-12-24 20:06:45', '206.81.3.227'),
(191, '0', 'evilskin@gmail.com', '2018-12-24 21:01:04', '171.25.193.77'),
(192, '0', 'valeria.germania@gmail.com', '2018-12-24 21:28:57', '89.31.57.5'),
(193, '0', 'kuznecovskyy@gmail.com', '2018-12-24 22:13:47', '193.171.202.150'),
(194, '0', 'safa_1989a@yahoo.com', '2018-12-24 23:00:18', '163.172.132.199'),
(195, '0', 'jumbocakes@gmail.com', '2018-12-24 23:48:33', '185.220.102.4'),
(196, '0', 'kursedkyuubi@gmail.com', '2018-12-25 00:33:33', '185.220.101.48'),
(197, '0', 'mike.alvarez3989@yahoo.com', '2018-12-25 01:03:56', '185.220.101.27'),
(198, '0', 'cm.esposito@yahoo.com', '2018-12-25 01:39:37', '197.231.221.211'),
(199, '0', 'txskyed@gmail.com', '2018-12-25 02:14:48', '54.37.16.241'),
(200, '0', 'carlycam@cox.net', '2018-12-25 06:00:11', '162.247.74.216'),
(201, '0', 'judydpc@aol.com', '2018-12-25 12:14:10', '65.19.167.132'),
(202, '0', 'davideitel.medical@gmail.com', '2018-12-25 14:34:30', '51.15.155.2'),
(203, '0', 'justintmercer@gmail.com', '2018-12-25 14:37:55', '185.220.101.21'),
(204, '0', 'jrderuki@gmail.com', '2018-12-25 15:42:09', '46.38.235.14'),
(205, '0', 'jrderuki@gmail.com', '2018-12-25 16:01:51', '162.247.74.202'),
(206, '0', 'meatskin1@yahoo.com', '2018-12-25 17:51:23', '91.121.112.181'),
(207, '0', 'rosarcexport@aol.com', '2018-12-25 18:35:17', '195.123.245.112'),
(208, '0', 'devinohare1@gmail.com', '2018-12-25 19:35:07', '185.220.102.7'),
(209, '0', 'devemile@gmail.com', '2018-12-25 19:52:04', '185.100.85.61'),
(210, '0', 'kursedkyuubi@gmail.com', '2018-12-25 21:39:03', '51.15.233.253'),
(211, '0', 'windysbrown@aol.com', '2018-12-25 21:44:23', '197.231.221.211'),
(212, '0', 'jamaievans@yahoo.com', '2018-12-25 22:08:54', '77.247.181.162'),
(213, '0', 'megarandommadness@gmail.com', '2018-12-26 00:26:10', '199.249.230.69'),
(214, '0', 'justintmercer@gmail.com', '2018-12-26 00:38:14', '37.233.102.65'),
(215, '0', 'jonathan.g.bristow@gmail.com', '2018-12-26 00:56:53', '195.123.213.116'),
(216, '0', 'tonyissa96@gmail.com', '2018-12-26 02:07:00', '185.220.101.12'),
(217, '0', 'angelarmann@gmail.com', '2018-12-26 02:43:59', '185.220.101.49'),
(218, '0', 'makensierich00@gmail.com', '2018-12-26 03:56:08', '195.176.3.24'),
(219, '0', 'olex.david@gmail.com', '2018-12-26 08:37:35', '199.249.230.67'),
(220, '0', 'angelarmann@gmail.com', '2018-12-26 13:02:00', '176.10.99.200'),
(221, '0', 'derele420@gmail.com', '2018-12-26 14:12:33', '163.172.215.253'),
(222, '0', 'davideitel.medical@gmail.com', '2018-12-26 16:12:43', '192.42.116.20'),
(223, '0', 'kursedkyuubi@gmail.com', '2018-12-26 16:25:53', '185.220.101.31'),
(224, '0', 'loriamccol@aol.com', '2018-12-26 17:45:40', '176.10.99.200'),
(225, '0', 'pippolina@vodafone.de', '2018-12-26 19:01:24', '85.248.227.164'),
(226, '0', 'mvitale06@gmail.com', '2018-12-26 19:58:41', '192.42.116.24'),
(227, '0', 'bocoopermx@gmail.com', '2018-12-26 20:20:16', '185.220.102.6'),
(228, '0', 'cathcartce@gmail.com', '2018-12-26 20:26:21', '171.25.193.78'),
(229, '0', 'davidfrost417@gmail.com', '2018-12-26 20:44:34', '66.70.217.179'),
(230, '0', 'johnstefkovic@gmail.com', '2018-12-26 20:53:59', '185.220.101.27'),
(231, '0', 'tonyissa96@gmail.com', '2018-12-26 21:33:29', '176.10.99.200'),
(232, '0', 'megarandommadness@gmail.com', '2018-12-26 23:11:23', '209.126.101.29'),
(233, '0', 'khurram@kingfuels.com', '2018-12-26 23:14:32', '51.15.235.211'),
(234, '0', 'chrisgalego@yahoo.com', '2018-12-27 00:06:56', '185.220.101.12'),
(235, '0', 'johnkell1212@gmail.com', '2018-12-27 01:05:43', '51.15.124.1'),
(236, '0', 'greggray82@aol.com', '2018-12-27 01:15:57', '65.19.167.132'),
(237, '0', 'derele420@gmail.com', '2018-12-27 01:59:53', '185.107.70.202'),
(238, '0', 'kathie.dubin.tvn@gmail.com', '2018-12-27 02:10:31', '91.121.251.65'),
(239, '0', 'tonyissa96@gmail.com', '2018-12-27 03:06:57', '178.32.147.150'),
(240, '0', 'bocoopermx@gmail.com', '2018-12-27 04:30:29', '192.42.116.27'),
(241, '0', 'cathyschnitzer52@gmail.com', '2018-12-27 07:15:15', '178.32.147.150'),
(242, '0', 'kuznecovskyy@gmail.com', '2018-12-27 07:35:05', '185.220.101.32'),
(243, '0', 'jrderuki@gmail.com', '2018-12-27 08:02:30', '149.202.238.204'),
(244, '0', 'andrewford3610@gmail.com', '2018-12-27 08:22:53', '199.249.230.68'),
(245, '0', 'convairazo580@gmail.com', '2018-12-27 08:41:18', '51.15.240.100'),
(246, '0', 'rkreamer1305@yahoo.com', '2018-12-27 20:37:59', '176.126.83.211'),
(247, '0', 'bchen2000us@gmail.com', '2018-12-27 22:30:29', '51.15.234.90'),
(248, '0', 'scottbard10@gmail.com', '2018-12-28 00:20:45', '185.227.68.78'),
(249, '0', 'msanchez107@yahoo.com', '2018-12-28 00:22:00', '80.127.116.96'),
(250, '0', 'bumerm@comcast.net', '2018-12-28 00:22:57', '185.195.236.2'),
(251, '0', 'kriscmonte@yahoo.com', '2018-12-28 01:55:53', '192.42.116.15'),
(252, '0', 'wearethemillers07@gmail.com', '2018-12-28 02:46:27', '199.249.230.70'),
(253, '0', 'jwyoonf@gmail.com', '2018-12-28 03:26:24', '176.10.104.240'),
(254, '0', 'luneburg24@aol.com', '2018-12-28 04:17:04', '185.195.236.2'),
(255, '0', 'aymangarout@gmail.com', '2018-12-28 13:07:49', '176.10.99.200'),
(256, '0', 'annu.kostiainen@gmail.com', '2018-12-28 13:21:09', '65.19.167.132'),
(257, '0', 'kursedkyuubi@gmail.com', '2018-12-28 13:35:06', '51.15.240.100'),
(258, '0', 'corytaylor1980@yahoo.com', '2018-12-28 13:50:13', '193.169.145.194'),
(259, '0', 'kursedkyuubi@gmail.com', '2018-12-28 13:55:16', '185.220.101.13'),
(260, '0', 'kursedkyuubi@gmail.com', '2018-12-28 14:25:22', '163.172.67.180'),
(261, '0', 'deadproof222@gmail.com', '2018-12-28 14:38:56', '192.42.116.28'),
(262, '0', 'lhmlpg_vut@yahoo.com', '2018-12-28 18:51:49', '185.220.102.8'),
(263, '0', 'gunnar_assmy@yahoo.de', '2018-12-28 20:08:14', '199.249.230.74'),
(264, '0', 'andrewford3610@gmail.com', '2018-12-28 21:09:27', '51.254.209.128'),
(265, '0', 'klemphouse@yahoo.com', '2018-12-29 00:14:30', '79.137.79.167'),
(266, '0', 'rbparham@gmail.com', '2018-12-29 00:39:11', '199.249.230.75'),
(267, '0', 'lynchdavid@aol.com', '2018-12-29 02:08:51', '193.171.202.150'),
(268, '0', 'hkuddokv13419@gmail.com', '2018-12-29 03:34:17', '185.107.47.171'),
(269, '0', 'belenmarquez31@gmail.com', '2018-12-29 11:46:01', '37.187.129.166'),
(270, '0', 'glachman9@gmail.com', '2018-12-29 14:53:29', '51.15.99.115'),
(271, '0', 'z4myi3@yahoo.com', '2018-12-29 15:21:36', '66.70.217.179'),
(272, '0', 'belenmarquez31@gmail.com', '2018-12-29 15:45:57', '188.132.176.2'),
(273, '0', 'oliverhd123456789@gmail.com', '2018-12-29 16:30:48', '199.195.250.77'),
(274, '0', 'won8450@gmail.com', '2018-12-29 19:05:02', '71.19.148.20'),
(275, '0', 'belenmarquez31@gmail.com', '2018-12-29 19:53:45', '212.21.66.6'),
(276, '0', 'evgeniyvolchenkov@gmail.com', '2018-12-29 19:57:07', '198.98.56.149'),
(277, '0', 'garethinthebush@gmail.com', '2018-12-29 21:51:13', '173.249.63.21'),
(278, '0', 'sebastianhuang.a@gmail.com', '2018-12-29 21:57:34', '89.234.157.254'),
(279, '0', 'timothy.been@mines.sdsmt.edu', '2018-12-29 23:32:00', '77.247.181.163'),
(280, '0', 'lbsoftstuff@gmail.com', '2018-12-30 01:52:37', '176.10.104.240'),
(281, '0', 'lynchdavid@aol.com', '2018-12-30 01:53:02', '18.85.22.239'),
(282, '0', 'tjjacksonsm@gmail.com', '2018-12-30 06:42:20', '5.135.158.101'),
(283, '0', 'trovescott@gmail.com', '2018-12-30 11:52:45', '80.67.172.162'),
(284, '0', '9718046125@mymetropcs.com', '2018-12-30 12:43:22', '85.248.227.165'),
(285, '0', 'sebastianhuang.a@gmail.com', '2018-12-30 13:15:28', '185.100.87.206'),
(286, '0', 'valeria.germania@gmail.com', '2018-12-30 15:13:34', '185.195.236.2'),
(287, '0', 'david@achelpohlroofing.com', '2018-12-30 15:22:07', '185.220.101.44'),
(288, '0', 'lblessedbyangels@aol.com', '2018-12-30 18:11:06', '179.43.134.157'),
(289, '0', 'kursedkyuubi@gmail.com', '2018-12-30 20:28:40', '18.85.22.239'),
(290, '0', 'sally.kirkendoll@yahoo.com', '2018-12-31 01:05:13', '197.231.221.211'),
(291, '0', 'lbsoftstuff@gmail.com', '2018-12-31 01:27:08', '188.132.176.2'),
(292, '0', 'vikacherkachick@gmail.com', '2018-12-31 01:40:45', '185.107.47.171'),
(293, '0', 'derele420@gmail.com', '2018-12-31 02:15:17', '197.231.221.211'),
(294, '0', 'tdbauer94@gmail.com', '2018-12-31 03:35:24', '85.248.227.163'),
(295, '0', 'belenmarquez31@gmail.com', '2018-12-31 04:08:31', '193.90.12.118'),
(296, '0', 'vivesto2013@gmail.com', '2018-12-31 04:20:56', '173.249.63.21'),
(297, '0', 'belenmarquez31@gmail.com', '2018-12-31 04:26:41', '185.220.101.5'),
(298, '0', 'kedari.a.matthews@gmail.com', '2018-12-31 06:00:21', '185.220.100.253'),
(299, '0', 'cortb64@yahoo.com', '2018-12-31 11:13:21', '51.15.43.205'),
(300, '0', 'babynou1962@gmail.com', '2018-12-31 13:27:21', '51.15.124.1'),
(301, '0', 'goudarzi.bita@yahoo.com', '2018-12-31 16:54:30', '80.79.120.82'),
(302, '0', 'yubojin1995@gmail.com', '2018-12-31 19:15:38', '64.113.32.29'),
(303, '0', 'z4myi3@yahoo.com', '2018-12-31 21:18:34', '185.220.101.28'),
(304, '0', 'davideitel.medical@gmail.com', '2018-12-31 22:18:30', '185.220.101.30'),
(305, '0', 'kay_chino@yahoo.com', '2018-12-31 23:02:43', '104.244.76.13'),
(306, '0', 'gjasper1261@gmail.com', '2019-01-01 02:00:40', '185.195.236.2'),
(307, '0', 'honda2001@gmail.com', '2019-01-01 03:14:01', '185.220.101.53'),
(308, '0', 'goloso333@yahoo.com', '2019-01-01 05:30:35', '77.247.181.165'),
(309, '0', 'troubledownunder@gmail.com', '2019-01-01 08:18:39', '185.220.101.48'),
(310, '0', 'anhphuong.vn@gmail.com', '2019-01-01 09:13:50', '171.25.193.25'),
(311, '0', 'lbsoftstuff@gmail.com', '2019-01-01 11:07:54', '65.19.167.131'),
(312, '0', 'lbsoftstuff@gmail.com', '2019-01-01 16:55:39', '185.220.101.27'),
(313, '0', 'cortb64@yahoo.com', '2019-01-02 00:24:10', '185.107.70.202'),
(314, '0', 'akhil232@gmail.com', '2019-01-02 05:47:35', '80.137.176.173'),
(315, '0', 'z4myi3@yahoo.com', '2019-01-02 08:11:17', '87.120.36.157'),
(316, '0', 'trovescott@gmail.com', '2019-01-02 12:29:29', '89.234.157.254'),
(317, '0', 'ubyrd@yahoo.com', '2019-01-02 16:25:31', '109.70.100.18'),
(318, '0', 'trovescott@gmail.com', '2019-01-02 16:42:58', '199.249.230.66'),
(319, '0', 'tuanchristimtran@yahoo.com', '2019-01-02 21:48:06', '193.169.145.194'),
(320, '0', 'mvitale06@gmail.com', '2019-01-02 22:33:54', '185.233.100.23'),
(321, '0', 'trovescott@gmail.com', '2019-01-03 07:02:20', '158.69.217.87'),
(322, '0', 'jamaievans@yahoo.com', '2019-01-03 07:23:45', '209.95.51.11'),
(323, '0', 'pokeguys88@gmail.com', '2019-01-03 12:27:12', '176.10.99.200'),
(324, '0', 'jhonniestafford3@gmail.com', '2019-01-03 13:18:55', '199.249.230.85'),
(325, '0', 'konak16.com@domstates.su', '2019-01-03 13:48:52', '188.92.74.189'),
(326, '0', 'dramaalertads@gmail.com', '2019-01-03 15:13:39', '192.42.116.20'),
(327, '0', 'mfjeso@gmail.com', '2019-01-03 15:55:49', '199.249.230.71'),
(328, '0', 'kromelynk@yahoo.com', '2019-01-03 18:48:25', '109.201.133.100'),
(329, '0', 'lisamhill68@gmail.com', '2019-01-03 20:29:23', '145.239.210.106'),
(330, '0', 'cheryl4176@gmail.com', '2019-01-03 22:36:45', '66.70.217.179'),
(331, '0', 'sineglaski@yahoo.com', '2019-01-03 22:38:04', '62.210.37.82'),
(332, '0', 'erinfay7@yahoo.com', '2019-01-04 00:22:40', '207.244.70.35'),
(333, '0', 'pmorlock@shimano.com', '2019-01-04 01:12:55', '151.80.167.64'),
(334, '0', 'tjjacksonsm@gmail.com', '2019-01-04 01:22:39', '178.17.166.148'),
(335, '0', 'lynchdavid@aol.com', '2019-01-04 01:52:10', '87.118.92.43'),
(336, '0', 'davideitel.medical@gmail.com', '2019-01-04 02:59:15', '65.19.167.130'),
(337, '0', 'kedari.a.matthews@gmail.com', '2019-01-04 03:32:25', '178.32.147.150'),
(338, '0', 'nobbykathy@yahoo.com', '2019-01-04 13:27:11', '51.15.235.211'),
(339, '0', 'ryder_del_fin@yahoo.com', '2019-01-04 13:39:05', '144.217.60.239'),
(340, '0', 'mfjeso@gmail.com', '2019-01-04 14:12:20', '141.255.162.34'),
(341, '0', 'smify1@aol.com', '2019-01-04 16:55:50', '51.15.113.84'),
(342, '0', 'm.styles8@gmail.com', '2019-01-04 17:43:41', '192.99.80.230'),
(343, '0', 'ssterhaar@gmail.com', '2019-01-04 19:03:12', '185.220.101.27'),
(344, '0', 'yubojin1995@gmail.com', '2019-01-04 20:34:23', '185.220.101.0'),
(345, '0', 'jchow24@aol.com', '2019-01-04 21:27:41', '51.15.113.84'),
(346, '0', 'mfjeso@gmail.com', '2019-01-04 21:45:35', '51.15.240.100'),
(347, '0', 'bluangel93@aol.com', '2019-01-04 22:25:49', '51.15.234.90'),
(348, '0', 'andrew.leeke@gmail.com', '2019-01-04 22:41:33', '51.15.99.115'),
(349, '0', 'arthurtormollan@gmail.com', '2019-01-04 23:40:11', '176.10.99.200'),
(350, '0', 'tjjacksonsm@gmail.com', '2019-01-04 23:59:08', '51.15.125.181'),
(351, '0', 'gabi.vrabie@gmail.com', '2019-01-05 01:26:08', '109.69.67.17'),
(352, '0', 'deannecouey@aol.com', '2019-01-05 06:44:54', '158.69.37.14'),
(353, '0', 'honda2001@gmail.com', '2019-01-05 09:15:24', '185.220.101.28'),
(354, '0', 'arthurtormollan@gmail.com', '2019-01-05 13:41:11', '213.61.215.54');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `menus`
--

CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `hint` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `htmlID` varchar(255) DEFAULT NULL,
  `htmlClass` varchar(255) DEFAULT NULL,
  `target` varchar(20) DEFAULT NULL,
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  `language` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_menus_parentId` (`parentId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=44 ;

--
-- Tablo döküm verisi `menus`
--

INSERT INTO `menus` (`id`, `parentId`, `name`, `title`, `hint`, `link`, `htmlID`, `htmlClass`, `target`, `order`, `language`) VALUES
(1, NULL, 'main', 'Ana Menü', NULL, NULL, NULL, NULL, NULL, 0, 'tr'),
(2, NULL, 'footer', 'Footer Menü', NULL, NULL, NULL, NULL, NULL, 0, 'tr'),
(4, 1, NULL, 'İLETİŞİM', 'İLETİŞİM', '@contact', '', '', '_self', 8, 'tr'),
(7, 1, NULL, 'KURUMSAL', 'KURUMSAL', '@content/kurumsal/16', '', '', '_self', 2, 'tr'),
(8, 2, NULL, 'ANA SAYFA', 'Anasayfa', '@home', '', '', '_self', 1, 'tr'),
(9, 2, NULL, 'KURUMSAL', 'KURUMSAL', '@content/kurumsal/16', '', '', '_self', 2, 'tr'),
(11, 2, NULL, 'HİZMETLERİMİZ', 'Hizmetler', '@service', '', '', '_self', 4, 'tr'),
(12, 2, NULL, 'İLETİŞİM', 'İletişim', '@contact', '', '', '_self', 6, 'tr'),
(18, 1, NULL, 'İK', 'İnsan Kaynakları', '@cv', '', '', '_self', 7, 'tr'),
(22, 2, NULL, 'İNSAN KAYNAKLARI', 'İnsan Kaynakları', '@cv', '', '', '_self', 7, 'tr'),
(34, 1, NULL, 'YORUMLAR', 'Yorumlar', '@comment', '', '', '_self', 3, 'tr'),
(36, 1, NULL, 'GALERİ', 'GALERİ', '@gallery/sizden-gelenler/3', '', '', '_self', 5, 'tr'),
(37, 1, NULL, 'HABERLER', 'HABERLER', '@news', '', '', '_self', 6, 'tr'),
(43, 1, NULL, 'MAÇ REZERVASYONU', 'MAÇ REZERVASYONU', '#', '', '', '_self', 4, 'tr');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `modules`
--

CREATE TABLE IF NOT EXISTS `modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `table` varchar(255) NOT NULL,
  `modified` int(10) unsigned NOT NULL,
  `permissions` text NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `menuPattern` text,
  `controller` varchar(255) NOT NULL,
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Tablo döküm verisi `modules`
--

INSERT INTO `modules` (`id`, `name`, `title`, `table`, `modified`, `permissions`, `type`, `icon`, `menuPattern`, `controller`, `order`) VALUES
(1, 'home', 'Home', 'admin_users', 1428906670, 'options,password,user-list,user-insert,user-update,user-delete,group-list,group-insert,group-update,group-delete', NULL, NULL, NULL, 'HomeAdminController', 0),
(2, 'module', 'Modüller', 'modules', 1453801828, 'list,update,delete,order', NULL, NULL, NULL, 'ModuleAdminController', 0),
(3, 'social', 'Sosyal Ağlar', 'socials', 1448436590, 'list,insert,update,delete', NULL, 'fa-retweet', NULL, 'SocialAdminController', 0),
(4, 'menu', 'Menü Yönetimi', 'menus', 1430400472, 'list,insert,update,delete', NULL, NULL, NULL, 'MenuAdminController', 0),
(5, 'content', 'İçerikler', 'contents', 1428906670, 'list,insert,update,delete', 'public', NULL, 'a:4:{s:5:"title";s:5:"title";s:4:"hint";s:5:"title";s:4:"link";a:2:{i:0;s:4:"slug";i:1;s:2:"id";}s:8:"language";b:1;}', 'ContentAdminController', 0),
(6, 'contact', 'İletişim', 'contacts', 1428906670, 'list,view,delete', 'public', NULL, 'a:1:{s:10:"moduleLink";b:1;}', 'ContactAdminController', 0),
(7, 'banner', 'Bannerlar', 'banners', 1471072586, 'list,insert,update,delete', NULL, NULL, NULL, 'BannerAdminController', 0),
(9, 'service', 'Hizmetler', 'services', 1471009078, 'list,insert,update,delete', 'public', NULL, 'a:5:{s:5:"title";s:5:"title";s:4:"hint";s:5:"title";s:4:"link";a:2:{i:0;s:4:"slug";i:1;s:2:"id";}s:10:"moduleLink";b:1;s:8:"language";b:1;}', 'ServiceAdminController', 0),
(10, 'callyou', 'Biz Sizi Arayalım', 'callyou', 1429795754, 'list,delete', NULL, NULL, NULL, 'CallyouAdminController', 0),
(11, 'maillist', 'E-Mail Listesi', 'maillist', 1428906670, 'list,delete', 'public', NULL, 'a:1:{s:10:"moduleLink";b:1;}', 'MaillistAdminController', 0),
(12, 'news', 'Haberler', 'news', 1464248818, 'list,insert,update,delete', 'public', NULL, 'a:5:{s:5:"title";s:5:"title";s:4:"hint";s:5:"title";s:4:"link";a:2:{i:0;s:4:"slug";i:1;s:2:"id";}s:10:"moduleLink";b:1;s:8:"language";b:1;}', 'NewsAdminController', 0),
(13, 'cv', 'İnsan Kaynakları', 'cvs', 1428906670, 'list,view,delete', 'public', NULL, 'a:1:{s:10:"moduleLink";b:1;}', 'CvAdminController', 0),
(14, 'productcategory', 'Ürün Kategorileri', 'product_categories', 1480327793, 'list,insert,update,delete', 'public', NULL, 'a:5:{s:5:"title";s:5:"title";s:4:"hint";s:5:"title";s:4:"link";a:2:{i:0;s:4:"slug";i:1;s:2:"id";}s:10:"moduleLink";b:1;s:8:"language";b:1;}', 'ProductcategoryAdminController', 0),
(15, 'product', 'Ürünler', 'products', 1480327793, 'list,insert,update,delete,image-list,image-insert,image-update,image-delete', 'public', NULL, 'a:5:{s:5:"title";s:5:"title";s:4:"hint";s:5:"title";s:4:"link";a:2:{i:0;s:4:"slug";i:1;s:2:"id";}s:10:"moduleLink";b:1;s:8:"language";b:1;}', 'ProductAdminController', 0),
(16, 'reference', 'Referanslar', 'references', 1458822416, 'list,insert,update,delete', 'public', NULL, 'a:1:{s:10:"moduleLink";b:1;}', 'ReferenceAdminController', 0),
(17, 'comment', 'Yorumlar', 'comments', 1458822416, 'list,view,delete', 'public', 'fa-comments', 'a:2:{s:10:"moduleLink";b:1;s:8:"language";b:1;}', 'CommentAdminController', 0),
(18, 'gallery', 'Galeri', 'galleries', 1458822416, 'list,insert,update,delete,image-list,image-insert,image-update,image-delete', 'public', NULL, 'a:5:{s:5:"title";s:5:"title";s:4:"hint";s:5:"title";s:4:"link";a:2:{i:0;s:4:"slug";i:1;s:2:"id";}s:10:"moduleLink";b:1;s:8:"language";b:1;}', 'GalleryAdminController', 0),
(19, 'reference', '', '', 0, '', NULL, NULL, NULL, '', 0),
(20, 'gallery', '', '', 0, '', NULL, NULL, NULL, '', 0),
(21, 'gallery', '', '', 0, '', NULL, NULL, NULL, '', 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `module_arguments`
--

CREATE TABLE IF NOT EXISTS `module_arguments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` longtext,
  `type` varchar(255) NOT NULL,
  `arguments` longtext NOT NULL,
  `language` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_module_arguments_module` (`module`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=74 ;

--
-- Tablo döküm verisi `module_arguments`
--

INSERT INTO `module_arguments` (`id`, `module`, `name`, `title`, `value`, `type`, `arguments`, `language`) VALUES
(1, 'home', 'file', 'E-Katalog', 'e3bf42048add1c3178e1c8d913cbed81.rar', 'file', '[]', 'tr'),
(3, 'home', 'aboutUs', 'Hakkında Yazısı', '<h2>Kuru Yemiş Sitesi</h2><br> Yıllarının getirdiği tecrübeye dayanarak İzmir''in üzerinde bir güneş gibi doğuyor. Yeni yaşam alanlarının mimarı <strong>Web Site Satışı</strong><br> bilgi, tecrübe ve sorumluluk bilinci ile  modern çizgileriyle faaliyetlerine devam ediyor.', 'textarea', '[]', 'tr'),
(6, 'home', 'phone', 'Telefon Numarası', '000000000', 'text', '[]', 'tr'),
(7, 'contact', 'title', 'Sayfa Başlığı', 'İletişim', 'text', '{"required":true}', 'tr'),
(8, 'contact', 'metaTitle', 'Meta Başlığı', 'İletişim', 'text', '[]', 'tr'),
(9, 'contact', 'metaDescription', 'Meta Tanımı', '', 'textarea', '[]', 'tr'),
(10, 'contact', 'metaKeywords', 'Meta Anahtar Kelimeleri', '', 'textarea', '[]', 'tr'),
(11, 'contact', 'notification', 'Bildirim Gönderimi', '0', 'dropdown', '{"required":true,"options":["Bildirim G\\u00f6nderme","Bilgirim G\\u00f6nder"]}', 'tr'),
(12, 'contact', 'notificationMail', 'Bildirim Maili', '', 'text', '[]', 'tr'),
(13, 'contact', 'googleMap', 'Google Map Kordinatları', '38.465166, 27.221342', 'text', '[]', 'tr'),
(14, 'contact', 'googleMapText', 'Google Map Yazısı', 'Konak 16', 'text', '[]', 'tr'),
(15, 'contact', 'detail', 'İletişim Bilgileri', '<p><b>Konak 16 CAFE</b></p>\r\n\r\n<p><span style="line-height: 1.42857;">Tel :&nbsp;</span>0533 162 35 34</p>\r\n\r\n<p>E-Posta : info@konak16.com</p>\r\n\r\n<p>Hocaalizade mah Beğendi sokak No:1/A&nbsp;&nbsp;OSMANGAZİ / BURSA</p>\r\n', 'editor', '{"required":true}', 'tr'),
(20, 'service', 'title', 'Sayfa Başlığı', 'Hizmetlerimiz', 'text', '{"required":true}', 'tr'),
(21, 'service', 'metaTitle', 'Meta Başlığı', 'Hizmetlerimiz', 'text', '[]', 'tr'),
(22, 'service', 'metaDescription', 'Meta Tanımı', '', 'textarea', '[]', 'tr'),
(23, 'service', 'metaKeywords', 'Meta Anahtar Kelimeleri', '', 'textarea', '[]', 'tr'),
(24, 'callyou', 'notification', 'Bildirim Gönderimi', '0', 'dropdown', '{"required":true,"options":["Bildirim G\\u00f6nderme","Bilgirim G\\u00f6nder"]}', 'tr'),
(25, 'callyou', 'notificationMail', 'Bildirim Maili', 'info@proteksaglik.com', 'text', '[]', 'tr'),
(26, 'contact', 'address', 'Adres', 'Konak 16 CAFE', 'text', '[]', 'tr'),
(27, 'contact', 'phone', 'Telefon Numarası', '0532 598 52 14', 'text', '[]', 'tr'),
(28, 'contact', 'mail', 'Email Adresi', 'info@konak16.com', 'text', '[]', 'tr'),
(29, 'news', 'title', 'Sayfa Başlığı', NULL, 'text', '{"required":true}', 'tr'),
(30, 'news', 'metaTitle', 'Meta Başlığı', NULL, 'text', '[]', 'tr'),
(31, 'news', 'metaDescription', 'Meta Tanımı', NULL, 'textarea', '[]', 'tr'),
(32, 'news', 'metaKeywords', 'Meta Anahtar Kelimeleri', NULL, 'textarea', '[]', 'tr'),
(33, 'cv', 'title', 'Sayfa Başlığı', 'İnsan Kaynakları', 'text', '{"required":true}', 'tr'),
(34, 'cv', 'metaTitle', 'Meta Başlığı', 'İnsan Kaynakları', 'text', '[]', 'tr'),
(35, 'cv', 'metaDescription', 'Meta Tanımı', 'İnsan Kaynakları', 'textarea', '[]', 'tr'),
(36, 'cv', 'metaKeywords', 'Meta Anahtar Kelimeleri', '', 'textarea', '[]', 'tr'),
(37, 'cv', 'notification', 'Bildirim Gönderimi', '0', 'dropdown', '{"required":true,"options":["Bildirim G\\u00f6nderme","Bilgirim G\\u00f6nder"]}', 'tr'),
(38, 'cv', 'notificationMail', 'Bildirim Maili', '', 'text', '[]', 'tr'),
(39, 'cv', 'detail', 'İnsan Kaynakları Yazısı', '<p><b>Konak16</b>, her t&uuml;rl&uuml; lezzeti&nbsp;ve damak tadına uygun kahveleriyle, lezzetin tadına varıcak m&uuml;şterilerimize, g&uuml;ler y&uuml;z&uuml; eksik olmayan deneyimli iş arkadaşlarımızı bekliyoruz&hellip;</p>\r\n', 'editor', '{"required":true}', 'tr'),
(40, 'productcategory', 'title', 'Sayfa Başlığı', NULL, 'text', '{"required":true}', 'tr'),
(41, 'productcategory', 'metaTitle', 'Meta Başlığı', NULL, 'text', '[]', 'tr'),
(42, 'productcategory', 'metaDescription', 'Meta Tanımı', NULL, 'textarea', '[]', 'tr'),
(43, 'productcategory', 'metaKeywords', 'Meta Anahtar Kelimeleri', NULL, 'textarea', '[]', 'tr'),
(44, 'product', 'title', 'Sayfa Başlığı', NULL, 'text', '{"required":true}', 'tr'),
(45, 'product', 'metaTitle', 'Meta Başlığı', NULL, 'text', '[]', 'tr'),
(46, 'product', 'metaDescription', 'Meta Tanımı', NULL, 'textarea', '[]', 'tr'),
(47, 'product', 'metaKeywords', 'Meta Anahtar Kelimeleri', NULL, 'textarea', '[]', 'tr'),
(48, 'reference', 'title', 'Sayfa Başlığı', NULL, 'text', '{"required":true}', 'tr'),
(49, 'reference', 'metaTitle', 'Meta Başlığı', NULL, 'text', '[]', 'tr'),
(50, 'reference', 'metaDescription', 'Meta Tanımı', NULL, 'textarea', '[]', 'tr'),
(51, 'reference', 'metaKeywords', 'Meta Anahtar Kelimeleri', NULL, 'textarea', '[]', 'tr'),
(52, 'comment', 'title', 'Sayfa Başlığı', 'Müşterilerimizin yorumları her zaman için değerlidir.', 'text', '{"required":true}', 'tr'),
(53, 'comment', 'metaTitle', 'Meta Başlığı', '', 'text', '[]', 'tr'),
(54, 'comment', 'metaDescription', 'Meta Tanımı', '', 'textarea', '[]', 'tr'),
(55, 'comment', 'metaKeywords', 'Meta Anahtar Kelimeleri', '', 'textarea', '[]', 'tr'),
(56, 'contact', 'notification', 'Bildirim Gönderimi', '0', 'dropdown', '{"required":true,"options":["Bildirim G\\u00f6nderme","Bilgirim G\\u00f6nder"]}', 'tr'),
(57, 'contact', 'notificationMail', 'Bildirim Maili', '', 'text', '[]', 'tr'),
(58, 'gallery', 'title', 'Sayfa Başlığı', NULL, 'text', '{"required":true}', 'tr'),
(59, 'gallery', 'metaTitle', 'Meta Başlığı', NULL, 'text', '[]', 'tr'),
(60, 'gallery', 'metaDescription', 'Meta Tanımı', NULL, 'textarea', '[]', 'tr'),
(61, 'gallery', 'metaKeywords', 'Meta Anahtar Kelimeleri', NULL, 'textarea', '[]', 'tr'),
(62, 'reference', 'title', 'Sayfa Başlığı', NULL, 'text', '{"required":true}', 'tr'),
(63, 'reference', 'metaTitle', 'Meta Başlığı', NULL, 'text', '[]', 'tr'),
(64, 'reference', 'metaDescription', 'Meta Tanımı', NULL, 'textarea', '[]', 'tr'),
(65, 'reference', 'metaKeywords', 'Meta Anahtar Kelimeleri', NULL, 'textarea', '[]', 'tr'),
(66, 'gallery', 'title', 'Sayfa Başlığı', NULL, 'text', '{"required":true}', 'tr'),
(67, 'gallery', 'metaTitle', 'Meta Başlığı', NULL, 'text', '[]', 'tr'),
(68, 'gallery', 'metaDescription', 'Meta Tanımı', NULL, 'textarea', '[]', 'tr'),
(69, 'gallery', 'metaKeywords', 'Meta Anahtar Kelimeleri', NULL, 'textarea', '[]', 'tr'),
(70, 'gallery', 'title', 'Sayfa Başlığı', NULL, 'text', '{"required":true}', 'tr'),
(71, 'gallery', 'metaTitle', 'Meta Başlığı', NULL, 'text', '[]', 'tr'),
(72, 'gallery', 'metaDescription', 'Meta Tanımı', NULL, 'textarea', '[]', 'tr'),
(73, 'gallery', 'metaKeywords', 'Meta Anahtar Kelimeleri', NULL, 'textarea', '[]', 'tr');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `summary` text NOT NULL,
  `detail` longtext NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `metaTitle` varchar(255) DEFAULT NULL,
  `metaDescription` text,
  `metaKeywords` text,
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  `language` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Tablo döküm verisi `news`
--

INSERT INTO `news` (`id`, `title`, `slug`, `summary`, `detail`, `image`, `date`, `metaTitle`, `metaDescription`, `metaKeywords`, `order`, `language`) VALUES
(2, 'Pes 2018 Turnuvasına Davetlisiniz.', 'pes-2018-turnuva', 'Değerli müşterilerimiz geleneksel bir şölen haline dönüşen Pes 2018 Turnumıza davetlisiniz.', '<p>Değerli m&uuml;şterilerimiz geleneksel bir ş&ouml;len haline d&ouml;n&uuml;şen Pes 2018 Turnumıza davetlisiniz.</p>\r\n', '053f38a75bc1dc64e552e1c69477139e.jpg', '2016-05-27', '', '', '', 5, 'tr'),
(3, 'Süperlig Maçları Yayını', 'superlig-mac-yayini', 'Sosyal Tesisimizde Tüm süperlig maçlarını izleme imkanınız bulunmaktadır.', '<p style="color: rgb(46, 58, 71); font-size: 14px; line-height: 20px;">Sosyal Tesisimizde T&uuml;m s&uuml;perlig ma&ccedil;larını izleme imkanınız bulunmaktadır.</p>\r\n', '78d7df402ebaae4cd659094a006a9ccc.jpg', '2016-05-27', '', '', '', 3, 'tr'),
(4, 'Bilardo Salonumuzla Hizmetinizdeyiz.', 'bilardo-salonumuz-hizmetinizde', 'Tesisimizde bursanın en büyük bilardo salonumuzla Hizmetinizdeyiz.', '<p>Tesisimizde bursanın en b&uuml;y&uuml;k bilardo salonumuzla Hizmetinizdeyiz.</p>\r\n', '713e52e05a278417946646881699b885.jpg', '2016-05-27', '', '', '', 4, 'tr');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `options`
--

CREATE TABLE IF NOT EXISTS `options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` longtext,
  `type` varchar(255) NOT NULL,
  `arguments` longtext NOT NULL,
  `language` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Tablo döküm verisi `options`
--

INSERT INTO `options` (`id`, `name`, `title`, `value`, `type`, `arguments`, `language`) VALUES
(1, 'metaTitle', 'Site Başlığı', 'Konak 16 Cafe Bursalıların Eğlence Merkezi', 'text', '{"required":true}', 'tr'),
(2, 'metaDescription', 'Site Tanımı', 'Konak 16 Cafe Bursalıların Eğlence Merkezi', 'textarea', '{"required":true}', 'tr'),
(3, 'metaKeywords', 'Site Anahtar Kelimeleri', 'Konak 16 Cafe Bursalıların Eğlence Merkezi', 'textarea', '{"required":true}', 'tr'),
(4, 'customMeta', 'Özel Metalar', '', 'textarea', '[]', 'tr'),
(5, 'smtpHost', 'Smtp Sunucusu', '', 'text', '[]', 'tr'),
(6, 'smtpPort', 'Smtp Port', '587', 'text', '[]', 'tr'),
(7, 'smtpUser', 'Smtp Kullanıcı Adı', '', 'text', '[]', 'tr'),
(8, 'smtpPass', 'Smtp Parola', '', 'text', '[]', 'tr'),
(9, 'footerText', 'Footer Kısa Yazı', '<h2>Konak 16 Cafe</h2><br>  Bursalıların Eğlence Merkezi', 'textarea', '[]', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `categoryId` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `summary` varchar(255) NOT NULL,
  `detail` text NOT NULL,
  `metaTitle` varchar(255) DEFAULT NULL,
  `metaDescription` text,
  `metaKeywords` text,
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  `language` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_categories`
--

CREATE TABLE IF NOT EXISTS `product_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `summary` text NOT NULL,
  `detail` longtext,
  `image` varchar(255) NOT NULL,
  `metaTitle` varchar(255) DEFAULT NULL,
  `metaDescription` text,
  `metaKeywords` text,
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  `language` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_images`
--

CREATE TABLE IF NOT EXISTS `product_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productId` int(10) unsigned NOT NULL,
  `image` varchar(255) NOT NULL,
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  `language` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Tablo döküm verisi `product_images`
--

INSERT INTO `product_images` (`id`, `productId`, `image`, `order`, `language`) VALUES
(1, 1, '63551be967c7a821695c5aca3c96e103.jpg', 1, 'tr'),
(2, 2, '9153296d28f5d15a724ca8b25e1f7712.jpg', 1, 'tr');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `projects`
--

CREATE TABLE IF NOT EXISTS `projects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL,
  `room` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `summary` text NOT NULL,
  `map` varchar(255) DEFAULT NULL,
  `detail` longtext,
  `projectDetail` longtext,
  `metaTitle` varchar(255) DEFAULT NULL,
  `metaDescription` text,
  `metaKeywords` text,
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  `language` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `project_images`
--

CREATE TABLE IF NOT EXISTS `project_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `galleryId` int(10) unsigned NOT NULL,
  `image` varchar(255) NOT NULL,
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  `language` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=169 ;

--
-- Tablo döküm verisi `project_images`
--

INSERT INTO `project_images` (`id`, `galleryId`, `image`, `order`, `language`) VALUES
(17, 6, '4a8453f63cce37e66f7589169cae0bb5.png', 1, 'tr'),
(18, 6, '37b83ddee5f51480e5814a6ecff4a132.png', 2, 'tr'),
(19, 6, 'eb03aad921578c4a8743c332253ab3c0.png', 3, 'tr'),
(20, 6, 'bad47ccd8804410cf9803eb528a76b2e.png', 4, 'tr'),
(21, 6, 'b55a0e5970a8c4e32eb641b1462e82d7.png', 5, 'tr'),
(22, 6, 'a64374fd9a3fe26e0fdacbef02f717c6.png', 6, 'tr'),
(23, 6, '6e0aebf03a87f7ba412a15b607631f0f.png', 7, 'tr'),
(24, 6, 'fc1130a300613f40b206c1691c3fbe55.png', 8, 'tr'),
(25, 6, 'a4e2445738680235ec00b5d4e9c24bcb.png', 9, 'tr'),
(26, 6, 'e8c40d0467b07ee0f23d3fd32759d8ce.png', 10, 'tr'),
(27, 5, '49f5c4e3be019dd40ec581e8aaa8217a.png', 1, 'tr'),
(28, 5, '30678a3959f6cc936f662143eed00890.png', 2, 'tr'),
(29, 5, '2e8dd713cb3ff1b6429f945d592a0beb.png', 3, 'tr'),
(30, 5, 'acb51a9082d43e672048f0da5d487434.png', 4, 'tr'),
(31, 5, '73af26673932b313f67ec57b48b733a0.png', 5, 'tr'),
(32, 5, 'a81e7475045958ec8e02c4a543545fc0.png', 6, 'tr'),
(33, 4, '2eb342253e815628253a4085496fd46b.png', 1, 'tr'),
(34, 4, '3aa83b5edc797c4a7e0f76adbf9b52cd.png', 2, 'tr'),
(35, 4, '38f7f22084184993d00a2981c5b164d5.png', 3, 'tr'),
(36, 4, '639cb681e9a4e5fbfdcd74076aa20437.png', 4, 'tr'),
(37, 4, 'eec13f35517f022848bd55fc7f9fa507.png', 5, 'tr'),
(38, 4, '237d200d05d8463de5fa1d826d5c63fb.png', 6, 'tr'),
(39, 4, 'fa8e8b5076ca98ed35a465bfeae3fa54.png', 7, 'tr'),
(40, 4, '14f94307b1dc9fce2c70b22ad0dcbecb.png', 8, 'tr'),
(41, 1, '94b8f6fc98f0bf698a98202e8a3a0a71.JPG', 1, 'tr'),
(42, 1, '05dc63b51b898b70289ea7aa8859d321.JPG', 2, 'tr'),
(44, 1, '8a3c980e2fe834c991ef5f6f6c691ed5.JPG', 4, 'tr'),
(45, 1, '217a2c5e17fed4b20ae492a39015160c.JPG', 5, 'tr'),
(46, 1, '13f372ea3030124af8540da1a73df82f.JPG', 6, 'tr'),
(47, 1, 'd8921e995117c12b9837ef494600ecba.JPG', 7, 'tr'),
(48, 1, '642dc98ae4fa21bb9ca52d6d98a5f247.JPG', 8, 'tr'),
(49, 1, 'caa449314debc76f9260507a361a49f9.JPG', 9, 'tr'),
(51, 1, 'c691e193a0ace0d6999319ec781db25d.JPG', 11, 'tr'),
(53, 1, '8cc9129d9b89a903f639a1d41043bd19.JPG', 13, 'tr'),
(54, 1, '6b5120724cd7e1956c0f676ee7e85169.JPG', 14, 'tr'),
(55, 1, 'b2be8e5dcde36f06e21839bb6f149706.JPG', 15, 'tr'),
(56, 1, '06748c496088b0bb4a7a4452c7593236.JPG', 16, 'tr'),
(57, 1, 'e97bf43a28383ae9c6bba5915329b804.JPG', 17, 'tr'),
(58, 1, '89fb526fdf8c6afa3ab38dd07196327e.JPG', 18, 'tr'),
(59, 1, '23d22fa00279db21de0f22d541800254.JPG', 19, 'tr'),
(61, 1, 'b149323c6a169fee895a9d4e0d9e5699.JPG', 21, 'tr'),
(62, 1, '2f64751901f5160c9612508984f2c0a1.JPG', 22, 'tr'),
(63, 1, 'a9db85fbe6fb59474ae04ddb71415746.JPG', 23, 'tr'),
(64, 1, 'a46b6c812e4b5da3b8e426ce94614823.JPG', 24, 'tr'),
(65, 1, 'b5b7dc7b7b3538561ba47afa2978b35c.JPG', 25, 'tr'),
(67, 1, '4fed9cd082569fd86d128b57ae25405f.JPG', 27, 'tr'),
(69, 1, '5118242a2c1bd03dd2c5c3c77d161456.JPG', 29, 'tr'),
(70, 1, 'f00758a03be3c8a1c4f1f0c00f797856.JPG', 30, 'tr'),
(71, 1, '3967bebd7fdb14c14abcfbe2746b6379.JPG', 31, 'tr'),
(72, 1, '81977f73410901fcd1764b5ed1e286f1.JPG', 32, 'tr'),
(73, 1, '543e60fa794ca508326073a18da78b6b.JPG', 33, 'tr'),
(74, 1, '0440f7e91c82ffd446432114e9096a4f.JPG', 34, 'tr'),
(76, 1, 'e06431480c651677cd468aac6231197b.JPG', 36, 'tr'),
(77, 1, '66edbace89a29eb54b2250b3f609f8e3.JPG', 37, 'tr'),
(78, 1, '23f0539c7f3beb924152aeb5627653f1.JPG', 38, 'tr'),
(80, 1, '52768d6577a563370231fa2c95cb7d5d.JPG', 40, 'tr'),
(81, 1, '4f81c4be871963a610a70662c0d5a668.JPG', 41, 'tr'),
(85, 1, '6a89e5767ae41c18f8532d93725d05d0.JPG', 45, 'tr'),
(87, 1, 'dbe18923766692f71a58680eeebd3af6.JPG', 47, 'tr'),
(88, 1, 'c5a6931c404894f921929a88e1bae0e7.JPG', 48, 'tr'),
(89, 1, '966695839e99b31a43932b4a7e77ef69.JPG', 49, 'tr'),
(90, 1, '0f047e981049376af86354da63b817cb.JPG', 50, 'tr'),
(91, 1, 'c035329c149a90757fb8b7cce904f7d4.JPG', 51, 'tr'),
(93, 1, 'cb70bca1a484fba64aa1e02c4f543564.JPG', 53, 'tr'),
(94, 1, '346416fd99d0848b245e3d4e9c587a81.JPG', 54, 'tr'),
(98, 1, '5f51bac20ae33fcb4b062a57f0925feb.JPG', 58, 'tr'),
(99, 1, '8972abcf8de6e3a953396c64507c9f5b.JPG', 59, 'tr'),
(100, 1, '53c493c9e4d7680a66abe06224720080.JPG', 60, 'tr'),
(101, 1, '249d5e5e04885d55fad5362a2fe2b42d.JPG', 61, 'tr'),
(102, 1, '20fbd8797c648f5828b838504b1c66eb.JPG', 62, 'tr'),
(103, 1, '1f03518b34f588416d41c4a17759200e.JPG', 63, 'tr'),
(104, 1, '4c964e10333a30e90eb6c23b0ef4ca8a.JPG', 64, 'tr'),
(105, 1, '36394ee7da25103e89101f472888cdb4.JPG', 65, 'tr'),
(106, 1, '04b4a138d9b4b298349c3e0629c3ec93.JPG', 66, 'tr'),
(107, 1, '0218bf607be1b222ff5ac88abf44b021.JPG', 67, 'tr'),
(108, 1, '94d2e8fb535b7a8d97d84d9167769b72.JPG', 68, 'tr'),
(109, 1, '2611c68f4a7ba5491ec0e1244321bbb4.JPG', 69, 'tr'),
(110, 1, 'b4badd2f9ad9d01c26d0db431f33bfb7.JPG', 70, 'tr'),
(111, 1, '093cac2dca4f0496ff2ad865128a0ce7.JPG', 71, 'tr'),
(115, 1, '89ea9b02dbd58cc1137436304ca5d0eb.JPG', 75, 'tr'),
(116, 1, 'bcd083d3f271a74606b3e4cbe862aaef.JPG', 76, 'tr'),
(117, 1, '2803fca148abf8692aa34960cff66a32.JPG', 77, 'tr'),
(118, 1, '3c43422fd0380db3d784e890cb04af03.JPG', 78, 'tr'),
(120, 1, 'becab6340b599ae0c3bafef343cc8903.JPG', 80, 'tr'),
(122, 1, 'ecf99e29db4140ee337ab779910e8477.JPG', 82, 'tr'),
(123, 1, 'b3188edc908628c6005604497d3043b2.JPG', 83, 'tr'),
(124, 1, '84dcc9448acc690e00f1a3fa08a90d5a.JPG', 84, 'tr'),
(126, 1, 'b097a8b98bd4ec1d309e51d554240145.JPG', 86, 'tr'),
(127, 1, '3b590db271efc764563a08e1af0bd9d4.JPG', 87, 'tr'),
(128, 1, '0439026a8940eecc15778cf6656a874a.JPG', 88, 'tr'),
(129, 1, 'd5fbb76bf916f6524a33217044b9d14f.JPG', 89, 'tr'),
(131, 1, '302bab00b2ad9125c611b87dde0ba7f7.JPG', 91, 'tr'),
(132, 1, '2fd7f8252f59b6b1a365cf3e3a611641.JPG', 92, 'tr'),
(133, 1, '3db4a51425aa07eaff98a3b621dd8da7.JPG', 93, 'tr'),
(134, 1, '6be934c2009221e5ef093668e2b3ecc2.JPG', 94, 'tr'),
(135, 1, 'ff930356c0bc6af7738519050eda573c.JPG', 95, 'tr'),
(136, 1, '796189a8287c238943a2681e8ecd8ea3.JPG', 96, 'tr'),
(138, 1, 'b740aa5d9ad3ffcb69762c6cd93081be.JPG', 98, 'tr'),
(139, 1, '94fab0bdb5a93165aa4ad0d410b883d5.JPG', 99, 'tr'),
(142, 7, '1e46cc94984b9a6e330926fa47476fa3.jpg', 1, 'tr'),
(143, 7, '2861766c7725a667cc99f407efa51208.jpg', 2, 'tr'),
(144, 7, '87cc3d1167e45ace5fcd6dc0924ef5bf.jpg', 3, 'tr'),
(145, 7, '68d6cbe6a69edbb18289b23100849141.jpg', 4, 'tr'),
(146, 7, '5e1c63a6ff7d52136631ec8c64f373b6.png', 5, 'tr'),
(147, 7, 'fab906053b3e843e66d713295c9bd4d4.png', 6, 'tr'),
(148, 7, 'd216690ec528dc5e390c325d1b9055dd.png', 7, 'tr'),
(149, 7, 'd4a9cc63e0d9320cd898bddf0ded293f.png', 8, 'tr'),
(150, 7, 'b9ae4302d2b23b874fc6035ad425812b.png', 9, 'tr'),
(151, 7, 'd142854069def389d1003aba81b91676.png', 10, 'tr'),
(152, 7, '08a478c555a6e32ffeae5d8b1b35fc24.jpg', 11, 'tr'),
(153, 2, '9669ed99ca2e1564763aeb026d17b0c8.jpg', 1, 'tr'),
(155, 2, '9d79c3263bc9c99b235f94e30dfa82c9.jpg', 3, 'tr'),
(157, 2, 'bd6f914e6c9d1ffd11eab0636263410d.jpg', 5, 'tr'),
(159, 2, 'f23e9d40ed38f51fb5ce408c2e4498af.jpg', 7, 'tr'),
(160, 2, '9e5280b44c88cd61b4c4105de72f7414.jpg', 8, 'tr'),
(161, 2, '6a507cdab7e96ac8d9596f15d5d074b9.jpg', 9, 'tr'),
(162, 2, 'ff943ac508e0e6b3a617c5720ee4be89.jpg', 10, 'tr'),
(163, 3, 'b6ee827bc60676af6e0f0ce9736b53f5.png', 1, 'tr'),
(164, 3, 'e15f06631cf5280587d86a16e19b1ff9.png', 2, 'tr'),
(165, 3, '1f63f3eae19796848e473ed0394ab074.png', 3, 'tr'),
(166, 2, '208abd2666fd87399c5e74ddf987b871.jpg', 11, 'tr'),
(167, 2, '2c5481b6bc9f946f83ef519f3eca796e.jpg', 12, 'tr'),
(168, 2, '828846d17a4d78bff10c759d028673d0.jpg', 13, 'tr');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `references`
--

CREATE TABLE IF NOT EXISTS `references` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  `language` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Tablo döküm verisi `references`
--

INSERT INTO `references` (`id`, `title`, `image`, `order`, `language`) VALUES
(1, 'TESt', '2d7d5f869f256657d162fed18836712a.jpg', 1, 'tr');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `services`
--

CREATE TABLE IF NOT EXISTS `services` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `summary` text NOT NULL,
  `detail` longtext NOT NULL,
  `image` varchar(255) NOT NULL,
  `metaTitle` varchar(255) DEFAULT NULL,
  `metaDescription` text,
  `metaKeywords` text,
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  `language` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `socials`
--

CREATE TABLE IF NOT EXISTS `socials` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Tablo döküm verisi `socials`
--

INSERT INTO `socials` (`id`, `title`, `link`, `image`, `icon`, `order`) VALUES
(1, 'Facebook', 'https://www.facebook.com/konak16', NULL, 'fa fa-facebook', 1),
(2, 'Twitter', '#', NULL, 'fa fa-twitter', 3),
(3, 'Instagram', '#', 'b346e243a2a725df832e932a6d958670.jpg', 'fa fa-instagram', 2);

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `admin_perms`
--
ALTER TABLE `admin_perms`
  ADD CONSTRAINT `admin_perms_ibfk_1` FOREIGN KEY (`groupId`) REFERENCES `admin_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `admin_users`
--
ALTER TABLE `admin_users`
  ADD CONSTRAINT `admin_users_ibfk_1` FOREIGN KEY (`groupId`) REFERENCES `admin_groups` (`id`) ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `contents`
--
ALTER TABLE `contents`
  ADD CONSTRAINT `contents_ibfk_1` FOREIGN KEY (`parentId`) REFERENCES `contents` (`id`) ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_ibfk_1` FOREIGN KEY (`parentId`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `module_arguments`
--
ALTER TABLE `module_arguments`
  ADD CONSTRAINT `module_arguments_ibfk_1` FOREIGN KEY (`module`) REFERENCES `modules` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
