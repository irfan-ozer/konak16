<?php

use Sirius\Admin\Manager;

class CommentAdminController extends Manager
{
    public $moduleTitle = 'Yorumlar';
    public $module = 'comment';
    public $table = 'comments';
    public $model = 'comment';
    public $type = 'public';
    public $icon = 'fa-comments';
    public $menuPattern = array(
        'moduleLink' => true,
        'language' => true
    );

    // Arama yapılacak kolonlar.
    public $search = array('fulname', 'email');


    // Filtreleme yapılacak querystring/kolonlar.
    public $filter = array('viewed');

    public $actions = array(
        'records' => 'list',
        'view' => 'view',
        'approve' => 'list',
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

    public function approve()
    {
        if (! $record = $this->appmodel->id($this->uri->segment(3))) {
            show_404();
        }

        $this->db->where('id', $this->uri->segment(3));
        if ( $record->approved == 1 ) {

            $this->db->update(
                $this->table, array(
                    'approved' => 0
                )
            );

        } else {

            $this->db->update(
                $this->table, array(
                    'approved' => 1
                )
            );

        }

        redirect($this->module.'/records');

    }






} 