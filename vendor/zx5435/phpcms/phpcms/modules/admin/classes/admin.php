<?php

namespace phpcms\modules\admin\classes;

use pc_base;
use phpcms\libs\classes\form;
use phpcms\libs\classes\param;
use phpcms\model\ipbanned_model;
use phpcms\model\log_model;
use phpcms\model\menu_model;

pc_base::session_start();

if (param::get_cookie('sys_lang')) {
    define('SYS_STYLE', param::get_cookie('sys_lang'));
} else {
    define('SYS_STYLE', 'zh-cn');
}

//定义在后台
define('IN_ADMIN', true);

class admin
{
    public $userid;
    public $username;

    public function __construct()
    {
        self::check_admin();
        self::check_priv();
        pc_base::load_app_func('global', 'admin');
        if (!module_exists(ROUTE_M)) {
            showmessage(L('module_not_exists'));
        }
        self::manage_log();
        self::check_ip();
        self::lock_screen();
        self::check_hash();
        if (pc_base::load_config('system', 'admin_url') && $_SERVER["HTTP_HOST"] != pc_base::load_config('system', 'admin_url')) {
            header("http/1.1 403 Forbidden");
            exit('No permission resources.');
        }
    }

    /**
     * 判断用户是否已经登陆
     */
    final public function check_admin()
    {
        if (ROUTE_M == 'admin' && ROUTE_C == 'index' && in_array(ROUTE_A, ['login', 'public_card'])) {
            return true;
        } else {
            $userid = param::get_cookie('userid');
            if (!isset($_SESSION['userid']) || !isset($_SESSION['roleid']) || !$_SESSION['userid'] || !$_SESSION['roleid'] || $userid != $_SESSION['userid']) {
                showmessage(L('admin_login'), '?m=admin&c=index&a=login');
            }
        }

        return false;
    }

    /**
     * 加载后台模板
     * @param string $file 文件名
     * @param string $m 模型名
     * @return string
     */
    final public static function admin_tpl($file, $m = '')
    {
        $m = empty($m) ? ROUTE_M : $m;
        if (empty($m)) {
            return false;
        }

        return PATH_PHPCMS . 'modules' . DS . $m . DS . 'templates' . DS . $file . '.tpl.php';
    }

    /**
     * 按父ID查找菜单子项
     * @param integer $parentid 父菜单ID
     * @param integer $with_self 是否包括他自己
     * @return array
     */
    final public static function admin_menu($parentid, $with_self = 0)
    {
        $parentid = intval($parentid);
        $menudb = new menu_model();
        $site_model = param::get_cookie('site_model');
        $where = ['parentid' => $parentid, 'display' => 1];
        if ($site_model && $parentid) {
            $where[$site_model] = 1;
        }
        $result = $menudb->select($where, '*', 1000, 'listorder ASC');
        if ($with_self) {
            $result2[] = $menudb->get_one(['id' => $parentid]);
            $result = array_merge($result2, $result);
        }
        //权限检查
        if ($_SESSION['roleid'] == 1) {
            return $result;
        }
        $array = [];
        $privdb = pc_base::load_model('admin_role_priv_model');
        $siteid = param::get_cookie('siteid');
        foreach ($result as $v) {
            $action = $v['a'];
            if (preg_match('/^public_/', $action)) {
                $array[] = $v;
            } else {
                if (preg_match('/^ajax_([a-z]+)_/', $action, $_match)) {
                    $action = $_match[1];
                }
                $r = $privdb->get_one(['m' => $v['m'], 'c' => $v['c'], 'a' => $action, 'roleid' => $_SESSION['roleid'], 'siteid' => $siteid]);
                if ($r) {
                    $array[] = $v;
                }
            }
        }

        return $array;
    }

    /**
     * 获取菜单 头部菜单导航
     * @param string $parentid 菜单id
     * @param bool   $big_menu
     * @return array
     */
    final public static function submenu($parentid = '', $big_menu = false)
    {
        if (empty($parentid)) {
            $menudb = pc_base::load_model('menu_model');
            $r = $menudb->get_one(['m' => ROUTE_M, 'c' => ROUTE_C, 'a' => ROUTE_A]);
            $parentid = $_GET['menuid'] = $r['id'];
        }
        $array = self::admin_menu($parentid, 1);

        $numbers = count($array);
        if ($numbers == 1 && !$big_menu) {
            return '';
        }
        $string = '';
        $pc_hash = $_SESSION['pc_hash'];
        foreach ($array as $_value) {
            if (!isset($_GET['s'])) {
                $classname = ROUTE_M == $_value['m'] && ROUTE_C == $_value['c'] && ROUTE_A == $_value['a'] ? 'class="on"' : '';
            } else {
                $_s = !empty($_value['data']) ? str_replace('=', '', strstr($_value['data'], '=')) : '';
                $classname = ROUTE_M == $_value['m'] && ROUTE_C == $_value['c'] && ROUTE_A == $_value['a'] && $_GET['s'] == $_s ? 'class="on"' : '';
            }
            if ($_value['parentid'] == 0 || $_value['m'] == '') {
                continue;
            }
            if ($classname) {
                $string .= "<a href='javascript:;' $classname><em>" . L($_value['name']) . "</em></a><span>|</span>";
            } else {
                $string .= "<a href='?m=" . $_value['m'] . "&c=" . $_value['c'] . "&a=" . $_value['a'] . "&menuid=$parentid&pc_hash=$pc_hash" . '&' . $_value['data'] . "' $classname><em>" . L($_value['name']) . "</em></a><span>|</span>";
            }
        }
        $string = substr($string, 0, -14);

        return $string;
    }

    /**
     * 当前位置
     * @param int $id 菜单id
     * @return string
     */
    final public static function current_pos($id)
    {
        $menudb = new menu_model();
        $r = $menudb->get_one(['id' => $id], 'id,name,parentid');
        $str = '';
        if ($r['parentid']) {
            $str = self::current_pos($r['parentid']);
        }

        return $str . L($r['name']) . ' > ';
    }

    /**
     * 获取当前的站点ID
     */
    final public static function get_siteid()
    {
        return get_siteid();
    }

    /**
     * 获取当前站点信息
     * @param integer $siteid 站点ID号，为空时取当前站点的信息
     * @return array
     */
    final public static function get_siteinfo($siteid = '')
    {
        if ($siteid == '') {
            $siteid = self::get_siteid();
        }
        if (empty($siteid)) {
            return false;
        }
        $sites = new sites();

        return $sites->get_by_id($siteid);
    }

    final public static function return_siteid()
    {
        $sites = pc_base::load_app_class('sites', 'admin');
        $siteid = explode(',', $sites->get_role_siteid($_SESSION['roleid']));

        return current($siteid);
    }

    /**
     * 权限判断
     */
    final public function check_priv()
    {
        if (ROUTE_M == 'admin' && ROUTE_C == 'index' && in_array(ROUTE_A, ['login', 'init', 'public_card'])) {
            return true;
        }
        if ($_SESSION['roleid'] == 1) {
            return true;
        }
        $siteid = param::get_cookie('siteid');
        $action = ROUTE_A;
        $privdb = pc_base::load_model('admin_role_priv_model');
        if (preg_match('/^public_/', ROUTE_A)) {
            return true;
        }
        if (preg_match('/^ajax_([a-z]+)_/', ROUTE_A, $_match)) {
            $action = $_match[1];
        }
        $r = $privdb->get_one(['m' => ROUTE_M, 'c' => ROUTE_C, 'a' => $action, 'roleid' => $_SESSION['roleid'], 'siteid' => $siteid]);
        if (!$r) {
            showmessage('您没有权限操作该项', 'blank');
        }

        return false;
    }

    /**
     *
     * 记录日志
     */
    final private function manage_log()
    {
        //判断是否记录
        $setconfig = pc_base::load_config('system');
        /** @var int $admin_log */
        extract($setconfig);
        if ($admin_log == 1) {
            $action = ROUTE_A;
            if ($action == '' || strchr($action, 'public') || $action == 'init' || $action == 'public_current_pos') {
                return false;
            } else {
                $ip = ip();
                $log = new log_model();
                $username = param::get_cookie('admin_username');
                $userid = isset($_SESSION['userid']) ? $_SESSION['userid'] : '';
                $time = date('Y-m-d H-i-s', SYS_TIME);
                $url = '?m=' . ROUTE_M . '&c=' . ROUTE_C . '&a=' . ROUTE_A;
                $log->insert(['module' => ROUTE_M, 'username' => $username, 'userid' => $userid, 'action' => ROUTE_C, 'querystring' => $url, 'time' => $time, 'ip' => $ip]);
            }
        }

        return false;
    }

    /**
     *
     * 后台IP禁止判断 ...
     */
    final private function check_ip()
    {
        $this->ipbanned = new ipbanned_model();
        $this->ipbanned->check_ip();
    }

    /**
     * 检查锁屏状态
     */
    final private function lock_screen()
    {
        if (isset($_SESSION['lock_screen']) && $_SESSION['lock_screen'] == 1) {
            if (preg_match('/^public_/',
                    ROUTE_A) || (ROUTE_M == 'content' && ROUTE_C == 'create_html') || (ROUTE_M == 'release') || (ROUTE_A == 'login') || (ROUTE_M == 'search' && ROUTE_C == 'search_admin' && ROUTE_A == 'createindex')
            ) {
                return true;
            }
            showmessage(L('admin_login'), '?m=admin&c=index&a=login');
        }

        return false;
    }

    /**
     * 检查hash值，验证用户数据安全性
     */
    final private function check_hash()
    {
        if (preg_match('/^public_/', ROUTE_A) || ROUTE_M == 'admin' && ROUTE_C == 'index' || in_array(ROUTE_A, ['login'])) {
            return true;
        }
        if (isset($_GET['pc_hash']) && $_SESSION['pc_hash'] != '' && ($_SESSION['pc_hash'] == $_GET['pc_hash'])) {
            return true;
        } elseif (isset($_POST['pc_hash']) && $_SESSION['pc_hash'] != '' && ($_SESSION['pc_hash'] == $_POST['pc_hash'])) {
            return true;
        } else {
            showmessage(L('hash_check_false'), HTTP_REFERER);
        }

        return false;
    }

    /**
     * 后台信息列表模板
     * @param string $id 被选中的模板名称
     * @param string $str form表单中的属性名
     * @return mixed
     */
    final public function admin_list_template($id = '', $str = '')
    {
        $templatedir = PATH_PHPCMS . DS . 'modules' . DS . 'content' . DS . 'templates' . DS;
        $pre = 'content_list';
        $templates = glob($templatedir . $pre . '*.tpl.php');
        if (empty($templates)) {
            return false;
        }
        $files = @array_map('basename', $templates);
        $templates = [];
        if (is_array($files)) {
            foreach ($files as $file) {
                $key = substr($file, 0, -8);
                $templates[$key] = $file;
            }
        }
        ksort($templates);

        return form::select($templates, $id, $str, L('please_select'));
    }
}