<?php

namespace phpcms\model;

use pc_base;
use phpcms\libs\classes\model;

class vote_data_model extends model
{
    function __construct()
    {
        $this->db_config = pc_base::load_config('database');
        $this->db_setting = 'default';
        $this->table_name = 'vote_data';
        parent::__construct();
    }

    /**
     * 说明: 查询 该投票的 投票信息
     * @param int $subjectid 投票ID
     */
    function get_vote_data($subjectid)
    {
        if (!$subjectid) {
            return false;
        }

        return $this->select(['subjectid' => $subjectid], '*', '', $order = 'optionid ASC');

    }
}
