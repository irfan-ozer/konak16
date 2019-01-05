<?php


class CommentController  extends CI_Controller
{
    public $module = 'comment';

    public function index()
    {
        $this->load->model('comment');
        $this->lang->load('modules/contact');
        $this->load->helper('form');

        if ($this->input->post()) {

            $this->load->library('form_validation');
            $this->form_validation->set_rules('fullname', 'Lütfen Adınızı ve Soyadınızı yazınız.', 'required');
            $this->form_validation->set_rules('email', 'Lütfen E-Posta adresinizi yazınız.', 'required|valid_email');
            $this->form_validation->set_rules('comment', 'Yorumunuz çok kısa.', 'required|min_length[5]');

            if ($this->form_validation->run() == true) {
                $success = $this->comment->insert();

                if (isset($this->maillist)) {
                    $this->maillist->insert();
                }

                if ($success) {
                    $this->site->setAlert('success', 'Mesajınız iletildi.');
                    redirect(current_url().'#form');
                }
            } else {
                $this->site->setAlert('error', $this->form_validation->error_string('<div>&bull; ', '</div>'));
            }
        }



        $this->load->view('master', array(
            'view' => 'comment/index',
            'comments' => $this->comment->all()
        ));

    }



} 