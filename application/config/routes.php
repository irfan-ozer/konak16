<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	http://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There area two reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router what URI segments to use if those provided
| in the URL cannot be matched to a valid route.
|
*/

$route['default_controller'] = "HomeController/index";

$route['icerik/[a-zA-Z0-9_-]+/([0-9]+)'] = 'ContentController/view/$1';
$route['iletisim'] = 'ContactController/index';
$route['project/[a-zA-Z0-9_-]+/([0-9]+)'] = 'ProjectController/view/$1';
$route['project'] = 'ProjectController/index';
$route['hizmet/[a-zA-Z0-9_-]+/([0-9]+)'] = 'ServiceController/view/$1';
$route['hizmet'] = 'ServiceController/index';
$route['biz-sizi-arayalim'] = 'CallyouController/index';
$route['mail-listesi'] = 'MaillistController/index';
$route['haber/[a-zA-Z0-9_-]+/([0-9]+)'] = 'NewsController/view/$1';
$route['haber'] = 'NewsController/index';
$route['insan-kaynaklari'] = 'CvController/index';
$route['yorumlar'] = 'CommentController/index';
$route['galeri'] = 'GalleryController/index';
$route['galeri/[a-zA-Z0-9_-]+/([0-9]+)'] = 'GalleryController/view/$1';
$route['urun-kategori/[a-zA-Z0-9_-]+/([0-9]+)'] = 'ProductcategoryController/view/$1';
$route['urun-kategori'] = 'ProductcategoryController/index';
$route['urunler/[a-zA-Z0-9_-]+/([0-9]+)'] = 'ProductController/view/$1';