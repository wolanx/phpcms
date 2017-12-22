<?php

namespace phpcms\modules\formguide\classes;

//模型原型存储路径
define('MODEL_PATH', PATH_PHPCMS . 'modules' . DS . 'formguide' . DS . 'fields' . DS);

/**
 * 更新form表单模型类
 */
class formguide
{

    public function __construct()
    {

    }

    /**
     * 更新模型缓存方法
     */
    public function public_cache()
    {
        require MODEL_PATH . 'fields.inc.php';
        //更新内容模型类：表单生成、入库、更新、输出
        $classtypes = ['form', 'input', 'update', 'output'];
        foreach ($classtypes as $classtype) {
            $cache_data = file_get_contents(MODEL_PATH . 'formguide_' . $classtype . '.class.php');
            $cache_data = str_replace('}?>', '', $cache_data);
            foreach ($fields as $field => $fieldvalue) {
                if (file_exists(MODEL_PATH . $field . DS . $classtype . '.inc.php')) {
                    $cache_data .= file_get_contents(MODEL_PATH . $field . DS . $classtype . '.inc.php');
                }
            }
            $cache_data .= "\r\n } \r\n?>";
            file_put_contents(CACHE_MODEL_PATH . 'formguide_' . $classtype . '.class.php', $cache_data);
            @chmod(CACHE_MODEL_PATH . 'formguide_' . $classtype . '.class.php', 0777);
        }

        return true;
    }
}
