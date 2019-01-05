<?php

class Productcategory extends CI_Model
{

    public function id($id)
    {
        return $this->db
            ->from($this->table)
            ->where('id', $id)
            ->where('language', $this->language)
            ->get()
            ->row();
    }


    public function all($limit = null, $offset = null)
    {
        $this->utils->filter();


        if ($limit != null) {
            $this->db->limit($limit, $offset);
        }

        return $this->db
            ->from($this->table)
            ->where('parentId',0)
            ->where('language', $this->language)
            ->order_by('id', 'asc')
            ->get()
            ->result();
    }


    public function count()
    {
        $this->utils->filter();

        return $this->db
            ->from($this->table)
            ->where('language', $this->language)
            ->count_all_results();
    }


    public function childCount($parent)
    {
        $this->utils->filter();

        return $this->db
            ->from($this->table)
            ->where('language', $this->language)
            ->count_all_results();
    }

    public function childAll($parent, $limit = null, $offset = null)
    {
        $this->utils->filter();


        if ($limit != null) {
            $this->db->limit($limit, $offset);
        }

        return $this->db
            ->select("{$this->table}.*, (SELECT COUNT(id) FROM {$this->table} child WHERE child.parentId = {$this->table}.id) childs", false)
            ->from($this->table)
            ->where('parentId', $parent->id)
            ->where('language', $this->language)
            ->order_by('order', 'asc')
            ->order_by('id', 'asc')
            ->get()
            ->result();
    }
    public function parents($id)
    {
        static $result = array();

        $record = $this->db->where('id', $id)->get($this->table)->row();

        if ($record) {
            array_unshift($result, array('title' => $record->title, 'url' => clink(array($this->module, 'childs', $record->id))));

            if ($record->parentId > 0) {
                $this->parents($record->parentId, false);
            }
        }

        return $result;

    }

    public function insert($data = array())
    {
        $this->db->insert($this->table, array(
            'title' => $this->input->post('title'),
            'slug' => $this->input->post('autoSlug') === 'true' ? makeSlug($this->input->post('title')) : makeSlug($this->input->post('slug')),
            'summary' => $this->input->post('summary'),
            'detail' => $this->input->post('detail'),
            'image' => $data['image']['name'],
            'parentId' => $this->input->post('parentId'),
            'metaTitle' => $this->input->post('metaTitle'),
            'metaDescription' => $this->input->post('metaDescription'),
            'metaKeywords' => $this->input->post('metaKeywords'),
            'language' => $this->language,
        ));

        return $this->db->insert_id();
    }



    public function update($record, $data = array())
    {
        $this->db
            ->where('id', $record->id)
            ->update($this->table, array(
                'title' => $this->input->post('title'),
                'slug' => $this->input->post('autoSlug') === 'true' ? makeSlug($this->input->post('title')) : makeSlug($this->input->post('slug')),
                'summary' => $this->input->post('summary'),
                'detail' => $this->input->post('detail'),
                'image' => $data['image']['name'],
                'metaTitle' => $this->input->post('metaTitle'),
                'metaDescription' => $this->input->post('metaDescription'),
                'metaKeywords' => $this->input->post('metaKeywords'),
            ));


        return $this->db->affected_rows();
    }




    public function delete($data)
    {
        if (is_array($data)) {
            $records = $this->db
                ->from($this->table)
                ->where_in('id', $data)
                ->get()
                ->result();

            $success = $this->db
                ->where_in('id', $data)
                ->delete($this->table);

            if ($success) {
                foreach ($records as $record) {
                    @unlink("../public/upload/productcategory/{$record->image}");
                }
            }

            return $success;
        }

        $success = $this->db
            ->where('id', $data->id)
            ->delete($this->table);

        @unlink("../public/upload/productcategory/{$data->image}");

        return $success;
    }


    public function order($ids = null)
    {
        if (is_array($ids)) {
            $records = $this->db
                ->from($this->table)
                ->where_in('id', $ids)
                ->where('language', $this->language)
                ->order_by('order', 'asc')
                ->order_by('id', 'desc')
                ->get()
                ->result();

            $firstOrder = 0;
            $affected = 0;

            foreach ($records as $record) {
                if ($firstOrder === 0) {
                    $firstOrder = $record->order;
                }

                $order = array_search($record->id, $ids) + $firstOrder;

                if ($record->order != $order) {
                    $this->db
                        ->where('id', $record->id)
                        ->update($this->table, array('order' => $order));

                    if ($this->db->affected_rows() > 0) {
                        $affected++;
                    }
                }

            }

            return $affected;
        }

    }

}