<!DOCTYPE html>
<html lang="<?php echo $this->language ?>">
    <head>
        <meta charset="utf-8">
        <title><?php echo $this->site->get('metaTitle') ?></title>
        <meta name="description" content="<?php echo $this->site->get('metaDescription') ?>">
        <meta name="keywords" content="<?php echo $this->site->get('metaKeywords') ?>">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport"
              content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height"/>

        <base href="<?php echo base_url('/') ?>"/>

        <link rel="stylesheet" type="text/css" href="public/plugin/bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="public/plugin/font-awesome/css/font-awesome.min.css"/>
        <link rel="stylesheet" type="text/css" href="public/plugin/fancybox/source/jquery.fancybox.css">
        <link rel="stylesheet" type="text/css" href="public/plugin/fancybox/source/helpers/jquery.fancybox-buttons.css">
        <link rel="stylesheet" type="text/css" href="public/plugin/fancybox/source/helpers/jquery.fancybox-thumbs.css">
        <link rel="stylesheet" type="text/css" href="public/plugin/owl-carousel/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="public/plugin/owl-carousel/owl.transitions.css">
        <link rel="stylesheet" type="text/css" href="public/plugin/scrollbar/jquery.mCustomScrollbar.min.css">
        <link rel="stylesheet" type="text/css" href="public/plugin/notify/pnotify.custom.min.css">
        <link rel="stylesheet" type="text/css" href="public/css/main.css"/>
        <link rel="stylesheet" type="text/css" href="public/css/custom.css"/>
        <link rel="stylesheet" type="text/css" href="public/scss/style.min.css"/>

        <?php foreach ($this->site->assets('css') as $asset): ?>
            <link rel="stylesheet" type="text/css" href="<?php echo $asset ?>"/>
        <?php endforeach; ?>

        <script type="text/javascript" src="public/js/jquery.js"></script>
        <script type="text/javascript" src="public/js/jquery.maskedinput.min.js"></script>
        <script type="text/javascript" src="public/js/jquery.numeric.min.js"></script>
        <script type="text/javascript" src="public/js/bootstrap.filestyle.min.js"></script>
        <script type="text/javascript" src="public/plugin/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="public/plugin/fancybox/source/jquery.fancybox.js?v=2.1.5"></script>
        <script type="text/javascript" src="public/plugin/fancybox/lib/jquery.mousewheel-3.0.6.pack.js"></script>
        <script type="text/javascript" src="public/plugin/fancybox/source/helpers/jquery.fancybox-buttons.js"></script>
        <script type="text/javascript" src="public/plugin/fancybox/source/helpers/jquery.fancybox-thumbs.js"></script>
        <script type="text/javascript" src="public/plugin/owl-carousel/owl.carousel.min.js"></script>
        <script type="text/javascript" src="public/plugin/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
        <script type="text/javascript" src="public/plugin/notify/pnotify.custom.min.js"></script>
        <script type="text/javascript" src="public/js/jquery.matchHeight-min.js"></script>
        <script type="text/javascript" src="public/js/smoothscroll.js"></script>

        <?php foreach ($this->site->assets('js') as $asset): ?>
            <script type="text/javascript" src="<?php echo $asset ?>"></script>
        <?php endforeach; ?>

        <script type="text/javascript" src="public/js/main.js"></script>

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

        <?php if ($ogType = $this->site->get('ogType')): ?>
            <meta property="og:type" content="<?php echo $ogType ?>"/>
        <?php endif; ?>
        <?php if ($ogTitle = $this->site->get('ogTitle')): ?>
            <meta property="og:title" content="<?php echo htmlspecialchars($ogTitle) ?>"/>
        <?php endif; ?>
        <?php if ($ogDescription = $this->site->get('ogDescription')): ?>
            <meta property="og:description" content="<?php echo htmlspecialchars($ogDescription) ?>"/>
        <?php endif; ?>
        <?php if ($ogImage = $this->site->get('ogImage')): ?>
            <meta property="og:image" content="<?php echo base_url('/') . $ogImage ?>"/>
        <?php endif; ?>

        <meta property="og:url" content="<?php echo current_url() ?>"/>

        <?php echo $this->site->get('customMeta') ?>
    </head>
    <body>

        <header id="header">
            <nav class="navbar navbar-default" style="">
                <!--<div class="container visible-md visible-lg">
            <ul class="socials pull-right">
                <?php foreach ($this->social->all() as $item): ?>
                    <li>
                        <a href="<?= $item->link ?>" data-toggle="tooltip"
                           data-placement="bottom" title="<?= htmlspecialchars($item->title) ?>" rel="external">
                            <i class="<?= $item->icon ?>"></i>
                        </a>
                    </li>
                <?php endforeach; ?>
            </ul>
        </div>-->
                <div class="container" style="position: relative;">
                    <div class="navbar-header" style="    height: 60px;">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                                data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand flexCC" href="<?= clink('@home') ?>">
                            <img src="public/img/test.png" alt="Web Site Satışı" class="img-logo pozilogo alt hidden-xs " style=" margin-top: 44px;   ">
                            <img src="public/img/logob.png" alt="Web Site Satışı" class="img-logo pozilogo  tek visible-xs " style="   ">

                        
                           
                        </a>
<!--                        <img src="public/img/logoalti.png" alt="Web Site Satışı" class="img-logo loal" style="top: 39px;-->
<!--       left:-216px;-->
<!--    position: absolute;">-->
                    </div>


           
                    
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right">
                            <?php foreach ($this->menu->get('main') as $menu): ?>
                                <li class="<?= !empty($menu->childs) ? 'dropdown' : '' ?> <?= clink($menu->link) == uri_string() ? 'active' : '' ?>
                               <?= uri_string() == "" && clink($menu->link) == './' ? 'active' : '' ?>">
                                    <a href="<?= clink($menu->link) ?>" title="<?= $menu->hint ?>"
                                       class="<?= !empty($menu->childs) ? ' dropdown-toggle' : '' ?>"
                                        <?= !empty($menu->childs) ? 'data-toggle="dropdown" aria-expanded="false"' : '' ?>>
                                        <?= $menu->title; ?><?= !empty($menu->childs) ? '<span class="caret"></span>' : '' ?>
                                    </a>
                                    <?php if (!empty($menu->childs)): ?>
                                        <ul class="dropdown-menu">
                                            <?php foreach ($menu->childs as $child): ?>
                                                <li>
                                                    <a href="<?= clink($child->link) ?>"
                                                       title="<?= htmlspecialchars($child->title) ?>">
                                                        <?= $child->title ?>
                                                    </a>
                                                </li>
                                            <?php endforeach; ?>
                                        </ul>
                                    <?php endif; ?>
                                </li>
                            <?php endforeach; ?>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>

        <?php $this->view($view); ?>
        <div class="container">
            <section class="map">
                <div id="map-canvas" style="width: 100%; height: 259px; position: relative; overflow: hidden; background-color: rgb(229, 227, 223);"><div class="gm-style" style="position: absolute; left: 0px; top: 0px; overflow: hidden; width: 100%; height: 100%; z-index: 0;"><div style="position: absolute; left: 0px; top: 0px; overflow: hidden; width: 100%; height: 100%; z-index: 0;"><div style="position: absolute; left: 0px; top: 0px; z-index: 1; width: 100%; transform-origin: 0px 0px 0px; transform: matrix(1, 0, 0, 1, 0, 0); will-change: transform;"><div style="position: absolute; left: 0px; top: 0px; z-index: 100; width: 100%;"></div><div style="position: absolute; left: 0px; top: 0px; z-index: 101; width: 100%;"></div><div style="position: absolute; left: 0px; top: 0px; z-index: 102; width: 100%;"></div><div style="position: absolute; left: 0px; top: 0px; z-index: 103; width: 100%;"><div style="position: absolute; left: 0px; top: 0px; z-index: -1;"><div aria-hidden="true" style="position: absolute; left: 0px; top: 0px; z-index: 1; visibility: inherit;"><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 848px; top: 209px;"><canvas draggable="false" height="256" width="256" style="-webkit-user-select: none; position: absolute; left: 0px; top: 0px; height: 256px; width: 256px;"></canvas></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 592px; top: 209px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 848px; top: -47px;"><canvas draggable="false" height="256" width="256" style="-webkit-user-select: none; position: absolute; left: 0px; top: 0px; height: 256px; width: 256px;"></canvas></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 848px; top: 465px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 1104px; top: 209px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 592px; top: 465px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 592px; top: -47px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 1104px; top: -47px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 1104px; top: 465px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 1360px; top: 209px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 336px; top: 209px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 1360px; top: 465px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 1360px; top: -47px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 336px; top: 465px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 336px; top: -47px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 1616px; top: 209px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 80px; top: 209px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 1616px; top: 465px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 1616px; top: -47px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 80px; top: 465px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 80px; top: -47px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 1872px; top: 209px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: -176px; top: 209px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: -176px; top: -47px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 1872px; top: -47px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: -176px; top: 465px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 1872px; top: 465px;"></div></div></div></div><div style="position: absolute; left: 0px; top: 0px; z-index: 0;"><div aria-hidden="true" style="position: absolute; left: 0px; top: 0px; z-index: 1; visibility: inherit;"><div style="position: absolute; left: 848px; top: 209px; transition: opacity 200ms ease-out;"><img src="https://www.google.com/maps/vt?pb=!1m5!1m4!1i17!2i75427!3i50346!4i256!2m3!1e0!2sm!3i361029149!3m9!2str-TR!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0&amp;token=121266" draggable="false" alt="" style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 848px; top: -47px; transition: opacity 200ms ease-out;"><img src="https://www.google.com/maps/vt?pb=!1m5!1m4!1i17!2i75427!3i50345!4i256!2m3!1e0!2sm!3i361029149!3m9!2str-TR!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0&amp;token=85245" draggable="false" alt="" style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 848px; top: 465px; transition: opacity 200ms ease-out;"><img src="https://www.google.com/maps/vt?pb=!1m5!1m4!1i17!2i75427!3i50347!4i256!2m3!1e0!2sm!3i361000000!3m9!2str-TR!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0&amp;token=26946" draggable="false" alt="" style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 1104px; top: 209px; transition: opacity 200ms ease-out;"><img src="https://www.google.com/maps/vt?pb=!1m5!1m4!1i17!2i75428!3i50346!4i256!2m3!1e0!2sm!3i361000000!3m9!2str-TR!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0&amp;token=82275" draggable="false" alt="" style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 592px; top: -47px; transition: opacity 200ms ease-out;"><img src="https://www.google.com/maps/vt?pb=!1m5!1m4!1i17!2i75426!3i50345!4i256!2m3!1e0!2sm!3i361029149!3m9!2str-TR!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0&amp;token=124966" draggable="false" alt="" style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 1104px; top: -47px; transition: opacity 200ms ease-out;"><img src="https://www.google.com/maps/vt?pb=!1m5!1m4!1i17!2i75428!3i50345!4i256!2m3!1e0!2sm!3i361029149!3m9!2str-TR!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0&amp;token=45524" draggable="false" alt="" style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 1104px; top: 465px; transition: opacity 200ms ease-out;"><img src="https://www.google.com/maps/vt?pb=!1m5!1m4!1i17!2i75428!3i50347!4i256!2m3!1e0!2sm!3i361029342!3m9!2str-TR!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0&amp;token=68165" draggable="false" alt="" style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 1360px; top: 209px; transition: opacity 200ms ease-out;"><img src="https://www.google.com/maps/vt?pb=!1m5!1m4!1i17!2i75429!3i50346!4i256!2m3!1e0!2sm!3i361000000!3m9!2str-TR!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0&amp;token=42554" draggable="false" alt="" style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 1360px; top: 465px; transition: opacity 200ms ease-out;"><img src="https://www.google.com/maps/vt?pb=!1m5!1m4!1i17!2i75429!3i50347!4i256!2m3!1e0!2sm!3i361029342!3m9!2str-TR!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0&amp;token=28444" draggable="false" alt="" style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 1360px; top: -47px; transition: opacity 200ms ease-out;"><img src="https://www.google.com/maps/vt?pb=!1m5!1m4!1i17!2i75429!3i50345!4i256!2m3!1e0!2sm!3i361029149!3m9!2str-TR!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0&amp;token=5803" draggable="false" alt="" style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 336px; top: 465px; transition: opacity 200ms ease-out;"><img src="https://www.google.com/maps/vt?pb=!1m5!1m4!1i17!2i75425!3i50347!4i256!2m3!1e0!2sm!3i361000000!3m9!2str-TR!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0&amp;token=106388" draggable="false" alt="" style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 336px; top: -47px; transition: opacity 200ms ease-out;"><img src="https://www.google.com/maps/vt?pb=!1m5!1m4!1i17!2i75425!3i50345!4i256!2m3!1e0!2sm!3i361029149!3m9!2str-TR!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0&amp;token=33616" draggable="false" alt="" style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 1616px; top: 209px; transition: opacity 200ms ease-out;"><img src="https://www.google.com/maps/vt?pb=!1m5!1m4!1i17!2i75430!3i50346!4i256!2m3!1e0!2sm!3i361029149!3m9!2str-TR!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0&amp;token=9695" draggable="false" alt="" style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 592px; top: 209px; transition: opacity 200ms ease-out;"><img src="https://www.google.com/maps/vt?pb=!1m5!1m4!1i17!2i75426!3i50346!4i256!2m3!1e0!2sm!3i361029149!3m9!2str-TR!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0&amp;token=29916" draggable="false" alt="" style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 592px; top: 465px; transition: opacity 200ms ease-out;"><img src="https://www.google.com/maps/vt?pb=!1m5!1m4!1i17!2i75426!3i50347!4i256!2m3!1e0!2sm!3i361000000!3m9!2str-TR!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0&amp;token=66667" draggable="false" alt="" style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 336px; top: 209px; transition: opacity 200ms ease-out;"><img src="https://www.google.com/maps/vt?pb=!1m5!1m4!1i17!2i75425!3i50346!4i256!2m3!1e0!2sm!3i361029149!3m9!2str-TR!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0&amp;token=69637" draggable="false" alt="" style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 1616px; top: 465px; transition: opacity 200ms ease-out;"><img src="https://www.google.com/maps/vt?pb=!1m5!1m4!1i17!2i75430!3i50347!4i256!2m3!1e0!2sm!3i361030362!3m9!2str-TR!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0&amp;token=85052" draggable="false" alt="" style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 80px; top: 209px; transition: opacity 200ms ease-out;"><img src="https://www.google.com/maps/vt?pb=!1m5!1m4!1i17!2i75424!3i50346!4i256!2m3!1e0!2sm!3i361000000!3m9!2str-TR!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0&amp;token=110088" draggable="false" alt="" style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 1616px; top: -47px; transition: opacity 200ms ease-out;"><img src="https://www.google.com/maps/vt?pb=!1m5!1m4!1i17!2i75430!3i50345!4i256!2m3!1e0!2sm!3i361029149!3m9!2str-TR!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0&amp;token=104745" draggable="false" alt="" style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 80px; top: 465px; transition: opacity 200ms ease-out;"><img src="https://www.google.com/maps/vt?pb=!1m5!1m4!1i17!2i75424!3i50347!4i256!2m3!1e0!2sm!3i361000000!3m9!2str-TR!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0&amp;token=15038" draggable="false" alt="" style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 80px; top: -47px; transition: opacity 200ms ease-out;"><img src="https://www.google.com/maps/vt?pb=!1m5!1m4!1i17!2i75424!3i50345!4i256!2m3!1e0!2sm!3i361000000!3m9!2str-TR!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0&amp;token=74067" draggable="false" alt="" style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 1872px; top: 209px; transition: opacity 200ms ease-out;"><img src="https://www.google.com/maps/vt?pb=!1m5!1m4!1i17!2i75431!3i50346!4i256!2m3!1e0!2sm!3i361029737!3m9!2str-TR!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0&amp;token=22495" draggable="false" alt="" style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: -176px; top: 209px; transition: opacity 200ms ease-out;"><img src="https://www.google.com/maps/vt?pb=!1m5!1m4!1i17!2i75423!3i50346!4i256!2m3!1e0!2sm!3i361000000!3m9!2str-TR!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0&amp;token=18738" draggable="false" alt="" style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: -176px; top: -47px; transition: opacity 200ms ease-out;"><img src="https://www.google.com/maps/vt?pb=!1m5!1m4!1i17!2i75423!3i50345!4i256!2m3!1e0!2sm!3i361000000!3m9!2str-TR!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0&amp;token=113788" draggable="false" alt="" style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 1872px; top: -47px; transition: opacity 200ms ease-out;"><img src="https://www.google.com/maps/vt?pb=!1m5!1m4!1i17!2i75431!3i50345!4i256!2m3!1e0!2sm!3i361029737!3m9!2str-TR!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0&amp;token=117545" draggable="false" alt="" style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: -176px; top: 465px; transition: opacity 200ms ease-out;"><img src="https://www.google.com/maps/vt?pb=!1m5!1m4!1i17!2i75423!3i50347!4i256!2m3!1e0!2sm!3i361000000!3m9!2str-TR!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0&amp;token=54759" draggable="false" alt="" style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 1872px; top: 465px; transition: opacity 200ms ease-out;"><img src="https://www.google.com/maps/vt?pb=!1m5!1m4!1i17!2i75431!3i50347!4i256!2m3!1e0!2sm!3i361030362!3m9!2str-TR!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0&amp;token=45331" draggable="false" alt="" style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div></div></div></div><div style="position: absolute; left: 0px; top: 0px; z-index: 2; width: 100%; height: 100%;"></div><div style="position: absolute; left: 0px; top: 0px; z-index: 3; width: 100%; height: 100%;"><iframe src="https://www.google.com/maps/api/js/widget?pb=!1m2!1u25!2s13!2str-TR#WzAsMjM0XQ.." frameborder="0" allowtransparency="true" scrolling="no" style="border: 0px; overflow: hidden; height: 100%; width: 100%;"></iframe></div><div style="position: absolute; left: 0px; top: 0px; z-index: 4; width: 100%; transform-origin: 0px 0px 0px; transform: matrix(1, 0, 0, 1, 0, 0);"><div style="position: absolute; left: 0px; top: 0px; z-index: 104; width: 100%;"></div><div style="position: absolute; left: 0px; top: 0px; z-index: 105; width: 100%;"></div><div style="position: absolute; left: 0px; top: 0px; z-index: 106; width: 100%;"></div><div style="position: absolute; left: 0px; top: 0px; z-index: 107; width: 100%;"><div style="cursor: default; position: absolute; width: 53px; height: 191px; visibility: hidden;"><div style="position: absolute; left: 0px; top: 0px;"><div style="width: 0px; height: 0px; border-right: 10px solid transparent; border-left: 10px solid transparent; border-top: 24px solid rgba(0, 0, 0, 0.0980392); position: absolute; left: 17px; top: 191px;"></div><div style="position: absolute; left: 0px; top: 0px; border-radius: 2px; box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; width: 53px; height: 191px; background-color: rgba(0, 0, 0, 0.2);"></div><div style="border-top-width: 24px; position: absolute; left: 17px; top: 188px;"><div style="position: absolute; overflow: hidden; left: -6px; top: -1px; width: 16px; height: 30px;"><div style="position: absolute; left: 6px; transform: skewX(22.6deg); transform-origin: 0px 0px 0px; height: 24px; width: 10px; box-shadow: rgba(0, 0, 0, 0.6) 0px 1px 6px; background-color: rgb(255, 255, 255);"></div></div><div style="position: absolute; overflow: hidden; top: -1px; left: 10px; width: 16px; height: 30px;"><div style="position: absolute; left: 0px; transform: skewX(-22.6deg); transform-origin: 10px 0px 0px; height: 24px; width: 10px; box-shadow: rgba(0, 0, 0, 0.6) 0px 1px 6px; background-color: rgb(255, 255, 255);"></div></div></div><div style="position: absolute; left: 1px; top: 1px; border-radius: 2px; width: 51px; height: 189px; background-color: rgb(255, 255, 255);"></div></div><div class="gm-style-iw" style="top: 9px; position: absolute; left: 15px; width: 23px; overflow: hidden;"><div style="display: inline-block; overflow: auto; max-height: 458px; max-width: 654px;"></div><iframe src="https://www.google.com/maps/api/js/widget?pb=!1m2!1u25!2s13!2str-TR#WzIsMjM0XQ.." frameborder="0" allowtransparency="true" scrolling="no" style="border: 0px; overflow: hidden;"></iframe></div><div style="width: 13px; height: 13px; overflow: hidden; position: absolute; opacity: 0.7; right: 15px; top: 13px; z-index: 10000; cursor: pointer;"><img src="https://maps.gstatic.com/mapfiles/api-3/images/mapcnt6.png" draggable="false" style="position: absolute; left: -2px; top: -336px; width: 59px; height: 492px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div></div></div></div></div><div style="margin-left: 5px; margin-right: 5px; z-index: 1000000; position: absolute; left: 0px; bottom: 0px;"><a target="_blank" href="https://maps.google.com/maps?ll=38.457544,27.167553&amp;z=17&amp;t=m&amp;hl=tr-TR&amp;gl=US&amp;mapclient=apiv3" title="Bu alanı Google Haritalar'da görmek için tıklayın" style="position: static; overflow: visible; float: none; display: inline;"><div style="width: 66px; height: 26px; cursor: pointer;"><img src="https://maps.gstatic.com/mapfiles/api-3/images/google4.png" draggable="false" style="position: absolute; left: 0px; top: 0px; width: 66px; height: 26px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;"></div></a></div><div style="padding: 15px 21px; border: 1px solid rgb(171, 171, 171); font-family: Roboto, Arial, sans-serif; color: rgb(34, 34, 34); box-shadow: rgba(0, 0, 0, 0.2) 0px 4px 16px; z-index: 10000002; display: none; width: 256px; height: 148px; position: absolute; left: 802px; top: 160px; background-color: white;"><div style="padding: 0px 0px 10px; font-size: 16px;">Harita Verileri</div><div style="font-size: 13px;">Harita verileri ©2016 Google</div><div style="width: 13px; height: 13px; overflow: hidden; position: absolute; opacity: 0.7; right: 12px; top: 12px; z-index: 10000; cursor: pointer;"><img src="https://maps.gstatic.com/mapfiles/api-3/images/mapcnt6.png" draggable="false" style="position: absolute; left: -2px; top: -336px; width: 59px; height: 492px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div></div><div class="gmnoprint" style="z-index: 1000001; position: absolute; right: 276px; bottom: 0px; width: 138px;"><div draggable="false" class="gm-style-cc" style="-webkit-user-select: none; height: 14px; line-height: 14px;"><div style="opacity: 0.7; width: 100%; height: 100%; position: absolute;"><div style="width: 1px;"></div><div style="width: auto; height: 100%; margin-left: 1px; background-color: rgb(245, 245, 245);"></div></div><div style="position: relative; padding-right: 6px; padding-left: 6px; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right; vertical-align: middle; display: inline-block;"><a style="color: rgb(68, 68, 68); text-decoration: none; cursor: pointer; display: none;">Harita Verileri</a><span>Harita verileri ©2016 Google</span></div></div></div><div class="gmnoscreen" style="position: absolute; right: 0px; bottom: 0px;"><div style="font-family: Roboto, Arial, sans-serif; font-size: 11px; color: rgb(68, 68, 68); direction: ltr; text-align: right; background-color: rgb(245, 245, 245);">Harita verileri ©2016 Google</div></div><div class="gmnoprint gm-style-cc" draggable="false" style="z-index: 1000001; -webkit-user-select: none; height: 14px; line-height: 14px; position: absolute; right: 101px; bottom: 0px;"><div style="opacity: 0.7; width: 100%; height: 100%; position: absolute;"><div style="width: 1px;"></div><div style="width: auto; height: 100%; margin-left: 1px; background-color: rgb(245, 245, 245);"></div></div><div style="position: relative; padding-right: 6px; padding-left: 6px; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right; vertical-align: middle; display: inline-block;"><a href="https://www.google.com/intl/tr-TR_US/help/terms_maps.html" target="_blank" style="text-decoration: none; cursor: pointer; color: rgb(68, 68, 68);">Kullanım Şartları</a></div></div><div style="width: 25px; height: 25px; overflow: hidden; display: none; margin: 10px 14px; position: absolute; top: 0px; right: 0px;"><img src="https://maps.gstatic.com/mapfiles/api-3/images/sv5.png" draggable="false" class="gm-fullscreen-control" style="position: absolute; left: -52px; top: -86px; width: 164px; height: 112px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;"></div><div style="z-index: 1000000; position: absolute; width: 95px; margin: 10px; top: 0px; right: -4px; height: 26px;" controlwidth="91" controlheight="22"><iframe src="https://www.google.com/maps/api/js/widget?pb=!1m2!1u25!2s13!2str-TR#WzEsMjM0XQ.." frameborder="0" allowtransparency="true" scrolling="no" style="border: 0px; overflow: hidden; position: absolute; right: 0px; visibility: visible; width: 95px; height: 26px;"></iframe></div><div draggable="false" class="gm-style-cc" style="-webkit-user-select: none; height: 14px; line-height: 14px; position: absolute; right: 0px; bottom: 0px;"><div style="opacity: 0.7; width: 100%; height: 100%; position: absolute;"><div style="width: 1px;"></div><div style="width: auto; height: 100%; margin-left: 1px; background-color: rgb(245, 245, 245);"></div></div><div style="position: relative; padding-right: 6px; padding-left: 6px; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right; vertical-align: middle; display: inline-block;"><a target="_new" title="Yol haritası veya görüntülerdeki hataları Google'a bildirin" href="https://www.google.com/maps/@38.4575438,27.1675535,17z/data=!10m1!1e1!12b1?source=apiv3&amp;rapsrc=apiv3" style="font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); text-decoration: none; position: relative;">Harita hatası bildirin</a></div></div><div class="gmnoprint gm-bundled-control" draggable="false" controlwidth="28" controlheight="55" style="margin: 10px; -webkit-user-select: none; position: absolute; right: 28px; top: 213px;"><div class="gmnoprint" controlwidth="28" controlheight="55" style="position: absolute; left: 0px; top: 0px;"><div draggable="false" style="-webkit-user-select: none; box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; border-radius: 2px; cursor: pointer; width: 28px; height: 55px; background-color: rgb(255, 255, 255);"><div title="Büyüt" style="position: relative; width: 28px; height: 27px; left: 0px; top: 0px;"><div style="overflow: hidden; position: absolute; width: 15px; height: 15px; left: 7px; top: 6px;"><img src="https://maps.gstatic.com/mapfiles/api-3/images/tmapctrl.png" draggable="false" style="position: absolute; left: 0px; top: 0px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none; width: 120px; height: 54px;"></div></div><div style="position: relative; overflow: hidden; width: 67%; height: 1px; left: 16%; top: 0px; background-color: rgb(230, 230, 230);"></div><div title="Küçült" style="position: relative; width: 28px; height: 27px; left: 0px; top: 0px;"><div style="overflow: hidden; position: absolute; width: 15px; height: 15px; left: 7px; top: 6px;"><img src="https://maps.gstatic.com/mapfiles/api-3/images/tmapctrl.png" draggable="false" style="position: absolute; left: 0px; top: -15px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none; width: 120px; height: 54px;"></div></div></div></div></div><div class="gmnoprint gm-bundled-control" draggable="false" controlwidth="28" controlheight="28" style="margin: 10px; -webkit-user-select: none; position: absolute; left: 0px; top: 201px;"><div class="gm-svpc" controlwidth="28" controlheight="28" style="box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; border-radius: 2px; width: 28px; height: 28px; cursor: url(&quot;https://maps.gstatic.com/mapfiles/openhand_8_8.cur&quot;) 8 8, default; position: absolute; left: 0px; top: 0px; background-color: rgb(255, 255, 255);"><div style="position: absolute; left: 1px; top: 1px;"></div><div style="position: absolute; left: 1px; top: 1px;"><div aria-label="Street View Pegman Kontrolü" style="width: 26px; height: 26px; overflow: hidden; position: absolute; left: 0px; top: 0px;"><img src="https://maps.gstatic.com/mapfiles/api-3/images/cb_scout5.png" draggable="false" style="position: absolute; left: -147px; top: -26px; width: 215px; height: 835px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div aria-label="Pegman, Haritanın üst kısmında" style="width: 26px; height: 26px; overflow: hidden; position: absolute; left: 0px; top: 0px; visibility: hidden;"><img src="https://maps.gstatic.com/mapfiles/api-3/images/cb_scout5.png" draggable="false" style="position: absolute; left: -147px; top: -52px; width: 215px; height: 835px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div aria-label="Street View Pegman Kontrolü" style="width: 26px; height: 26px; overflow: hidden; position: absolute; left: 0px; top: 0px; visibility: hidden;"><img src="https://maps.gstatic.com/mapfiles/api-3/images/cb_scout5.png" draggable="false" style="position: absolute; left: -147px; top: -78px; width: 215px; height: 835px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div></div></div></div><div class="gmnoprint gm-bundled-control gm-bundled-control-on-bottom" draggable="false" controlwidth="0" controlheight="0" style="margin: 10px; -webkit-user-select: none; position: absolute; display: none; bottom: 14px; right: 0px;"><div class="gmnoprint" controlwidth="28" controlheight="0" style="display: none; position: absolute;"><div title="Harita 90 derece döndürülür" style="width: 28px; height: 28px; overflow: hidden; position: absolute; border-radius: 2px; box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; cursor: pointer; display: none; background-color: rgb(255, 255, 255);"><img src="https://maps.gstatic.com/mapfiles/api-3/images/tmapctrl4.png" draggable="false" style="position: absolute; left: -141px; top: 6px; width: 170px; height: 54px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div class="gm-tilt" style="width: 28px; height: 28px; overflow: hidden; position: absolute; border-radius: 2px; box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; top: 0px; cursor: pointer; background-color: rgb(255, 255, 255);"><img src="https://maps.gstatic.com/mapfiles/api-3/images/tmapctrl4.png" draggable="false" style="position: absolute; left: -141px; top: -13px; width: 170px; height: 54px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div></div></div><div class="gmnoprint" style="margin: 10px; z-index: 0; position: absolute; cursor: pointer; left: 0px; top: 249px;"><div class="gm-style-mtc" style="float: left;"><div draggable="false" title="Sokak haritasını göster" style="direction: ltr; overflow: hidden; text-align: center; position: relative; color: rgb(0, 0, 0); font-family: Roboto, Arial, sans-serif; -webkit-user-select: none; font-size: 11px; padding: 8px; border-bottom-left-radius: 2px; border-top-left-radius: 2px; -webkit-background-clip: padding-box; box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; min-width: 29px; font-weight: 500; background-color: rgb(255, 255, 255); background-clip: padding-box;">Harita</div><div style="z-index: -1; padding: 2px; border-bottom-left-radius: 2px; border-bottom-right-radius: 2px; box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; position: absolute; left: 0px; top: 31px; text-align: left; display: none; background-color: white;"><div draggable="false" title="Sokak haritasında arazi göster" style="color: rgb(0, 0, 0); font-family: Roboto, Arial, sans-serif; -webkit-user-select: none; font-size: 11px; padding: 6px 8px 6px 6px; direction: ltr; text-align: left; white-space: nowrap; background-color: rgb(255, 255, 255);"><span role="checkbox" style="box-sizing: border-box; position: relative; line-height: 0; font-size: 0px; margin: 0px 5px 0px 0px; display: inline-block; border: 1px solid rgb(198, 198, 198); border-radius: 1px; width: 13px; height: 13px; vertical-align: middle; background-color: rgb(255, 255, 255);"><div style="position: absolute; left: 1px; top: -2px; width: 13px; height: 11px; overflow: hidden; display: none;"><img src="https://maps.gstatic.com/mapfiles/mv/imgs8.png" draggable="false" style="position: absolute; left: -52px; top: -44px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none; width: 68px; height: 67px;"></div></span><label style="vertical-align: middle; cursor: pointer;">Arazi</label></div></div></div><div class="gm-style-mtc" style="float: left;"><div draggable="false" title="Uydu görüntülerini göster" style="direction: ltr; overflow: hidden; text-align: center; position: relative; color: rgb(86, 86, 86); font-family: Roboto, Arial, sans-serif; -webkit-user-select: none; font-size: 11px; padding: 8px; border-bottom-right-radius: 2px; border-top-right-radius: 2px; -webkit-background-clip: padding-box; box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; border-left: 0px; min-width: 26px; background-color: rgb(255, 255, 255); background-clip: padding-box;">Uydu</div><div style="z-index: -1; padding: 2px; border-bottom-left-radius: 2px; border-bottom-right-radius: 2px; box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; position: absolute; right: 0px; top: 31px; text-align: left; display: none; background-color: white;"><div draggable="false" title="Görüntüleri sokak adlarıyla göster" style="color: rgb(0, 0, 0); font-family: Roboto, Arial, sans-serif; -webkit-user-select: none; font-size: 11px; padding: 6px 8px 6px 6px; direction: ltr; text-align: left; white-space: nowrap; background-color: rgb(255, 255, 255);"><span role="checkbox" style="box-sizing: border-box; position: relative; line-height: 0; font-size: 0px; margin: 0px 5px 0px 0px; display: inline-block; border: 1px solid rgb(198, 198, 198); border-radius: 1px; width: 13px; height: 13px; vertical-align: middle; background-color: rgb(255, 255, 255);"><div style="position: absolute; left: 1px; top: -2px; width: 13px; height: 11px; overflow: hidden;"><img src="https://maps.gstatic.com/mapfiles/mv/imgs8.png" draggable="false" style="position: absolute; left: -52px; top: -44px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none; width: 68px; height: 67px;"></div></span><label style="vertical-align: middle; cursor: pointer;">Etiketler</label></div></div></div></div><div draggable="false" class="gm-style-cc" style="position: absolute; -webkit-user-select: none; height: 14px; line-height: 14px; right: 186px; bottom: 0px;"><div style="opacity: 0.7; width: 100%; height: 100%; position: absolute;"><div style="width: 1px;"></div><div style="width: auto; height: 100%; margin-left: 1px; background-color: rgb(245, 245, 245);"></div></div><div style="position: relative; padding-right: 6px; padding-left: 6px; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right; vertical-align: middle; display: inline-block;"><span>50 m&nbsp;</span><div style="position: relative; display: inline-block; height: 8px; bottom: -1px; width: 53px;"><div style="width: 100%; height: 4px; position: absolute; left: 0px; top: 0px;"></div><div style="width: 4px; height: 8px; left: 0px; top: 0px; background-color: rgb(255, 255, 255);"></div><div style="width: 4px; height: 8px; position: absolute; left: 0px; bottom: 0px; background-color: rgb(255, 255, 255);"></div><div style="position: absolute; height: 2px; left: 1px; bottom: 1px; right: 1px; background-color: rgb(102, 102, 102);"></div><div style="position: absolute; width: 2px; height: 6px; left: 1px; top: 1px; background-color: rgb(102, 102, 102);"></div><div style="width: 2px; height: 6px; position: absolute; bottom: 1px; right: 1px; background-color: rgb(102, 102, 102);"></div></div></div></div></div></div>
                <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC5tsEc6YH4r7dOtYH16ddHKPWf75LyR50&libraries=places"></script></script>
                <script type="text/javascript">
                    function initialize() {
                        var konum = new google.maps.LatLng(40.1892151,29.0678673);
                        var mapOptions = {
                            zoom: 17,
                            center: konum,
                            scrollwheel: false,
                            draggable : true,
                            mapTypeControl: true,
                            mapTypeControlOptions: {
                                position: google.maps.ControlPosition.LEFT_CENTER
                            },
                            zoomControl: true,
                            zoomControlOptions: {
                                position: google.maps.ControlPosition.RIGHT_CENTER
                            },
                            scaleControl: true,
                            streetViewControl: true,
                            streetViewControlOptions: {
                                position: google.maps.ControlPosition.LEFT_CENTER
                            },
                            mapTypeId: google.maps.MapTypeId.ROADMAP
                        };

                        var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

                        var contentString = 'En Yeni Web';

                        var infowindow = new google.maps.InfoWindow({
                            content: contentString
                        });

                        var marker = new google.maps.Marker({
                            position: konum,
                            map: map,
                            icon: 'public/img/marker.png',
                            title: ''
                        });

                        if (marker.getAnimation() != null) {
                            marker.setAnimation(null);
                        } else {
                            marker.setAnimation(google.maps.Animation.DROP);
                        }

                        google.maps.event.addListener(marker, 'click', function() {
                            infowindow.open(map, marker);
                        });
                        console.log();
                    }
                    google.maps.event.addDomListener(window, 'load', initialize);
                </script>
            </section></div>
        <section class="kopa__bottomSidebar hatc" style="  background: #222c36;">
            <div class="container">
                <div class="row row__custom">
                    <div class="col-xs-12 col-sm-3 kopa__reveal bottom">
                        <div class="widget kopa__about style--06">
                            <div class="widget-content">
                                <a href="<?= clink('@home') ?>">
                                    <img src="public/img/foter.png" alt="Web Site Satışı" class="img-responsive" style="    margin-left: 116px;
    margin-top: 20px;">
                                </a>
                             
                            </div>
                            <!-- widget content-->
                        </div>
                       
                    </div>
                    <!-- col-->
      
                    <!-- col-->
                   
                    <!-- col-->
                    <div class="col-xs-12 col-sm-6 kopa__reveal bottom aaaa" style="     position: absolute; ">
                        <div class="widget kopa__newsLetter style--01">
                            <div class="widget-title style--04">
                                <h3 class="newsTitle" style="text-align:center ;">KONAK 16<br>E- Bülten</h3>
                            </div>
                            <!-- widget title-->
                            <div class="widget-content">
                                <p style="    text-align: center;">Bizden haberdar olmak için mail listemize kaydolun</p>
                                <form action="<?= clink('@maillist') ?>" method="post" accept-charset="UTF-8">
                                    <input type="email" name="email" placeholder="Email Adresiniz">
                                    <input type="hidden" name="mLink" value="<?= clink('@maillist') ?>">
                                    <input type="button" value="GÖNDER" class="btnRed" style="    width: 50%;
    height: 40px;
    margin-left: 25%;">
                                </form>
                            </div>
                            <!-- widget content-->
                        </div>
                        <!-- kopa news letter-->
                    </div>
                    <div class="col-xs-12 col-sm-3 kopa__reveal bottom cantact" >
                        <div class="widget kopa__contact style--02">
                            <div class="widget-title style--04">
                                <h4 class="primary__title" style="color:White;">İletişim</h4>
                            </div>
                            <!-- widget title-->
                            <div class="widget-content">
                                <p style="color:White;">
                                    <i class="fa fa-map-marker fa-x3" style="color:White;"></i>
                                    <?= $this->arguments->get('contact', 'address') ?>
                                </p>
                                <p style="color:White;">
                                    <i class="fa fa-phone fa-x3" style="color:White;"></i>
                                    <a href="tel:<?= $this->arguments->get('contact', 'phone') ?>">
                                        <?= $this->arguments->get('contact', 'phone') ?>
                                    </a>
                                </p>
                                <p style="color:White;"> 
                                    <i class="fa fa-envelope fa-x3" style="color:White;"></i>
                                    <a href="Mail:<?= $this->arguments->get('contact', 'mail') ?>">
                                        <?= $this->arguments->get('contact', 'mail') ?>
                                    </a>
                                </p>
                            </div>
                            <!-- widget content-->
                        </div>
                        <!-- kopa contact-->
                    </div>
                    <!-- col-->
                </div>
                <!-- row-->
            </div>
            <!-- container-->
        </section>
        <!-- kopa bottom sidebar-->
        <footer class="kopa__footer" style="background: #171e24">
            <div class="container">
                  <p class="bfr"> © Copyright 2017 Konak16 </p>
                
            </div>
            <!-- container-->
            <div class="kopa__backTop"></div>
            <!-- back top-->
        </footer>
        <!-- kopa__footer-->

    </body>
</html>
