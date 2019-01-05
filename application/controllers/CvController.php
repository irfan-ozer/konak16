<?php


class CvController  extends CI_Controller
{
    public $module = 'cv';

    public function index()
    {
        $this->load->model('cv');
        $this->lang->load('modules/cv');
        $this->load->helper('form');

        if ($this->input->post()) {

            $this->load->library('form_validation');
            $this->form_validation->set_rules('fullname', lang('cv-validate-fullname'), 'required');
            $this->form_validation->set_rules('phone', lang('cv-validate-fullname'), 'required');
            $this->form_validation->set_rules('email', lang('cv-validate-fullname'), 'required|valid_email');

            if ($this->form_validation->run() == true) {
                $success = $this->cv->insert();

                if ($success) {
                    $this->site->setAlert('success', lang('cv-success-message'));
                    redirect(current_url());
                }
            } else {
                $this->site->setAlert('error', $this->form_validation->error_string('<div>&bull; ', '</div>'));
            }
        }



        $this->load->view('master', array(
            'view' => 'cv/index',
        ));

    }



} 