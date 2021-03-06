<div class="row">
    <form action="" method="post" enctype="multipart/form-data">

        <div class="col-md-8">
            <?php echo $this->utils->alert(); ?>

            <div class="panel panel-default">
                <div class="panel-heading"><i class="fa fa-edit"></i> Kayıt Düzenle</div>
                <div class="panel-body">

                    <?php echo bsFormText('username', 'Kullanıcı Adı', array('required' => true, 'value' => $record->username)) ?>
                    <?php echo bsFormPassword('password', 'Parola') ?>
                    <?php echo bsFormDropdown('group', 'Kullanıcı Grubu', array(
                        'required' => true,
                        'value' => $record->groupId,
                        'options' => prepareForSelect($this->appmodel->getGroups(), 'id', 'name', 'Seçin')
                    )) ?>

                </div>

                <div class="panel-footer">
                    <button class="btn btn-success" type="submit">Gönder</button>
                </div>

            </div>
        </div>

    </form>
</div>