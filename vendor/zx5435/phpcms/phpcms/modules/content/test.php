<?php

namespace phpcms\modules\content;

use pc_base;

pc_base::session_start();

class test
{
    public function init()
    {
        //$_SESSION['a'] = 'qwe';
        var_export($_SESSION);
    }
}
