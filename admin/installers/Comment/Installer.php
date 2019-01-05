<?php

use Sirius\Admin\Installer as InstallManager;


class Installer extends InstallManager
{


    public $routes = array(
        'tr' => array(
            'route' => array(
                '@uri' => 'CommentController/index',
            ),
            'uri' => 'yorumlar'
        ),
        'en' => array(
            'route' => array(
                '@uri' => 'CommentController/index',
            ),
            'uri' => 'comments'
        ),
        'de' => array(
            'route' => array(
                '@uri' => 'CommentController/index',
            ),
            'uri' => 'comments'
        ),
        'ru' => array(
            'route' => array(
                '@uri' => 'CommentController/index',
            ),
            'uri' => 'comments'
        ),
    );




    public function insertData()
    {
        $languages = $this->config->item('languages');
        $insert = array();

        foreach ($languages as $language => $label) {
            $data = array(
                array(
                    'module' => 'comment',
                    'name' => 'title',
                    'title' => 'Sayfa Başlığı',
                    'value' => null,
                    'type' => 'text',
                    'arguments' => json_encode(array('required' => true)),
                    'language' => $language,
                ),
                array(
                    'module' => 'comment',
                    'name' => 'metaTitle',
                    'title' => 'Meta Başlığı',
                    'value' => null,
                    'type' => 'text',
                    'arguments' => json_encode(array()),
                    'language' => $language,
                ),
                array(
                    'module' => 'comment',
                    'name' => 'metaDescription',
                    'title' => 'Meta Tanımı',
                    'value' => null,
                    'type' => 'textarea',
                    'arguments' => json_encode(array()),
                    'language' => $language,
                ),
                array(
                    'module' => 'comment',
                    'name' => 'metaKeywords',
                    'title' => 'Meta Anahtar Kelimeleri',
                    'value' => null,
                    'type' => 'textarea',
                    'arguments' => json_encode(array()),
                    'language' => $language,
                ),
                array(
                    'module' => 'contact',
                    'name' => 'notification',
                    'title' => 'Bildirim Gönderimi',
                    'value' => 0,
                    'type' => 'dropdown',
                    'arguments' => json_encode(array('required' => true, 'options' => array('0' => 'Bildirim Gönderme', '1' => 'Bilgirim Gönder'))),
                    'language' => $language,
                ),
                array(
                    'module' => 'contact',
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
