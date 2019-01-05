<?php

class Maillist extends CI_Model
{
    public function insert()
    {
        $data = array(
            'fullname' => $this->input->post('fullname'),
            'email' => $this->input->post('email'),
            'date' => $this->date->set()->mysqlDatetime(),
            'ip' => $this->input->ip_address()
        );

        $this->db->insert('maillist', $data);
        $success = $this->db->insert_id();

        return $success;
    }



} 