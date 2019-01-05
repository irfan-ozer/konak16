<?php


class ProductController  extends CI_Controller
{

    public $module = 'product';

    public function index($id)
    {
        $this->load->model('product');

        $this->lang->load('modules/product');

        $product = array();
        $pagination = null;
        $productCount = $this->product->count();

        if ($productCount > 0) {
            $config = array(
                'base_url' => clink(array('@productcategory')),
                'total_rows' => $productCount,
                'per_page' => 10
            );

            $this->load->library('pagination');
            $this->pagination->initialize($config);


            $product = $this->product->all($id, $this->pagination->per_page, $this->pagination->offset);
            $pagination = $this->pagination->create_links();
        }


        $this->load->view('master', array(
            'view' => 'product/index',
            'products' => $product,
            'pagination' => $pagination,

        ));
    }

    public function view($id)
    {
        $this->load->model('product');
        $this->load->model('productcategory');
        $this->lang->load('modules/product');

        if (! $product = $this->product->findId($id)) {
            show_404();
        }

        $this->site->set('metaTitle', !empty($product->metaTitle) ? $product->metaTitle : $product->title);
        $this->site->set('metaDescription', $product->metaDescription);
        $this->site->set('metaKeywords', $product->metaKeywords);

        $this->site->set('ogType', 'article');
        $this->site->set('ogTitle', $product->title);
        $this->site->set('ogDescription', $product->summary);
        $this->site->set('ogImage', uploadPath($product->image, 'product'));

        $menus = $this->productcategory->category();

        $this->load->view('master', array(
            'view' => 'product/view',
            'product' => $product,
            'menus'     => $menus,
        ));


    }



} 