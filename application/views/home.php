
<main id="main">
    <section class="banner">

        <div class="slider" id="banner">
            <?php if (isset($this->banner)): ?>
                <?php $this->view('banner/slider') ?>
            <?php endif; ?>
        </div>
    </section>

    <?php if (! empty($services)): ?>
        <section class="main-project">
            <div class="container">

                <div class="row">
                    <?php foreach ($services as $key => $service): ?>
                        <!--                        --><?php //var_dump($service) ?>
                        <?php if ($key ==0): ?>
                            <div class="col-sm-6 services" style=" position: relative;    ">
                                <a class="db" href="<?= clink(array('@service', $service->slug, $service->id)) ?>">
                                    <div class="serviceImg " style="  position: relative;                                 ">
                                    
                                        <img src="public/img/kuruyem.png"
                                        alt="<?= htmlspecialchars($service->title) ?>"  style=" position: relative;">  <div class="btnRed" style="     position: absolute;
    right: 0;
    z-index: 66;
    line-height: 20px;
    height: 37px;
    bottom: 0;">DETAYLAR</div>
                                        <?php  if (!empty($service->youtube) ){
                                            echo '<a href="'.$service->youtube.'"></a> <div class="click"></div>';
                                        } ?>

                                    </div>


                                </a>
                            </div>
                        <?php endif; ?>
                        <?php if ($key ==1): ?>
                            <div class="col-sm-6 services" style="position: relative;  ">
                                <a class="db" href="<?= clink(array('@service', $service->slug, $service->id)) ?>">
                                    <div class="serviceImg" style="   position: relative;                       ">
                                        
                                        <img src="public/img/t2s.png""
                                             alt="<?= htmlspecialchars($service->title) ?>" class="haiti">
                                        <!--<div class="btnRed" style="       position: absolute;
    right: 0;
    z-index: 66;
    line-height: 20px;
    height: 37px;
    bottom: 0;">DETAYLAR</div>-->
                                        <?php  if (!empty($service->youtube) ){
                                            echo '<a href="'.$service->youtube.'"></a> <div class="click"></div>';
                                        } ?>

                                    </div>


                                </a>
                            </div>
                            
                        <?php endif; ?>
                        <?php if ($key ==2): ?>
                            <div class="col-sm-6 services " style=" position: relative; ">
                                <a class="db" href="<?= clink(array('@service', $service->slug, $service->id)) ?>">
                                    <div class="serviceImg" style="  position: relative;   
                                    ">
                                        
                                        <img src="<?= uploadPath($service->image, 'service') ?>"
                                             alt="<?= htmlspecialchars($service->title) ?>" style="  position:relative;                                       ">
                                        <div class="btnRed btnposi" style="   ">DETAYLAR</div>
                                        <?php  if (!empty($service->youtube) ){
                                            echo '<a href="'.$service->youtube.'"></a> <div class="click"></div>';
                                        } ?>

                                    </div>


                                </a>
                            </div>
                        <?php endif; ?>



                    <?php endforeach; ?>
                </div>
            </div>
        </section>

    <?php endif; ?>

    <?php if (! empty($reserved)): ?>
        <section class="main-company ">
            <div class="container">
                <div class="row">
                   
                    <div class="col-md-6 leftmarg" style="text-align: center;">
                        <h2 class="f9 title-effect" data-text="<?= htmlspecialchars($reserved->title) ?>">
                            <?= $reserved->title ?>
                        </h2>
                        <p class="reserved text-justify"  style="    text-align: center;">
                            <?= $reserved->summary ?>
                        </p>
                        <a class="btnRed mT15" href="<?= clink(array('@content', $reserved->slug, $reserved->id))
                        ?>">DETAYLAR</a>
                    </div>
                </div>
            </div>
        </section>
    <?php endif; ?>

    <?php if (! empty($newsRecords)): ?>
        <section class="main-project" style="position: relative;">
            <div class="container" style="position: relative;">
                <div class="col-md-4" style="position: relative;">
                   
                    <div class="col-sm-12  carousel-item top80" style="">
                        <a class="db" href="yorumlar" style="    position: relative;"> 
                            <div class="carousel-img" style="    position: relative;">
                                <img src="public/img/yorum.png"        alt="" style="    position: relative;">
                            </div>
                            <div class="caption" style="" >
                                <span class="ziyaret"  style="   ">Ziyaretçi Defteri</span>
                                <span class="zi2" ><?= $this->arguments->get('comment', 'title') ?></span>
                                <span class="btnRed ayla" style="   ">Tüm Yorumlar</span>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-8 flat" style="    margin-top: 30px;">
                    
                <h1 class="newsTitle mobtit" style="font-weight: 700;">BİZDEN HABERLER</h1>

                <div class="carousel">
                    <?php if (count($newsRecords) > 3): ?>
                        <div class="buttons" id="Next">
                            <i class="fa fa-angle-right"></i>
                        </div>
                        <div class="buttons" id="Prev">
                            <i class="fa fa-angle-left"></i>
                        </div>
                    <?php endif; ?>
                    <div id="project-carousel">

                        <?php foreach ($newsRecords as $item): ?>
                            <div class="col-sm-12 thumbnail carousel-item">
                                <a class="db" href="<?= clink(array('@news', $item->slug, $item->id)) ?>">
                                    <div class="carousel-img">
                                        <img src="<?= uploadPath($item->image, 'news') ?>"
                                             alt="<?= htmlspecialchars($item->title) ?>">
                                    </div>
                                    <div class="caption" style="        height: 185px;">
                                        <h3 class="eclipse" style="    line-height: 22px;"><?= $item->title ?></h3>
                                        <h5 class="eclipse" style="color:#949493;"><?= $item->summary ?></h5>
                                        <span class="btnRed" style="color:White;  font-size: 14px;">DETAYLAR</span>
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

    
</main>
