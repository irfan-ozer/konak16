
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
            <th>Tarih</th>
            <th>IP</th>
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
            <td><?php echo $item->mail ?></td>
            <td><?php echo $this->date->set($item->date)->datetimeWithName() ?></td>
            <td><?php echo $item->ip ?></td>

            <td class="text-right">
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