<?php


class ContactController  extends CI_Controller
{
    public $module = 'contact';

    public function index()
    {
        $this->load->model('contact');
        $this->lang->load('modules/contact');
        $this->load->helper('form');

        if ($this->input->post()) {

            $this->load->library('form_validation');
            $this->form_validation->set_rules('fullname', lang('contact-validate-fullname'), 'required');
            $this->form_validation->set_rules('phone', lang('contact-validate-phone'), 'required');
            $this->form_validation->set_rules('email', lang('contact-validate-email'), 'required|valid_email');
            $this->form_validation->set_rules('comment', lang('contact-validate-comment'), 'required|min_length[5]');

            if ($this->form_validation->run() == true) {
                $success = $this->contact->insert();

                if ($success) {
                    $this->site->setAlert('success', lang('contact-success-message'));
                    redirect(current_url());
                }
            } else {
                $this->site->setAlert('danger', $this->form_validation->error_string('<div>&bull; ', '</div>'));
            }
        }



        $this->load->view('master', array(
            'view' => 'contact/index',
        ));

    }



} 