<main id="main">
    <section class="banner">
        <div class="bread cover" style="background-image: url(public/img/baslik-bg.png);">
            <div class="container flexC">

                <div class="w100">
                    <div class="bread-title">
                        <h3><img src="public/img/fistik.png" /><?= $project->title ?></h3>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <section class="content">
        <div class="container">
            <div class="content-body">
                <h1 class="f9 m0 mB30 title-effect" data-text="<?= htmlspecialchars($project->title) ?>">
                    <?= $project->title ?>
                </h1>

                <?= $project->detail ?>

                <div class="row">
                    <?php if (!empty($project->room)): ?>
                        <div class="col-md-3 col-sm-6 mB30 clearfix project-text">
                            <div class="project-prop flexC">
                                <img src="public/img/project-prop-1.png" alt="oda tipleri">
                                <div><span>Oda Tipleri :</span> <?= $project->room ?></div>
                            </div>
                        </div>
                    <?php endif; ?>
                    <?php if (!empty($project->price)): ?>
                        <div class="col-md-3 col-sm-6 mB30 clearfix project-text">
                            <div class="project-prop flexC">
                                <img src="public/img/project-prop-2.png" alt="fiyat">
                                <div><span>Fiyat :</span> <?= $project->price ?></div>
                            </div>
                        </div>
                    <?php endif; ?>
                    <?php if (!empty($project->loaction)): ?>
                        <div class="col-md-3 col-sm-6 mB30 clearfix project-text">
                            <div class="project-prop flexC">
                                <img src="public/img/project-prop-3.png" alt="lokasyon">
                                <div><span>Lokasyon :</span> <?= $project->location ?></div>
                            </div>
                        </div>
                    <?php endif; ?>
                    <?php if (!empty($project->type)): ?>
                        <div class="col-md-3 col-sm-6 mB30 clearfix project-text">
                            <div class="project-prop flexC">
                                <img src="public/img/project-prop-4.png" alt="proje tipi">
                                <div><span>Proje Tipi :</span> <?= $project->type ?></div>
                            </div>
                        </div>
                    <?php endif; ?>
                </div>

                <div class="row">
                    <div class="col-md-6 mB30 project-detail-img">
                        <a class="fancyBox" href="<?= uploadPath($project->image, 'project') ?>">
                            <img class="img-responsive center-block"
                                 src="<?= uploadPath($project->image, 'project') ?>"
                                 alt="<?= htmlspecialchars($project->title) ?>">
                        </a>
                        <?php if (!empty($project->file)): ?>
                            <a class="btnRed" href="<?= uploadPath($project->file, 'project/file') ?>" rel="external">
                                <i class="fa fa-file-pdf-o"></i> e-Katalog İndir
                            </a>
                        <?php endif; ?>
                    </div>
                    <div class="col-md-6 mB30">
                        <h4 class="m0 mB30 f9">Proje Özellikleri</h4>
                        <div class="project-detail-text">
                            <?= $project->projectDetail ?>
                        </div>
                    </div>
                    <?php if (!empty($project->images)): ?>
                        <div class="carousel-project mB30">
                            <div class="buttons" id="Next">
                                <i class="fa fa-angle-right"></i>
                            </div>
                            <div class="buttons" id="Prev">
                                <i class="fa fa-angle-left"></i>
                            </div>
                            <div id="project-gallery">
                                <?php foreach ($project->images as $image): ?>
                                    <div class="col-sm-12 carousel-item">
                                        <a class="fancyBox db" rel="gallery1"
                                           href="<?= uploadPath($image->image, 'project/normal') ?>">
                                            <div class="carousel-img">
                                                <img src="<?= uploadPath($image->image, 'project/thumb') ?>"
                                                     alt="<?= htmlspecialchars($project->title) ?>">
                                            </div>
                                        </a>
                                    </div>
                                <?php endforeach; ?>
                            </div>
                        </div>
                    <?php endif; ?>

                    <?php if (!empty($project->map)): ?>
                        <div class="col-xs-12 mB30">
                            <h4 class="m0 mB30 f9">Proje Lokasyonu</h4>
                            <div id="map-canvas" style="width: 100%; height: 350px;"></div>
                            <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true&libraries=places"></script>
                            <script type="text/javascript">
                                function initialize() {
                                    var konum = new google.maps.LatLng(<?php echo $project->map ?>);
                                    var mapOptions = {
                                        zoom: 17,
                                        center: konum,
                                        scrollwheel: false,
                                        draggable: false,
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

                                    var contentString = '<?php echo htmlspecialchars($project->title) ?>';

                                    var infowindow = new google.maps.InfoWindow({
                                        content: contentString
                                    });

                                    var marker = new google.maps.Marker({
                                        position: konum,
                                        map: map,
                                        icon: 'public/img/marker.png',
                                        title: '<?php htmlspecialchars($project->title) ?>'
                                    });

                                    if (marker.getAnimation() != null) {
                                        marker.setAnimation(null);
                                    } else {
                                        marker.setAnimation(google.maps.Animation.DROP);
                                    }

                                    google.maps.event.addListener(marker, 'click', function () {
                                        infowindow.open(map, marker);
                                    });
                                    console.log();
                                }
                                google.maps.event.addDomListener(window, 'load', initialize);
                            </script>
                        </div>
                    <?php endif; ?>


                </div>
            </div>
            <div class="w100 clearfix">
                <a class="btnBack sm pull-right" href="javascript:history.back();">
                    <i class="fa fa-arrow-left"></i> <?php echo lang('content-go-back') ?>
                </a>
                <div class="share-box clearfix">
                    <h5 class="share-caption"><?php echo lang('content-share-social') ?></h5>
                    <a class="btnShare facebook" href="http://facebook.com/sharer.php?u=<?php echo current_url() ?>"
                       data-toggle="tooltip" data-placement="top" title="<?php echo lang('content-share-facebook') ?>">
                        <i class="fa share"></i>
                        <span><?php echo lang('content-share-facebook') ?></span>
                    </a>

                    <a class="btnShare twitter"
                       href="https://twitter.com/share?url=<?php echo current_url() ?>&text=<?php echo htmlspecialchars($project->title) ?>"
                       data-toggle="tooltip" data-placement="top" title="<?php echo lang('content-share-twitter') ?>">
                        <i class="fa share"></i>
                        <span><?php echo lang('content-share-twitter') ?></span>
                    </a>

                    <a class="btnShare google-plus" href="https://plus.google.com/share?url=<?php echo current_url() ?>"
                       data-toggle="tooltip" data-placement="top" title="<?php echo lang('content-share-twitter') ?>">
                        <i class="fa share"></i>
                        <span><?php echo lang('content-share-google') ?></span>
                    </a>
                </div>
            </div>
        </div>
    </section>

    <?php if (!empty($projects)): ?>
        <section class="content-project">
            <div class="container">
                <div class="row">
                    <div class="carousel">
                        <div class="buttons" id="Next">
                            <i class="fa fa-angle-right"></i>
                        </div>
                        <div class="buttons" id="Prev">
                            <i class="fa fa-angle-left"></i>
                        </div>
                        <div id="project-carousel">

                            <?php foreach ($projects as $item): ?>
                                <?php if ($item->id !== $project->id): ?>
                                    <div class="col-sm-12 carousel-item">
                                        <a class="db"
                                           href="<?= clink(array('@project', $item->slug, $item->id)) ?>">
                                            <div class="carousel-img">
                                                <img src="<?= uploadPath($item->image, 'project') ?>"
                                                     alt="<?= htmlspecialchars($item->title) ?>">
                                            </div>
                                            <div class="caption">
                                                <h3 class="eclipse"><?= $item->title ?></h3>
                                                <span>Avantajlardan yararlanmak için tıklayın!</span>
                                            </div>
                                        </a>
                                    </div>
                                <?php endif; ?>
                            <?php endforeach; ?>

                        </div>
                    </div>
                </div>
            </div>
        </section>
    <?php endif; ?>

</main>