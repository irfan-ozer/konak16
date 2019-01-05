<?php


class MaillistController  extends CI_Controller
{
    public $module = 'maillist';

    public function index()
    {
        $this->load->model('maillist');
        $this->lang->load('modules/maillist');
        $this->load->helper('form');

        // Request ajax ile yapıldıysa json veri döndürülür.
        if ($this->input->is_ajax_request()) {
            $json = array('success' => false, 'message' => '');
        }

        if ($this->input->post()) {

            $this->load->library('form_validation');
//            $this->form_validation->set_rules('fullname', lang('maillist-validate-fullname'), 'required');
            $this->form_validation->set_rules('email', lang('maillist-validate-email'), 'required|valid_email');

            if ($this->form_validation->run() == true) {
                $success = $this->maillist->insert();

                if ($success) {
                    if (isset($json)) {
                        $json['success'] = true;
                        $json['message'] = lang('maillist-success-message');
                        $json['title'] = lang('maillist-success-title');
                    } else {
                        $this->site->setAlert('success', lang('maillist-success-message'));
                        redirect($this->input->server('HTTP_REFERER').'#maillist');
                    }
                }
            } else {
                if (isset($json)) {
                    $json['success'] = false;
                    $json['message'] = $this->form_validation->error_string('<div>&bull; ', '</div>');
                    $json['title'] = lang('maillist-error-title');
                } else {
                    $this->site->setAlert('danger', $this->form_validation->error_string('<div>&bull; ', '</div>'));
                    redirect($this->input->server('HTTP_REFERER').'#maillist');
                }

            }
        }
        if (isset($json)) {
            echo json_encode($json);
        }
    }



} 