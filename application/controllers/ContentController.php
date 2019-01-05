<?php


class ContentController  extends CI_Controller
{
    public $module = 'content';

    public function view($id)
    {
        $this->load->model('content');
        $this->lang->load('modules/content');

        if (! $content = $this->content->findId($id)) {
            show_404();
        }


        $this->site->set('metaTitle', !empty($content->metaTitle) ? $content->metaTitle : $content->title);
        $this->site->set('metaDescription', $content->metaDescription);
        $this->site->set('metaKeywords', $content->metaKeywords);

        $this->site->set('ogType', 'article');
        $this->site->set('ogTitle', $content->title);

        if (! empty($content->summary)) {
            $this->site->set('ogDescription', $content->summary);
        }
        if (! empty($content->image)) {
            $this->site->set('ogImage', uploadPath($content->image, 'content'));
        }


        $this->load->view('master', array(
            'view' => 'content/view',
            'content' => $content
        ));


    }



} 