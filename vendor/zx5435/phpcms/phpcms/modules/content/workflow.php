<?php

namespace phpcms\modules\content;

use phpcms\model\admin_model;
use phpcms\model\workflow_model;
use phpcms\modules\admin\classes\admin;

class workflow extends admin
{
    private $db, $admin_db;
    public $siteid;

    function __construct()
    {
        parent::__construct();
        $this->db = new workflow_model();
        $this->admin_db = new admin_model();
        $this->siteid = $this->get_siteid();
    }

    public function init()
    {
        $datas = [];
        $result_datas = $this->db->listinfo(['siteid' => $this->siteid]);
        foreach ($result_datas as $r) {
            $datas[] = $r;
        }
        $this->cache();
        include $this->admin_tpl('workflow_list');
    }

    public function add()
    {
        if (isset($_POST['dosubmit'])) {

            $_POST['info']['siteid'] = $this->siteid;
            $_POST['info']['workname'] = safe_replace($_POST['info']['workname']);
            $setting[1] = $_POST['checkadmin1'];
            $setting[2] = $_POST['checkadmin2'];
            $setting[3] = $_POST['checkadmin3'];
            $setting[4] = $_POST['checkadmin4'];
            $setting['nocheck_users'] = $_POST['nocheck_users'];
            $setting = array2string($setting);
            $_POST['info']['setting'] = $setting;

            $this->db->insert($_POST['info']);
            $this->cache();
            showmessage(L('add_success'));
        } else {
            $show_validator = '';
            $admin_data = [];
            $result = $this->admin_db->select();
            foreach ($result as $_value) {
                if ($_value['roleid'] == 1) {
                    continue;
                }
                $admin_data[$_value['username']] = $_value['username'];
            }
            include $this->admin_tpl('workflow_add');
        }
    }

    public function edit()
    {
        if (isset($_POST['dosubmit'])) {
            $workflowid = intval($_POST['workflowid']);

            $_POST['info']['workname'] = safe_replace($_POST['info']['workname']);

            $setting[1] = $_POST['checkadmin1'];
            $setting[2] = $_POST['checkadmin2'];
            $setting[3] = $_POST['checkadmin3'];
            $setting[4] = $_POST['checkadmin4'];
            $setting['nocheck_users'] = $_POST['nocheck_users'];
            $setting = array2string($setting);
            $_POST['info']['setting'] = $setting;
            $this->db->update($_POST['info'], ['workflowid' => $workflowid]);
            $this->cache();
            showmessage(L('update_success'), '', '', 'edit');
        } else {
            $show_header = $show_validator = '';
            $workflowid = intval($_GET['workflowid']);
            $admin_data = [];
            $result = $this->admin_db->select();
            foreach ($result as $_value) {
                if ($_value['roleid'] == 1) {
                    continue;
                }
                $admin_data[$_value['username']] = $_value['username'];
            }
            $r = $this->db->get_one(['workflowid' => $workflowid]);
            extract($r);
            $setting = string2array($setting);

            $checkadmin1 = $this->implode_ids($setting[1]);
            $checkadmin2 = $this->implode_ids($setting[2]);
            $checkadmin3 = $this->implode_ids($setting[3]);
            $checkadmin4 = $this->implode_ids($setting[4]);
            $nocheck_users = $this->implode_ids($setting['nocheck_users']);

            include $this->admin_tpl('workflow_edit');
        }
    }

    public function view()
    {

        $show_header = '';
        $workflowid = intval($_GET['workflowid']);
        $admin_data = [];
        $result = $this->admin_db->select();
        foreach ($result as $_value) {
            if ($_value['roleid'] == 1) {
                continue;
            }
            $admin_data[$_value['username']] = $_value['username'];
        }
        $r = $this->db->get_one(['workflowid' => $workflowid]);
        extract($r);
        $setting = string2array($setting);

        $checkadmin1 = $this->implode_ids($setting[1], '、');
        $checkadmin2 = $this->implode_ids($setting[2], '、');
        $checkadmin3 = $this->implode_ids($setting[3], '、');
        $checkadmin4 = $this->implode_ids($setting[4], '、');

        include $this->admin_tpl('workflow_view');
    }

    public function delete()
    {
        $_GET['workflowid'] = intval($_GET['workflowid']);
        $this->db->delete(['workflowid' => $_GET['workflowid']]);
        $this->cache();
        exit('1');
    }


    public function cache()
    {
        $datas = [];
        $workflow_datas = $this->db->select(['siteid' => $this->siteid], '*', 1000);
        foreach ($workflow_datas as $_k => $_v) {
            $datas[$_v['workflowid']] = $_v;
        }
        setcache('workflow_' . $this->siteid, $datas, 'commons');

        return true;
    }

    /**
     * 用逗号分隔数组
     */
    private function implode_ids($array, $flags = ',')
    {
        if (empty($array)) {
            return true;
        }
        $length = strlen($flags);
        $string = '';
        foreach ($array as $_v) {
            $string .= $_v . $flags;
        }

        return substr($string, 0, -$length);
    }
}
