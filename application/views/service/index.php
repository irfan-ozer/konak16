<main id="main">
    <section class="banner">
        <div class="bread cover" style="background-image: url(public/img/baslik-bg.png);">
            <div class="container flexC">

                <div class="w100">
                    <div class="bread-title">
                        <h3><img src="public/img/fistik.png" /><?= $this->module->arguments->title ?></h3>
                    </div>
                </div>

            </div>
        </div>
    </section>


    <section class="content">
        <div class="container">
            <div class="content-body">
                <div class="row">

                    <?php if (! empty($services)): ?>
                        <?php foreach ($services as $service): ?>
                            <div class="service-item clearfix">
                                <div class="col-md-3 mB30">
                                    <a class="db service-img"
                                       href="<?= clink(array('@service', $service->slug, $service->id)) ?>">
                                        <img class="img-responsive center-block"
                                             src="<?= uploadPath($service->image, 'service') ?>"
                                             alt="<?= htmlspecialchars($service->title) ?>">
                                    </a>
                                </div>
                                <div class="col-md-9 mB30 clearfix">
                                    <a class="db" href="<?= clink(array('@service', $service->slug, $service->id)) ?>">
                                        <h2 class="service-title title-effect"
                                            data-text="<?= htmlspecialchars($service->title) ?>">
                                            <?= $service->title ?>
                                        </h2>
                                    </a>
                                    <p>
                                        <?= $service->summary ?>
                                    </p>
                                    <a class="btnRed md pull-right" href="<?= clink(array('@service', $service->slug, $service->id)) ?>">Detaylar</a>
                                </div>
                            </div>
                        <?php endforeach; ?>
                    <?php endif; ?>

                    <div class="clearfix"></div>

                    <div class="text-center">
                        <?php if (! empty($pagination)): ?>
                            <?php echo $pagination ?>
                        <?php endif; ?>
                    </div>

                </div>
            </div>
        </div>
    </section>


</main>
