<?php

namespace phpcms\model;

use pc_base;
use phpcms\libs\classes\model;

class dianping_type_model extends model
{
    function __construct()
    {
        $this->db_config = pc_base::load_config('database');
        $this->db_setting = 'default';
        $this->table_name = 'dianping_type';
        parent::__construct();
    }

    /**
     * 说明: 取得投票信息, 返回数组
     * @param int $subjectid 投票ID
     */
    function get_subject($subjectid)
    {
        if (!$subjectid) {
            return false;
        }

        return $this->get_one(['subjectid' => $subjectid]);
    }
}
