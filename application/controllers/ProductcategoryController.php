<?php


class ProductcategoryController  extends CI_Controller
{

    public $module = 'productcategory';

    public function index()
    {
        $this->load->model('productcategory');
        $this->lang->load('modules/productcategory');

        $categories = array();
        $pagination = null;
        $count = $this->productcategory->count();

        if ($count > 0) {
            $config = array(
                'base_url' => clink(array('@productcategory')),
                'total_rows' => $count,
                'per_page' => 10
            );

            $this->load->library('pagination');
            $this->pagination->initialize($config);


            $categories = $this->productcategory->all($this->pagination->per_page, $this->pagination->offset);
            $pagination = $this->pagination->create_links();
        }

        $menus = $this->productcategory->category();

        $this->load->view('master', array(
            'view' => 'productcategory/index',
            'categories' => $categories,
            'pagination' => $pagination,
            'menus'      => $menus,

        ));

    }
    
    
    
    
    


    public function view($id)
    {
        $this->load->model('productcategory');
        $this->lang->load('modules/productcategory');

        if (! $category = $this->productcategory->findId($id)) {
            show_404();
        }

        $this->site->set('metaTitle', !empty($category->metaTitle) ? $category->metaTitle : $category->title);
        $this->site->set('metaDescription', $category->metaDescription);
        $this->site->set('metaKeywords', $category->metaKeywords);

        $this->site->set('ogType', 'article');
        $this->site->set('ogTitle', $category->title);
        $this->site->set('ogDescription', $category->summary);
        $this->site->set('ogImage', uploadPath($category->image, 'productcategory'));
        $menus = $this->productcategory->category();


        $this->load->view('master', array(
            'view' => 'productcategory/view',
            'category' => $category,
            'menus'      => $menus,

        ));


    }



}