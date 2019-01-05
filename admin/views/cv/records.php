<?php
/*
$languages = $this->config->item('languages');
$insert = array();

foreach ($languages as $language => $label) {
    $data = array(
        array(
            'module' => 'cv',
            'name' => 'title',
            'title' => 'Sayfa Başlığı',
            'value' => null,
            'type' => 'text',
            'arguments' => json_encode(array('required' => true)),
            'language' => $language,
        ),
        array(
            'module' => 'cv',
            'name' => 'metaTitle',
            'title' => 'Meta Başlığı',
            'value' => null,
            'type' => 'text',
            'arguments' => json_encode(array()),
            'language' => $language,
        ),
        array(
            'module' => 'cv',
            'name' => 'metaDescription',
            'title' => 'Meta Tanımı',
            'value' => null,
            'type' => 'textarea',
            'arguments' => json_encode(array()),
            'language' => $language,
        ),
        array(
            'module' => 'cv',
            'name' => 'metaKeywords',
            'title' => 'Meta Anahtar Kelimeleri',
            'value' => null,
            'type' => 'textarea',
            'arguments' => json_encode(array()),
            'language' => $language,
        ),
        array(
            'module' => 'cv',
            'name' => 'notification',
            'title' => 'Bildirim Gönderimi',
            'value' => 0,
            'type' => 'dropdown',
            'arguments' => json_encode(array('required' => true, 'options' => array('0' => 'Bildirim Gönderme', '1' => 'Bilgirim Gönder'))),
            'language' => $language,
        ),
        array(
            'module' => 'cv',
            'name' => 'notificationMail',
            'title' => 'Bildirim Maili',
            'value' => null,
            'type' => 'text',
            'arguments' => json_encode(array()),
            'language' => $language,
        ),

        array(
            'module' => 'cv',
            'name' => 'detail',
            'title' => 'İnsan Kaynakları Yazısı',
            'value' => null,
            'type' => 'editor',
            'arguments' => json_encode(array('required' => true)),
            'language' => $language,
        ),
    );


    $insert = array_merge($insert, $data);
}

$this->db->insert_batch('module_arguments', $insert);
*/
?>
<?php echo $this->utils->alert(); ?>

<div class="panel panel-default">
    <div class="panel-heading"><i class="fa fa-table"></i> <?php echo $this->moduleTitle ?></div>
    <div class="panel-toolbar clearfix">
        <div class="row">
            <div class="col-md-4">
                <?php if ($this->permission('delete')): ?>
                    <a class="btn btn-sm btn-info checkall" data-toggle="button"><i class="fa fa-check-square-o"></i> Hepsini Seç</a>
                    <a class="btn btn-sm btn-danger deleteall" href="<?php echo $this->module ?>/delete"><i class="fa fa-trash-o"></i></a>
                <?php endif; ?>
                <?php if ($this->permission('insert')): ?>
                    <a class="btn btn-sm btn-success" href="<?php echo $this->module ?>/insert"><i class="fa fa-plus"></i> Yeni Kayıt</a>
                <?php endif; ?>
            </div>
            <div class="col-md-8 text-right">
                <form class="form-inline" action="" method="get" id="filter" accept-charset="utf-8" style="display: inline-block;">

                    <?php echo bsFormDropdown('viewed', 'Okunma : ', array(
                        'value' => $this->input->get('viewed'),
                        'options' => array('' => 'Hepsi', 'true' => 'Okunanlar', 'false' => 'Okunmayanlar'),
                        'class' => 'input-sm'
                    )); ?>

                    <?php $this->view('filter') ?>

                </form>
            </div>
        </div>
    </div>
    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <th width="40" class="text-center"><i class="fa fa-ellipsis-v"></i></th>
            <th width="50">#</th>
            <th>İsim</th>
            <th>Telefon</th>
            <th>E-Mail</th>
            <th width="100" class="text-center">Okundu</th>
            <th width="100" class="text-right">İşlem</th>
        </tr>
        </thead>
        <tbody>
        <?php foreach ($records as $item): ?>
        <tr>
            <td class="text-center"><input type="checkbox" class="checkall-item" value="<?php echo $item->id ?>" /></td>
            <td><?php echo $item->id ?></td>
            <td><?php echo $item->fullname ?></td>
            <td><?php echo $item->phone ?></td>
            <td><?php echo $item->email ?></td>
            <td class="text-center"><i class="fa fa-check-circle <?php echo $item->viewed == 1 ? 'text-success':'text-muted' ?>"></i></td>
            <td class="text-right">
                <?php if ($this->permission('view')): ?>
                <a class="btn btn-xs btn-primary" href="<?php echo $this->module ?>/view/<?php echo $item->id ?>"><i class="fa fa-eye"></i></a>
                <?php endif; ?>
                <?php if ($this->permission('delete')): ?>
                <a class="btn btn-xs btn-danger confirm-delete" href="<?php echo $this->module ?>/delete/<?php echo $item->id ?>"><i class="fa fa-trash-o"></i></a>
                <?php endif; ?>
            </td>
        </tr>
        <?php endforeach; ?>
        </tbody>
    </table>

    <?php if (! empty($pagination)): ?>
        <div class="panel-footer">
            <?php echo $pagination ?>
        </div>
    <?php endif; ?>
</div>