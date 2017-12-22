<?php

namespace phpcms\model;

use pc_base;
use phpcms\libs\classes\model;

class hits_model extends model
{
    public $table_name = '';

    public function __construct()
    {
        $this->db_config = pc_base::load_config('database');
        $this->db_setting = 'default';
        $this->table_name = 'hits';
        parent::__construct();
    }
}
