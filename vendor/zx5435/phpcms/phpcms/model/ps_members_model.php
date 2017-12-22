<?php

namespace phpcms\model;

use pc_base;
use phpcms\libs\classes\model;

class ps_members_model extends model
{
    public function __construct()
    {
        $this->db_config = pc_base::load_config('database');
        $this->db_setting = 'phpsso';
        $this->table_name = 'members';
        parent::__construct();
    }
}
