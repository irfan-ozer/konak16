<?php

use Sirius\Admin\Installer as InstallManager;


class Installer extends InstallManager
{

    public $routes = array(
        'tr' => array(
            'route' => array(
                '@uri' => 'CvController/index',
            ),
            'uri' => 'insan-kaynaklari'
        ),
        'en' => array(
            'route' => array(
                '@uri' => 'CvController/index',
            ),
            'uri' => 'human-resources'
        ),
    );

    public function insertData()
    {
        $languages = $this->config->item('languages');
        $insert = array();

        foreach ($languages as $language => $label) {
            $data = array(
                array(
                    'module' => 'cv',
                    'name' => 'title',
                    'title' => 'Sayfa Başlığı',
                    'value' => null,
                    'type' => 'text',
                    'arguments' => json_encode(array('required' => true)),
                    'language' => $language,
                ),
                array(
                    'module' => 'cv',
                    'name' => 'metaTitle',
                    'title' => 'Meta Başlığı',
                    'value' => null,
                    'type' => 'text',
                    'arguments' => json_encode(array()),
                    'language' => $language,
                ),
                array(
                    'module' => 'cv',
                    'name' => 'metaDescription',
                    'title' => 'Meta Tanımı',
                    'value' => null,
                    'type' => 'textarea',
                    'arguments' => json_encode(array()),
                    'language' => $language,
                ),
                array(
                    'module' => 'cv',
                    'name' => 'metaKeywords',
                    'title' => 'Meta Anahtar Kelimeleri',
                    'value' => null,
                    'type' => 'textarea',
                    'arguments' => json_encode(array()),
                    'language' => $language,
                ),
                array(
                    'module' => 'cv',
                    'name' => 'notification',
                    'title' => 'Bildirim Gönderimi',
                    'value' => 0,
                    'type' => 'dropdown',
                    'arguments' => json_encode(array('required' => true, 'options' => array('0' => 'Bildirim Gönderme', '1' => 'Bilgirim Gönder'))),
                    'language' => $language,
                ),
                array(
                    'module' => 'cv',
                    'name' => 'notificationMail',
                    'title' => 'Bildirim Maili',
                    'value' => null,
                    'type' => 'text',
                    'arguments' => json_encode(array()),
                    'language' => $language,
                ),
                array(
                    'module' => 'cv',
                    'name' => 'detail',
                    'title' => 'İnsan Kaynakları Yazısı',
                    'value' => null,
                    'type' => 'editor',
                    'arguments' => json_encode(array('required' => true)),
                    'language' => $language,
                ),
            );


            $insert = array_merge($insert, $data);
        }

        $this->db->insert_batch('module_arguments', $insert);


    }

}
