<?php


class Gallery extends  CI_Model
{

    public function all($limit = null, $offset = null)
    {
        if ($limit != null) {
            $this->db->limit($limit, $offset);
        }

        return $this->db
            ->from('galleries')
            ->where('language', $this->language)
            ->order_by('order', 'asc')
            ->order_by('id', 'desc')
            ->get()
            ->result();

    }

    public function count()
    {
        return $this->db
            ->from('galleries')
            ->where('language', $this->language)
            ->count_all_results();
    }



    public function findId($id)
    {
        $result = $this->db
            ->from('galleries')
            ->where('id', $id)
            ->where('language', $this->language)
            ->get()
            ->row();


        if ($result) {
            $result->images = $this->db
                ->from('gallery_images')
                ->where('galleryId', $result->id)
                ->order_by('order', 'asc')
                ->order_by('id', 'desc')
                ->get()
                ->result();
        }

        return $result;
    }


}