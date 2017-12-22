<?php

namespace phpcms\model;

use pc_base;
use phpcms\libs\classes\model;

class urlrule_model extends model
{
    function __construct()
    {
        $this->db_config = pc_base::load_config('database');
        $this->db_setting = 'default';
        $this->table_name = 'urlrule';
        parent::__construct();
    }
}
