<?php


class NewsController  extends CI_Controller
{

    public $module = 'news';



    public function index()
    {
        $this->load->model('news');
        $this->lang->load('modules/news');

        $news = array();
        $pagination = null;
        $newsCount = $this->news->count();

        if ($newsCount > 0) {
            $config = array(
                'base_url' => clink(array('@news')),
                'total_rows' => $newsCount,
                'per_page' => 10
            );

            $this->load->library('pagination');
            $this->pagination->initialize($config);


            $news = $this->news->all($this->pagination->per_page, $this->pagination->offset);
            $pagination = $this->pagination->create_links();
        }


        $this->load->view('master', array(
            'view' => 'news/index',
            'newscast' => $news,
            'pagination' => $pagination,

        ));
    }




    public function view($id)
    {
        $this->load->model('news');
        $this->lang->load('modules/news');

        if (! $news = $this->news->findId($id)) {
            show_404();
        }

        $this->site->set('metaTitle', !empty($news->metaTitle) ? $news->metaTitle : $news->title);
        $this->site->set('metaDescription', $news->metaDescription);
        $this->site->set('metaKeywords', $news->metaKeywords);

        $this->site->set('ogType', 'article');
        $this->site->set('ogTitle', $news->title);
        $this->site->set('ogDescription', $news->summary);
        $this->site->set('ogImage', uploadPath($news->image, 'news'));


        $this->load->view('master', array(
            'view' => 'news/view',
            'news' => $news

        ));


    }



} 