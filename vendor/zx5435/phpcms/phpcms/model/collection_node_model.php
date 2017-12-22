<?php

namespace phpcms\model;

use pc_base;
use phpcms\libs\classes\model;

pc_base::load_sys_class('model', '', 0);

class collection_node_model extends model
{
    public function __construct()
    {
        $this->db_config = pc_base::load_config('database');
        $this->db_setting = 'default';
        $this->table_name = 'collection_node';
        parent::__construct();
    }

}
