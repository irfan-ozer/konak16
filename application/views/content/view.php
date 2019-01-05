<main id="main">
    <section class="banner">
        <div class="bread cover" style="background-image: url(public/img/baslik-bg.png);">
            <div class="container flexC">

                <div class="w100">
                    <div class="bread-title">
                        <h3><img src="public/img/fistik.png" /><?= $content->title ?></h3>
                    </div>
                </div>

            </div>
        </div>
    </section>


    <section class="content">
        <div class="container">
            <div class="content-body">

                <div class="row">
                    <div class="col-sm-<?= ! empty($content->parent->childs) || ! empty($content->childs) ? 9 . " col-sm-push-3 col-xs-push-0" :12 ?>">
                        <?php if (! empty($content->image)): ?>
                            <img src="<?= uploadPath($content->image, 'content') ?>" style="max-width: 305px;
                            margin: 0 15px 15px 0;" alt="<?= htmlspecialchars($content->title) ?>" align="left">
                        <?php endif; ?>
                        <?= $content->detail ?>
                        <div class="clearfix"></div>
                    </div>

                    <?php if (! empty($content->parent->childs) || ! empty($content->childs)): ?>
                        <div class="col-sm-3 col-sm-pull-9 col-xs-pull-0">

                            <?php if (! empty($content->parent->childs)): ?>
                                <div class="list-group">
                                    <a class="list-group-item"
                                       href="<?php echo clink(array('@content', $content->parent->slug, $content->parent->id)) ?>"
                                       title="<?php echo $content->parent->title ?>">
                                        <?php echo $content->parent->title ?>
                                    </a>
                                    <?php foreach ($content->parent->childs as $child): ?>
                                        <a class="list-group-item <?php echo $content->id === $child->id ? 'active':'' ?>"
                                           href="<?php echo clink(array('@content', $child->slug, $child->id)) ?>"
                                           title="<?php echo $child->title ?>">
                                            <?php echo $child->title ?>
                                        </a>
                                    <?php endforeach; ?>
                                </div>
                            <?php endif; ?>

                            <?php if (! empty($content->childs)): ?>
                                <div class="list-group">
                                    <a class="list-group-item active"
                                       href="<?php echo clink(array('@content', $content->slug, $content->id)) ?>"
                                       title="<?php echo $content->title ?>">
                                        <?php echo $content->title ?>
                                    </a>
                                    <?php foreach ($content->childs as $child): ?>
                                        <a class="list-group-item"
                                           href="<?php echo clink(array('@content', $child->slug, $child->id)) ?>"
                                           title="<?php echo $child->title ?>">
                                            <?php echo $child->title ?>
                                        </a>
                                    <?php endforeach; ?>
                                </div>
                            <?php endif; ?>
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

                    <a class="btnShare twitter" href="https://twitter.com/share?url=<?php echo current_url() ?>&text=<?php echo htmlspecialchars($content->title) ?>"
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