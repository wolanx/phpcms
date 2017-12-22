<?php

namespace phpcms\modules\admin\classes;

use phpcms\model\admin_role_model;
use phpcms\model\admin_role_priv_model;

//定义在后台
define('IN_ADMIN', true);

class role_op
{
    public function __construct()
    {
        $this->db = new admin_role_model();
        $this->priv_db = new admin_role_priv_model();
    }

    /**
     * 获取角色中文名称
     * @param int $roleid 角色ID
     * @return array
     */
    public function get_rolename($roleid)
    {
        $roleid = intval($roleid);
        $search_field = '`roleid`,`rolename`';
        $info = $this->db->get_one(['roleid' => $roleid], $search_field);

        return $info;
    }

    /**
     * 检查角色名称重复
     * @param string $name 角色组名称
     * @return bool
     */
    public function checkname($name)
    {
        $info = $this->db->get_one(['rolename' => $name], 'roleid');
        if ($info['roleid']) {
            return true;
        }

        return false;
    }

    /**
     * 获取菜单表信息
     * @param int $menuid 菜单ID
     * @param int $menu_info 菜单数据
     * @return array
     */
    public function get_menuinfo($menuid, $menu_info)
    {
        $menuid = intval($menuid);
        unset($menu_info[$menuid]['id']);

        return $menu_info[$menuid];
    }

    /**
     * 检查指定菜单是否有权限
     * @param array $data menu表中数组
     * @param int   $roleid 需要检查的角色ID
     * @param       $siteid
     * @param       $priv_data
     * @return bool
     */
    public function is_checked($data, $roleid, $siteid, $priv_data)
    {
        $priv_arr = ['m', 'c', 'a', 'data'];
        if ($data['m'] == '') {
            return false;
        }
        foreach ($data as $key => $value) {
            if (!in_array($key, $priv_arr)) {
                unset($data[$key]);
            }
        }
        $data['roleid'] = $roleid;
        $data['siteid'] = $siteid;
        $info = in_array($data, $priv_data);
        if ($info) {
            return true;
        } else {
            return false;
        }

    }

    /**
     * 是否为设置状态
     * @param int $siteid
     * @param int $roleid
     * @return bool
     */
    public function is_setting($siteid, $roleid)
    {
        $siteid = intval($siteid);
        $roleid = intval($roleid);
        $sqls = "`siteid`='$siteid' AND `roleid` = '$roleid' AND `m` != ''";
        $result = $this->priv_db->get_one($sqls);

        return $result ? true : false;
    }

    /**
     * 获取菜单深度
     * @param $id
     * @param $array
     * @param $i
     * @return int
     */
    public function get_level($id, $array = [], $i = 0)
    {
        foreach ($array as $n => $value) {
            if ($value['id'] == $id) {
                if ($value['parentid'] == '0') {
                    return $i;
                }
                $i++;

                return $this->get_level($value['parentid'], $array, $i);
            }
        }

        return $i;
    }
}
