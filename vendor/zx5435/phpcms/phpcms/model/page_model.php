<?php

namespace phpcms\model;

use pc_base;
use phpcms\libs\classes\model;

class page_model extends model
{
    public $table_name = '';

    public function __construct()
    {
        $this->db_config = pc_base::load_config('database');
        $this->db_setting = 'default';
        $this->table_name = 'page';
        parent::__construct();
    }

    public function create_html($catid)
    {
        $this->html = pc_base::load_app_class('html', 'content');
        $this->html->category($catid, 1);
    }
}
