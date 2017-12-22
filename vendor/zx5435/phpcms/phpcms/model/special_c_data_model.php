<?php

namespace phpcms\model;

use pc_base;
use phpcms\libs\classes\model;

class special_c_data_model extends model
{
    public $table_name;

    function __construct()
    {
        $this->db_config = pc_base::load_config('database');
        $this->db_setting = 'default';
        $this->table_name = 'special_c_data';
        parent::__construct();
    }
}
