
<div class="row">
    <form action="" method="post" enctype="multipart/form-data">
        <div class="col-md-8">
            <?php echo $this->utils->alert(); ?>

            <div class="panel panel-default">
                <div class="panel-heading"><i class="fa fa-plus-square"></i> Yeni Kayıt Ekle</div>
                <div class="panel-body">
                    <?php echo bsFormImage('image', 'Resim') ?>

                </div>
                <div class="panel-footer">
                    <button class="btn btn-success" type="submit">Kaydet</button>
                    <button class="btn btn-success" type="submit" name="redirect" value="<?php echo $this->module ?>/images/<?php echo $parent->id ?>">Kaydet ve Listeye Dön</button>
                    <a class="btn btn-default" href="<?php echo $this->module ?>/images/<?php echo $parent->id ?>">Vazgeç</a>
                </div>
            </div>
        </div>
    </form>
</div>