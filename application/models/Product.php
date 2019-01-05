<?php


class Product extends  CI_Model
{

    public function all($id, $limit = null, $offset = null)
    {
        if ($limit != null) {
            $this->db->limit($limit, $offset);
        }

        $result = $this->db
            ->from('products')
            ->where('categoryId', $id)
            ->where('language', $this->language)
            ->order_by('id', 'desc')
            ->get()
            ->result();

        return $result;
    }

    public function count()
    {
        return $this->db
            ->from('products')
            ->where('language', $this->language)
            ->count_all_results();
    }

    public function findId($id)
    {
        $result = $this->db
            ->from('products')
            ->where('id', $id)
            ->get()
            ->row();

        $result->images = $this->db
            ->from('product_images')
            ->where('productId', $id)
            ->get()
            ->result();

        return $result;

    }


}