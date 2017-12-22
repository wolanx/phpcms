<?php

namespace phpcms\model;

use pc_base;
use phpcms\libs\classes\model;

class queue_model extends model
{
    public function __construct()
    {
        $this->db_config = pc_base::load_config('database');
        $this->db_setting = 'default';
        $this->table_name = 'queue';
        parent::__construct();
    }

    /**
     * 添加同步队列
     * @param string  $type 操作类型{add:添加,edit:修改,del:删除}
     * @param string  $path 文档地址
     * @param integer $siteid 站点ID
     */
    final public function add_queue($type = 'add', $path, $siteid = '')
    {
        if (empty($siteid)) {
            $siteid = get_siteid();
        }
        $sites = pc_base::load_app_class('sites', 'admin');
        $site = $sites->get_by_id($siteid);
        if (empty($site['release_point'])) {
            return false;
        }

        if ($r = $this->get_one(['type' => $type, 'path' => $path, 'siteid' => $siteid], 'id')) {
            if ($this->update(['status1' => '0', 'status2' => '0', 'status3' => '0', 'status4' => '0', 'times' => SYS_TIME], ['id' => $r['id']])) {
                return true;
            } else {
                return false;
            }
        } else {
            if ($this->insert(['type' => $type, 'path' => $path, 'siteid' => $siteid, 'times' => SYS_TIME])) {
                return true;
            } else {
                return false;
            }
        }
    }
}
