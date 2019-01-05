<div id="layerslider" style="width: 100%; height: 480px;">
    <?php foreach ($this->banner->all() as $banner): ?>
        <div class="ls-slide" data-ls="slidedelay: <?php echo $banner->delay ?>; <?php echo $banner->transition ?>">
            <img class="ls-bg" src="public/upload/banner/<?php echo $banner->image ?>" alt="<?php echo $banner->title ?>" />

            <?php if (! empty($banner->text)): ?>
                <?php
                $top = 285;
                $delayin = 200;
                ?>

            <div class="ls-l text" style="top: <?php echo $top ?>px; left: 0;" data-ls="delayin: <?php echo $delayin ?>; offsetxin: -150; offsetxout: 150;">
                <div class="bannerDiv">
                    <?php if (! empty($banner->title)): ?>
                        <h1><?= $banner->title ?></h1>
                    <?php endif; ?>
                    <p><?php echo $banner->text ?></p>
                </div>
            </div>
            <?php endif; ?>

            <?php echo !empty($banner->link) ? '<a class="ls-link" href="'. $banner->link .'" title="'. $banner->title .'"></a>':'' ?>
        </div>
    <?php endforeach; ?>
</div>