<?php

use Sirius\Admin\Manager;

class ContactAdminController extends Manager
{
    public $moduleTitle = 'İletişim';
    public $module = 'contact';
    public $table = 'contacts';
    public $model = 'contact';
    public $type = 'public';
    public $menuPattern = array(
        'moduleLink' => true
    );

    // Arama yapılacak kolonlar.
    public $search = array('fulname', 'email');


    // Filtreleme yapılacak querystring/kolonlar.
     public $filter = array('viewed');

    public $actions = array(
        'records' => 'list',
        'view' => 'view',
        'delete' => 'delete',
    );


    public function view()
    {
        if (! $record = $this->appmodel->id($this->uri->segment(3))) {
            show_404();
        }

        $this->appmodel->viewed($record);

        $this->breadcrumb('Detaylar');

        $this->viewData['record'] = $record;

        $this->render('view');

    }





} 