<?php

namespace phpcms\model;

use pc_base;
use phpcms\libs\classes\model;

class members_model extends model
{
    public function __construct()
    {
        $this->db_config = pc_base::load_config('database');
        $this->db_setting = 'default';
        $this->table_name = 'member';
        parent::__construct();
    }

    /**
     * 重置模型操作表表
     * @param string $modelid 模型id
     */
    public function set_model($modelid = '')
    {
        if ($modelid) {
            $model = getcache('member_model', 'commons');
            $this->table_name = $this->db_tablepre . $model[$modelid]['tablename'];
        } else {
            $this->table_name = $this->db_tablepre . 'member';
        }
    }
}
