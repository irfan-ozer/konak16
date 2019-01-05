<?php

class Social extends CI_Model
{

    public function id($id)
    {
        return $this->db
            ->from($this->table)
            ->where('id', $id)
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
            ->count_all_results();
    }





    public function insert($data = array())
    {
        $order = 1;
        $lastOrderRecord = $this->db->from($this->table)->order_by('order', 'desc')->limit(1)->get()->row();

        if ($lastOrderRecord) {
            $order = $lastOrderRecord->order + 1;
        }

        $this->db->insert($this->table, array(
            'title' => $this->input->post('title'),
            'link' => $this->input->post('link'),
            'image' => $data['image']['name'],
            'icon' => $this->input->post('icon'),
            'order' => $order
        ));

        return $this->db->insert_id();
    }



    public function update($record, $data = array())
    {
        $this->db
            ->where('id', $record->id)
            ->update($this->table, array(
                'title' => $this->input->post('title'),
                'link' => $this->input->post('link'),
                'image' => $data['image']['name'],
                'icon' => $this->input->post('icon'),
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
                    @unlink("../public/upload/social/{$record->image}");
                }
            }

            return $success;
        }

        $success = $this->db
            ->where('id', $data->id)
            ->delete($this->table);

        @unlink("../public/upload/social/{$data->image}");

        return $success;
    }



    public function order($ids = null)
    {
        if (is_array($ids)) {
            $records = $this->db
                ->from($this->table)
                ->where_in('id', $ids)
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