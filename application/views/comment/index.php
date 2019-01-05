<section id="main" class="batiBackWhite">
    <section class="banner">
        <div class="bread cover" style="background-image: url(public/img/baslik-bg.png);">
            <div class="container flexC">

                <div class="w100">
                    <div class="bread-title">
                        <h3><img src="public/img/fistik.png" />YORUMLAR</h3>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <div class="container">
        <div class=" padding-top-30 padding-bottom-30">
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-12 form" style="    margin-top: 50px;">
                    <h4>Yorum Bırakın</h4>
                    <?php echo $this->site->alert(); ?>



                    <form method="post" action="<?php echo clink('@comment') ?>#form" accept-charset="utf-8">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label><?= lang('contact-fullname') ?></label>
                                    <input type="text" name="fullname" required="required" class="form-control"
                                           value="<?php echo set_value('fullname') ?>" />
                                </div>

                            </div>
                            <div class="col-sm-6">

                                <div class="form-group">
                                    <label><?= lang('contact-email') ?></label>
                                    <input type="email" name="email" required="required" class="form-control"
                                           value="<?php echo set_value('email') ?>" />
                                </div>
                            </div>
                        </div>


                        <div class="form-group">
                            <label><?= lang('contact-message') ?></label>
                            <textarea name="comment" class="form-control" rows="5" style="resize: none;"
                                      required="required"><?php echo set_value('comment') ?></textarea>
                        </div>

                        <div class="form-group">
                            <button type="submit" class="btn btn-success"><?= lang('contact-send') ?></button>
                        </div>

                    </form>
                </div>
                <div class="col-md-6 col-xs-12 col-sm-6" style="    margin-top: 50px;">
                    <div class="information">
                        <h4>Yorumlar</h4>
                        <section class="comment-list">
                            <?php if ( ! empty($comments) ): ?>
                                <?php foreach ( $comments as $item ): ?>
                                    <!-- ## Comment -->
                                    <article class="row">
                                        <div class="col-md-3 col-sm-3 hidden-xs">
                                            <figure class="thumbnail">
                                                
                                                <figcaption class="text-center"><i class="fa fa-user"></i> <?= $item->fullname ?></figcaption>
                                            </figure>
                                        </div>
                                        <div class="col-md-9 col-sm-9">
                                            <div class="panel panel-default arrow left">
                                                <div class="panel-body comment">
                                                    <header class="text-left">
                                                        <time class="comment-date"
                                                              datetime="<?= $item->date ?>">
                                                            <i class="fa fa-clock-o"></i>
                                                            <?= $this->date->set($item->date)->datetimeWithName(); ?>
                                                        </time>
                                                    </header>
                                                    <div class="comment-post">
                                                        <p>
                                                            <?= $item->comment ?>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                <?php endforeach; ?>
                            <?php endif; ?>
                        </section>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

