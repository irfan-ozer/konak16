<?php


class CallyouController  extends CI_Controller
{
    public $module = 'callyou';


    public function index()
    {
        $this->load->model('callyou');
        $this->lang->load('modules/callyou');
        $this->load->helper('form');

        // Request ajax ile yapıldıysa json veri döndürülür.
        if ($this->input->is_ajax_request()) {
            $json = array('success' => false, 'message' => '');
        }

        if ($this->input->post()) {
            $this->load->library('form_validation');
            $this->form_validation->set_rules('fullname', lang('callyou-validate-fullname'), 'required');
            $this->form_validation->set_rules('phone', lang('callyou-validate-phone'), 'required');

            if ($this->form_validation->run() == true) {
                $success = $this->callyou->insert();

                if ($success) {
                    if (isset($json)) {
                        $json['success'] = true;
                        $json['message'] = lang('callyou-success-message');
                    } else {
                        $this->site->setAlert('success', lang('callyou-success-message'));
                        redirect(clink('@contact'));
                    }
                }
            } else {
                if (isset($json)) {
                    $json['message'] = $this->form_validation->error_string('<div>&bull; ', '</div>');
                } else {
                    $this->site->setAlert('danger', $this->form_validation->error_string('<div>&bull; ', '</div>'));
                    redirect(clink('@contact'));
                }
            }
        }

        if (isset($json)) {
            echo json_encode($json);
        }
    }



}