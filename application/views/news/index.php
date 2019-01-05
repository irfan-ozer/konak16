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

                    <?php if (! empty($newscast)): ?>
                        <?php foreach ($newscast as $item): ?>
                            <div class="col-sm-3">
                                <a href="<?= clink(array('@news', $item->slug, $item->id)) ?>" class="db">
                                    <div class="project-item">
                                        <div class="project-img">
                                            <img src="<?= uploadPath($item->image, 'news') ?>"
                                                 alt="<?= htmlspecialchars($item->title) ?>">
                                        </div>
                                        <div class="newsContent">
                                            <h1 class="f9"
                                                data-text="<?= htmlspecialchars($item->title) ?>">
                                                <?= $item->title ?>
                                            </h1>
                                            <p>
                                                <?= $item->summary ?>
                                            </p>
                                        </div>
                                    </div>
                                </a>
                            </div>

                        <?php endforeach; ?>
                    <?php endif; ?>


                </div>

                <div class="clearfix"></div>

                <div class="text-center">
                    <?php if (! empty($pagination)): ?>
                        <?php echo $pagination ?>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </section>


</main>