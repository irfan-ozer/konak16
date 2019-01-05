<?php

class Comment extends CI_Model
{
    public function insert()
    {
        $data = array(
            'fullname' => $this->input->post('fullname'),
            'email' => $this->input->post('email'),
            'comment' => $this->input->post('comment'),
            'date' => $this->date->set()->mysqlDatetime(),
            'ip' => $this->input->ip_address()
        );

        $this->db->insert('comments', $data);
        $success = $this->db->insert_id();


        if ($success && $this->module->arguments->notification == true) {
            $this->load->library('email');
            $this->email->initialize(array(
                'smtp_host' => $this->site->get('smtpHost'),
                'smtp_port' => $this->site->get('smtpPort'),
                'smtp_user' => $this->site->get('smtpUser'),
                'smtp_pass' => $this->site->get('smtpPass'),
            ));

            $this->email->from($this->input->post('email'), htmlspecialchars($this->input->post('fullname')));
            $this->email->to($this->module->arguments->notificationMail);
            $this->email->subject('İletişim Formu Bildirimi');
            $this->email->message($this->load->view('comment/mail', $data, true));
            $this->email->send();
        }

        return $success;
    }


    public function all($limit = null, $offset = null)
    {
        if ($limit != null) {
            $this->db->limit($limit, $offset);
        }

        return $this->db
            ->from('comments')
            ->where('approved', '1')
            ->order_by('id', 'desc')
            ->get()
            ->result();
    }


}