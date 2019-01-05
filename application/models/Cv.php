<?php

class Cv extends CI_Model
{
    public function insert()
    {

        $this->load->library('upload', array(
            'upload_path' => 'public/upload/cv/',
            'allowed_types' => 'doc|docx|pdf|xls|odt|jpg',
            'encrypt_name' => true,
        ));

        if (! $this->upload->do_upload('file')) {
            $this->site->setAlert('danger', $this->upload->display_errors('<div>&bull; ', '</div>'));
            return false;
        }

        $uploadData = $this->upload->data();

        $data = array(
            'fullname' => $this->input->post('fullname'),
            'phone' => $this->input->post('phone'),
            'email' => $this->input->post('email'),
            'comment' => $this->input->post('comment'),
            'cv' => $uploadData['file_name'],
            'date' => $this->date->set()->mysqlDatetime(),
            'ip' => $this->input->ip_address()
        );

        $this->db->insert('cvs', $data);
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
            $this->email->subject('Cv Formu Bildirimi');
            $this->email->message($this->load->view('cv/mail', $data, true));
            $this->email->send();
        }

        return $success;
    }



} 