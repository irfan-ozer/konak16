-- phpMyAdmin SQL Dump
-- version 4.4.15.8
-- https://www.phpmyadmin.net
--
-- Anamakine: localhost
-- Üretim Zamanı: 29 Mar 2017, 18:17:00
-- Sunucu sürümü: 5.6.31
-- PHP Sürümü: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `kuruyemis`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `admin_groups`
--

CREATE TABLE IF NOT EXISTS `admin_groups` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

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
  `perm` varchar(255) NOT NULL
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
  `id` int(10) unsigned NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `groupId` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `groupId`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `banners`
--

CREATE TABLE IF NOT EXISTS `banners` (
  `id` int(10) unsigned NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `text` text NOT NULL,
  `transition` varchar(255) NOT NULL,
  `delay` int(10) unsigned NOT NULL,
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  `language` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `banners`
--

INSERT INTO `banners` (`id`, `title`, `image`, `link`, `text`, `transition`, `delay`, `order`, `language`) VALUES
(22, '', '01f8003ef6e72f1f9f4402ee941abb87.png', '', '', 'transition2d: 1', 4000, 1, 'tr'),
(23, '', '7860cb413d639c677574924e7834504b.png', '', '', 'transition2d: 1', 4000, 2, 'tr'),
(24, '', 'bac414638381c60d4d0496539c3fa87e.png', '', '', 'transition2d: 1', 4000, 3, 'tr');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `callyou`
--

CREATE TABLE IF NOT EXISTS `callyou` (
  `id` int(10) unsigned NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `ip` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(10) unsigned NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `date` datetime NOT NULL,
  `ip` varchar(255) NOT NULL,
  `viewed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `approved` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `comments`
--

INSERT INTO `comments` (`id`, `fullname`, `email`, `comment`, `date`, `ip`, `viewed`, `approved`) VALUES
(3, 'İbrahim Kılıç', 'ibrahim@gmail.com', 'Gerçekten bütün ürünler çok tazeydi bütün personel güler yüzlü artık hep uğrayacağım hepinize teşekkürler.', '2016-08-15 13:45:17', '78.189.166.57', 0, 1),
(4, 'Hasan Taşkıran', 'Taskiran@gmail.com', 'Çikolata çeşitleri müşthiş bir de kumda pişirilmiş türk kahvesinin yanında olunca tadına doyum olmuyor.', '2016-08-15 13:50:07', '78.189.166.57', 0, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `contacts`
--

CREATE TABLE IF NOT EXISTS `contacts` (
  `id` int(10) unsigned NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `date` datetime NOT NULL,
  `ip` varchar(255) NOT NULL,
  `viewed` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `contents`
--

CREATE TABLE IF NOT EXISTS `contents` (
  `id` int(10) unsigned NOT NULL,
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
  `language` varchar(5) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `contents`
--

INSERT INTO `contents` (`id`, `parentId`, `title`, `slug`, `summary`, `detail`, `image`, `reserved`, `metaTitle`, `metaDescription`, `metaKeywords`, `order`, `language`) VALUES
(1, NULL, 'TÜM ÜRÜNLERİMİZ BAKIRDIR', 'tum-urunlerimiz-bakirdir', '<center style="    padding: 10px;\n">Mağazalarımızda kuruyemişlerin en tazesini, en sıcağını bulabilir veya cafemizde oturup sıcak  bakır cezvelerde kahvenin en derin tadıyla deneyim kazanın...</center>', '<p style="text-align: center;"><strong style="color: rgb(34, 34, 34); font-family: tahoma; font-size: 12px; line-height: 14.772px; text-align: center;">Bakır iletkenlik &ouml;zelliği g&uuml;&ccedil;l&uuml; olan bir maddedir.Bu y&uuml;zden yalıtım s&ouml;z konusudur ve ısıyı &ccedil;abuk dağıtmaz.İ&ccedil;ine bırakılan soğuk suyu soğuk,sıcak suyu sıcak muhafaza eder.<br />\nBakırin iletken olma &ouml;zelliğinden dolayı y&uuml;ksek ısıda ateşe maruz bırakmamamız gerekir.Kısık ateşte kullanmak kalay &ouml;mr&uuml;n&uuml;n uzunluğu a&ccedil;ısından &ouml;nemlidir.<br />\nAyrıca kalay &ouml;mr&uuml;n&uuml;n uzun olması i&ccedil;in bakır kaplarda ahşap kaşık ya da yanmayan sağlıklı slikon kaşıklar kullanmakta fayda vardır.<br />\nYemeği pişirdikten sonra artan yemeği bakır kaplarda bekletmemek gerekiyor.Bu durum ssağlıklı ya da sağlıksız olma durumundan ziyade bakır kaplarda beklettiğimiz yemekler kalayın rengini bozabiliyorlar.</strong><br />\n&nbsp;</p>\n', 'e50158686133ffb1356618d07c26ea3c.jpg', 'home', '', '', '', 1, 'tr'),
(5, NULL, 'İnsan Kaynakları', 'insan-kaynaklari', '', '<p><strong style="margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-size: 14px; text-align: justify;">Lorem Ipsum</strong><span style="color: rgb(0, 0, 0); font-size: 14px; text-align: justify;">, dizgi ve baskı end&uuml;strisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak &uuml;zere bir yazı galerisini alarak karıştırdığı 1500&#39;lerden beri end&uuml;stri standardı sahte metinler olarak kullanılmıştır. Beşy&uuml;z yıl boyunca varlığını s&uuml;rd&uuml;rmekle kalmamış, aynı zamanda pek değişmeden elektronik dizgiye de sı&ccedil;ramıştır. 1960&#39;larda Lorem Ipsum pasajları da i&ccedil;eren Letraset yapraklarının yayınlanması ile ve yakın zamanda Aldus PageMaker gibi Lorem Ipsum s&uuml;r&uuml;mleri i&ccedil;eren masa&uuml;st&uuml; yayıncılık yazılımları ile pop&uuml;ler olmuştur.</span></p>\r\n', NULL, NULL, '', '', '', 3, 'tr'),
(16, NULL, 'Hakkımızda', 'hakkimizda', '<b>KURUYEMİŞ CAFE</b><br>; Sağlıklı ve hijyenik ortamlarda üretimini gerçekleştirdiği taze kahve ve özenle seçilip kaliteli tohumlardan üretilmiş kuruyemişlerle sizlere hizmet veriyoruz.', '<p><strong style="margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-size: 14px; text-align: justify;">Lorem Ipsum</strong><span style="color: rgb(0, 0, 0); font-size: 14px; text-align: justify;">, dizgi ve baskı end&uuml;strisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak &uuml;zere bir yazı galerisini alarak karıştırdığı 1500&#39;lerden beri end&uuml;stri standardı sahte metinler olarak kullanılmıştır. Beşy&uuml;z yıl boyunca varlığını s&uuml;rd&uuml;rmekle kalmamış, aynı zamanda pek değişmeden elektronik dizgiye de sı&ccedil;ramıştır. 1960&#39;larda Lorem Ipsum pasajları da i&ccedil;eren Letraset yapraklarının yayınlanması ile ve yakın zamanda Aldus PageMaker gibi Lorem Ipsum s&uuml;r&uuml;mleri i&ccedil;eren masa&uuml;st&uuml; yayıncılık yazılımları ile pop&uuml;ler olmuştur.</span></p>\r\n', '3e40bf0a6b3d48600b51d2ab8fd03f96.png', NULL, '', '', '', 13, 'tr');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cvs`
--

CREATE TABLE IF NOT EXISTS `cvs` (
  `id` int(10) unsigned NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `comment` text,
  `cv` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `ip` varchar(255) NOT NULL,
  `viewed` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `galleries`
--

CREATE TABLE IF NOT EXISTS `galleries` (
  `id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  `language` varchar(5) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `galleries`
--

INSERT INTO `galleries` (`id`, `title`, `slug`, `image`, `order`, `language`) VALUES
(1, 'Kuruyemiş', 'kuruyemis', '39aa49a564117a8681d5ff736dcc9554.png', 0, 'tr'),
(2, 'Kuruyemiş', 'kuruyemis', 'b5815b5a124c6c3ad8475e0c4a6477c1.png', 1, 'tr');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `gallery_images`
--

CREATE TABLE IF NOT EXISTS `gallery_images` (
  `id` int(10) unsigned NOT NULL,
  `galleryId` int(10) unsigned NOT NULL,
  `image` varchar(255) NOT NULL,
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  `language` varchar(5) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `gallery_images`
--

INSERT INTO `gallery_images` (`id`, `galleryId`, `image`, `order`, `language`) VALUES
(1, 1, 'd19ac06c93759da1bc830c3d9fcc10b3.png', 1, 'tr'),
(2, 2, 'e3ffad624aaa4f0ffe4f54c8e97e5599.png', 5, 'tr'),
(3, 2, '183bfa6e828edd1143503fd57b329a15.png', 6, 'tr'),
(4, 2, 'a0d230ab3ea60abf61f8521e4c4107ec.png', 7, 'tr'),
(5, 2, 'c5b1ab3a3e8ed69ba7ecbd8f67d93f65.jpg', 8, 'tr'),
(6, 2, 'e67dbd3a7cc651dbe41f7c1d11f09f61.png', 9, 'tr'),
(7, 2, '7e92ce729377ad33af89376e00f2f7a4.png', 10, 'tr'),
(8, 2, 'a4f68c261dfba6f7a4767e5f69b0b513.png', 11, 'tr'),
(9, 2, '1ab1c492a760f88174f6200f93f579bc.png', 12, 'tr'),
(10, 2, 'ad58cff64367955462437bfc43b9c037.png', 13, 'tr'),
(11, 2, '636af4ec8be9ab5d3032779557d668b5.png', 14, 'tr'),
(12, 2, '9aa245b200e7d43b879103f993bc55ac.png', 15, 'tr'),
(13, 2, 'e5b91ae02ae48679e66344484a6afc17.png', 16, 'tr');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `maillist`
--

CREATE TABLE IF NOT EXISTS `maillist` (
  `id` int(10) unsigned NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `ip` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `menus`
--

CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) unsigned NOT NULL,
  `parentId` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `hint` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `htmlID` varchar(255) DEFAULT NULL,
  `htmlClass` varchar(255) DEFAULT NULL,
  `target` varchar(20) DEFAULT NULL,
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  `language` varchar(5) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `menus`
--

INSERT INTO `menus` (`id`, `parentId`, `name`, `title`, `hint`, `link`, `htmlID`, `htmlClass`, `target`, `order`, `language`) VALUES
(1, NULL, 'main', 'Ana Menü', NULL, NULL, NULL, NULL, NULL, 0, 'tr'),
(2, NULL, 'footer', 'Footer Menü', NULL, NULL, NULL, NULL, NULL, 0, 'tr'),
(4, 1, NULL, 'İLETİŞİM', 'İLETİŞİM', '@contact', '', '', '_self', 9, 'tr'),
(6, 1, NULL, 'HİZMETLERİMİZ', 'HİZMETLERİMİZ', '@service', '', '', '_self', 3, 'tr'),
(7, 1, NULL, 'KURUMSAL', 'KURUMSAL', '@content/kurumsal/16', '', '', '_self', 2, 'tr'),
(8, 2, NULL, 'ANA SAYFA', 'Anasayfa', '@home', '', '', '_self', 1, 'tr'),
(9, 2, NULL, 'KURUMSAL', 'KURUMSAL', '@content/kurumsal/16', '', '', '_self', 2, 'tr'),
(11, 2, NULL, 'HİZMETLERİMİZ', 'Hizmetler', '@service', '', '', '_self', 4, 'tr'),
(12, 2, NULL, 'İLETİŞİM', 'İletişim', '@contact', '', '', '_self', 6, 'tr'),
(15, 6, NULL, 'Kuruyemiş Çeşitleri', 'Kuruyemiş Çeşitleri', '@service/kuruyemis-cesitleri/1', '', '', '_self', 1, 'tr'),
(16, 6, NULL, 'Kumda Kahve', 'Kumda Kahve', '@service/kumda-kahve/2', '', '', '_self', 2, 'tr'),
(17, 6, NULL, 'Çikolata Çeşitlerimiz', 'Çikolata Çeşitlerimiz', '@service/cikolata-cesitleri/3', '', '', '_self', 3, 'tr'),
(18, 1, NULL, 'İK', 'İnsan Kaynakları', '@cv', '', '', '_self', 8, 'tr'),
(22, 2, NULL, 'İNSAN KAYNAKLARI', 'İnsan Kaynakları', '@cv', '', '', '_self', 7, 'tr'),
(34, 1, NULL, 'YORUMLAR', 'Yorumlar', '@comment', '', '', '_self', 5, 'tr'),
(36, 1, NULL, 'GALERİ', 'GALERİ', '@gallery/kuruyemis/2', '', '', '_self', 6, 'tr'),
(37, 1, NULL, 'HABERLER', 'HABERLER', '@news', '', '', '_self', 7, 'tr'),
(38, 6, NULL, 'Kurumsal Hediyelikler', 'Kurumsal Hediyelikler', '@service/kurumsal-hediyelikler/4', NULL, NULL, NULL, 4, 'tr'),
(41, 1, NULL, 'Hediyelik Eşya', 'Hediyelik Eşya', '@productcategory/hediyelik-esya/12', NULL, NULL, NULL, 4, 'tr');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `modules`
--

CREATE TABLE IF NOT EXISTS `modules` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `table` varchar(255) NOT NULL,
  `modified` int(10) unsigned NOT NULL,
  `permissions` text NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `menuPattern` text,
  `controller` varchar(255) NOT NULL,
  `order` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

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
  `id` int(10) unsigned NOT NULL,
  `module` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` longtext,
  `type` varchar(255) NOT NULL,
  `arguments` longtext NOT NULL,
  `language` varchar(5) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `module_arguments`
--

INSERT INTO `module_arguments` (`id`, `module`, `name`, `title`, `value`, `type`, `arguments`, `language`) VALUES
(1, 'home', 'file', 'E-Katalog', 'e3bf42048add1c3178e1c8d913cbed81.rar', 'file', '[]', 'tr'),
(3, 'home', 'aboutUs', 'Hakkında Yazısı', '<h2>Kuru Yemiş Sitesi</h2><br> Yıllarının getirdiği tecrübeye dayanarak İzmir''in üzerinde bir güneş gibi doğuyor. Yeni yaşam alanlarının mimarı <strong>Web Site Satışı</strong><br> bilgi, tecrübe ve sorumluluk bilinci ile  modern çizgileriyle faaliyetlerine devam ediyor.', 'textarea', '[]', 'tr'),
(6, 'home', 'phone', 'Telefon Numarası', '0(530) 321 41 99', 'text', '[]', 'tr'),
(7, 'contact', 'title', 'Sayfa Başlığı', 'İletişim', 'text', '{"required":true}', 'tr'),
(8, 'contact', 'metaTitle', 'Meta Başlığı', 'İletişim', 'text', '[]', 'tr'),
(9, 'contact', 'metaDescription', 'Meta Tanımı', '', 'textarea', '[]', 'tr'),
(10, 'contact', 'metaKeywords', 'Meta Anahtar Kelimeleri', '', 'textarea', '[]', 'tr'),
(11, 'contact', 'notification', 'Bildirim Gönderimi', '0', 'dropdown', '{"required":true,"options":["Bildirim G\\u00f6nderme","Bilgirim G\\u00f6nder"]}', 'tr'),
(12, 'contact', 'notificationMail', 'Bildirim Maili', '', 'text', '[]', 'tr'),
(13, 'contact', 'googleMap', 'Google Map Kordinatları', '38.465166, 27.221342', 'text', '[]', 'tr'),
(14, 'contact', 'googleMapText', 'Google Map Yazısı', 'Kuruyemiş Cafe', 'text', '[]', 'tr'),
(15, 'contact', 'detail', 'İletişim Bilgileri', '<p><b>BURCUM KURUYEMİŞ CAFE</b></p>\r\n\r\n<p><span style="color: rgb(106, 107, 108); font-family: &quot;Titillium Web&quot;, sans-serif; font-size: 14px; background-color: rgb(248, 248, 248);">Web Site Satışı İnternet Hizmetleri Home Ofis &Ccedil;alışma Sistemi</span></p>\r\n\r\n<p><span style="line-height: 1.42857;">Tel :&nbsp;0 530 321 41 99</span></p>\r\n\r\n<p><span style="line-height: 1.42857;">Fax :&nbsp;</span>0 530 321 41 99</p>\r\n\r\n<p>E-Posta : websitesatisi@gmail.com</p>\r\n\r\n<p>&nbsp;</p>\r\n', 'editor', '{"required":true}', 'tr'),
(20, 'service', 'title', 'Sayfa Başlığı', 'Hizmetlerimiz', 'text', '{"required":true}', 'tr'),
(21, 'service', 'metaTitle', 'Meta Başlığı', 'Hizmetlerimiz', 'text', '[]', 'tr'),
(22, 'service', 'metaDescription', 'Meta Tanımı', '', 'textarea', '[]', 'tr'),
(23, 'service', 'metaKeywords', 'Meta Anahtar Kelimeleri', '', 'textarea', '[]', 'tr'),
(24, 'callyou', 'notification', 'Bildirim Gönderimi', '0', 'dropdown', '{"required":true,"options":["Bildirim G\\u00f6nderme","Bilgirim G\\u00f6nder"]}', 'tr'),
(25, 'callyou', 'notificationMail', 'Bildirim Maili', NULL, 'text', '[]', 'tr'),
(26, 'contact', 'address', 'Adres', 'Web Site Satışı İnternet Hizmetleri Home Ofis Çalışma Sistemi', 'text', '[]', 'tr'),
(27, 'contact', 'phone', 'Telefon Numarası', '0530 321 41 99', 'text', '[]', 'tr'),
(28, 'contact', 'mail', 'Email Adresi', 'websitesatisi@gmail.com', 'text', '[]', 'tr'),
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
(39, 'cv', 'detail', 'İnsan Kaynakları Yazısı', '<p><strong>KURUYEMİŞ CAFE</strong>, her t&uuml;rl&uuml; kuruyemiş, lezzetli &ccedil;ikolatalar ve damak tadına uygun kahvelerle, lezzetin tadına varıcak m&uuml;şterilerimize, g&uuml;ler y&uuml;z&uuml; eksik olmayan deneyimli iş arkadaşlarımızı bekliyoruz&hellip;</p>\r\n', 'editor', '{"required":true}', 'tr'),
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
  `id` int(10) unsigned NOT NULL,
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
  `language` varchar(5) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `news`
--

INSERT INTO `news` (`id`, `title`, `slug`, `summary`, `detail`, `image`, `date`, `metaTitle`, `metaDescription`, `metaKeywords`, `order`, `language`) VALUES
(2, 'Ev Yapımı Kekler', 'ev-yapimi-kekler', 'Kuruyemiş Cafemizde bulunan tüm ürünler ev hanımı kadınlar tarafından yapılmaktadır. Dışarıdan hiç bir unlu mamüllerine yer yoktur.', '<p>Kuruyemiş Cafemizde bulunan t&uuml;m &uuml;r&uuml;nler ev hanımı kadınlar tarafından yapılmaktadır. Dışarıdan hi&ccedil; bir unlu mam&uuml;llerine yer yoktur.</p>\n', '936b2cf1ad932b7e8ed6882b8d6416a1.jpg', '2016-05-27', '', '', '', 5, 'tr'),
(3, 'Taze Gelen Çerezlerimiz', 'taze-gelen-cerezlerimiz', 'Kuruyemiş & Cafemize gelen her çeşit kuruyemişlerimiz taze ve lezzetli gelmektedir. Günlük olarak sunulmaktadır.', '<p style="color: rgb(46, 58, 71); font-size: 14px; line-height: 20px;">Kuruyemiş &amp; Cafemize gelen her &ccedil;eşit kuruyemişlerimiz taze ve lezzetli gelmektedir. G&uuml;nl&uuml;k olarak sunulmaktadır.</p>\r\n', 'c30039aacbfc60632d485345f0915234.png', '2016-05-27', '', '', '', 3, 'tr'),
(4, 'Bakır Cezvede Kahve', 'bakir-cezvede-kahve', 'Bilirsiniz ki her şeyin eski usulü daha lezzet katar herşeye bizimde Cafemizde sunulan kahvelerimiz bakır cezvelerde yapılıp servis edilmektedir. ', '<p>Bilirsiniz ki her şeyin eski usul&uuml; daha lezzet katar herşeye bizimde Cafemizde sunulan kahvelerimiz bakır cezvelerde yapılıp servis edilmektedir. Damak tadınızı bakır cezvelerde yapılmış kahvelerden eksik etmeyin. Afiyet olsun...</p>\n', '1198466752a36e21e9358f424c30655e.png', '2016-05-27', '', '', '', 4, 'tr');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `options`
--

CREATE TABLE IF NOT EXISTS `options` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` longtext,
  `type` varchar(255) NOT NULL,
  `arguments` longtext NOT NULL,
  `language` varchar(5) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `options`
--

INSERT INTO `options` (`id`, `name`, `title`, `value`, `type`, `arguments`, `language`) VALUES
(1, 'metaTitle', 'Site Başlığı', 'Kuruyemiş Cafe | Kuruyemiş Sitesi | Kuruyemişçi Sitesi | Cafe Sitesi', 'text', '{"required":true}', 'tr'),
(2, 'metaDescription', 'Site Tanımı', 'Kuruyemiş Cafe | Kuruyemiş Sitesi | Kuruyemişçi Sitesi | Cafe Sitesi', 'textarea', '{"required":true}', 'tr'),
(3, 'metaKeywords', 'Site Anahtar Kelimeleri', 'Kuruyemiş Cafe,Kuruyemiş Sitesi,Kuruyemişçi Sitesi,Cafe Sitesi', 'textarea', '{"required":true}', 'tr'),
(4, 'customMeta', 'Özel Metalar', '', 'textarea', '[]', 'tr'),
(5, 'smtpHost', 'Smtp Sunucusu', '', 'text', '[]', 'tr'),
(6, 'smtpPort', 'Smtp Port', '587', 'text', '[]', 'tr'),
(7, 'smtpUser', 'Smtp Kullanıcı Adı', '', 'text', '[]', 'tr'),
(8, 'smtpPass', 'Smtp Parola', '', 'text', '[]', 'tr'),
(9, 'footerText', 'Footer Kısa Yazı', '<h2>Kuruyemiş Cafe</h2><br> İnşaat, mimarlık, mühendislik alanlarında  inşaat taahhüt gayrimenkul projeleri geliştirme ve kentsel dönüşüm alanlarında İstanbul ve Ege bölgesinde faaliyet göstermektedir.', 'textarea', '[]', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(10) unsigned NOT NULL,
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
  `language` varchar(5) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `products`
--

INSERT INTO `products` (`id`, `categoryId`, `title`, `slug`, `image`, `summary`, `detail`, `metaTitle`, `metaDescription`, `metaKeywords`, `order`, `language`) VALUES
(2, 12, 'DENEME', 'deneme', '45cad63179ddf993942cf34f73855ea6.jpg', 'DENEME', '<p>DENEME</p>\n', '', '', '', 1, 'tr');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_categories`
--

CREATE TABLE IF NOT EXISTS `product_categories` (
  `id` int(10) unsigned NOT NULL,
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
  `language` varchar(5) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `product_categories`
--

INSERT INTO `product_categories` (`id`, `parentId`, `title`, `slug`, `summary`, `detail`, `image`, `metaTitle`, `metaDescription`, `metaKeywords`, `order`, `language`) VALUES
(12, 0, 'HEDİYELİK EŞYA', 'hediyelik-esya', 'Hediyelik Eşya', '', 'f5b12d8a1020c1d0c37ab584670690f9.jpg', '', '', '', 0, 'tr');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_images`
--

CREATE TABLE IF NOT EXISTS `product_images` (
  `id` int(10) unsigned NOT NULL,
  `productId` int(10) unsigned NOT NULL,
  `image` varchar(255) NOT NULL,
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  `language` varchar(5) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

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
  `id` int(10) unsigned NOT NULL,
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
  `language` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `project_images`
--

CREATE TABLE IF NOT EXISTS `project_images` (
  `id` int(10) unsigned NOT NULL,
  `galleryId` int(10) unsigned NOT NULL,
  `image` varchar(255) NOT NULL,
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  `language` varchar(5) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8;

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
  `id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  `language` varchar(5) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

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
  `id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `summary` text NOT NULL,
  `detail` longtext NOT NULL,
  `image` varchar(255) NOT NULL,
  `metaTitle` varchar(255) DEFAULT NULL,
  `metaDescription` text,
  `metaKeywords` text,
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  `language` varchar(5) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `services`
--

INSERT INTO `services` (`id`, `title`, `slug`, `summary`, `detail`, `image`, `metaTitle`, `metaDescription`, `metaKeywords`, `order`, `language`) VALUES
(1, 'KURUYEMİŞ ÇEŞİTLERİ', 'kuruyemis-cesitleri', 'Kuruyemiş & Cafemize gelen her çeşit kuruyemişlerimiz taze ve lezzetli gelmektedir. Günlük olarak sunulmaktadır.', '<p><img alt="" class="img-responsive" src="public/upload/editor/images/iStock_45648628_XLARGE_1.jpg" style="width: 450px; float: left; margin-right: 15px; margin-bottom: 15px;" /></p>\r\n\r\n<p style="line-height: 20px; font-family: Oxygen, sans-serif; font-size: 14px; color: rgb(46, 58, 71);"><span style="font-size:14px;"><strong>Kuruyemiş &amp; Cafemize</strong> gelen her &ccedil;eşit kuruyemişlerimiz <strong>taze ve lezzetli</strong> gelmektedir. G&uuml;nl&uuml;k olarak sunulmaktadır. Eşsiz lezzetleriyle sohbetlerin vazge&ccedil;ilmezi olan kuruyemiş &ccedil;eşitlerinin faydaları tabii ki saymakla bitmiyor.</span><strong style="color: rgb(46, 58, 71); font-family: Oxygen, sans-serif; font-size: 14px; line-height: 20px;">Kuruyemiş &amp; Cafe&#39;de&nbsp;</strong>taptaze olan kuruyemişler sizlerin hizmetine sunuluyor.</p>\r\n\r\n<p style="line-height: 20px; font-family: Oxygen, sans-serif; font-size: 14px; color: rgb(46, 58, 71);">Afiyet Olsun...</p>\r\n', '4c389eafd078801e02561da865ce2285.png', '', '', '', 1, 'tr'),
(2, 'KUMDA KAHVE', 'kumda-kahve', 'Bilirsiniz ki her şeyin eski usulü daha lezzet katar herşeye bizimde Cafemizde sunulan kahvelerimiz bakır cezvelerde ve kumda pişirilip yapılıp servis edilmektedir. Damak tadınızı bakır cezvelerde yapılmış kumda kahve tadında eksik etmeyin. Afiyet olsun...', '<p style="text-align: justify;"><span style="line-height: 1.42857;"><img alt="" class="img-responsive" src="public/upload/editor/images/iStock_60696304_XLARGE.jpg" style="width: 300px;margin-right: 15px; margin-bottom: 15px; float: left;" /></span>Bilirsiniz ki her şeyin eski usul&uuml; daha lezzet katar herşeye bizimde Cafemizde sunulan <strong>kahvelerimiz bakır cezvelerde ve kumda pişirilip</strong>&nbsp;yapılıp servis edilmektedir.&nbsp;</p>\r\n\r\n<p style="text-align: justify;">Bizlerle bu kadar &ouml;zdeşleşmiş, bu milli i&ccedil;eceğimizin bizlere has pişirilmesine en uygun&nbsp; &uuml;r&uuml;n&uuml; sizlere sunmak istedik.</p>\r\n\r\n<p style="text-align: justify;">Osmanlıdan bug&uuml;ne kadar kahve bir&ccedil;ok şekilde pişirilmiştir.Ancak odun ateşi k&ouml;z&uuml;nde veya k&uuml;le g&ouml;m&uuml;lmek suretiyle yapılan kahvenin tadını hi&ccedil; birşey tutmaz. Bug&uuml;n&uuml;n şartlarında o ortamları bulup her yerde odun ateşi yakma imkanı da olmadığından bu keyiften insanlarımız mahrum kalmışlardı.Bizde Kuruyemiş&amp;Cafe olarak insanlarımızın bu eşsiz lezzetten mahrum kalmasın istiyoruz.&nbsp;Damak tadınızı bakır cezvelerde yapılmış kumda kahve tadında&nbsp;eksik etmeyin.&nbsp;&nbsp;Afiyet olsun...</p>\r\n', 'e0604a3007492f7426667bc07720ef18.png', '', '', '', 2, 'tr'),
(3, 'ÇİKOLATA ÇEŞİTLERİMİZ', 'cikolata-cesitlerimiz', '<b>KURUYEMİŞ CAFE</b><br>kendi bünyemizde yapmış olduğumuz çikolatalarımızı denediniz mi ? Her damağa ve zevke uygun tatlarla sizlerle...', '<p style="text-align: justify;"><strong><img alt="" class="img-responsive" src="public/upload/editor/images/iStock_99048315_XLARGE.jpg" style="width: 300px; float: left; margin-right: 15px; margin-bottom: 15px;" />KURUYEMİŞ CAFE&nbsp;</strong><span style="line-height: 18.5714px; text-align: justify;">kendi b&uuml;nyemizde&nbsp;</span>yapmış olduğumuz &ccedil;ikolatalarımızı denediniz mi ? Her damağa ve zevke uygun tatlarla sizlerle...</p>\r\n\r\n<p style="text-align: justify;"><strong>&Ccedil;ikolatanın faydası</strong>, i&ccedil;inde bulunan ve&nbsp;<strong>flavonoid</strong>&nbsp;denilen antioksidanları barındırmasından ileri gelir.&nbsp;Antioksidanlar v&uuml;cuttaki kimyasal olaylar sonucu ortaya &ccedil;ıkan ve h&uuml;creleri yıkıma uğratan serbest<span style="line-height: 1.42857;">radikallerin zararlı etkilerini azaltan enzimlerdir. Bir&ccedil;ok antioksidan vardır hatta bir kısmını v&uuml;cudumuz kendisi &uuml;retir. Flavonoidler &ccedil;ikolatada, meyvelerde, sebzelerde ve &ccedil;ayda bol miktarda bulunan antioksidanlardır.</span></p>\r\n', '9fd24c756693e2e1322f3f6ec089cc01.png', '', '', '', 3, 'tr'),
(4, 'KURUMSAL HEDİYELİKLER', 'kurumsal-hediyelikler', 'Kurumsal hediuyelik', '<p><img alt="" src="public/upload/editor/images/bos_fincan.jpg" style="width: 200px; height: 200px; float: left; margin-left: 5px; margin-right: 5px;" />&Ouml;ğretmenler g&uuml;n&uuml;ne &ouml;zel hediyelik bardaklarımız ile hizmetiizdeyiz.</p>\n', '2ea57fa67da6144287695406d9f3c678.jpg', '', '', '', 4, 'tr');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `socials`
--

CREATE TABLE IF NOT EXISTS `socials` (
  `id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `order` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `socials`
--

INSERT INTO `socials` (`id`, `title`, `link`, `image`, `icon`, `order`) VALUES
(1, 'Facebook', 'https://www.facebook.com/', NULL, 'fa fa-facebook', 1),
(2, 'Twitter', '#', NULL, 'fa fa-twitter', 3),
(3, 'Instagram', '#', 'b346e243a2a725df832e932a6d958670.jpg', 'fa fa-instagram', 2);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `admin_groups`
--
ALTER TABLE `admin_groups`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `admin_perms`
--
ALTER TABLE `admin_perms`
  ADD KEY `fk_admin_perms_groupId` (`groupId`);

--
-- Tablo için indeksler `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_admin_users_groupId` (`groupId`);

--
-- Tablo için indeksler `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `callyou`
--
ALTER TABLE `callyou`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_contents_parentId` (`parentId`);

--
-- Tablo için indeksler `cvs`
--
ALTER TABLE `cvs`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `gallery_images`
--
ALTER TABLE `gallery_images`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `maillist`
--
ALTER TABLE `maillist`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_menus_parentId` (`parentId`);

--
-- Tablo için indeksler `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Tablo için indeksler `module_arguments`
--
ALTER TABLE `module_arguments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_module_arguments_module` (`module`);

--
-- Tablo için indeksler `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `project_images`
--
ALTER TABLE `project_images`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `references`
--
ALTER TABLE `references`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `socials`
--
ALTER TABLE `socials`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `admin_groups`
--
ALTER TABLE `admin_groups`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Tablo için AUTO_INCREMENT değeri `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Tablo için AUTO_INCREMENT değeri `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- Tablo için AUTO_INCREMENT değeri `callyou`
--
ALTER TABLE `callyou`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- Tablo için AUTO_INCREMENT değeri `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Tablo için AUTO_INCREMENT değeri `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- Tablo için AUTO_INCREMENT değeri `contents`
--
ALTER TABLE `contents`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- Tablo için AUTO_INCREMENT değeri `cvs`
--
ALTER TABLE `cvs`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- Tablo için AUTO_INCREMENT değeri `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Tablo için AUTO_INCREMENT değeri `gallery_images`
--
ALTER TABLE `gallery_images`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- Tablo için AUTO_INCREMENT değeri `maillist`
--
ALTER TABLE `maillist`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- Tablo için AUTO_INCREMENT değeri `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=42;
--
-- Tablo için AUTO_INCREMENT değeri `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- Tablo için AUTO_INCREMENT değeri `module_arguments`
--
ALTER TABLE `module_arguments`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=74;
--
-- Tablo için AUTO_INCREMENT değeri `news`
--
ALTER TABLE `news`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Tablo için AUTO_INCREMENT değeri `options`
--
ALTER TABLE `options`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- Tablo için AUTO_INCREMENT değeri `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Tablo için AUTO_INCREMENT değeri `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- Tablo için AUTO_INCREMENT değeri `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Tablo için AUTO_INCREMENT değeri `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- Tablo için AUTO_INCREMENT değeri `project_images`
--
ALTER TABLE `project_images`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=169;
--
-- Tablo için AUTO_INCREMENT değeri `references`
--
ALTER TABLE `references`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Tablo için AUTO_INCREMENT değeri `services`
--
ALTER TABLE `services`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Tablo için AUTO_INCREMENT değeri `socials`
--
ALTER TABLE `socials`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
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
