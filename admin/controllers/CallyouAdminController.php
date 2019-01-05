<?php

use Sirius\Admin\Manager;

class CallyouAdminController extends Manager
{
    public $moduleTitle = 'Biz Sizi Arayalım';
    public $module = 'callyou';
    public $table = 'callyou';
    public $model = 'callyou';

    // Arama yapılacak kolonlar.
    public $search = array('fullname', 'phone');


    public $actions = array(
        'records' => 'list',
        'delete' => 'delete',
    );


} 