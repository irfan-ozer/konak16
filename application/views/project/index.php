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

                    <?php if (! empty($projects)): ?>
                        <?php foreach ($projects as $project): ?>
                            <div class="project-item clearfix mB30">
                                <div class="col-sm-5">
                                    <div class="project-img">
                                        <img src="<?= uploadPath($project->image, 'project') ?>"
                                             alt="<?= htmlspecialchars($project->title) ?>">
                                        <a class="btnRed trlX"
                                           href="<?= clink(array('@project', $project->slug, $project->id)) ?>">
                                            Detaylar
                                        </a>
                                    </div>
                                </div>
                                <div class="col-sm-7 project-text">
                                    <a class="db" href="<?= clink(array('@project', $project->slug, $project->id)) ?>">
                                        <h1 class="f9 title-effect"
                                            data-text="<?= htmlspecialchars($project->title) ?>">
                                            <?= $project->title ?>
                                        </h1>
                                    </a>
                                    <div class="row hidden-xs">
                                        <div class="col-sm-6 mB30 clearfix">
                                            <div class="project-prop flexC">
                                                <img src="public/img/project-prop-1.png" alt="">
                                                <div><span>Oda Tipleri :</span> <?= $project->room ?></div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 mB30 clearfix">
                                            <div class="project-prop flexC">
                                                <img src="public/img/project-prop-2.png" alt="">
                                                <div><span>Fiyat :</span> <?= $project->price ?> TL</div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 mB30 clearfix">
                                            <div class="project-prop flexC">
                                                <img src="public/img/project-prop-3.png" alt="">
                                                <div><span>Lokasyon :</span> <?= $project->location ?></div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 mB30 clearfix">
                                            <div class="project-prop flexC">
                                                <img src="public/img/project-prop-4.png" alt="">
                                                <div><span>Proje Tipi :</span> <?= $project->type ?></div>
                                            </div>
                                        </div>
                                    </div>
                                    <p>
                                        <?= $project->summary ?>
                                    </p>
                                </div>
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