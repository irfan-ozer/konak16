<?php

use Sirius\Admin\Manager;

class ProductcategoryAdminController extends Manager
{
    public $moduleTitle = 'Ürün Kategorileri';
    public $module = 'productcategory';
    public $table = 'product_categories';
    public $model = 'productcategory';
    public $type = 'public';
    public $menuPattern = array(
        'title' => 'title',
        'hint' => 'title',
        'link' => array('slug', 'id'),
        'moduleLink' => true,
        'language' => true
    );

    // Arama yapılacak kolonlar.
    public $search = array('title');


    // Filtreleme yapılacak querystring/kolonlar.
    // public $filter = array('type');

    public $actions = array(
        'records' => 'list',
        'childs' => 'list',
        'insert' => 'insert',
        'update' => 'update',
        'delete' => 'delete',
    );

    public function childs()
    {
        if (! $parent = $this->appmodel->id($this->uri->segment(3))) {
            show_404();
        }

        $records = array();
        $pagination = null;
        $recordCount = $this->appmodel->childCount($parent);

        if ($recordCount > 0) {
            $config = array(
                'base_url' => clink(array($this->module, 'childs', $parent->id)),
                'total_rows' => $recordCount,
                'per_page' => 19
            );

            $this->load->library('pagination');
            $this->pagination->initialize($config);


            $records = $this->appmodel->childAll($parent, $this->pagination->per_page +1, $this->pagination->offset);
            $pagination = $this->pagination->create_links();
        }



        // Navigasyon eklemeleri yapılır
        $parents = $this->appmodel->parents($parent->id);

        foreach ($parents as $bread){
            $this->breadcrumb($bread['title'], $bread['url']);
        }
        $this->breadcrumb('Kayıtlar');

        $this->viewData['parent'] = $parent;
        $this->viewData['records'] = $records;
        $this->viewData['pagination'] = $pagination;
        $this->load->vars('public', array('js' => array('../public/admin/js/module/menu.js')));

        $this->render('childs');
    }



    protected function insertRequest()
    {
        $this->load->vars('public', array('js' => array(
            '../public/admin/plugin/ckeditor/ckeditor.js',
            '../public/admin/plugin/ckfinder/ckfinder.js'
        )));
    }

    protected function insertValidateRules()
    {
        $this->form_validation->set_rules('title', 'Lütfen Başlık yazınız.', 'required');
        $this->form_validation->set_rules('summary', 'Lütfen Özet yazınız.', 'required');

        if ($this->input->post('autoSlug') !== 'true') {
            $this->form_validation->set_rules('slug', 'Lütfen slug yazınız.', 'required');
        }
    }

    protected function insertAfterValidate()
    {
        $this->utils
            ->uploadInput('imageFile')
            ->minSizes(170, 120)
            ->addProcessSize('normal', 170, 120, 'productcategory', 'thumbnail');


        if ($this->input->post('imageUrl')) {
            $this->modelData['image'] = $this->utils->imageDownload(true, $this->input->post('imageUrl'));
        } else {
            $this->modelData['image'] = $this->utils->imageUpload(true);
        }
    }


    protected function updateRequest($record)
    {
        $this->load->vars('public', array('js' => array(
            '../public/admin/plugin/ckeditor/ckeditor.js',
            '../public/admin/plugin/ckfinder/ckfinder.js'
        )));
    }

    protected function updateValidateRules()
    {
        $this->form_validation->set_rules('title', 'Lütfen Başlık yazınız.', 'required');
        $this->form_validation->set_rules('summary', 'Lütfen Özet yazınız.', 'required');

        if ($this->input->post('autoSlug') !== 'true') {
            $this->form_validation->set_rules('slug', 'Lütfen slug yazınız.', 'required');
        }
    }

    protected function updateAfterValidate($record)
    {
        $this->utils
            ->uploadInput('imageFile')
            ->minSizes(170, 120)
            ->addProcessSize('normal', 170, 120, 'productcategory', 'thumbnail');


        if ($this->input->post('imageUrl')) {
            $this->modelData['image'] = $this->utils->imageDownload(false, $this->input->post('imageUrl'), $record->image);
        } else {
            $this->modelData['image'] = $this->utils->imageUpload(false, $record->image);
        }
    }

} 