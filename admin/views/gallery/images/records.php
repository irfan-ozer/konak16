
<?php echo $this->utils->alert(); ?>

<div class="panel panel-default">
    <div class="panel-heading"><i class="fa fa-table"></i> <?php echo $this->moduleTitle ?></div>
    <div class="panel-toolbar clearfix">
        <div class="row">
            <div class="col-md-4">
                <?php if ($this->permission('image-delete')): ?>
                    <a class="btn btn-sm btn-info checkall" data-toggle="button"><i class="fa fa-check-square-o"></i> Hepsini Seç</a>
                    <a class="btn btn-sm btn-danger deleteall" href="<?php echo $this->module ?>/imageDelete"><i class="fa fa-trash-o"></i></a>
                <?php endif; ?>
                <?php if ($this->permission('image-insert')): ?>
                    <a id="modal-plupload-button" class="btn btn-success btn-sm" href="<?php echo $this->module ?>/imageInsert/<?php echo $parent->id ?>"><i class="fa fa-plus"></i> Yeni Kayıt Ekle</a>
                <?php endif; ?>

                <a id="order-update" class="btn btn-sm btn-info hide" href="<?php echo $this->module ?>/imageOrder"><i class="fa fa-check-square"></i> Sırayı Güncelle</a>
            </div>

        </div>
    </div>
    <div class="panel-body clearfix">
        <div class="row sortable">
            <?php foreach ($records as $item): ?>
                <div class="image-thumbs col-md-2" data-id="<?php echo $item->id ?>">
                    <p>
                        <a class="fancybox" href="../public/upload/gallery/normal/<?php echo $item->image ?>">
                            <img class="img-thumbnail img-responsive" src="../public/upload/gallery/thumb/<?php echo $item->image ?>" />
                        </a>
                    </p>

                    <div class="pull-left">
                        <div class="checkbox pull-left">
                            <label>
                                <input type="checkbox" class="checkall-item" value="<?php echo $item->id ?>" />
                            </label>
                        </div>
                        <span class="btn-group pull-left">
                            <a class="btn btn-xs btn-info disabled"><?php echo $item->order ?></a>
                            <?php if (! $this->input->get()): ?>
                                <a class="btn btn-xs btn-default sortable-handle"><i class="fa fa-arrows"></i></a>
                            <?php endif; ?>
                        </span>
                        <span class="clearfix"></span>
                    </div>

                    <div class="pull-right">
                        <?php if ($this->permission('update')): ?>
                            <a class="btn btn-xs btn-primary" href="<?php echo $this->module ?>/imageUpdate/<?php echo $item->id ?>"><i class="fa fa-edit"></i></a>
                        <?php endif; ?>
                        <?php if ($this->permission('delete')): ?>
                            <a class="btn btn-xs btn-danger confirm-delete" href="<?php echo $this->module ?>/imageDelete/<?php echo $item->id ?>"><i class="fa fa-trash-o"></i></a>
                        <?php endif; ?>
                    </div>
                </div>
            <?php endforeach; ?>

        </div>
    </div>

    <?php if (! empty($pagination)): ?>
        <div class="panel-footer">
            <?php echo $pagination ?>
        </div>
    <?php endif; ?>
</div>