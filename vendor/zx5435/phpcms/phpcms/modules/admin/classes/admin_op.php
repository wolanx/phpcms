<?php

namespace phpcms\modules\admin\classes;

use pc_base;
use phpcms\model\admin_model;

//定义在后台
define('IN_ADMIN', true);

class admin_op
{
    public function __construct()
    {
        $this->db = new admin_model();
    }

    /*
     * 修改密码
     */
    public function edit_password($userid, $password)
    {
        $userid = intval($userid);
        if ($userid < 1) {
            return false;
        }
        if (!is_password($password)) {
            showmessage(L('pwd_incorrect'));

            return false;
        }
        $passwordinfo = password($password);

        return $this->db->update($passwordinfo, ['userid' => $userid]);
    }

    /*
     * 检查用户名重名
     */
    public function checkname($username)
    {
        $username = trim($username);
        if ($this->db->get_one(['username' => $username], 'userid')) {
            return false;
        }

        return true;
    }
}
