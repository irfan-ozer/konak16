<?php

use Sirius\Admin\Manager;

class ProjectAdminController extends Manager
{
    public $moduleTitle = 'Projeler';
    public $module = 'project';
    public $table = 'projects';
    public $model = 'project';
    public $type = 'public';
    public $menuPattern = array(
        'title' => 'title',
        'hint' => 'title',
        'link' => array('slug', 'id'),
        'moduleLink' => true,
        'language' => true
    );



    public $actions = array(
        'records' => 'list',
        'order' => 'list',
        'insert' => 'insert',
        'update' => 'update',
        'delete' => 'delete',
        'images' => 'image-list',
        'imageOrder' => 'image-list',
        'imageInsert' => 'image-insert',
        'imageUpdate' => 'image-update',
        'imageDelete' => 'image-delete',

    );

    protected function insertRequest()
    {
        $this->load->vars('public', array('js' => array(
            '../public/admin/plugin/ckeditor/ckeditor.js',
            '../public/admin/plugin/ckfinder/ckfinder.js',
            'https://maps.googleapis.com/maps/api/js?key=AIzaSyC5tsEc6YH4r7dOtYH16ddHKPWf75LyR50&libraries=places',
            '../public/admin/js/module/project.js'
        )));
    }

    protected function insertValidateRules()
    {
        $this->form_validation->set_rules('title', 'Lütfen Başlık yazınız.', 'required');

        if ($this->input->post('autoSlug') !== 'true') {
            $this->form_validation->set_rules('slug', 'Lütfen slug yazınız.', 'required');
        }
    }

    protected function insertAfterValidate()
    {
        $this->utils
            ->uploadInput('imageFile')
            ->minSizes(460, 330)
            ->addProcessSize('thumb', 460, 335, 'project/thumb', 'thumbnail')
            ->addProcessSize('normal', 800, 600, 'project', 'thumbnail');


        if ($this->input->post('imageUrl')) {
            $this->modelData['image'] = $this->utils->imageDownload(true, $this->input->post('imageUrl'));
        } else {
            $this->modelData['image'] = $this->utils->imageUpload(true);
        }

        $this->load->library('upload');
        $this->upload->initialize(array(
            'upload_path' => '../public/upload/project/file/',
            'allowed_types' => '*',
            'encrypt_name' => true,
        ));


        if (! empty($_FILES['file']['name'])) {
            if (! $this->upload->do_upload('file')) {
                $this->utils->setAlert('danger', $this->upload->display_errors('<div>&bull; ', '</div>'));
            }

            $this->modelData['file'] = $this->upload->data();
        }
    }


    protected function updateRequest($record)
    {
        $this->load->vars('public', array('js' => array(
            '../public/admin/plugin/ckeditor/ckeditor.js',
            '../public/admin/plugin/ckfinder/ckfinder.js',
            'https://maps.googleapis.com/maps/api/js?key=AIzaSyC5tsEc6YH4r7dOtYH16ddHKPWf75LyR50&libraries=places',
            '../public/admin/js/module/project.js'
        )));

        $lat = "38.43001";
        $lng = "27.14729";
        if (! empty($record->map)) {
            $map = $record->map;
            $map = explode(",",$map);
            $lat = $map[0];
            $lng = $map[1];
        }
        $this->viewData['lat'] = $lat;
        $this->viewData['lng'] = $lng;
    }

    protected function updateValidateRules()
    {
        $this->form_validation->set_rules('title', 'Lütfen Başlık yazınız.', 'required');

        if ($this->input->post('autoSlug') !== 'true') {
            $this->form_validation->set_rules('slug', 'Lütfen slug yazınız.', 'required');
        }
    }


    protected function updateAfterValidate($record)
    {
        $this->utils
            ->uploadInput('imageFile')
            ->minSizes(460, 330)
            ->addProcessSize('thumb', 460, 335, 'project/thumb', 'thumbnail')
            ->addProcessSize('normal', 800, 600, 'project', 'thumbnail');


        if ($this->input->post('imageUrl')) {
            $this->modelData['image'] = $this->utils->imageDownload(false, $this->input->post('imageUrl'), $record->image);
        } else {
            $this->modelData['image'] = $this->utils->imageUpload(false, $record->image);
        }

        $this->load->library('upload');
        $this->upload->initialize(array(
            'upload_path' => '../public/upload/project/file/',
            'allowed_types' => '*',
            'encrypt_name' => true,
        ));


        if (! empty($_FILES['file']['name'])) {
            if (! $this->upload->do_upload('file')) {
                $this->utils->setAlert('danger', $this->upload->display_errors('<div>&bull; ', '</div>'));
            }

            $this->modelData['file'] = $this->upload->data();
        }
    }


    public function images()
    {
        if (! $parent = $this->appmodel->id($this->uri->segment(3))) {
            show_404();
        }

        $records = array();
        $pagination = null;
        $recordCount = $this->appmodel->imageCount($parent);

        if ($recordCount > 0) {
            $config = array(
                'base_url' => clink(array($this->module, 'images', $parent->id)),
                'total_rows' => $recordCount,
                'per_page' => 20
            );

            $this->load->library('pagination');
            $this->pagination->initialize($config);


            $records = $this->appmodel->imageAll($parent, $this->pagination->per_page, $this->pagination->offset);
            $pagination = $this->pagination->create_links();
        }



        $this->breadcrumb($parent->title, clink(array($this->module, 'images', $parent->id)));
        $this->breadcrumb('Resimler');

        $this->viewData['parent'] = $parent;
        $this->viewData['records'] = $records;
        $this->viewData['pagination'] = $pagination;

        $this->load->vars('public', array('js' => array(
            '../public/admin/plugin/plupload/plupload.js',
            '../public/admin/plugin/plupload/plupload.flash.js',
            '../public/admin/plugin/plupload/plupload.html4.js',
            '../public/admin/plugin/plupload/plupload.html5.js',
        )));

        $this->render('images/records');
    }




    public function imageInsert()
    {
        if (! $parent = $this->appmodel->id($this->uri->segment(3))) {
            echo json_encode(array(
                'jsonrpc'	=> '2.0',
                'error'		=> array('code' => '500', 'message' => 'Kayıt bulunamadı.'),
                'id'		=> 'id'
            ));
        }

        $this->utils
            ->setPlupload()
            ->uploadInput('file')
            ->minSizes(770, 570)
            ->addProcessSize('thumb', 180, 130, 'project/thumb', 'thumbnail')
            ->addProcessSize('normal', 770, 500, 'project/normal', 'thumbnail');

        $this->modelData['image'] = $this->utils->imageUpload(true);

        $success = $this->appmodel->imageInsert($parent, $this->modelData);

        if ($success) {
            echo json_encode(array(
                'jsonrpc'	=> '2.0',
                'error'		=> array(),
                'id'		=> 'id'
            ));

            return;
        }
    }




    public function imageUpdate()
    {
        if (! $record = $this->appmodel->image($this->uri->segment(3))) {
            show_404();
        }

        $parent = $this->appmodel->id($record->galleryId);

        if ($this->input->post()) {

            if ($this->form_validation->run() === false) {
                $this->utils->setAlert('danger', $this->form_validation->error_string('<div>&bull; ', '</div>'));
            }

            $this->utils
                ->uploadInput('imageFile')
                ->minSizes(770, 570)
                ->addProcessSize('thumb', 180, 130, 'project/thumb', 'thumbnail')
                ->addProcessSize('normal', 770, 500, 'project/normal', 'thumbnail');


            if ($this->input->post('imageUrl')) {
                $this->modelData['image'] = $this->utils->imageDownload(false, $this->input->post('imageUrl'), $record->image);
            } else {
                $this->modelData['image'] = $this->utils->imageUpload(false, $record->image);
            }

            if (! $this->utils->isAlert()) {
                $success = $this->appmodel->imageUpdate($record, $this->modelData);

                if ($success) {
                    $this->utils->setAlert('success', 'Kayıt düzenlendi.');
                    redirect(clink(array($this->module, 'imageUpdate', $record->id)));
                }
                $this->utils->setAlert('warning', 'Kayıt düzenlenmedi.');
            }
        }

        $this->breadcrumb($parent->title, clink(array($this->module, 'images', $parent->id)));
        $this->breadcrumb('Kayıt Düzenle');

        $this->viewData['parent'] = $parent;
        $this->viewData['record'] = $record;

        $this->render('images/update');
    }




    public function imageDelete()
    {
        // Ajax sorgusu  ise toplu silme uygulanır
        if ($this->input->is_ajax_request()) {
            $ids = $this->input->post('ids');

            if (count($ids) == 0) {
                $this->utils->setAlert('danger', 'Lütfen kayıt seçiniz.');
                echo $this->input->server('HTTP_REFERER');
            }

            $success = $this->appmodel->imageDelete($ids);

            if ($success) {
                $this->utils->setAlert('success', "Kayıtlar başarıyla silindi.");
                echo $this->input->server('HTTP_REFERER');
            }

            return true;
        }

        // Normal sorgu ise tekli silme uygulanır
        if (! $record = $this->appmodel->image($this->uri->segment(3))) {
            show_404();
        }

        $success = $this->appmodel->imageDelete($record);

        if ($success) {
            $this->utils->setAlert('success', "Kayıt kaldırıldı. (#{$record->id})");
            redirect($this->input->server('HTTP_REFERER'));
        }

        $this->utils->setAlert('danger', 'Kayıt kaldırılamadı.');
        redirect($this->input->server('HTTP_REFERER'));

    }


    /**
     * Sıralama işlemi yapar
     */
    public function imageOrder()
    {
        $ids = explode(',', $this->input->post('ids'));

        if (count($ids) == 0){
            $this->utils->setAlert('danger', 'Lütfen kayıt seçiniz.');
        }

        $success = $this->appmodel->imageOrder($ids);

        if ($success){
            $this->utils->setAlert('success', "Kayıtlar başarıyla sıralandı.");
        }
    }

} 