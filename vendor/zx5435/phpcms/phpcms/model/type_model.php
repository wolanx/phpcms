<?php

namespace phpcms\model;

use pc_base;
use phpcms\libs\classes\model;

class type_model extends model
{
    function __construct()
    {
        $this->db_config = pc_base::load_config('database');
        $this->db_setting = 'default';
        $this->table_name = 'type';
        parent::__construct();
    }

    /**
     * 说明: 查询对应模块下的分类
     * @param int $siteid 模块名称
     * @return array|bool
     */
    function get_types($siteid)
    {
        if (!ROUTE_M) {
            return false;
        }

        return $this->select(['module' => ROUTE_M, 'siteid' => $siteid], '*', '', $order = 'typeid ASC');
    }
}
