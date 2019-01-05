
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
        
        </div>

        <div class="galleries">
            <div class="row">

                <?php foreach ($gallery->images as $image): ?>
                    <div class="column col-md-3">
                        <div class="gallery">
                            <a class="fancybox" rel="gallery" href="<?php echo uploadPath($image->image, 'gallery/normal') ?>">
                                <img class="img-responsive thumbnail" src="<?php echo uploadPath($image->image, 'gallery/thumb') ?>" style="margin-top:30px; margin-bottom:10px;"/>
                            </a>
                        </div>
                    </div>
                <?php endforeach; ?>

            </div>

            <div class="buttons">
                <a class="btn btn-primary btn-sm" href="javascript:history.back();"><span class="glyphicon glyphicon-circle-arrow-left"></span> <?php echo lang('gallery-go-back') ?></a>
                <a class="btn btn-primary btn-sm" href="<?php echo clink('@gallery') ?>"><?php echo lang('gallery-all-galleries') ?></a>
            </div>
        </div>

    </div>
</main>
