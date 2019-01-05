
<div class="row">
    <div class="col-md-4">

        <div class="panel panel-default">
            <div class="panel-heading"><i class="fa fa-edit"></i> Detay Görüntüle</div>
            <div class="panel-body">

                <div class="form-group">
                    <label>İsim</label>
                    <p class="form-control-static"><?php echo htmlspecialchars($record->fullname) ?></p>
                </div>

                <div class="form-group">
                    <label>Telefon</label>
                    <p class="form-control-static"><?php echo htmlspecialchars($record->phone) ?></p>
                </div>

                <div class="form-group">
                    <label>E-Mail</label>
                    <p class="form-control-static"><a href="mailto:<?php echo htmlspecialchars($record->email) ?>"><?php echo htmlspecialchars($record->email) ?></a></p>
                </div>

                <div class="form-group">
                    <label>Tarih</label>
                    <p class="form-control-static"><?php echo $this->date->set($record->date)->datetimeWithName() ?></p>
                </div>

                <div class="form-group">
                    <label>IP</label>
                    <p class="form-control-static"><?php echo $record->ip ?></p>
                </div>


            </div>
        </div>
    </div>


    <div class="col-md-8">
        <?php echo $this->utils->alert(); ?>

        <div class="panel panel-default">
            <div class="panel-heading"><i class="fa fa-edit"></i> Mesaj</div>
            <div class="panel-body">


                <div class="form-group">
                    <p class="form-control-static"><?php echo htmlspecialchars($record->comment) ?></p>
                </div>


            </div>
            <div class="panel-footer">
                <a class="btn btn-default" href="<?php echo $this->module ?>/records">Geri Dön</a>
            </div>
        </div>
    </div>

</div>

