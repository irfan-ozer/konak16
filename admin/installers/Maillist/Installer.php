<?php

use Sirius\Admin\Installer as InstallManager;


class Installer extends InstallManager
{
    public $routes = array(
        'tr' => array(
            'route' => array(
                '@uri' => 'MaillistController/index',
            ),
            'uri' => 'mail-listesi'
        ),
        'en' => array(
            'route' => array(
                '@uri' => 'MaillistController/index',
            ),
            'uri' => 'subscribe'
        ),
    );
}