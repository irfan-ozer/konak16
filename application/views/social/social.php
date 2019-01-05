<div class="socials">
    <?php foreach ($this->social->all() as $social): ?>
        <a href="<?php echo $social->link ?>" title="<?php echo htmlspecialchars($social->title) ?>" target="_blank">
            <img src="<?php echo uploadPath($social->image, 'social') ?>" alt="<?php echo htmlspecialchars($social->title) ?>" />
        </a>
    <?php endforeach; ?>
</div>