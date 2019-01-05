<?php

use Sirius\Admin\Manager;

class BannerAdminController extends Manager
{
    public $moduleTitle = 'Bannerlar';
    public $module      = 'banner';
    public $table       = 'banners';
    public $model       = 'banner';

    // Arama yapılacak kolonlar.
    public $search = array('title');


    // Filtreleme yapılacak querystring/kolonlar.
    // public $filter = array('type');

    public $actions = array(
        'records' => 'list',
        'order'   => 'list',
        'insert'  => 'insert',
        'update'  => 'update',
        'delete'  => 'delete',
    );


    protected function insertAfterValidate()
    {
        $this->utils
            ->uploadInput('imageFile')
            ->minSizes(1920, 480)
            ->addProcessSize('normal', 1920, 480, 'banner', 'thumbnail');


        if ($this->input->post('imageUrl')) {
            $this->modelData['image'] = $this->utils->imageDownload(TRUE, $this->input->post('imageUrl'));
        } else {
            $this->modelData['image'] = $this->utils->imageUpload(TRUE);
        }
    }

    protected function updateAfterValidate($record)
    {
        $this->utils
            ->uploadInput('imageFile')
            ->minSizes(1920, 480)
            ->addProcessSize('normal', 1920, 480, 'banner', 'thumbnail');


        if ($this->input->post('imageUrl')) {
            $this->modelData['image'] = $this->utils->imageDownload(FALSE, $this->input->post('imageUrl'), $record->image);
        } else {
            $this->modelData['image'] = $this->utils->imageUpload(FALSE, $record->image);
        }
    }


} 