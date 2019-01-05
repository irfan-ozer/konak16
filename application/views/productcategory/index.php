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

            <div class="col-md-10">

                <div class="col-md-12 urunlerbox">
                    <?php $c=50; foreach ($categories as $urunler): ?>
                    	<div class="col-sm-3">
                            <a href="<?= clink(array('@productcategory', $urunler->slug, $urunler->id)) ?>" class="db">
                                <div class="project-item">
                                    <div class="project-img">
                                        <img src="<?= uploadPath($urunler->image, 'productcategory') ?>"
                                             alt="<?= htmlspecialchars($urunler->title) ?>">
                                    </div>
                                    <div class="newsContent">
                                        <h1 class="f9"
                                            data-text="<?= htmlspecialchars($urunler->title) ?>">
                                            <?= $urunler->title ?>
                                        </h1>
                                    </div>
                                </div>
                            </a>
                        </div>
                    	
                    
                        
                    <?php endforeach; ?>
                </div>


            </div>


        </div>
    </section>