<?php

use Sirius\Admin\Manager;

class GalleryAdminController extends Manager
{
    public $moduleTitle = 'Galeri';
    public $module = 'gallery';
    public $table = 'galleries';
    public $model = 'gallery';
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
            ->minSizes(400, 300)
            ->addProcessSize('normal', 400, 300, 'gallery', 'thumbnail');


        if ($this->input->post('imageUrl')) {
            $this->modelData['image'] = $this->utils->imageDownload(true, $this->input->post('imageUrl'));
        } else {
            $this->modelData['image'] = $this->utils->imageUpload(true);
        }
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
            ->minSizes(400, 300)
            ->addProcessSize('normal', 400, 300, 'gallery', 'thumbnail');


        if ($this->input->post('imageUrl')) {
            $this->modelData['image'] = $this->utils->imageDownload(false, $this->input->post('imageUrl'), $record->image);
        } else {
            $this->modelData['image'] = $this->utils->imageUpload(false, $record->image);
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
            ->minSizes(400, 300)
            ->addProcessSize('thumb', 400, 300, 'gallery/thumb', 'thumbnail')
            ->addProcessSize('normal', 900, 900, 'gallery/normal', 'fit');

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
                ->minSizes(400, 300)
                ->addProcessSize('thumb', 400, 300, 'gallery/thumb', 'thumbnail')
                ->addProcessSize('normal', 900, 900, 'gallery/normal', 'fit');


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