<?php

class Contact extends CI_Model
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
            ->order_by('id', 'desc')
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




    public function viewed($record, $data = array())
    {
        $this->db
            ->where('id', $record->id)
            ->update($this->table, array(
                'viewed' => 1
            ));

        return $this->db->affected_rows();
    }




    public function delete($data)
    {
        if (is_array($data)) {
            $success = $this->db
                ->where_in('id', $data)
                ->delete($this->table);

            return $success;
        }

        $success = $this->db
            ->where('id', $data->id)
            ->delete($this->table);


        return $success;
    }


} 