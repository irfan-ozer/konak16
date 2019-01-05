<?php

use Sirius\Admin\Manager;

class SocialAdminController extends Manager
{
    public $moduleTitle = 'Sosyal Ağlar';
    public $module = 'social';
    public $table = 'socials';
    public $model = 'social';
    public $icon = 'fa-retweet';


    // Arama yapılacak kolonlar.
    public $search = array('title');


    // Filtreleme yapılacak querystring/kolonlar.
    // public $filter = array('type');


    public $icons = array(
        'Facebook' => 'fa fa-facebook',
        'Facebook Kare' => 'fa fa-facebook-official',
        'Twitter' => 'fa fa-twitter',
        'Twitter Kare' => 'fa fa-twitter-square',
        'Google' => 'fa fa-google',
        'Google Plus' => 'fa fa-google-plus',
        'Google Plus Kare' => 'fa fa-google-plus-square',
        'Instagram' => 'fa fa-instagram',
        'Linkedin' => 'fa fa-linkedin',
        'Linkedin Kare' => 'fa fa-linkedin-square',
        'Youtube' => 'fa fa-youtube',
        'Youtube Kare' => 'fa fa-youtube-square',
        'Tripadvisor' => 'fa fa-tripadvisor',
        'Flickr' => 'fa fa-flickr',
        'Pinterest' => 'fa fa-pinterest',
        'Pinterest Kare' => 'fa fa-pinterest-square',
        'Pinterest Sade' => 'fa fa-pinterest-p',
        'Vimeo' => 'fa fa-vimeo',
        'Vimeo Kare' => 'fa fa-vimeo-square',
    );

    public $actions = array(
        'records' => 'list',
        'order' => 'list',
        'insert' => 'insert',
        'update' => 'update',
        'delete' => 'delete',
    );

    protected function insertRequest()
    {
        $this->viewData['icons'] = $this->icons;
    }

    protected function insertValidateRules()
    {
        $this->form_validation->set_rules('title', 'Lütfen Başlık yazınız.', 'required');
        $this->form_validation->set_rules('link', 'Lütfen Bağlantı yazınız.', 'required');
    }

    protected function insertAfterValidate()
    {
        $this->utils
            ->uploadInput('imageFile')
            ->minSizes(0, 0)
            ->addProcessSize('normal', 25, 25, 'social', 'thumbnail');


        if ($this->input->post('imageUrl')) {
            $this->modelData['image'] = $this->utils->imageDownload(false, $this->input->post('imageUrl'));
        } else {
            $this->modelData['image'] = $this->utils->imageUpload(false);
        }
    }

    protected function updateRequest()
    {
        $this->viewData['icons'] = $this->icons;
    }


    protected function updateValidateRules()
    {
        $this->form_validation->set_rules('title', 'Lütfen Başlık yazınız.', 'required');
        $this->form_validation->set_rules('link', 'Lütfen Bağlantı yazınız.', 'required');
    }


    protected function updateAfterValidate($record)
    {
        $this->utils
            ->uploadInput('imageFile')
            ->minSizes(0, 0)
            ->addProcessSize('normal', 25, 25, 'social', 'thumbnail');


        if ($this->input->post('imageUrl')) {
            $this->modelData['image'] = $this->utils->imageDownload(false, $this->input->post('imageUrl'), $record->image);
        } else {
            $this->modelData['image'] = $this->utils->imageUpload(false, $record->image);
        }
    }

} 