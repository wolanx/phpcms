<?php

namespace phpcms\model;

use pc_base;
use phpcms\libs\classes\model;

class vote_subject_model extends model
{
    function __construct()
    {
        $this->db_config = pc_base::load_config('database');
        $this->db_setting = 'default';
        $this->table_name = 'vote_subject';
        parent::__construct();
    }

    /**
     * 说明: 取得投票信息, 返回数组
     * @param $subjectid 投票ID
     */
    function get_subject($subjectid)
    {
        if (!$subjectid) {
            return false;
        }

        return $this->get_one(['subjectid' => $subjectid]);
    }
}
