<?php

namespace phpcms\modules\member;

use phpcms\model\module_model;
use phpcms\modules\admin\classes\admin;

/**
 * 管理员后台会员模块设置
 * @property $sms_setting_arr array
 * @property $sms_setting array
 */
class member_setting extends admin
{

    private $db;

    function __construct()
    {
        parent::__construct();
        $this->db = new module_model();
    }

    /**
     * member list
     */
    function manage()
    {
        if (isset($_POST['dosubmit'])) {
            $member_setting = array2string($_POST['info']);

            $this->db->update(['module' => 'member', 'setting' => $member_setting], ['module' => 'member']);
            setcache('member_setting', $_POST['info']);
            showmessage(L('operation_success'), HTTP_REFERER);
        } else {
            $show_scroll = true;
            $member_setting = $this->db->get_one(['module' => 'member'], 'setting');
            $member_setting = string2array($member_setting['setting']);

            $email_config = getcache('common', 'commons');
            $this->sms_setting_arr = getcache('sms', 'sms');
            $siteid = get_siteid();

            if (empty($email_config['mail_user']) || empty($email_config['mail_password'])) {
                $mail_disabled = 1;
            }

            if (!empty($this->sms_setting_arr[$siteid])) {
                $this->sms_setting = $this->sms_setting_arr[$siteid];
                if ($this->sms_setting['sms_enable'] == '0') {
                    $sms_disabled = 1;
                } else {
                    if (empty($this->sms_setting['userid']) || empty($this->sms_setting['productid']) || empty($this->sms_setting['sms_key'])) {
                        $sms_disabled = 1;
                    }
                }
            } else {
                $sms_disabled = 1;
            }

            include $this->admin_tpl('member_setting');
        }
    }

}
