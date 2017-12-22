<?php

namespace phpcms\modules\admin;

use pc_base;
use phpcms\modules\admin\classes\admin;

class phpsso extends admin
{
    function __construct()
    {
        parent::__construct();
    }

    function menu()
    {
    }

    function public_menu_left()
    {
        $setting = pc_base::load_config('system');

        include $this->admin_tpl('phpsso');
    }
}
