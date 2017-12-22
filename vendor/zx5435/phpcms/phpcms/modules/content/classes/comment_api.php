<?php

namespace phpcms\modules\content\classes;

use phpcms\model\content_model;

defined('IN_PHPCMS') or exit('No permission resources.');
if (!module_exists('comment')) {
    showmessage(L('module_not_exists'));
}

class comment_api
{
    /** @var content_model $db */
    private $db;

    function __construct()
    {
        $this->db = new content_model();
    }

    /**
     * 获取评论信息
     * @param int $module 模型
     * @param int $contentid 文章ID
     * @param int $siteid 站点ID
     * @return array|bool
     */
    function get_info($module, $contentid, $siteid)
    {
        list($module, $catid) = explode('_', $module);
        if (empty($contentid) || empty($catid)) {
            return false;
        }
        //判断栏目是否存在 s
        $CATEGORYS = getcache('category_content_' . $siteid, 'commons');
        if (!$CATEGORYS[$catid]) {
            return false;
        }

        //判断模型是否存在
        $this_modelid = $CATEGORYS[$catid]['modelid'];
        $MODEL = getcache('model', 'commons');
        if (!$MODEL[$this_modelid]) {
            return false;
        }

        $this->db->set_catid($catid);
        $r = $this->db->get_one(['catid' => $catid, 'id' => $contentid], '`title`');
        $category = getcache('category_content_' . $siteid, 'commons');
        $model = getcache('model', 'commons');

        $cat = $category[$catid];
        $data_info = [];
        if ($cat['type'] == 0) {
            if ($model[$cat['modelid']]['tablename']) {
                $this->db->table_name = $this->db->db_tablepre . $model[$cat['modelid']]['tablename'] . '_data';
                $data_info = $this->db->get_one(['id' => $contentid]);
            }
        }

        if ($r) {
            return ['title' => $r['title'], 'url' => go($catid, $contentid, 1), 'allow_comment' => (isset($data_info['allow_comment']) ? $data_info['allow_comment'] : 1)];
        } else {
            return false;
        }
    }
}
