
<main id="main">
    <section class="banner">
        <div class="bread cover" style="background-image: url(public/img/baslik-bg.png);">
            <div class="container flexC">

                <div class="w100">
                    <div class="bread-title">
                        <h3><img src="public/img/fistik.png" />GALERİ</h3>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <div class="container">

        <div class="page-title">
            <?php echo $this->module->arguments->title ?>
        </div>

        <div class="galleries">
            <div class="row">

                <?php foreach ($galleries as $gallery): ?>
                    <div class="column col-md-3">
                        <div class="gallery">
                            <a href="<?php echo clink(array('@gallery', $gallery->slug, $gallery->id)) ?>">
                                <img class="img-responsive" src="<?php echo uploadPath($gallery->image, 'gallery') ?>" alt="<?php echo htmlspecialchars($gallery->title) ?>" style="margin-top: 30px;" />
                                <span><?php echo $gallery->title ?></span>
                            </a>
                        </div>
                    </div>
                <?php endforeach; ?>

            </div>

            <div class="text-center">
                <?php if (! empty($pagination)): ?>
                    <?php echo $pagination ?>
                <?php endif; ?>
            </div>
        </div>

    </div>
</main>
