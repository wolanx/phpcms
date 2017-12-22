<?php

namespace phpcms\model;

use pc_base;
use phpcms\libs\classes\model;

/**
 * Class admin_panel_model
 * @property $this model
 */
class admin_panel_model extends model
{
    public function __construct()
    {
        $this->db_config = pc_base::load_config('database');
        $this->db_setting = 'default';
        $this->table_name = 'admin_panel';
        parent::__construct();
    }
}
