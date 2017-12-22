<?php

namespace phpcms\modules\admin;

use phpcms\model\module_model;
use phpcms\model\urlrule_model;
use phpcms\modules\admin\classes\admin;

/**
 * @property urlrule_model $db
 * @property module_model $module_db
 */
class urlrule extends admin
{
    function __construct()
    {
        parent::__construct();
        $this->db = new urlrule_model();
        $this->module_db = new module_model();
    }

    function init()
    {
        $page = intval($_GET['page']);
        $infos = $this->db->listinfo('', '', $page);
        $pages = $this->db->pages;
        $big_menu = [
            'javascript:window.top.art.dialog({id:\'add\',iframe:\'?m=admin&c=urlrule&a=add\', title:\'' . L('add_urlrule') . '\', width:\'750\', height:\'300\', lock:true}, function(){var d = window.top.art.dialog({id:\'add\'}).data.iframe;var form = d.document.getElementById(\'dosubmit\');form.click();return false;}, function(){window.top.art.dialog({id:\'add\'}).close()});void(0);',
            L('add_urlrule'),
        ];
        $this->public_cache_urlrule();
        include $this->admin_tpl('urlrule_list');
    }

    function add()
    {
        if (isset($_POST['dosubmit'])) {
            $_POST['info']['urlrule'] = rtrim(trim($_POST['info']['urlrule']), '.php');
            $_POST['info']['urlrule'] = $this->url_replace($_POST['info']['urlrule']);
            if ($this->url_ifok($_POST['info']['urlrule']) == false) {
                showmessage('url规则里含有非法php字符');
            }
            $this->db->insert($_POST['info']);
            $this->public_cache_urlrule();
            showmessage(L('add_success'), '', '', 'add');
        } else {
            $show_validator = $show_header = '';
            $modules_arr = $this->module_db->select('', 'module,name');

            $modules = [];
            foreach ($modules_arr as $r) {
                $modules[$r['module']] = $r['name'];
            }

            include $this->admin_tpl('urlrule_add');
        }
    }

    function delete()
    {
        $_GET['urlruleid'] = intval($_GET['urlruleid']);
        $this->db->delete(['urlruleid' => $_GET['urlruleid']]);
        $this->public_cache_urlrule();
        showmessage(L('operation_success'), HTTP_REFERER);
    }

    function edit()
    {
        if (isset($_POST['dosubmit'])) {
            $urlruleid = intval($_POST['urlruleid']);
            $_POST['info']['urlrule'] = rtrim(trim($_POST['info']['urlrule']), '.php');
            $_POST['info']['urlrule'] = $this->url_replace($_POST['info']['urlrule']);
            if ($this->url_ifok($_POST['info']['urlrule']) == false) {
                showmessage('url规则里含有非法php字符');
            }
            $this->db->update($_POST['info'], ['urlruleid' => $urlruleid]);
            $this->public_cache_urlrule();
            showmessage(L('update_success'), '', '', 'edit');
        } else {
            $show_validator = $show_header = '';
            $urlruleid = $_GET['urlruleid'];
            $r = $this->db->get_one(['urlruleid' => $urlruleid]);
            extract($r);
            $modules_arr = $this->module_db->select('', 'module,name');

            $modules = [];
            foreach ($modules_arr as $r) {
                $modules[$r['module']] = $r['name'];
            }
            include $this->admin_tpl('urlrule_edit');
        }
    }

    /**
     * 更新URL规则
     */
    public function public_cache_urlrule()
    {
        $datas = $this->db->select('', '*', '', '', '', 'urlruleid');
        $basic_data = [];
        foreach ($datas as $roleid => $r) {
            $basic_data[$roleid] = $r['urlrule'];;
        }
        setcache('urlrules_detail', $datas, 'commons');
        setcache('urlrules', $basic_data, 'commons');
    }

    /**
     * url规则替换
     * @param $url
     * @return string
     */
    public function url_replace($url)
    {
        $urldb = explode("|", $url);
        foreach ($urldb as $key => $value) {
            if (strpos($value, "index.php") === 0) {
                $value = str_replace('index.php', '', $value);
                $value = str_replace('.php', '', $value);
                $value = "index.php" . $value;
            } else {
                $value = str_replace('.php', '', $value);
            }
            $urldb[$key] = $value;
        }

        return implode("|", $urldb);
    }

    /**
     * 规则 判断。
     * @param $url
     * @return bool
     */
    public function url_ifok($url)
    {
        $urldb = explode("|", $url);
        foreach ($urldb as $key => $value) {
            if (strpos($value, "index.php") === 0) {
                $value = substr($value, '9');
            }
            if (stripos($value, "php") !== false) {
                return false;
            }
        }

        return true;
    }
}
