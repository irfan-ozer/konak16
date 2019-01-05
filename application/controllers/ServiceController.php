<?php


class ServiceController  extends CI_Controller
{

    public $module = 'service';

    public function index()
    {
        $this->load->model('service');
        $this->lang->load('modules/service');

        $services = array();
        $pagination = null;
        $serviceCount = $this->service->count();

        if ($serviceCount > 0) {
            $config = array(
                'base_url' => clink(array('@service')),
                'total_rows' => $serviceCount,
                'per_page' => 10
            );

            $this->load->library('pagination');
            $this->pagination->initialize($config);


            $services = $this->service->all($this->pagination->per_page, $this->pagination->offset);
            $pagination = $this->pagination->create_links();
        }


        $this->load->view('master', array(
            'view' => 'service/index',
            'services' => $services,
            'pagination' => $pagination,

        ));
    }




    public function view($id)
    {
        $this->load->model('service');
        $this->lang->load('modules/service');

        if (! $service = $this->service->findId($id)) {
            show_404();
        }

        $this->site->set('metaTitle', !empty($service->metaTitle) ? $service->metaTitle : $service->title);
        $this->site->set('metaDescription', $service->metaDescription);
        $this->site->set('metaKeywords', $service->metaKeywords);

        $this->site->set('ogType', 'article');
        $this->site->set('ogTitle', $service->title);
        $this->site->set('ogDescription', $service->summary);
        $this->site->set('ogImage', uploadPath($service->image, 'news'));


        $this->load->view('master', array(
            'view' => 'service/view',
            'service' => $service,
            'all' => $this->service->all()

        ));


    }



} 