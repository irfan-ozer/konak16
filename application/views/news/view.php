<main id="main">
    <section class="banner">
        <div class="bread cover" style="background-image: url(public/img/baslik-bg.png);">
            <div class="container flexC">

                <div class="w100">
                    <div class="bread-title">
                        <h3><img src="public/img/fistik.png" /><?= $news->title ?></h3>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <section class="content">
        <div class="container">
            <div class="content-body">
                <h1 class="f9 m0 mB30 title-effect" data-text="<?= htmlspecialchars($news->title) ?>">
                    <?= $news->title ?>
                    <br>
                    <small>
                        <?= $this->date->set($news->date)->dateWithName() ?>
                    </small>
                </h1>
                <?php if (! empty($news->image)): ?>
                    <img src="<?= uploadPath($news->image, 'news') ?>" style="margin: 0 15px 15px 0;" width="305"
                         alt="<?= htmlspecialchars($news->title) ?>" align="left" class="img-responsive">
                <?php endif; ?>
                <?= $news->detail ?>
                <div class="clearfix"></div>

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
                       href="https://twitter.com/share?url=<?php echo current_url() ?>&text=<?php echo htmlspecialchars($news->title) ?>"
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


</main>