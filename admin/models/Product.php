<?php

class Product extends CI_Model
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
            ->select("{$this->table}.*, (SELECT COUNT(id) FROM product_images WHERE product_images.productId = {$this->table}.id) images", false)
            ->from($this->table)
            ->where('language', $this->language)
            ->order_by('order', 'asc')
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


    public function getCategories()
    {
        return $this->db
            ->from("product_categories")
            ->where("language", $this->language)
            ->get()
            ->result();
    }


    public function insert($data = array())
    {
        $order = 1;
        $lastOrderRecord = $this->db
            ->from($this->table)
            ->where('language', $this->language)
            ->order_by('order', 'desc')
            ->limit(1)
            ->get()
            ->row();

        if ($lastOrderRecord) {
            $order = $lastOrderRecord->order + 1;
        }


        $this->db->insert($this->table, array(
            'categoryId' => $this->input->post('categoryId'),
            'title' => $this->input->post('title'),
            'slug' => $this->input->post('autoSlug') === 'true' ? makeSlug($this->input->post('title')) : makeSlug($this->input->post('slug')),
            'image' => $data['image']['name'],
            'summary' => $this->input->post('summary'),
            'detail' => $this->input->post('detail'),
            'metaTitle' => $this->input->post('metaTitle'),
            'metaDescription' => $this->input->post('metaDescription'),
            'metaKeywords' => $this->input->post('metaKeywords'),
            'order' => $order,
            'language' =>$this->language
        ));

        return $this->db->insert_id();
    }



    public function update($record, $data = array())
    {
        $this->db
            ->where('id', $record->id)
            ->update($this->table, array(
                'categoryId' => $this->input->post('categoryId'),
                'title' => $this->input->post('title'),
                'slug' => $this->input->post('autoSlug') === 'true' ? makeSlug($this->input->post('title')) : makeSlug($this->input->post('slug')),
                'image' => $data['image']['name'],
                'summary' => $this->input->post('summary'),
                'detail' => $this->input->post('detail'),
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
                    @unlink("../public/upload/product/{$record->image}");
                }
            }

            return $success;
        }

        $success = $this->db
            ->where('id', $data->id)
            ->delete($this->table);

        @unlink("../public/upload/product/{$data->image}");


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





    public function image($id)
    {
        return $this->db
            ->from('product_images')
            ->where('id', $id)
            ->where('language', $this->language)
            ->get()
            ->row();
    }


    public function imageAll($product, $limit = null, $offset = null)
    {
        $this->utils->filter();


        if ($limit != null) {
            $this->db->limit($limit, $offset);
        }

        return $this->db
            ->from('product_images')
            ->where('productId', $product->id)
            ->where('language', $this->language)
            ->order_by('order', 'asc')
            ->order_by('id', 'asc')
            ->get()
            ->result();
    }


    public function imageCount($product)
    {
        $this->utils->filter();

        return $this->db
            ->from('product_images')
            ->where('productId', $product->id)
            ->where('language', $this->language)
            ->count_all_results();
    }


    public function imageInsert($product, $data = array())
    {
        $order = 1;
        $lastOrderRecord = $this->db
            ->from('product_images')
            ->where('productId', $product->id)
            ->where('language', $this->language)
            ->order_by('order', 'desc')
            ->limit(1)
            ->get()
            ->row();


        if ($lastOrderRecord) {
            $order = $lastOrderRecord->order + 1;
        }


        $this->db->insert('product_images', array(
            'productId' => $product->id,
            'image' => $data['image']['name'],
            'order' => $order,
            'language' => $this->language,
        ));

        return $this->db->insert_id();
    }



    public function imageUpdate($record, $data = array())
    {
        $this->db
            ->where('id', $record->id)
            ->update('product_images', array(
                'image' => $data['image']['name'],
            ));

        return $this->db->affected_rows();
    }



    public function imageDelete($data)
    {
        if (is_array($data)) {
            $records = $this->db
                ->from('product_images')
                ->where_in('id', $data)
                ->get()
                ->result();

            $success = $this->db
                ->where_in('id', $data)
                ->delete('product_images');

            if ($success) {
                foreach ($records as $record) {
                    @unlink("../public/upload/product/thumb/{$record->image}");
                    @unlink("../public/upload/product/normal/{$record->image}");
                }
            }

            return $success;
        }

        $success = $this->db
            ->where('id', $data->id)
            ->delete('product_images');

        @unlink("../public/upload/product/thumb/{$data->image}");
        @unlink("../public/upload/product/normal/{$data->image}");


        return $success;
    }


    public function imageOrder($ids = null)
    {
        if (is_array($ids)) {
            $records = $this->db
                ->from('product_images')
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
                        ->update('product_images', array('order' => $order));

                    if ($this->db->affected_rows() > 0) {
                        $affected++;
                    }
                }

            }

            return $affected;
        }

    }

} 