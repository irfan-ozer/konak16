<?php


class Productcategory extends  CI_Model
{

    public function all($limit = null, $offset = null)
    {
        if ($limit != null) {
            $this->db->limit($limit, $offset);
        }

        $result = $this->db
            ->from('product_categories')
            ->where('language', $this->language)
            ->order_by('order', 'asc')
            ->get()
            ->result();

        return $result;
    }

    public function category()
    {
        $results = $this->db
            ->from('product_categories')
            ->where('parentId',0)
            ->where('language', $this->language)
            ->get()
            ->result();

        foreach ($results as $result) {
            $result->childs = $this->childs($result->id);
        }

        return $results;
    }

    private function childs($parentId)
    {
        $results = $this->db
            ->from('product_categories')
            ->where('parentId', $parentId)
            ->where('language', $this->language)
            ->order_by('order', 'asc')
            ->order_by('id', 'asc')
            ->get()
            ->result();

        return $results;

    }


    public function count()
    {
        return $this->db
            ->from('product_categories')
            ->where('language', $this->language)
            ->count_all_results();
    }


    public function findId($id)
    {
        $result = $this->db
            ->from('product_categories')
            ->where('id', $id)
            ->get()
            ->row();

        $result->products = $this->db
            ->from('products')
            ->where('categoryId', $id)
            ->order_by('order', 'asc')
            ->get()
            ->result();
        return $result;

    }


}