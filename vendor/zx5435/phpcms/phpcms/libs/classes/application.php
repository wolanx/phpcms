<?php

namespace phpcms\libs\classes;

/**
 * 应用程序创建类
 */
class application
{

    /**
     * 构造函数
     */
    public function __construct()
    {
        $param = new param();
        define('ROUTE_M', $param->route_m());
        define('ROUTE_C', $param->route_c());
        define('ROUTE_A', $param->route_a());

        $this->init();
    }

    /**
     * 调用件事
     */
    public function init()
    {
        $controller = $this->load_controller();
        if (method_exists($controller, ROUTE_A)) {
            if (preg_match('/^[_]/i', ROUTE_A)) {
                exit('You are visiting the action is to protect the private action');
            } else {
                call_user_func([$controller, ROUTE_A]);
            }
        } else {
            exit('Action does not exist.');
        }
    }

    /**
     * 加载控制器
     * @param string $filename
     * @param string $m
     * @return mixed
     */
    protected function load_controller($filename = '', $m = '')
    {
        if (empty($filename)) {
            $filename = ROUTE_C;
        }
        if (empty($m)) {
            $m = ROUTE_M;
        }
        try {
            $n = "phpcms\\modules\\$m\\$filename";

            return new $n();
        } catch (\Exception $e) {
            echo $e->getMessage();
            exit('Controller does not exist.');
        }
    }
}
