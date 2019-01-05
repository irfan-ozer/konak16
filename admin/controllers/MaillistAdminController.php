<?php

use Sirius\Admin\Manager;

class MaillistAdminController extends Manager
{
    public $moduleTitle = 'E-Mail Listesi';
    public $module = 'maillist';
    public $table = 'maillist';
    public $model = 'maillist';
    public $type = 'public';
    public $menuPattern = array(
        'moduleLink' => true
    );

    // Arama yapılacak kolonlar.
    public $search = array('fulname', 'email');


    public $actions = array(
        'records' => 'list',
        'delete' => 'delete',
    );


} 