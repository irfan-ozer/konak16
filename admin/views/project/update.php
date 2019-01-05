<div class="row">
    <form action="" method="post" enctype="multipart/form-data">
        <div class="col-md-8">
            <?php echo $this->utils->alert(); ?>

            <div class="panel panel-default">
                <div class="panel-heading"><i class="fa fa-edit"></i> Kayıt Düzenle</div>
                <div class="panel-body">

                    <?php echo bsFormText('title', 'Başlık', array('required' => true, 'value' => $record->title)) ?>
                    <?php echo bsFormSlug('slug', 'Slug', array('required' => true, 'value' => $record->slug)) ?>
                    <?php echo bsFormImage('image', 'Resim', array('value' => $record->image, 'path' => '../public/upload/project/')) ?>
                    <?= bsFormFile('file', 'e-Katalog', array(
                        'path' => '../public/upload/project/file/',
                        'value' => $record->file
                    )) ?>
                    <?= bsFormText('map', 'Proje Google Map Koordinatları', array(
                        'class' => 'latlng',
                        'value' => $record->map
                        )) ?>
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
                    <div id="map-canvas" style="width: 100%; height: 300px;" data-lat="<?= $lat ?>"
                         data-lng="<?= $lng ?>"></div>
                    <?php echo bsFormTextarea('summary', 'Özet', array('required' => true, 'value' => $record->summary)) ?>
                    <?php echo bsFormEditor('detail', 'Detay', array('value' => $record->detail)) ?>
                    <?php echo bsFormEditor('projectDetail', 'Proje Özellikleri', array(
                        'value' => $record->projectDetail)) ?>


                </div>
                <div class="panel-footer">
                    <button class="btn btn-success" type="submit">Kaydet</button>
                    <a class="btn btn-default" href="<?php echo $this->module ?>/records">Vazgeç</a>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading"><i class="fa fa-plus-square"></i> Diğer Özellikler</div>

                <div class="panel-body">
                    <?php echo bsFormText('room', 'Oda Tipleri', array('value' => $record->room)) ?>
                    <?php echo bsFormText('price', 'Fiyat', array('value' => $record->price)) ?>
                    <?php echo bsFormText('location', 'Lokasyon', array('value' => $record->location)) ?>
                    <?php echo bsFormText('type', 'Proje Tipi', array('value' => $record->type)) ?>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading"><i class="fa fa-plus-square"></i> Meta Bilgileri</div>

                <div class="panel-body">
                    <?php echo bsFormText('metaTitle', 'Title', array('value' => $record->metaTitle)) ?>
                    <?php echo bsFormTextarea('metaDescription', 'Description', array('value' => $record->metaDescription)) ?>
                    <?php echo bsFormTextarea('metaKeywords', 'Keywords', array('value' => $record->metaKeywords)) ?>
                </div>
            </div>
        </div>
    </form>
</div>

