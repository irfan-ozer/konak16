<?php

class Callyou extends CI_Model
{
    public function insert()
    {
        $data = array(
            'fullname' => $this->input->post('fullname'),
            'phone' => $this->input->post('phone'),
            'mail' => $this->input->post('email'),
            'date' => $this->date->set()->mysqlDatetime(),
            'ip' => $this->input->ip_address()
        );

        $this->db->insert('callyou', $data);

        $success = $this->db->insert_id();

        if ($success && $this->module->arguments->notification == true) {
            $this->load->library('email');
            $this->email->initialize(array(
                'smtp_host' => $this->site->get('smtpHost'),
                'smtp_port' => $this->site->get('smtpPort'),
                'smtp_user' => $this->site->get('smtpUser'),
                'smtp_pass' => $this->site->get('smtpPass'),
            ));

            $this->email->from($this->module->arguments->notificationMail, htmlspecialchars($this->input->post('fullname')));
            $this->email->to($this->module->arguments->notificationMail);
            $this->email->subject('Sizi Arayalım Formu Bildirimi');
            $this->email->message($this->load->view('callyou/mail', $data, true));
            $this->email->send();
        }

        return $success;
    }



} 