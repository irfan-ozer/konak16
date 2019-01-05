
<div class="row">
    <form action="" method="post" enctype="multipart/form-data">
        <div class="col-md-8">
            <?php echo $this->utils->alert(); ?>

            <div class="panel panel-default">
                <div class="panel-heading"><i class="fa fa-plus-square"></i> Yeni Kayıt Ekle</div>
                <div class="panel-body">

                    <?php echo bsFormText('title', 'Başlık', array('required' => true)) ?>
                    <?php echo bsFormSlug('slug', 'Slug', array('checked' => true)) ?>
                    <?php echo bsFormImage('image', 'Resim') ?>
                    <?= bsFormFile('file', 'e-Katalog') ?>
                    <?php echo bsFormTextarea('summary', 'Özet', array('required' => true)) ?>
                    <?= bsFormText('map', 'Proje Google Map Koordinatları', array('class' => 'latlng')) ?>
                    <input id="pac-input" class="controls" type="text"
                           placeholder="Enter a location">
                    <div id="type-selector" class="controls">
                        <input type="radio" name="type" id="changetype-all" checked="checked">
                        <label for="changetype-all">All</label>

                        <input type="radio" name="type" id="changetype-establishment">
                        <label for="changetype-establishment">Establishments</label>

                        <input type="radio" name="type" id="changetype-address">
                        <label for="changetype-address">Addresses</label>

                        <input type="radio" name="type" id="changetype-geocode">
                        <label for="changetype-geocode">Geocodes</label>
                    </div>

                    <div id="map-canvas" style="width: 100%; height: 300px;" data-lat="38.43001" data-lng="27.14729"></div>
                    <?php echo bsFormEditor('detail', 'Detay') ?>
                    <?php echo bsFormEditor('projectDetail', 'Proje Özellikleri') ?>

                </div>
                <div class="panel-footer">
                    <button class="btn btn-success" type="submit">Kaydet</button>
                    <button class="btn btn-success" type="submit" name="redirect" value="<?php echo $this->module ?>/records">Kaydet ve Listeye Dön</button>
                    <a class="btn btn-default" href="<?php echo $this->module ?>/records">Vazgeç</a>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading"><i class="fa fa-plus-square"></i> Diğer Özellikler</div>

                <div class="panel-body">
                    <?php echo bsFormText('room', 'Oda Tipleri') ?>
                    <?php echo bsFormText('price', 'Fiyat') ?>
                    <?php echo bsFormText('location', 'Lokasyon') ?>
                    <?php echo bsFormText('type', 'Proje Tipi') ?>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading"><i class="fa fa-plus-square"></i> Seo Ayarları</div>

                <div class="panel-body">
                    <?php echo bsFormText('metaTitle', 'Title') ?>
                    <?php echo bsFormTextarea('metaDescription', 'Description') ?>
                    <?php echo bsFormTextarea('metaKeywords', 'Keywords') ?>
                </div>
            </div>
        </div>
    </form>
</div>
