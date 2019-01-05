<?php

class Contact extends CI_Model
{
    public function insert()
    {
        $data = array(
            'fullname' => $this->input->post('fullname'),
            'email' => $this->input->post('email'),
            'phone' => $this->input->post('phone'),
            'comment' => $this->input->post('comment'),
            'date' => $this->date->set()->mysqlDatetime(),
            'ip' => $this->input->ip_address()
        );

        $this->db->insert('contacts', $data);
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
            $this->email->message($this->load->view('contact/mail', $data, true));
            $this->email->send();
        }

        return $success;
    }



}