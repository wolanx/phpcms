<?php

namespace phpcms\modules\video\classes;

use phpcms\libs\classes\model;
use phpcms\libs\classes\param;

/**
 * 这个类，主要负责视频模型数据处理
 * @property model $db
 */
class v
{
    private $db;

    public function __construct(&$db)
    {
        $this->db = &$db;
    }

    /**
     * add 添加视频方法，将视频入库到视频库中
     * @param array $data 视频信息数据
     * @return bool|int
     */
    public function add($data = [])
    {
        if (is_array($data) && !empty($data)) {
            $data['status'] = 1;
            $data['userid'] = defined('IN_ADMIN') ? 0 : intval(param::get_cookie('_userid'));
            $data['vid'] = safe_replace($data['vid']);
            $vid = $this->db->insert($data, true);

            return $vid ? $vid : false;
        } else {
            return false;
        }
    }

    /**
     * function edit
     * 编辑视频方法，用户重新编辑已上传的视频
     * @param array $data 视频视频信息数组 包括title description tag vid 等信息
     * @param int   $vid 视频库中视频的主键
     * @return bool
     */
    public function edit($data = [], $vid = 0)
    {
        if (is_array($data) && !empty($data)) {
            $vid = intval($vid);
            if (!$vid) {
                return false;
            }
            unset($data['vid']);
            $this->db->update($data, "`videoid` = '$vid'");

            return true;
        } else {
            return false;
        }
    }

    /**
     * 删除视频库中的视频
     * @param int $vid 视频ID
     * @return bool
     */
    public function del_video($vid = 0)
    {
        $vid = intval($vid);
        if (!$vid) {
            return false;
        }
        //删除视频关联的内容，并更新内容页
        $this->db->delete(['videoid' => $vid]);

        return true;
    }
}
