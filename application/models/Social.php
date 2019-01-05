<?php


class Social extends CI_Model
{
    private $items = array();


    /**
     * Obje oluşturulduğunda tüm kayıtları çekip değişkene aktarır.
     */
    public function __construct()
    {
        $this->items = $this->db
            ->from('socials')
            ->order_by('order', 'asc')
            ->get()
            ->result();
    }


    /**
     * Tüm kayıtları döndürür.
     *
     * @return array
     */
    public function all()
    {
        return $this->items;
    }


}