<?php

namespace phpcms\model;

use pc_base;
use phpcms\libs\classes\model;

class video_store_model extends model
{
    public $table_name = '';

    public function __construct()
    {
        $this->db_config = pc_base::load_config('database');
        $this->db_setting = 'default';
        $this->table_name = 'video_store';
        parent::__construct();
    }
}
