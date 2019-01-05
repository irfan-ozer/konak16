<?php $projects = $this->project->all() ?>

<?php if (! empty($projects)): ?>
    <section class="content-project">
        <div class="container">
            <div class="row">
                <div class="carousel">
                    <div class="buttons" id="Next">
                        <i class="fa fa-angle-right"></i>
                    </div>
                    <div class="buttons" id="Prev">
                        <i class="fa fa-angle-left"></i>
                    </div>
                    <div id="project-carousel">

                        <?php foreach ($projects as $project): ?>
                            <div class="col-sm-12 carousel-item">
                                <a class="db"
                                   href="<?= clink(array('@project', $project->slug, $project->id)) ?>">
                                    <div class="carousel-img">
                                        <img src="<?= uploadPath($project->image, 'project') ?>"
                                             alt="<?= htmlspecialchars($project->title) ?>">
                                    </div>
                                    <div class="caption">
                                        <h3 class="eclipse"><?= $project->title ?></h3>
                                        <span>Avantajlardan yararlanmak için tıklayın!</span>
                                    </div>
                                </a>
                            </div>
                        <?php endforeach; ?>

                    </div>
                </div>
            </div>
        </div>
    </section>
<?php endif; ?>
