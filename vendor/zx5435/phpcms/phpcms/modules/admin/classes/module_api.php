<?php

namespace phpcms\modules\admin\classes;

use pc_base;
use phpcms\libs\classes\model;
use phpcms\model\menu_model;
use phpcms\model\module_model;

pc_base::load_sys_func('dir');

/**
 * 模块安装接口类
 * @property string $uninstalldir
 * @property model|mixed $m_db
 */
class module_api
{

    private $db, $m_db, $installdir, $uninstaldir, $module, $isall;
    public $error_msg = '';

    public function __construct()
    {
        $this->db = new module_model();
    }

    /**
     * 模块安装
     * @param string $module 模块名
     * @return bool
     */
    public function install($module = '')
    {
        define('INSTALL', true);
        if ($module) {
            $this->module = $module;
        }
        $this->installdir = PATH_PHPCMS . 'modules' . DS . $this->module . DS . 'install' . DS;

        $this->check();
        $models = @require($this->installdir . 'model.php');
        if (!is_array($models) || empty($models)) {
            $models = ['module'];
        }
        if (!in_array('module', $models)) {
            array_unshift($models, 'module');
        }
        if (is_array($models) && !empty($models)) {
            foreach ($models as $m) {
                $this->m_db = pc_base::load_model($m . '_model');
                $sql = file_get_contents($this->installdir . $m . '.sql');
                $this->sql_execute($sql);
            }
        }
        if (file_exists($this->installdir . 'extention.inc.php')) {
            $menu_db = new menu_model();
            @include($this->installdir . 'extention.inc.php');
            if (!defined('INSTALL_MODULE')) {
                $file = PATH_PHPCMS . 'languages' . DS . pc_base::load_config('system', 'lang') . DS . 'system_menu.lang.php';
                if (file_exists($file)) {
                    $content = file_get_contents($file);
                    $content = substr($content, 0, -2);
                    $data = '';
                    foreach ($language as $key => $l) {
                        if (L($key, '', 'system_menu') == $key) {
                            $data .= "\$LANG['" . $key . "'] = '" . $l . "';\r\n";
                        }
                    }
                    $data = $content . $data . "?>";
                    file_put_contents($file, $data);
                } else {
                    foreach ($language as $key => $l) {
                        if (L($key, '', 'system_menu') == $key) {
                            $data .= "\$LANG['" . $key . "'] = '" . $l . "';\r\n";
                        }
                    }
                    $data = "<?" . "php\r\n\$data?>";
                    file_put_contents($file, $data);
                }
            }
        }

        if (!defined('INSTALL_MODULE')) {
            if (file_exists($this->installdir . 'languages' . DS)) {
                dir_copy($this->installdir . 'languages' . DS, PATH_PHPCMS . 'languages' . DS);
            }
            if (file_exists($this->installdir . 'templates' . DS)) {
                dir_copy($this->installdir . 'templates' . DS,
                    PATH_PHPCMS . 'templates' . DS . pc_base::load_config('system', 'tpl_name') . DS . $this->module . DS);
                if (file_exists($this->installdir . 'templates' . DS . 'name.inc.php')) {
                    $keyid = 'templates|' . pc_base::load_config('system', 'tpl_name') . '|' . $this->module;
                    $file_explan[$keyid] = include $this->installdir . 'templates' . DS . 'name.inc.php';
                    $templatepath = PATH_PHPCMS . 'templates' . DS . pc_base::load_config('system', 'tpl_name') . DS;
                    if (file_exists($templatepath . 'config.php')) {
                        $style_info = include $templatepath . 'config.php';
                        $style_info['file_explan'] = array_merge($style_info['file_explan'], $file_explan);
                        @file_put_contents($templatepath . 'config.php', '<?php return ' . var_export($style_info, true) . ';?>');
                    }
                    unlink(PATH_PHPCMS . 'templates' . DS . pc_base::load_config('system',
                            'tpl_name') . DS . $this->module . DS . 'name.inc.php');
                }
            }
        }

        return true;
    }

    /**
     * 检查安装目录
     * @param string $module 模块名
     * @return bool
     */
    public function check($module = '')
    {
        define('INSTALL', true);
        if ($module) {
            $this->module = $module;
        }
        if (!$this->module) {
            $this->error_msg = L('no_module');

            return false;
        }
        if (!defined('INSTALL_MODULE')) {
            if (dir_create(PATH_PHPCMS . 'languages' . DS . pc_base::load_config('system', 'lang') . DS . 'test_create_dir')) {
                sleep(1);
                dir_delete(PATH_PHPCMS . 'languages' . DS . pc_base::load_config('system', 'lang') . DS . 'test_create_dir');

            } else {
                $this->error_msg = L('lang_dir_no_write');

                return false;
            }
        }
        $r = $this->db->get_one(['module' => $this->module]);
        if ($r) {
            $this->error_msg = L('this_module_installed');

            return false;
        }
        if (!$this->installdir) {
            $this->installdir = PATH_PHPCMS . 'modules' . DS . $this->module . DS . 'install' . DS;
        }
        if (!is_dir($this->installdir)) {
            $this->error_msg = L('install_dir_no_exist');

            return false;
        }
        if (!file_exists($this->installdir . 'module.sql')) {
            $this->error_msg = L('module_sql_no_exist');

            return false;
        }
        $models = @require($this->installdir . 'model.php');
        if (is_array($models) && !empty($models)) {
            foreach ($models as $m) {
                if (!file_exists(PATH_PHPCMS . 'model' . DS . $m . '_model.php')) {
                    $this->error_msg = $m . L('model_clas_no_exist');

                    return false;
                }
                if (!file_exists($this->installdir . $m . '.sql')) {
                    $this->error_msg = $m . L('sql_no_exist');

                    return false;
                }
            }
        }

        return true;
    }

    /**
     * 模块卸载
     * @param string $module 模块名
     * @return bool
     */
    public function uninstall($module)
    {
        define('UNINSTALL', true);
        if (!$module) {
            $this->error_msg = L('illegal_parameters');

            return false;
        }
        $this->module = $module;
        $this->uninstalldir = PATH_PHPCMS . 'modules' . DS . $this->module . DS . 'uninstall' . DS;
        if (!is_dir($this->uninstalldir)) {
            $this->error_msg = L('uninstall_dir_no_exist');

            return false;
        }
        if (file_exists($this->uninstalldir . 'model.php')) {
            $models = @require($this->uninstalldir . 'model.php');
            if (is_array($models) && !empty($models)) {
                foreach ($models as $m) {
                    if (!file_exists($this->uninstalldir . $m . '.sql')) {
                        $this->error_msg = $this->module . DS . 'uninstall' . DS . $m . L('sql_no_exist');

                        return false;
                    }
                }
            }
        }
        if (is_array($models) && !empty($models)) {
            foreach ($models as $m) {
                echo $m . '-';
                $this->m_db = pc_base::load_model($m . '_model');
                $sql = file_get_contents($this->uninstalldir . $m . '.sql');
                $this->sql_execute($sql);
            }
        }
        if (file_exists($this->uninstalldir . 'extention.inc.php')) {
            @include($this->uninstalldir . 'extention.inc.php');
        }
        if (file_exists(PATH_PHPCMS . 'languages' . DS . pc_base::load_config('system', 'lang') . DS . $this->module . '.lang.php')) {
            @unlink(PATH_PHPCMS . 'languages' . DS . pc_base::load_config('system', 'lang') . DS . $this->module . '.lang.php');
        }
        if (is_dir(PATH_PHPCMS . 'templates' . DS . pc_base::load_config('system', 'tpl_name') . DS . $this->module)) {
            @dir_delete(PATH_PHPCMS . 'templates' . DS . pc_base::load_config('system', 'tpl_name') . DS . $this->module);
        }
        $templatepath = PATH_PHPCMS . 'templates' . DS . pc_base::load_config('system', 'tpl_name') . DS;
        if (file_exists($templatepath . 'config.php')) {
            $keyid = 'templates|' . pc_base::load_config('system', 'tpl_name') . '|' . $this->module;
            $style_info = include $templatepath . 'config.php';
            unset($style_info['file_explan'][$keyid]);
            @file_put_contents($templatepath . 'config.php', '<?php return ' . var_export($style_info, true) . ';?>');
        }
        $menu_db = new menu_model();
        $menu_db->delete(['m' => $this->module]);
        $this->db->delete(['module' => $this->module]);

        return true;
    }

    /**
     * 执行mysql.sql文件，创建数据表等
     * @param string $sql sql语句
     * @return bool|array
     */
    private function sql_execute($sql)
    {
        $sqls = $this->sql_split($sql);

        if (is_array($sqls)) {
            foreach ($sqls as $sql) {
                if (trim($sql) != '') {
                    $this->m_db->query($sql);
                }
            }
        } else {
            $this->m_db->query($sqls);
        }

        return true;
    }

    /**
     * 处理sql语句，执行替换前缀都功能。
     * @param string $sql 原始的sql，将一些大众的部分替换成私有的
     * @return array
     */
    private function sql_split($sql)
    {
        $dbcharset = $GLOBALS['dbcharset'];
        if (!$dbcharset) {
            $dbcharset = pc_base::load_config('database', 'default');
            $dbcharset = $dbcharset['charset'];
        }
        if ($this->m_db->version() > '4.1' && $dbcharset) {
            $sql = preg_replace("/TYPE=(InnoDB|MyISAM|MEMORY)( DEFAULT CHARSET=[^; ]+)?/", "ENGINE=\\1 DEFAULT CHARSET=" . $dbcharset, $sql);
        }
        if ($this->m_db->db_tablepre != "phpcms_") {
            $sql = str_replace("phpcms_", $this->m_db->db_tablepre, $sql);
        }
        $sql = str_replace(["\r", '2010-9-05'], ["\n", date('Y-m-d')], $sql);
        $ret = [];
        $num = 0;
        $queriesarray = explode(";\n", trim($sql));
        unset($sql);
        foreach ($queriesarray as $query) {
            $ret[$num] = '';
            $queries = explode("\n", trim($query));
            $queries = array_filter($queries);
            foreach ($queries as $query) {
                $str1 = substr($query, 0, 1);
                if ($str1 != '#' && $str1 != '-') {
                    $ret[$num] .= $query;
                }
            }
            $num++;
        }

        return $ret;
    }
}
