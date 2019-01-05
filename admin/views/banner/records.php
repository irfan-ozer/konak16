
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

                <a id="order-update" class="btn btn-sm btn-info hide" href="<?php echo $this->module ?>/order"><i class="fa fa-check-square"></i> Sırayı Güncelle</a>
            </div>
            <div class="col-md-8 text-right">
                <form class="form-inline" action="" method="get" id="filter" accept-charset="utf-8" style="display: inline-block;">
                    <?php $this->view('filter') ?>
                </form>
            </div>
        </div>
    </div>
    <div class="panel-body clearfix">
        <div class="row sortable">
            <?php foreach ($records as $item): ?>
                <div class="col-md-2" data-id="<?php echo $item->id ?>">
                    <p>
                        <a class="fancybox" href="../public/upload/banner/<?php echo $item->image ?>">
                            <img class="img-thumbnail img-responsive" src="../public/upload/banner/<?php echo $item->image ?>" alt="<?php echo htmlspecialchars($item->title) ?>" />
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
                            <?php if (! $this->input->get() || $this->input->get('page')): ?>
                                <a class="btn btn-xs btn-default sortable-handle"><i class="fa fa-arrows"></i></a>
                            <?php endif; ?>
                        </span>
                        <span class="clearfix"></span>
                    </div>

                    <div class="pull-right">
                        <?php if ($this->permission('update')): ?>
                            <a class="btn btn-xs btn-primary" href="<?php echo $this->module ?>/update/<?php echo $item->id ?>"><i class="fa fa-edit"></i></a>
                        <?php endif; ?>
                        <?php if ($this->permission('delete')): ?>
                            <a class="btn btn-xs btn-danger confirm-delete" href="<?php echo $this->module ?>/delete/<?php echo $item->id ?>"><i class="fa fa-trash-o"></i></a>
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