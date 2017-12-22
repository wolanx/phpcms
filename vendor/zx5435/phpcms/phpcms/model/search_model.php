<?php

namespace phpcms\model;

use pc_base;
use phpcms\libs\classes\model;
use phpcms\libs\classes\segment;
use phpcms\libs\classes\param;

class search_model extends model
{
    public $table_name = '';

    public function __construct()
    {
        $this->db_config = pc_base::load_config('database');
        $this->db_setting = 'default';
        $this->table_name = 'search';
        parent::__construct();
    }

    /**
     * 添加到全站搜索、修改已有内容
     * @param $typeid
     * @param int $id
     * @param string $data
     * @param string $text 不分词的文本
     * @param int $adddate 添加时间
     * @param int $iscreateindex 是否是后台更新全文索引
     * @return bool
     */
    public function update_search($typeid, $id = 0, $data = '', $text = '', $adddate = 0, $iscreateindex = 0)
    {
        $segment = new segment();
        //分词结果
        $fulltext_data = $segment->get_keyword($segment->split_result($data));
        $fulltext_data = $text . ' ' . $fulltext_data;
        if (!$iscreateindex) {
            $r = $this->get_one(['typeid' => $typeid, 'id' => $id], 'searchid');
        }

        if ($r) {
            $searchid = $r['searchid'];
            $this->update(['data' => $fulltext_data, 'adddate' => $adddate], ['typeid' => $typeid, 'id' => $id]);
        } else {
            $siteid = param::get_cookie('siteid');
            $searchid = $this->insert([
                'typeid'  => $typeid,
                'id'      => $id,
                'adddate' => $adddate,
                'data'    => $fulltext_data,
                'siteid'  => $siteid,
            ], true);
        }

        return $searchid;
    }

    /*
     * 删除全站搜索内容
     */
    public function delete_search($typeid, $id)
    {
        $this->delete(['typeid' => $typeid, 'id' => $id]);
    }
}
