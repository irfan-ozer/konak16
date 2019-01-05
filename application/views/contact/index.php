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
                    <div class="col-md-5 mB30 clearfix contact-detail">
                        <section>
                            <h5 class="f7">Adres :</h5>
                            <div><?= $this->module->arguments->address ?></div>
                        </section>
                        <section>
                            <h5 class="f7">Telefon :</h5>
                            <div>
                                <?= $this->module->arguments->phone ?>
                            </div>
                        </section>
                        <section>
                            <h5 class="f7">E-Posta :</h5>
                            <div>
                                <a href="mailto:<?= $this->module->arguments->mail ?>">
                                    <?= $this->module->arguments->mail ?>
                                </a>
                            </div>
                        </section>

                    </div>

                    <div class="col-md-7 contactForm">
                        <div class="row">

                            <form method="post" action="<?php echo clink('@contact') ?>" accept-charset="utf-8">
                                <?php echo $this->site->alert() ?>

                                <div class="col-xs-12">
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <input type="text" class="form-control" placeholder="<?php echo lang('contact-fullname') ?>"
                                                       name="fullname" required="required" value="<?php echo set_value('fullname') ?>">
                                            </div>
                                        </div>

                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <input type="email" class="form-control" placeholder="<?php echo lang('contact-email') ?>"
                                                       name="email" required="required" value="<?php echo set_value('email') ?>" />
                                            </div>
                                        </div>

                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <input type="text" class="form-control mask-phone" placeholder="<?php echo lang('contact-phone') ?>"
                                                       name="phone" required="required" value="<?php echo set_value('phone') ?>" />
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-xs-12">
                                    <textarea class="form-control" placeholder="<?php echo lang('contact-message') ?>"
                                              name="comment" required="required" rows="8"><?php echo set_value('comment') ?></textarea>
                                </div>

                                <div class="col-xs-12 text-right mT15">
                                    <button type="submit" class="btn btnRed">
                                        <span class="glyphicon glyphicon-ok"></span>&nbsp; <?php echo lang('contact-send') ?>
                                    </button>
                                </div>

                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>



</main>
