<?php


class HomeController  extends CI_Controller
{

    public $module = 'home';

    public function index()
    {
        $this->load->model('banner');
        $this->load->model('service');
//        $this->load->model('project');
        $this->load->model('content');
        $this->load->model('news');
//        $this->load->model('reference');

        $this->load->view('master', array(
            'view' => 'home',
//            'projects' => $this->project->all(),
            'reserved' => $this->content->reserved('home'),
            'services' => $this->service->all(3),
            'newsRecords' => $this->news->all(),
//                'references' => $this->reference->all(),
        ));


    }



} 