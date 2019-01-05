<?php


class Banner extends CI_Model
{

    public function __construct()
    {
        $this->site->assets('js', array(
            'public/plugin/layerslider/js/greensock.js',
            'public/plugin/layerslider/js/layerslider.transitions.js',
            'public/plugin/layerslider/js/layerslider.kreaturamedia.jquery.js',
            'public/plugin/layerslider/js/init.js'
        ));

        $this->site->assets('css', 'public/plugin/layerslider/css/layerslider.css');
    }

    public function all()
    {
        return $this->db
            ->from('banners')
            ->where('language', $this->language)
            ->order_by('order', 'asc')
            ->order_by('id', 'asc')
            ->get()
            ->result();
    }


}