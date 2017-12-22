<?php

use phpcms\libs\classes\application;
use phpcms\libs\classes\session;

define('IN_PHPCMS', true);
define('DS', DIRECTORY_SEPARATOR);

// NEW
define('PATH_API', dirname(__FILE__) . DS . 'api' . DS);
define('PATH_PHPCMS', dirname(__FILE__) . DS . 'phpcms' . DS);
define('PATH_CACHES', PATH_ROOT . 'caches' . DS);
define('PATH_CACHE_DEF', dirname(__FILE__) . DS . 'caches' . DS);
define('CACHE_PATH', PATH_ROOT . 'caches' . DS); // TODO DEL

define('CACHE_MODEL_PATH', CACHE_PATH . 'caches_model' . DS . 'caches_data' . DS);

define('SITE_PROTOCOL', isset($_SERVER['SERVER_PORT']) && $_SERVER['SERVER_PORT'] == '443' ? 'https://' : 'http://'); // 主机协议
define('SITE_URL', (isset($_SERVER['HTTP_HOST']) ? $_SERVER['HTTP_HOST'] : '')); // 当前访问的主机名
define('HTTP_REFERER', isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : ''); // 来源
define('SYS_START_TIME', microtime()); // 系统开始时间

//加载公用函数库
pc_base::load_sys_func('global');
pc_base::load_sys_func('extention');
pc_base::auto_load_func();

pc_base::load_config('system', 'errorlog') ? set_error_handler('my_error_handler') : error_reporting(E_ERROR | E_WARNING | E_PARSE);
//设置本地时差
function_exists('date_default_timezone_set') && date_default_timezone_set(pc_base::load_config('system', 'timezone'));

define('CHARSET', pc_base::load_config('system', 'charset'));
define('PC_VERSION', pc_base::load_config('version', 'pc_version'));

header('Content-type: text/html; charset=utf-8'); // 输出页面字符集

define('SYS_TIME', time());

define('WEB_PATH', pc_base::load_config('system', 'web_path')); // 定义网站根路径
define('CDN_PATH', pc_base::load_config('system', 'cdn_path'));
define('JS_PATH', pc_base::load_config('system', 'js_path'));
define('CSS_PATH', pc_base::load_config('system', 'css_path'));
define('IMG_PATH', pc_base::load_config('system', 'img_path'));
define('APP_PATH', pc_base::load_config('system', 'app_path')); // 动态程序路径
define('PLUGIN_STATICS_PATH', WEB_PATH . 'statics/plugin/'); //应用静态文件路径

if (pc_base::load_config('system', 'gzip') && function_exists('ob_gzhandler')) {
    ob_start('ob_gzhandler');
} else {
    ob_start();
}

class pc_base
{
    public static $ver = PC_VERSION;

    /**
     * 初始化应用程序
     */
    public static function creat_app()
    {
        return new application();
    }

    public static function session_start()
    {
        return new session();
    }

    /**
     * 加载系统类方法
     * @deprecated
     * @param string $classname 类名
     * @param string $path 扩展地址
     * @param int $initialize 是否初始化
     * @return bool
     */
    public static function load_sys_class($classname, $path = '', $initialize = 1)
    {
        return false;
    }

    /**
     * 加载应用类方法
     * @deprecated
     * @param string $classname
     * @param string $m
     * @param int $initialize
     * @return bool|mixed
     */
    public static function load_app_class($classname, $m = '', $initialize = 1)
    {
        $m = empty($m) && defined('ROUTE_M') ? ROUTE_M : $m;
        if (empty($m)) {
            return false;
        }

        return self::_load_class($classname, 'modules' . DS . $m . DS . 'classes', $initialize);
    }

    /**
     * 加载数据模型
     * @deprecated
     * @param string $classname 类名
     * @return \phpcms\libs\classes\model|mixed
     */
    public static function load_model($classname)
    {
        return self::_load_class($classname, 'model');
    }

    /**
     * 加载类文件函数
     * @deprecated
     * @param string $classname 类名
     * @param string $path 扩展地址
     * @param int $initialize 是否初始化
     * @return bool|mixed
     */
    private static function _load_class($classname, $path = '', $initialize = 1)
    {
        static $classes = [];
        if (empty($path)) {
            $path = 'libs' . DS . 'classes';
        }

        $key = md5($path . $classname);
        if (isset($classes[$key])) {
            if (!empty($classes[$key])) {
                return $classes[$key];
            } else {
                return true;
            }
        }
        if (file_exists(PATH_PHPCMS . $path . DS . $classname . '.php')) {
            if ($my_path = self::my_path(PATH_PHPCMS . $path . DS . $classname . '.php')) {
                $classname = 'MY_' . $classname;
            }
            if ($initialize) {
                $path = str_replace('/', '\\', $path);
                $c = "\\phpcms\\$path\\$classname";
                $classes[$key] = new $c();
            } else {
                $classes[$key] = true;
            }

            return $classes[$key];
        } else {
            return false;
        }
    }

    /**
     * 加载系统的函数库
     * @param string $func 函数库名
     * @deprecated
     * @return bool
     */
    public static function load_sys_func($func)
    {
        return self::_load_func($func);
    }

    /**
     * @deprecated
     * 自动加载autoload目录下函数库
     * @param string $path 函数库名
     * @return mixed
     */
    public static function auto_load_func($path = '')
    {
        return self::_auto_load_func($path);
    }

    /**
     * @deprecated
     * 加载应用函数库
     * @param string $func 函数库名
     * @param string $m 模型名
     * @return bool
     */
    public static function load_app_func($func, $m = '')
    {
        $m = empty($m) && defined('ROUTE_M') ? ROUTE_M : $m;
        if (empty($m)) {
            return false;
        }

        return self::_load_func($func, 'modules' . DS . $m . DS . 'functions');
    }

    /**
     * 加载插件类库
     * @deprecated
     */
    public static function load_plugin_class($classname, $identification = '', $initialize = 1)
    {
        $identification = empty($identification) && defined('PLUGIN_ID') ? PLUGIN_ID : $identification;
        if (empty($identification)) {
            return false;
        }

        return pc_base::load_sys_class($classname, 'plugin' . DS . $identification . DS . 'classes', $initialize);
    }

    /**
     * 加载插件函数库
     * @param string $func 函数文件名称
     * @param string $identification 插件标识
     * @return bool
     */
    public static function load_plugin_func($func, $identification)
    {
        static $funcs = [];
        $identification = empty($identification) && defined('PLUGIN_ID') ? PLUGIN_ID : $identification;
        if (empty($identification)) {
            return false;
        }
        $path = 'plugin' . DS . $identification . DS . 'functions' . DS . $func . '.func.php';
        $key = md5($path);
        if (isset($funcs[$key])) {
            return true;
        }
        if (file_exists(PATH_PHPCMS . $path)) {
            include PATH_PHPCMS . $path;
        } else {
            $funcs[$key] = false;

            return false;
        }
        $funcs[$key] = true;

        return true;
    }

    /**
     * 加载插件数据模型
     * @param string $classname 类名
     * @param        $identification
     * @return bool|mixed
     */
    public static function load_plugin_model($classname, $identification)
    {
        $identification = empty($identification) && defined('PLUGIN_ID') ? PLUGIN_ID : $identification;
        $path = 'plugin' . DS . $identification . DS . 'model';

        return self::_load_class($classname, $path);
    }

    /**
     * 加载函数库
     * @param string $func 函数库名
     * @param string $path 地址
     * @return bool
     */
    private static function _load_func($func, $path = '')
    {
        static $funcs = [];
        if (empty($path)) {
            $path = 'libs' . DS . 'functions';
        }
        $path .= DS . $func . '.func.php';
        $key = md5($path);
        if (isset($funcs[$key])) {
            return true;
        }
        if (file_exists(PATH_PHPCMS . $path)) {
            include PATH_PHPCMS . $path;
        } else {
            $funcs[$key] = false;

            return false;
        }
        $funcs[$key] = true;

        return true;
    }

    /**
     * 加载函数库
     * @param string $path
     * @return mixed
     */
    private static function _auto_load_func($path = '')
    {
        if (empty($path)) {
            $path = 'libs' . DS . 'functions' . DS . 'autoload';
        }
        $path .= DS . '*.func.php';
        $auto_funcs = glob(PATH_PHPCMS . DS . $path);
        if (!empty($auto_funcs) && is_array($auto_funcs)) {
            foreach ($auto_funcs as $func_path) {
                include $func_path;
            }
        }

        return false;
    }

    /**
     * 是否有自己的扩展文件
     * @param string $filepath 路径
     * @return bool|string
     */
    public static function my_path($filepath)
    {
        $path = pathinfo($filepath);
        if (file_exists($path['dirname'] . DS . 'MY_' . $path['basename'])) {
            return $path['dirname'] . DS . 'MY_' . $path['basename'];
        } else {
            return false;
        }
    }

    /**
     * 加载配置文件
     * @param string $file 配置文件
     * @param string $key 要获取的配置荐
     * @param string $default 默认配置。当获取配置项目失败时该值发生作用。
     * @param boolean $reload 强制重新加载。
     * @return mixed|string
     */
    public static function load_config($file, $key = '', $default = '', $reload = false)
    {
        static $configs = [];
        if (!$reload && isset($configs[$file])) {
            if (empty($key)) {
                return $configs[$file];
            } elseif (isset($configs[$file][$key])) {
                return $configs[$file][$key];
            } else {
                return $default;
            }
        }

        $path1 = PATH_CACHE_DEF . 'configs' . DS . $file . '.php';
        $path2 = PATH_CACHES . 'configs' . DS . $file . '.php';
        $data1 = [];
        $data2 = [];

        if (file_exists($path1)) {
            $data1 = include($path1);
        }
        if (file_exists($path2)) {
            $data2 = include($path2);
        }
        $data = array_merge($data1, $data2);

//        print_r($data);

        $configs[$file] = $data;
        if (empty($key)) {
            return $configs[$file];
        } elseif (isset($configs[$file][$key])) {
            return $configs[$file][$key];
        } else {
            return $default;
        }
    }
}
