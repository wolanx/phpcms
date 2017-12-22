<?php

namespace phpcms\modules\poster\classes;

use pc_base;
use phpcms\model\poster_model;
use phpcms\model\poster_space_model;
use phpcms\model\queue_model;

/**
 * 广告生成js类
 */
class html
{
    private $db, $s_db, $queue;

    public function __construct()
    {
        $this->s_db = new poster_space_model();
        $this->db = new poster_model();
        $this->queue = new queue_model();
    }

    /**
     * 生成广告js文件
     * @param int $id 广告版位ID
     * @return bool 成功返回true
     */
    public function create_js($id = 0)
    {
        $id = intval($id);
        if (!$id) {
            $this->msg = L('no_create_js');

            return false;
        }
        $siteid = get_siteid();
        $r = $this->s_db->get_one(['siteid' => $siteid, 'spaceid' => $id]);
        $now = SYS_TIME;
        if ($r['setting']) {
            $space_setting = string2array($r['setting']);
        }
        if ($r['type'] == 'code') {
            return true;
        }
        $poster_template = getcache('poster_template_' . $siteid, 'commons');
        if ($poster_template[$r['type']]['option']) {
            $where = "`spaceid`='" . $id . "' AND `siteid`='" . $siteid . "' AND `disabled`=0 AND `startdate`<='" . $now . "' AND (`enddate`>='" . $now . "' OR `enddate`=0) ";
            $pinfo = $this->db->select($where, '*', '', '`listorder` ASC, `id` DESC');
            if (is_array($pinfo) && !empty($pinfo)) {
                foreach ($pinfo as $k => $rs) {
                    if ($rs['setting']) {
                        $rs['setting'] = string2array($rs['setting']);
                        $pinfo[$k] = $rs;
                    } else {
                        unset($pinfo[$k]);
                    }
                }
                extract($r);
            } else {
                return true;
            }
        } else {
            $where = " `spaceid`='" . $id . "' AND `siteid`='" . $siteid . "' AND `disabled`=0 AND `startdate`<='" . $now . "' AND (`enddate`>='" . $now . "' OR `enddate`=0)";
            $pinfo = $this->db->get_one($where, '*', '`listorder` ASC, `id` DESC');
            if (is_array($pinfo) && $pinfo['setting']) {
                $pinfo['setting'] = string2array($pinfo['setting']);
            }
            extract($r);
            if (!is_array($pinfo) || empty($pinfo)) {
                return true;
            }
            extract($pinfo, EXTR_PREFIX_SAME, 'p');
        }
        $file = CACHE_PATH . $path;
        ob_start();
        include template('poster', $type);
        $data = ob_get_contents();
        ob_end_clean();

        $strlen = pc_base::load_config('system', 'lock_ex') ? file_put_contents($file, $data, LOCK_EX) : file_put_contents($file, $data);
        @chmod($file, 0777);

        return true;
    }
}
