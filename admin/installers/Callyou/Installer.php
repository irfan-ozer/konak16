<?php

use Sirius\Admin\Installer as InstallManager;


class Installer extends InstallManager
{

    public $routes = array(
        'tr' => array(
            'route' => array(
                '@uri' => 'CallyouController/index',
            ),
            'uri' => 'biz-sizi-arayalim'
        ),
        'en' => array(
            'route' => array(
                '@uri' => 'CallyouController/index',
            ),
            'uri' => 'callyou'
        ),
    );

    public function insertData()
    {
        $languages = $this->config->item('languages');
        $insert = array();

        foreach ($languages as $language => $label) {
            $data = array(
                array(
                    'module' => 'callyou',
                    'name' => 'notification',
                    'title' => 'Bildirim Gönderimi',
                    'value' => 0,
                    'type' => 'dropdown',
                    'arguments' => json_encode(array('required' => true, 'options' => array('0' => 'Bildirim Gönderme', '1' => 'Bilgirim Gönder'))),
                    'language' => $language,
                ),
                array(
                    'module' => 'callyou',
                    'name' => 'notificationMail',
                    'title' => 'Bildirim Maili',
                    'value' => null,
                    'type' => 'text',
                    'arguments' => json_encode(array()),
                    'language' => $language,
                ),
            );


            $insert = array_merge($insert, $data);
        }

        $this->db->insert_batch('module_arguments', $insert);


    }

}