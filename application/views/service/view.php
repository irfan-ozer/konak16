<main id="main">
    <section class="banner">
        <div class="bread cover" style="background-image: url(public/img/baslik-bg.png);">
            <div class="container flexC">

                <div class="w100">
                    <div class="bread-title">
                        <h3><img src="public/img/fistik.png" /><?= $service->title ?></h3>
                    </div>
                </div>

            </div>
        </div>
    </section>


    <section class="content">
        <div class="container">
            <div class="row">
                <div class="col-sm-9 col-sm-push-3 col-xs-push-0">
                    <div class="content-body">
                        <?= $service->detail ?>
                    </div>
                </div>
                <div class="col-sm-3 col-sm-pull-9 col-xs-pull-0">
                    <div class="list-group">
                        <?php foreach ($all as $item): ?>
                            <a href="<?= clink(array('@service', $item->slug, $item->id)) ?>"
                               class="list-group-item <?= $item->id == $service->id ? 'active' : '' ?>">
                                <?= $item->title ?>
                            </a>
                        <?php endforeach; ?>
                    </div>
                </div>
            </div>

            <div class="w100 clearfix">
                <a class="btnBack sm pull-right" href="javascript:history.back();"><i class="fa fa-arrow-left"></i> Geri Dön</a>
                <div class="share-box clearfix">
                    <h5 class="share-caption">Sosyal Medyada Paylaş</h5>
                    <a class="btnShare facebook" href="http://facebook.com/sharer.php?u=<?php echo current_url() ?>"
                       data-toggle="tooltip" data-placement="top" title="<?php echo lang('service-share-facebook') ?>">
                        <i class="fa share"></i>
                        <span>Facebook</span>
                    </a>

                    <a class="btnShare twitter" href="https://twitter.com/share?url=<?php echo current_url() ?>&text=<?php echo htmlspecialchars($service->title) ?>"
                       data-toggle="tooltip" data-placement="top" title="<?php echo lang('service-share-twitter') ?>">
                        <i class="fa share"></i>
                        <span>Twitter</span>
                    </a>

                    <a class="btnShare google-plus" href="https://plus.google.com/share?url=<?php echo current_url() ?>"
                       data-toggle="tooltip" data-placement="top" title="<?php echo lang('service-share-google') ?>">
                        <i class="fa share"></i>
                        <span>Google Plus</span>
                    </a>
                </div>
            </div>
        </div>
    </section>


</main>