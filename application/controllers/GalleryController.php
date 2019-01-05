<?php


class GalleryController  extends CI_Controller
{

    public $module = 'gallery';



    public function index()
    {
        $this->load->model('gallery');
        $this->lang->load('modules/gallery');

        $galleries = array();
        $pagination = null;
        $galleryCount = $this->gallery->count();

        if ($galleryCount > 0) {
            $config = array(
                'base_url' => clink(array('@gallery')),
                'total_rows' => $galleryCount,
                'per_page' => 10
            );

            $this->load->library('pagination');
            $this->pagination->initialize($config);


            $galleries = $this->gallery->all($this->pagination->per_page, $this->pagination->offset);
            $pagination = $this->pagination->create_links();
        }

        $this->load->view('master', array(
            'view' => 'gallery/index',
            'galleries' => $galleries,
            'pagination' => $pagination,

        ));
    }




    public function view($id)
    {
        $this->load->model('gallery');
        $this->lang->load('modules/gallery');

        if (! $gallery = $this->gallery->findId($id)) {
            show_404();
        }

        $this->site->set('metaTitle', $gallery->title);

        $this->site->set('ogType', 'article');
        $this->site->set('ogTitle', $gallery->title);
        $this->site->set('ogImage', uploadPath($gallery->image, 'gallery'));


        $this->load->view('master', array(
            'view' => 'gallery/view',
            'gallery' => $gallery

        ));


    }



} 